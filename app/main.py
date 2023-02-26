import json
import logging
import os
from pydantic import BaseModel
from urllib.parse import parse_qs, urlsplit
from typing import Optional
import graphistry
import pandas as pd
from dotenv import load_dotenv
from fastapi import FastAPI
from fastapi.responses import JSONResponse
from neo4j import GraphDatabase  # for data loader
from neo4j.exceptions import ServiceUnavailable
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker

load_dotenv()
uri = os.getenv("uri")
user = os.getenv("user")
pwd = os.getenv("pwd")
personal_key_id = os.getenv("personal_key_id")
personal_key_secret = os.getenv("personal_key_secret")
postgres_db = os.getenv("database_uri")

graphistry.register(api=3, personal_key_id=personal_key_id,
                    personal_key_secret=personal_key_secret, protocol='https', server='hub.graphistry.com')
NEO4J = {'uri': uri, 'auth': (user, pwd)}
graphistry.register(bolt=NEO4J)


def connection():
  driver = GraphDatabase.driver(uri=uri, auth=(user, pwd))
  return (driver)


app = FastAPI()
driver_neo4j = connection()
engine = create_engine(postgres_db)
SessionLocal = sessionmaker(autocommit=True, autoflush=True, bind=engine)


@app.middleware("http")
async def db_session_middleware(request, call_next):
    response = JSONResponse(
        content={"message": "Internal Server Error"}, status_code=500)
    try:
        request.state.db = SessionLocal()
        response = await call_next(request)
    finally:
        request.state.db.close()
    return response


@app.get("/")
async def main_route():
  return {"message": "Hey, Graphistry!!"}


@app.get("/getDropdownValues")
async def get_table_data():
    with SessionLocal() as con:
        rs = con.execute("SELECT * FROM ld_node_selection_lov order by id")
        results = [dict(row) for row in rs]
    return {"data": results}

driver = GraphDatabase.driver(uri, auth=(user, pwd))


async def execute_query_builder(node1: str, node2: Optional[str] = None, node3: Optional[str] = None) -> dict:
    with SessionLocal() as con:
        query = f"SELECT ld_match_query, ld_match_node1, ld_match_node2, ld_match_node3, ld_return_node1, ld_return_node2, ld_return_node3, ld_return_edge1, ld_return_edge2, ld_limit, ld_edge_point_icon FROM ld_query_builder WHERE ld_node1 = '{node1}'"
        if node2 is not None and node2 != "null":
            query += f" AND ld_node2 = '{node2}'"
        else:
            query += " AND ld_node2 =''"
        if node3 is not None and node3 != "null":
            query += f" AND ld_node3 = '{node3}'"
        else:
            query += " AND ld_node3 =''"
        query = text(query)
        print(query)
        params = {"node1": node1, "node2": node2, "node3": node3}
        rs = con.execute(query, params)
        query_builder_data = [dict(row) for row in rs]
        print(query_builder_data)
    if not query_builder_data:
        print(
            f"No records found for nodes: node1={node1}, node2={node2}, node3={node3}")
        return {}
    return query_builder_data


@app.get("/buildQuery")
async def queryGraphistry(node1: str, keyword1: Optional[str] = "null", node2: Optional[str] = "null", keyword2: Optional[str] = "null", node3: Optional[str] = "null", keyword3: Optional[str] = "null", userId: Optional[str] = "null"):
    try:
        keyword1 = keyword1.lower() if keyword1 != "null" else keyword1
        keyword2 = keyword2.lower() if keyword2 != "null" else keyword2
        keyword3 = keyword3.lower() if keyword3 != "null" else keyword3
        if node2 != "null" and node3 != "null":
            print("Found 3 nodes")

            # get the query builder data for node1
            query_builder_data_node = await execute_query_builder(node1, node2, node3)
            if not query_builder_data_node:
                print(
                    f"No query builder data found for nodes: node1={node1}, node2={node2}, node3={node3}")
                return {}
            cypher_query = f"{query_builder_data_node[0]['ld_match_query']} "
            if keyword1 != "null":
                cypher_query += f"AND {query_builder_data_node[0]['ld_match_node1']}  '{keyword1}'  "
            if keyword2 != "null":
                cypher_query += f"AND {query_builder_data_node[0]['ld_match_node2']}  '{keyword2}'  "
            if keyword3 != "null":
                cypher_query += f"AND {query_builder_data_node[0]['ld_match_node3']}  '{keyword3}'  "
            cypher_query_node1 = cypher_query + \
                f"RETURN {query_builder_data_node[0]['ld_return_node1']} limit  {query_builder_data_node[0]['ld_limit']}"
            cypher_query_node2 = cypher_query + \
                f"RETURN {query_builder_data_node[0]['ld_return_node2']} limit  {query_builder_data_node[0]['ld_limit']}"
            cypher_query_node3 = cypher_query + \
                f"RETURN {query_builder_data_node[0]['ld_return_node3']} limit  {query_builder_data_node[0]['ld_limit']}"
            cypher_query_edges1 = cypher_query + \
                f"RETURN {query_builder_data_node[0]['ld_return_edge1']} limit  {query_builder_data_node[0]['ld_limit']}"
            cypher_query_edges2 = cypher_query + \
                f"RETURN {query_builder_data_node[0]['ld_return_edge2']} limit  {query_builder_data_node[0]['ld_limit']}"
            cypher_query_edges = cypher_query_edges1 + f" union " + cypher_query_edges2
            print(cypher_query_edges)
            with driver.session() as session:
                result = session.run(cypher_query_node1)
                node1 = pd.DataFrame([r.data() for r in result])
            with driver.session() as session:
                result = session.run(cypher_query_node2)
                node2 = pd.DataFrame([r.data() for r in result])
            with driver.session() as session:
                result = session.run(cypher_query_node3)
                node3 = pd.DataFrame([r.data() for r in result])
            nodes = pd.concat([node1, node2, node3])
            with driver.session() as session:
                result = session.run(cypher_query_edges)
                edges_r = pd.DataFrame([r.data() for r in result])

            if nodes.empty:
                msg = "No records found"
                await insert_query_history(user_id=userId, node1=node1, keyword1=keyword1, node2=node2, keyword2=keyword2, node3=node3, keyword3=keyword3, error_message=msg)
                return (msg)
            var_bind = f"{query_builder_data_node[0]['ld_edge_point_icon']}"

            shareable_and_embeddable_url = graphistry.bind(source="n1", destination="n2", node="id").nodes(nodes).edges(edges_r).encode_point_icon('ConstructRole', shape="circle", as_text=True, categorical_mapping={
                'Moderator': 'MV', 'IndependentVariable': 'IV', 'Mediator': 'M', 'DependentVariable': 'DV'}, default_mapping="?").addStyle(bg={'color': '#FFFFFF'}).plot(render=False)
            query = urlsplit(shareable_and_embeddable_url).query
            params = parse_qs(query)
            dataset_value = params['dataset']
            await insert_query_history(user_id=userId, node1=node1, keyword1=keyword1, node2=node2, keyword2=keyword2, node3=node3, keyword3=keyword3, dataset=dataset_value)

        elif node2 != "null" and node3 == "null":
            print("Found 2 nodes")

            # get the query builder data for 2 node
            query_builder_data_node = await execute_query_builder(node1, node2)

            if not query_builder_data_node:
                print(
                    f"No query builder data found for nodes: node1={node1}, node2={node2}")
                return {}

            cypher_query = f"{query_builder_data_node[0]['ld_match_query']} "
            if keyword1 != "null":
                cypher_query += f"AND {query_builder_data_node[0]['ld_match_node1']}  '{keyword1}'  "
            if keyword2 != "null":
                cypher_query += f"AND {query_builder_data_node[0]['ld_match_node2']}  '{keyword2}'  "

            cypher_query_node1 = cypher_query + \
                f"RETURN {query_builder_data_node[0]['ld_return_node1']} limit  {query_builder_data_node[0]['ld_limit']}"
            cypher_query_node2 = cypher_query + \
                f"RETURN {query_builder_data_node[0]['ld_return_node2']} limit  {query_builder_data_node[0]['ld_limit']}"
            cypher_query_edges = cypher_query + \
                f"RETURN {query_builder_data_node[0]['ld_return_edge1']} limit  {query_builder_data_node[0]['ld_limit']}"
            print(cypher_query_node1)
            print(cypher_query_node2)
            print(cypher_query_edges)
            with driver.session() as session:
                result = session.run(cypher_query_node1)
                node1 = pd.DataFrame([r.data() for r in result])
            with driver.session() as session:
                result = session.run(cypher_query_node2)
                node2 = pd.DataFrame([r.data() for r in result])
            nodes = pd.concat([node1, node2])
            with driver.session() as session:
                result = session.run(cypher_query_edges)
                edges_r = pd.DataFrame([r.data() for r in result])
            if nodes.empty:
                msg = "No records found"
                await insert_query_history(user_id=userId, node1=node1, keyword1=keyword1, node2=node2, keyword2=keyword2, error_message=msg)
                return (msg)
            var_bind = f"{query_builder_data_node[0]['ld_edge_point_icon']}"
            shareable_and_embeddable_url = graphistry.bind(source="n1", destination="n2", node="id").nodes(
                nodes).edges(edges_r).addStyle(bg={'color': '#FFFFFF'}).plot(render=False)
            query = urlsplit(shareable_and_embeddable_url).query
            params = parse_qs(query)
            dataset_value = params['dataset']
            print(dataset_value)
            await insert_query_history(user_id=userId, node1=node1, keyword1=keyword1, node2=node2, keyword2=keyword2, dataset=dataset_value)

        elif node2 == "null" and node3 == "null":
            print("Found 1 node")

            # get the query builder data for 2 node
            query_builder_data_node = await execute_query_builder(node1)
            if not query_builder_data_node:
                msg = f"No query builder data found for node: node1={node1}"
                print(msg)
                await insert_query_history(user_id=userId, node1=node1, keyword1=keyword1, error_message=msg)
                return msg

            cypher_query = f"{query_builder_data_node[0]['ld_match_query']} "
            if keyword1 != "null":
                cypher_query += f"AND {query_builder_data_node[0]['ld_match_node1']}  '{keyword1}'  "

            cypher_query_node1 = cypher_query + \
                f"RETURN {query_builder_data_node[0]['ld_return_node1']} limit  {query_builder_data_node[0]['ld_limit']}"
            cypher_query_edges = cypher_query + \
                f"RETURN {query_builder_data_node[0]['ld_return_edge1']} limit  {query_builder_data_node[0]['ld_limit']}"
            print(cypher_query_node1)
            print(cypher_query_edges)

            with driver.session() as session:
                result = session.run(cypher_query_node1)
                df = pd.DataFrame([r.data()
                                  for r in result], columns=result.keys())
                edges_r = pd.DataFrame(columns=['n1', 'n2'])
            nodes = graphistry.bind(
                source="n1", destination="n2", node="id").nodes(df).edges(edges_r)
            if nodes is not None:
                viz = nodes.addStyle(bg={'color': '#FFFFFF'})
                shareable_and_embeddable_url = viz.plot(render=False)
                query = urlsplit(shareable_and_embeddable_url).query
                params = parse_qs(query)
                dataset_value = params['dataset']
                await insert_query_history(user_id=userId, node1=node1, keyword1=keyword1, dataset=dataset_value)
            else:
                msg = "No records found"
                print(msg)
                await insert_query_history(user_id=userId, node1=node1, keyword1=keyword1, error_message=msg)
                return (msg)

    except ServiceUnavailable as exception:
        logging.error("Error: {exception}".format(exception=exception))
        raise
    return params['dataset']

query1 = """CALL apoc.meta.stats() YIELD labels
RETURN labels.JournalPublication as Journals, labels.JournalReference as Papers, labels.Publisher as Publishers, labels.Affiliation as Affiliations, labels.Hypothesis as Hypotheses, labels.Author as Authors, labels.Construct as Constructs"""

query2 = """MATCH (ref:JournalReference)-[:APPEARED_IN]->(pub:JournalPublication)
WHERE '1981'> ref.year<= '1990'
    with pub.name as `Journal Name`, "1980-1990" as Years, count(ref) as `No.Of Papers`
RETURN `Journal Name`, Years, `No.Of Papers`
UNION ALL
MATCH (ref:JournalReference)-[:APPEARED_IN]->(pub:JournalPublication)
WHERE '1991'> ref.year<= '2000'
    with pub.name as `Journal Name`, "1991-2000" as Years, count(ref) as `No.Of Papers`
RETURN `Journal Name`, Years, `No.Of Papers`
UNION ALL
MATCH (ref:JournalReference)-[:APPEARED_IN]->(pub:JournalPublication)
WHERE '2001'> ref.year<= '2010'
    with pub.name as `Journal Name`, "2001-2010" as Years, count(ref) as `No.Of Papers`
RETURN `Journal Name`, Years, `No.Of Papers`
UNION ALL
MATCH (ref:JournalReference)-[:APPEARED_IN]->(pub:JournalPublication)
WHERE '2011'> ref.year<= '2020'
    with pub.name as `Journal Name`, "2011-2020" as Years, count(ref) as `No.Of Papers`
RETURN `Journal Name`, Years, `No.Of Papers`
UNION ALL
MATCH (ref:JournalReference)-[:APPEARED_IN]->(pub:JournalPublication)
WHERE '2020'> ref.year<= '2023'
    with pub.name as `Journal Name`, "2020-2023" as Years, count(ref) as `No.Of Papers`
RETURN `Journal Name`, Years, `No.Of Papers`
"""

query3 = """MATCH (c:Construct)-[r:AS]->(cr:`Construct Role`)
WITH c.ConstructRole as role, count(c) as count
MATCH (c2:Construct)
WITH count, role, count(c2) as total
RETURN role, count, toFloat(count) / toFloat(total) * 100 as percentage
"""

response = dict()


@app.get("/dashboardQuery/{queryNo}")
async def get_query(queryNo):

	if queryNo == "1":
		query = query1
	elif queryNo == "2":
		query = query2
	elif queryNo == "3":
		query = query3
	with driver.session() as session:
		info = session.run(query)
		res = info.data()

	json_results = json.dumps(res)
	return json_results

response = dict()


@app.get("/dashboardQuery")
async def get_allQueries():
    with driver.session() as session:
        info = session.run(query1)
        res1 = info.data()
        response["query1"] = res1

        info = session.run(query2)
        res2 = info.data()
        response["query2"] = res2

        info = session.run(query3)
        res3 = info.data()
        response["query2"] = res3
    json_results = json.dumps(response)
    return json_results


async def insert_query_history(user_id: Optional[str] , node1: str, keyword1: Optional[str] = None, node2: Optional[str] = None, keyword2: Optional[str] = None, node3: Optional[str] = None, keyword3: Optional[str] = None, dataset: Optional[str] = None, status: Optional[str] = None, error_message: Optional[str] = None) -> None:
    with SessionLocal() as con:
        query = text("""
            INSERT INTO ld_user_build_query_log (user_id, node1, keyword1, node2, keyword2, node3, keyword3, dataset, status, error_message)   
            VALUES (:user_id, :node1, :keyword1, :node2, :keyword2, :node3, :keyword3, :dataset, :status, :error_message)
        """)
        params = {
            "user_id": user_id,
            "node1": node1,
            "keyword1": keyword1,
            "node2": node2,
            "keyword2": keyword2,
            "node3": node3,
            "keyword3": keyword3,
            "dataset": dataset,
            "status": status,
            "error_message": error_message}
        con.execute(query, params)


class SaveQuery(BaseModel):
    user_id: str
    selection_type: str
    node1: str
    keyword1: Optional[str] = None
    node2: Optional[str] = None
    keyword2: Optional[str] = None
    node3: Optional[str] = None
    keyword3: Optional[str] = None
    dataset: Optional[str] = None


@app.post('/saveQuery')
def save_query(save_query: SaveQuery):
    with SessionLocal() as con:
        query = text("""
            INSERT INTO ld_user_saved_queries (user_id, selection_type, node1, keyword1, node2, keyword2, node3, keyword3, dataset)
            VALUES (:user_id, :selection_type, :node1, :keyword1, :node2, :keyword2, :node3, :keyword3, :dataset)
        """)
        params = {
            "user_id": save_query.user_id,
            "selection_type": save_query.selection_type,
            "node1": save_query.node1,
            "keyword1": save_query.keyword1,
            "node2": save_query.node2,
            "keyword2": save_query.keyword2,
            "node3": save_query.node3,
            "keyword3": save_query.keyword3,
            "dataset": save_query.dataset
        }
        con.execute(query, params)
        return {'message': 'Query saved successfully'}

@app.post('/updateSavedQuery')
def update_saved_query(uuid: str, query_name: Optional[str] = None):
    with SessionLocal() as con:
        if not uuid:
            return {'message': 'Please provide a uuid to update'}
        query = text("""
            UPDATE ld_user_saved_queries
            SET query_name = :query_name
            WHERE uuid = :uuid
        """)
        params = {"uuid": uuid, "query_name": query_name}
        result = con.execute(query, params)
        if result.rowcount == 0:
            return {'message': f"No saved query found with uuid '{uuid}'"}
        else:
            return {'message': f"Query with uuid '{uuid}' updated successfully"}

@app.post('/deleteSavedQuery')
def delete_saved_query(uuid: str):
    with SessionLocal() as con:
        if not uuid:
            return {'message': 'Please provide a uuid to delete'}
        query = text("""
            DELETE FROM ld_user_saved_queries
            WHERE uuid = :uuid
        """)
        params = {"uuid": uuid}
        result = con.execute(query, params)
        if result.rowcount == 0:
            return {'message': f"No saved query found with uuid '{uuid}'"}
        else:
            return {'message': f"Query with uuid '{uuid}' deleted successfully"}


@app.get("/userQueries/{user_id}")
async def get_saved_queries(user_id: str, limit: Optional[int] = 100, skip: Optional[int] = 0):
    query = text("""
        SELECT uuid, user_id, selection_type, node1, keyword1, node2, keyword2, node3, keyword3, dataset, save_time
        FROM ld_user_saved_queries
        WHERE user_id = :user_id
        ORDER BY save_time DESC
        LIMIT :limit
        OFFSET :skip
    """)
    params = {"user_id": user_id,
              "limit": limit,
              "skip": skip}
    with SessionLocal() as con:
        result = con.execute(query, params)
        return [SavedQuery(**row) for row in result]
