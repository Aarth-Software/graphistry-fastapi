CREATE or replace TABLE ld_query_builder (
  ld_node1 varchar2(50),
  ld_node2 varchar2(50),
  ld_node3 varchar2(50),
  ld_match_query TEXT,
  ld_match_node1 TEXT,
  ld_match_node2 TEXT,
  ld_match_node3 TEXT,
  ld_return_node1 TEXT,
  ld_return_node2 TEXT,
  ld_return_node3 TEXT,
    ld_return_edge1 TEXT,
    ld_return_edge2 TEXT, 
  ld_limit INTEGER,
    ld_edge_point_icon TEXT
);
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Construct (Ind. Var.)','Construct (Mediator)','Construct (Dep. Var.)','MATCH (H:Hypothesis)-[:STUDIED]->(C1:Construct)-[:AS]->(iv:IndependentVariable)
 MATCH (H)-[:STUDIED]->(C2:Construct)-[:AS]->(ME:MediatorVariable) MATCH (H)-[:STUDIED]->(C3:Construct)-[:AS]->(DV:DependentVariable) where 1=1','tolower(C1.name) Contains','tolower(C2.name) Contains','tolower(C3.name )Contains','distinct id(C1) as id,C1.name as construct_name, C1.constructRole as constructRole, CASE WHEN C1.hypothesisLabel IS NOT NULL THEN C1.hypothesisLabel ELSE C1.propositionLabel END as hypothesisStatement, C1.JournalReferenceTitle as JournalReferenceTitle, C1.sourceTitle as sourceTitle, C1.year as year, C1.affiliation as affiliation, C1.publisherName as publisherName','distinct id(C2) as id,C2.name as construct_name, C2.constructRole as constructRole,CASE WHEN C2.hypothesisLabel IS NOT NULL THEN C2.hypothesisLabel ELSE C2.propositionLabel END as hypothesisStatement, C2.JournalReferenceTitle as JournalReferenceTitle, C2.sourceTitle as sourceTitle, C2.year as year, C2.affiliation as affiliation, C2.publisherName as publisherName','distinct id(C3) as id,C3.name as construct_name,C3.constructRole as constructRole, CASE WHEN C3.hypothesisLabel IS NOT NULL THEN C3.hypothesisLabel ELSE C3.propositionLabel END as hypothesisStatement, C3.JournalReferenceTitle as JournalReferenceTitle, C3.sourceTitle as sourceTitle, C3.year as year, C3.affiliation as affiliation, C3.publisherName as publisherName','distinct id(C1) as n1,id(C2) as n2',' distinct id(C2) as n1,id(C3) as n2',100,'ConstructRole');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Construct (Ind. Var.)','Construct (Moderator)','Construct (Dep. Var.)','MATCH (H:Hypothesis)-[:STUDIED]->(C1:Construct)-[:AS]->(iv:IndependentVariable)
 MATCH (H)-[:STUDIED]->(C2:Construct)-[:AS]->(MO:ModeratorVariable)
 MATCH (H)-[:STUDIED]->(C3:Construct)-[:AS]->(DV:DependentVariable) where 1=1','tolower(C1.name) Contains','tolower(C2.name) Contains','tolower(C3.name) Contains','distinct id(C1) as id,C1.name as construct_name, C1.constructRole as constructRole, CASE WHEN C1.hypothesisLabel IS NOT NULL THEN C1.hypothesisLabel ELSE C1.propositionLabel END as hypothesisStatement, C1.JournalReferenceTitle as JournalReferenceTitle, C1.sourceTitle as sourceTitle, C1.year as year, C1.affiliation as affiliation, C1.publisherName as publisherName','distinct id(C2) as id,C2.name as construct_name,C2.constructRole as constructRole, CASE WHEN C2.hypothesisLabel IS NOT NULL THEN C2.hypothesisLabel ELSE C2.propositionLabel END as hypothesisStatement, C2.JournalReferenceTitle as JournalReferenceTitle, C2.sourceTitle as sourceTitle, C2.year as year, C2.affiliation as affiliation, C2.publisherName as publisherName','distinct id(C3) as id,C3.name as construct_name,C3.constructRole as constructRole, CASE WHEN C3.hypothesisLabel IS NOT NULL THEN C3.hypothesisLabel ELSE C3.propositionLabel END as hypothesisStatement, C3.JournalReferenceTitle as JournalReferenceTitle, C3.sourceTitle as sourceTitle, C3.year as year, C3.affiliation as affiliation, C3.publisherName as publisherName','distinct id(C1) as n1,id(C2) as n2','distinct id(C2) as n1,id(C3) as n2',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Publisher','','','match (PU:Publisher) where 1=1','tolower(PU.name) Contains','','','distinct id(PU) as id,"Publisher" as nodeLabel, PU.name as Name','','','distinct id(PU) as n1','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Proposition','','','match (PR:Proposition) where 1=1','tolower(PR.statement) Contains','','','distinct id(PR) as id, "Proposition" as nodeLabel, PR.statement as Statement, PR.journalReferenceTitle as Title, PR.sourceTitle as SourceTitle, PR.year as Year, PR.affiliation as Affiliation, PR.publisherName as PublisherName','','','distinct id(PR) as n1','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Keyword','','','match (KE:Keyword) where 1=1','tolower(KE.name) Contains','','','distinct id(KE) as id, "Keyword" as nodeLabel, KE.name as Name, KE.journalReferenceTitle as Title, KE.sourceTitle as SourceTitle, KE.year as Year, KE.affiliation as Affiliation, KE.publisherName as PublisherName','','','distinct id(KE) as n1','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalReference','','','match (JR:JournalReference) where 1=1','tolower(JR.title) Contains','','','distinct id(JR) as id, "JournalReference" as nodeLabel, JR.title as Title, JR.sourceTitle as SourceTitle, JR.year as Year, JR.affiliation as Affiliation, JR.publisherName as PublisherName','','','distinct id(JR) as n1','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Hypothesis','','','match (HY:Hypothesis) where 1=1','tolower(HY.statement )Contains','','','distinct id(HY) as id, "Hypothesis" as nodeLabel, HY.statement as Statement, HY.journalReferenceTitle as  Title, HY.sourceTitle as SourceTitle, HY.year as Year, HY.affiliation as Affiliation, HY.publisherName as PublisherName','','','distinct id(HY) as n1','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Funding','','','match (FU:Funding) where 1=1','tolower(FU.name) Contains','','','distinct id(FU) as id,  "Funding" as nodeLabel, FU.name as Name','','','distinct id(FU) as n1','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Construct','','','match (CO:Construct) where 1=1','tolower(CO.name) Contains','','','distinct id(CO) as id, "Construct" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','','distinct id(CO) as n1','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Author','','','match (AU:Author) where 1=1','tolower(AU.fullName) Contains','','','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','','','distinct id(AU) as n1','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Affiliation','','','match (AF:Affiliation) where 1=1','tolower(AF.name )Contains','','','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','','','distinct id(AF) as n1','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Ind. Var.','Dep. Var.','','match (IN:IndependentVariable)<-[:AS]-(C1:Construct)<-[:STUDIED]-(HY:Hypothesis)-[:STUDIED]->(C2:Construct)-[:AS]->(DE:DependentVariable) where 1=1','tolower(C1.name )Contains','tolower(C2.name) Contains','','distinct id(C1) as id, "IndependentVariable" as nodeLabel, C1.name as Name,   CASE 
    WHEN C1.hypothesisLabel IS NOT NULL THEN C1.hypothesisLabel 
    ELSE C1.propositionLabel 
  END as hypothesisStatement, C1.journalReferenceTitle as Title, C1.sourceTitle as SourceTitle, C1.year as Year, C1.affiliation as Affiliation, C1.publisherName as PublisherName','distinct id(C2) as id, "DependentVariable" as nodeLabel, C2.name as Name,   CASE 
    WHEN C2.hypothesisLabel IS NOT NULL THEN C2.hypothesisLabel 
    ELSE C2.propositionLabel 
  END as hypothesisStatement, C2.journalReferenceTitle as Title, C2.sourceTitle as SourceTitle, C2.year as Year, C2.affiliation as Affiliation, C2.publisherName as PublisherName','','distinct id(C1) as n1,  id(C2) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Hypothesis','Construct','','match (HY:Hypothesis)-[:STUDIED]->(CO:Construct) where 1=1','tolower(HY.statement) Contains','tolower(CO.name) Contains','','distinct id(HY) as id,  "Hypothesis" as nodeLabel, HY.statement as Statement, HY.journalReferenceTitle as  Title, HY.sourceTitle as SourceTitle, HY.year as Year, HY.affiliation as Affiliation, HY.publisherName as PublisherName','distinct id(CO) as id, "Construct" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(HY) as n1,  id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Hypothesis','Construct (Ind. Var.)','','match (HY:Hypothesis)-[:STUDIED]->(CO:Construct)-[:AS]->(IN:IndependentVariable) where 1=1','tolower(HY.statement )Contains','tolower(CO.name) Contains','','distinct id(HY) as id,  "Hypothesis" as nodeLabel, HY.statement as Statement, HY.journalReferenceTitle as  Title, HY.sourceTitle as SourceTitle, HY.year as Year, HY.affiliation as Affiliation, HY.publisherName as PublisherName','distinct id(CO) as id, "IndependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(HY) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Hypothesis','Construct (Dep. Var.)','','match (HY:Hypothesis)-[:STUDIED]->(CO:Construct)-[:AS]->(DE:DependentVariable) where 1=1','tolower(HY.statement) Contains','tolower(CO.name) Contains','','distinct id(HY) as id,  "Hypothesis" as nodeLabel, HY.statement as Statement, HY.journalReferenceTitle as  Title, HY.sourceTitle as SourceTitle, HY.year as Year, HY.affiliation as Affiliation, HY.publisherName as PublisherName','distinct id(CO) as id, "DependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(HY) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Hypothesis','Construct (Mediator)','','match (HY:Hypothesis)-[:STUDIED]->(CO:Construct)-[:AS]->(ME:MediatorVariable)  where 1=1','tolower(HY.statement) Contains','tolower(CO.name) Contains','','distinct id(HY) as id,  "Hypothesis" as nodeLabel, HY.statement as Statement, HY.journalReferenceTitle as  Title, HY.sourceTitle as SourceTitle, HY.year as Year, HY.affiliation as Affiliation, HY.publisherName as PublisherName','distinct id(CO) as id, "Mediator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(HY) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Hypothesis','Construct (Moderator)','','match (HY:Hypothesis)-[:STUDIED]->(CO:Construct)-[:AS]->(MO:ModeratorVariable) where 1=1','tolower(HY.statement) Contains','tolower(CO.name )Contains','','distinct id(HY) as id,  "Hypothesis" as nodeLabel, HY.statement as Statement, HY.journalReferenceTitle as  Title, HY.sourceTitle as SourceTitle, HY.year as Year, HY.affiliation as Affiliation, HY.publisherName as PublisherName','distinct id(CO) as id, "Moderator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(HY) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Proposition','Construct','','match (PR:Proposition)-[:STUDIED]->(CO:Construct) where 1=1','tolower(PR.statement) Contains','tolower(CO.name) Contains','','distinct id(PR) as id, "Proposition" as nodeLabel, PR.statement as Statement, PR.journalReferenceTitle as Title, PR.sourceTitle as SourceTitle, PR.year as Year, PR.affiliation as Affiliation, PR.publisherName as PublisherName','distinct id(CO) as id, "Construct" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(PR) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Proposition','Construct (Ind. Var.)','','match (PR:Proposition)-[:STUDIED]->(CO:Construct)-[:AS]->(IN:IndependentVariable) where 1=1','tolower(PR.statement) Contains','tolower(CO.name) Contains','','distinct id(PR) as id, "Proposition" as nodeLabel, PR.statement as Statement, PR.journalReferenceTitle as Title, PR.sourceTitle as SourceTitle, PR.year as Year, PR.affiliation as Affiliation, PR.publisherName as PublisherName','distinct id(CO) as id, "IndependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(PR) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Proposition','Construct (Dep. Var.)','','match (PR:Proposition)-[:STUDIED]->(CO:Construct)-[:AS]->(DE:DependentVariable) where 1=1','tolower(PR.statement) Contains','tolower(CO.name )Contains','','distinct id(PR) as id, "Proposition" as nodeLabel, PR.statement as Statement, PR.journalReferenceTitle as Title, PR.sourceTitle as SourceTitle, PR.year as Year, PR.affiliation as Affiliation, PR.publisherName as PublisherName','distinct id(CO) as id, "DependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(PR) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Proposition','Construct (Mediator)','','match (PR:Proposition)-[:STUDIED]->(CO:Construct)-[:AS]->(ME:MediatorVariable) where 1=1','tolower(PR.statement) Contains','tolower(CO.name) Contains','','distinct id(PR) as id, "Proposition" as nodeLabel, PR.statement as Statement, PR.journalReferenceTitle as Title, PR.sourceTitle as SourceTitle, PR.year as Year, PR.affiliation as Affiliation, PR.publisherName as PublisherName','distinct id(CO) as id, "Mediator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(PR) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Proposition','Construct (Moderator)','','match (PR:Proposition)-[:STUDIED]->(CO:Construct)-[:AS]->(MO:ModeratorVariable) where 1=1','tolower(PR.statement )Contains','tolower(CO.name) Contains','','distinct id(PR) as id, "Proposition" as nodeLabel, PR.statement as Statement, PR.journalReferenceTitle as Title, PR.sourceTitle as SourceTitle, PR.year as Year, PR.affiliation as Affiliation, PR.publisherName as PublisherName','distinct id(CO) as id, "Moderator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(PR) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalReference','Construct','','match (JR:JournalReference)-[:STUDIED]->(CO:Construct) where 1=1','tolower(JR.title )Contains','tolower(CO.name) Contains','','distinct id(JR) as id, "JournalReference" as nodeLabel, JR.title as Title, JR.sourceTitle as SourceTitle, JR.year as Year, JR.affiliation as Affiliation, JR.publisherName as PublisherName','distinct id(CO) as id, "Construct" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(JR) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalReference','Construct (Ind. Var.)','','match (JR:JournalReference)-[:STUDIED]->(CO:Construct)-[:AS]->(IN:IndependentVariable) where 1=1','tolower(JR.title) Contains','tolower(CO.name) Contains','','distinct id(JR) as id, "JournalReference" as nodeLabel, JR.title as Title, JR.sourceTitle as SourceTitle, JR.year as Year, JR.affiliation as Affiliation, JR.publisherName as PublisherName','distinct id(CO) as id, "IndependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(JR) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalReference','Construct (Dep. Var.)','','match (JR:JournalReference)-[:STUDIED]->(CO:Construct)-[:AS]->(DE:DependentVariable) where 1=1','tolower(JR.title) Contains','tolower(CO.name) Contains','','distinct id(JR) as id, "JournalReference" as nodeLabel, JR.title as Title, JR.sourceTitle as SourceTitle, JR.year as Year, JR.affiliation as Affiliation, JR.publisherName as PublisherName','distinct id(CO) as id, "DependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(JR) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalReference','Construct (Mediator)','','match (JR:JournalReference))-[:STUDIED]->(CO:Construct)-[:AS]->(ME:MediatorVariable)  where 1=1','tolower(JR.title) Contains','tolower(CO.name) Contains','','distinct id(JR) as id, "JournalReference" as nodeLabel, JR.title as Title, JR.sourceTitle as SourceTitle, JR.year as Year, JR.affiliation as Affiliation, JR.publisherName as PublisherName','distinct id(CO) as id, "Mediator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(JR) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalReference','Construct (Moderator)','','match (JR:JournalReference)-[:STUDIED]->(CO:Construct)-[:AS]->(MO:ModeratorVariable) where 1=1','tolower(JR.title) Contains','tolower(CO.name )Contains','','distinct id(JR) as id, "JournalReference" as nodeLabel, JR.title as Title, JR.sourceTitle as SourceTitle, JR.year as Year, JR.affiliation as Affiliation, JR.publisherName as PublisherName','distinct id(CO) as id, "Moderator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(JR) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalReference','Hypothesis','','match (JR:JournalReference)-[:STUDIED]->(HY:Hypothesis) where 1=1','tolower(JR.title) Contains','tolower(HY.statement) Contains','','distinct id(JR) as id, "JournalReference" as nodeLabel, JR.title as Title, JR.sourceTitle as SourceTitle, JR.year as Year, JR.affiliation as Affiliation, JR.publisherName as PublisherName','distinct id(HY) as id,  "Hypothesis" as nodeLabel, HY.statement as Statement, HY.journalReferenceTitle as  Title, HY.sourceTitle as SourceTitle, HY.year as Year, HY.affiliation as Affiliation, HY.publisherName as PublisherName','','distinct id(JR) as n1, id(HY) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalReference','Proposition','','match (JR:JournalReference)-[:STUDIED]->(PR:Proposition) where 1=1','tolower(JR.title) Contains','tolower(PR.statement )Contains','','distinct id(JR) as id, "JournalReference" as nodeLabel, JR.title as Title, JR.sourceTitle as SourceTitle, JR.year as Year, JR.affiliation as Affiliation, JR.publisherName as PublisherName','distinct id(PR) as id, "Proposition" as nodeLabel, PR.statement as Statement, PR.journalReferenceTitle as Title, PR.sourceTitle as SourceTitle, PR.year as Year, PR.affiliation as Affiliation, PR.publisherName as PublisherName','','distinct id(JR) as n1, id(PR) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalReference','Keyword','','match (JR:JournalReference)-[:HAS]->(KE:Keyword) where 1=1','tolower(JR.title) Contains','tolower(KE.name) Contains','','distinct id(JR) as id, "JournalReference" as nodeLabel, JR.title as Title, JR.sourceTitle as SourceTitle, JR.year as Year, JR.affiliation as Affiliation, JR.publisherName as PublisherName','distinct id(KE) as id, "Keyword" as nodeLabel, KE.name as Name, KE.journalReferenceTitle as Title, KE.sourceTitle as SourceTitle, KE.year as Year, KE.affiliation as Affiliation, KE.publisherName as PublisherName','','distinct id(JR) as n1, id(KE) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalPublication','Construct','','match (JP:JournalPublication)<-[:APPEARED_IN]-(JR:JournalReference)-[:STUDIED]->(CO:Construct) where 1=1','tolower(JP.name) Contains','tolower(CO.name) Contains','','distinct id(JP) as id, "JournalPublication" as nodeLabel, JP.name as Name, JP.publisherName as PublisherName','distinct id(CO) as id, "Construct" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(JP) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalPublication','Construct (Ind. Var.)','','match (JP:JournalPublication)<-[:APPEARED_IN]-(JR:JournalReference)-[:STUDIED]->(CO:Construct)-[:AS]->(IN:IndependentVariable) where 1=1','tolower(JP.name) Contains','tolower(CO.name) Contains','','distinct id(JP) as id, "JournalPublication" as nodeLabel, JP.name as Name, JP.publisherName as PublisherName','distinct id(CO) as id, "IndependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(JP) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalPublication','Construct (Dep. Var.)','','match (JP:JournalPublication)<-[:APPEARED_IN]-(JR:JournalReference)-[:STUDIED]->(CO:Construct)-[:AS]->(DE:DependentVariable) where 1=1','tolower(JP.name) Contains','tolower(CO.name) Contains','','distinct id(JP) as id, "JournalPublication" as nodeLabel, JP.name as Name, JP.publisherName as PublisherName','distinct id(CO) as id, "DependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(JP) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalPublication','Construct (Mediator)','','match (JP:JournalPublication)<-[:APPEARED_IN]-(JR:JournalReference)-[:STUDIED]->(CO:Construct)-[:AS]->(ME:MediatorVariable) where 1=1','tolower(JP.name) Contains','tolower(CO.name) Contains','','distinct id(JP) as id, "JournalPublication" as nodeLabel, JP.name as Name, JP.publisherName as PublisherName','distinct id(CO) as id, "Mediator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(JP) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalPublication','Construct (Moderator)','','match (JP:JournalPublication)<-[:APPEARED_IN]-(JR:JournalReference)-[:STUDIED]->(CO:Construct)-[:AS]->(MO:ModeratorVariable) where 1=1','tolower(JP.name )Contains','tolower(CO.name) Contains','','distinct id(JP) as id, "JournalPublication" as nodeLabel, JP.name as Name, JP.publisherName as PublisherName','distinct id(CO) as id, "Moderator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(JP) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalPublication','Hypothesis','','match (JP:JournalPublication)-[:STUDIED]->(HY:Hypothesis) where 1=1','tolower(JP.name )Contains','tolower(HY.statement )Contains','','distinct id(JP) as id, "JournalPublication" as nodeLabel, JP.name as Name, JP.publisherName as PublisherName','distinct id(HY) as id,  "Hypothesis" as nodeLabel, HY.statement as Statement, HY.journalReferenceTitle as  Title, HY.sourceTitle as SourceTitle, HY.year as Year, HY.affiliation as Affiliation, HY.publisherName as PublisherName','','distinct id(JP) as n1,  id(HY) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalPublication','Proposition','','match (JP:JournalPublication)-[:STUDIED]->(PR:Proposition) where 1=1','tolower(JP.name) Contains','tolower(PR.statement) Contains','','distinct id(JP) as id, "JournalPublication" as nodeLabel, JP.name as Name, JP.publisherName as PublisherName','distinct id(PR) as id, "Proposition" as nodeLabel, PR.statement as Statement, PR.journalReferenceTitle as Title, PR.sourceTitle as SourceTitle, PR.year as Year, PR.affiliation as Affiliation, PR.publisherName as PublisherName','','distinct id(JP) as n1, id(PR) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalPublication','JournalReference','','match (JP:JournalPublication)<-[:APPEARED_IN]-(JR:JournalReference) where 1=1','tolower(JP.name) Contains','tolower(JR.title )Contains','','distinct id(JP) as id, "JournalPublication" as nodeLabel, JP.name as Name, JP.publisherName as PublisherName','distinct id(JR) as id, "JournalReference" as nodeLabel, JR.title as Title, JR.sourceTitle as SourceTitle, JR.year as Year, JR.affiliation as Affiliation, JR.publisherName as PublisherName','','distinct id(JP) as n1, id(JR) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalPublication','Author','','match (JP:JournalPublication)<-[:CONTRIBUTED_IN]-(AU:Author) where 1=1','tolower(JP.name) Contains','tolower(AU.fullName) Contains','','distinct id(JP) as id, "JournalPublication" as nodeLabel, JP.name as Name, JP.publisherName as PublisherName','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','','distinct id(JP) as n1, id(AU) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalPublication','Keyword','','match (JP:JournalPublication)<-[:APPEARED_IN]-(JR:JournalReference)-[:HAS]->(KE:Keyword) where 1=1','tolower(JP.name) Contains','tolower(KE.name) Contains','','distinct id(JP) as id, "JournalPublication" as nodeLabel, JP.name as Name, JP.publisherName as PublisherName','distinct id(KE) as id, "Keyword" as nodeLabel, KE.name as Name, KE.journalReferenceTitle as Title, KE.sourceTitle as SourceTitle, KE.year as Year, KE.affiliation as Affiliation, KE.publisherName as PublisherName','','distinct id(JP) as n1, id(KE) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalPublication','Affiliation','','match (JP:JournalPublication)<-[:APPEARED_IN]-(JR:JournalReference)<-[:PRODUCED]-(AF:Affiliation) where 1=1','tolower(JP.name) Contains','tolower(AF.name) Contains','','distinct id(JP) as id, "JournalPublication" as nodeLabel, JP.name as Name, JP.publisherName as PublisherName','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','','distinct id(JP) as n1, id(AF) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('JournalPublication','Funding','','match (JP:JournalPublication)<-[:APPEARED_IN]-(JR:JournalReference)<-[:FUNDED]-(FU:Funding) where 1=1','tolower(JP.name) Contains','tolower(FU.name) Contains','','distinct id(JP) as id, "JournalPublication" as nodeLabel, JP.name as Name, JP.publisherName as PublisherName','distinct id(FU) as id, "Funding" as nodeLabel, FU.name as Name','','distinct id(JP) as n1, id(FU) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Publisher','Construct','','match (PU:Publisher)<-[:CONTRIBUTED_IN]-(AU:Author)-[:STUDIED]->(CO:Construct) where 1=1','tolower(PU.name) Contains','tolower(CO.name) Contains','','distinct id(PU) as id, "Publisher" as nodeLabel, PU.name as Name','distinct id(CO) as id, "Construct" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(PU) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Publisher','Construct (Ind. Var.)','','match (PU:Publisher)<-[:CONTRIBUTED_IN]-(AU:Author)-[:STUDIED]->(CO:Construct)-[:AS]->(IN:IndependentVariable)  where 1=1','tolower(PU.name) Contains','tolower(CO.name) Contains','','distinct id(PU) as id, "Publisher" as nodeLabel, PU.name as Name','distinct id(CO) as id, "IndependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(PU) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Publisher','Construct (Dep. Var.)','','match (PU:Publisher)<-[:CONTRIBUTED_IN]-(AU:Author)-[:STUDIED]->(CO:Construct)-[:AS]->(DE:DependentVariable) where 1=1','tolower(PU.name) Contains','tolower(CO.name) Contains','','distinct id(PU) as id, "Publisher" as nodeLabel, PU.name as Name','distinct id(CO) as id, "DependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(PU) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Publisher','Construct (Mediator)','','match (PU:Publisher)<-[:CONTRIBUTED_IN]-(AU:Author)-[:STUDIED]->(CO:Construct)-[:AS]->(ME:MediatorVariable) where 1=1','tolower(PU.name )Contains','tolower(CO.name) Contains','','distinct id(PU) as id, "Publisher" as nodeLabel, PU.name as Name','distinct id(CO) as id, "Mediator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(PU) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Publisher','Construct (Moderator)','','match (PU:Publisher)<-[:CONTRIBUTED_IN]-(AU:Author)-[:STUDIED]->(CO:Construct)-[:AS]->(MO:ModeratorVariable) where 1=1','tolower(PU.name )Contains','tolower(CO.name) Contains','','distinct id(PU) as id, "Publisher" as nodeLabel, PU.name as Name','distinct id(CO) as id, "Moderator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(PU) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Publisher','Hypothesis','','match (PU:Publisher)<-[:CONTRIBUTED_IN]-(AU:Author)-[:STUDIED]->(HY:Hypothesis) where 1=1','tolower(PU.name) Contains','tolower(HY.statement) Contains','','distinct id(PU) as id, "Publisher" as nodeLabel, PU.name as Name','distinct id(HY) as id,  "Hypothesis" as nodeLabel, HY.statement as Statement, HY.journalReferenceTitle as  Title, HY.sourceTitle as SourceTitle, HY.year as Year, HY.affiliation as Affiliation, HY.publisherName as PublisherName','','distinct id(PU) as n1, id(HY) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Publisher','Proposition','','match (PU:Publisher)<-[:CONTRIBUTED_IN]-(AU:Author)-[:STUDIED]->(PR:Proposition) where 1=1','tolower(PU.name) Contains','tolower(PR.statement) Contains','','distinct id(PU) as id, "Publisher" as nodeLabel, PU.name as Name','distinct id(PR) as id, "Proposition" as nodeLabel, PR.statement as Statement, PR.journalReferenceTitle as Title, PR.sourceTitle as SourceTitle, PR.year as Year, PR.affiliation as Affiliation, PR.publisherName as PublisherName','','distinct id(PU) as n1, id(PR) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Publisher','JournalReference','','match (PU:Publisher)<-[:PUBLISHED_BY]-(JP:JournalPublication)<-[:APPEARED_IN]-(JR:JournalReference) where 1=1','tolower(PU.name )Contains','tolower(JR.title) Contains','','distinct id(PU) as id, "Publisher" as nodeLabel, PU.name as Name','distinct id(JR) as id, "JournalReference" as nodeLabel, JR.title as Title, JR.sourceTitle as SourceTitle, JR.year as Year, JR.affiliation as Affiliation, JR.publisherName as PublisherName','','distinct id(PU) as n1, id(JR) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Publisher','Author','','match (PU:Publisher)<-[:CONTRIBUTED_IN]-(AU:Author) where 1=1','tolower(PU.name) Contains','tolower(AU.fullName) Contains','','distinct id(PU) as id, "Publisher" as nodeLabel, PU.name as Name','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','','distinct id(PU) as n1, id(AU) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Publisher','Keyword','','match (PU:Publisher)<-[:CONTRIBUTED_IN]-(AU:Author)-[:USED]->(KE:Keyword) where 1=1','tolower(PU.name) Contains','tolower(KE.name )Contains','','distinct id(PU) as id, "Publisher" as nodeLabel, PU.name as Name','distinct id(KE) as id, "Keyword" as nodeLabel, KE.name as Name, KE.journalReferenceTitle as Title, KE.sourceTitle as SourceTitle, KE.year as Year, KE.affiliation as Affiliation, KE.publisherName as PublisherName','','distinct id(PU) as n1, id(KE) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Publisher','Affiliation','','match (PU:Publisher)<-[:PUBLISHED_BY]-(JP:JournalPublication)<-[:APPEARED_IN]-(JR:JournalReference)<-[:PRODUCED]-(AF:Affiliation) where 1=1','tolower(PU.name) Contains','tolower(AF.name) Contains','','distinct id(PU) as id, "Publisher" as nodeLabel, PU.name as Name','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','','distinct id(PU) as n1, id(AF) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Publisher','Funding','','match (PU:Publisher)<-[:CONTRIBUTED_IN]-(AU:Author)-[:FUNDED_BY]->(FU:Funding) where 1=1','tolower(PU.name) Contains','tolower(FU.name) Contains','','distinct id(PU) as id, "Publisher" as nodeLabel, PU.name as Name','distinct id(FU) as id, "Funding" as nodeLabel, FU.name as Name','','distinct id(PU) as n1,  id(FU) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Author','Construct','','match (AU:Author)-[:STUDIED]->(CO:Construct) where 1=1','tolower(AU.fullName )Contains','tolower(CO.name )Contains','','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','distinct id(CO) as id, "Construct" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(AU) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Author','Construct (Ind. Var.)','','match (AU:Author)-[:STUDIED]->(CO:Construct)-[:AS]->(IN:IndependentVariable) where 1=1','tolower(AU.fullName) Contains','tolower(CO.name )Contains','','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','distinct id(CO) as id, "IndependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(AU) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Author','Construct (Dep. Var.)','','match (AU:Author)-[:STUDIED]->(CO:Construct)-[:AS]->(DE:DependentVariable) where 1=1','tolower(AU.fullName) Contains','tolower(CO.name) Contains','','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','distinct id(CO) as id, "DependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(AU) as n1,  id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Author','Construct (Mediator)','','match (AU:Author)-[:STUDIED]->(CO:Construct)-[:AS]->(ME:MediatorVariable) where 1=1','tolower(AU.fullName) Contains','tolower(CO.name) Contains','','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','distinct id(CO) as id, "Mediator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(AU) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Author','Construct (Moderator)','','match (AU:Author)-[:STUDIED]->(CO:Construct)-[:AS]->(MO:ModeratorVariable) where 1=1','tolower(AU.fullName )Contains','tolower(CO.name) Contains','','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','distinct id(CO) as id, "Moderator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(AU) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Author','Hypothesis','','match (AU:Author)-[:STUDIED]->(HY:Hypothesis) where 1=1','tolower(AU.fullName) Contains','tolower(HY.statement )Contains','','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','distinct id(HY) as id,  "Hypothesis" as nodeLabel, HY.statement as Statement, HY.journalReferenceTitle as  Title, HY.sourceTitle as SourceTitle, HY.year as Year, HY.affiliation as Affiliation, HY.publisherName as PublisherName','','distinct id(AU) as n1, id(HY) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Author','Proposition','','match (AU:Author)-[:STUDIED]->(PR:Proposition) where 1=1','tolower(AU.fullName) Contains','tolower(PR.statement) Contains','','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','distinct id(PR) as id, "Proposition" as nodeLabel, PR.statement as Statement, PR.journalReferenceTitle as Title, PR.sourceTitle as SourceTitle, PR.year as Year, PR.affiliation as Affiliation, PR.publisherName as PublisherName','','distinct id(AU) as n1, id(PR) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Author','JournalReference','','match (AU:Author)-[:CONTRIBUTED_TO]->(JP:JournalPublication)<-[:APPEARED_IN]-(JR:JournalReference) where 1=1','tolower(AU.fullName )Contains','tolower(JR.title) Contains','','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','distinct id(JR) as id, "JournalReference" as nodeLabel, JR.title as Title, JR.sourceTitle as SourceTitle, JR.year as Year, JR.affiliation as Affiliation, JR.publisherName as PublisherName','','distinct id(AU) as n1, id(JR) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Author','Keyword','','match (AU:Author)-[:USED]->(KE:Keyword) where 1=1','tolower(AU.fullName )Contains','tolower(KE.name )Contains','','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','distinct id(KE) as id, "Keyword" as nodeLabel, KE.name as Name, KE.journalReferenceTitle as Title, KE.sourceTitle as SourceTitle, KE.year as Year, KE.affiliation as Affiliation, KE.publisherName as PublisherName','','distinct id(AU) as n1, id(KE) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Author','Funding','','match (AU:Author)-[:FUNDED_BY]->(FU:Funding) where 1=1','tolower(AU.fullName )Contains','tolower(FU.name) Contains','','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','distinct id(FU) as id, "Funding" as nodeLabel, FU.name as Name','','distinct id(AU) as n1, id(FU) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Affiliation','Construct','','match (AF:Affiliation)-[PRODUCED]->(JR:JournalReference)-[:STUDIED]->(CO:Construct) where 1=1','tolower(AF.name) Contains','tolower(CO.name) Contains','','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','distinct id(CO) as id, "Construct" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(AF) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Affiliation','Construct (Ind. Var.)','','match (AF:Affiliation)-[PRODUCED]->(JR:JournalReference)-[:STUDIED]->(CO:Construct)-[:AS]->(IN:IndependentVariable) where 1=1','tolower(AF.name) Contains','tolower(CO.name) Contains','','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','distinct id(CO) as id, "IndependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(AF) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Affiliation','Construct (Dep. Var.)','','match (AF:Affiliation)-[PRODUCED]->(JR:JournalReference)-[:STUDIED]->(CO:Construct)-[:AS]->(DE:DependentVariable) where 1=1','tolower(AF.name) Contains','tolower(CO.name) Contains','','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','distinct id(CO) as id, "DependentVariable" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(AF) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Affiliation','Construct (Mediator)','','match (AF:Affiliation)-[PRODUCED]->(JR:JournalReference)-[:STUDIED]->(CO:Construct)-[:AS]->(ME:MediatorVariable) where 1=1','tolower(AF.name) Contains','tolower(CO.name )Contains','','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','distinct id(CO) as id, "Mediator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(AF) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Affiliation','Construct (Moderator)','','match (AF:Affiliation)-[PRODUCED]->(JR:JournalReference)-[:STUDIED]->(CO:Construct)-[:AS]->(MO:ModeratorVariable) where 1=1','tolower(AF.name) Contains','tolower(CO.name) Contains','','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','distinct id(CO) as id, "Moderator" as nodeLabel, CO.name as Name,   CASE 
    WHEN CO.hypothesisLabel IS NOT NULL THEN CO.hypothesisLabel 
    ELSE CO.propositionLabel 
  END as hypothesisStatement, CO.journalReferenceTitle as Title, CO.sourceTitle as SourceTitle, CO.year as Year, CO.affiliation as Affiliation, CO.publisherName as PublisherName','','distinct id(AF) as n1, id(CO) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Affiliation','Hypothesis','','match (AF:Affiliation)-[PRODUCED]->(JR:JournalReference)-[:STUDIED]->(HY:Hypothesis) where 1=1','tolower(AF.name) Contains','tolower(HY.statement) Contains','','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','distinct id(HY) as id,  "Hypothesis" as nodeLabel, HY.statement as Statement, HY.journalReferenceTitle as  Title, HY.sourceTitle as SourceTitle, HY.year as Year, HY.affiliation as Affiliation, HY.publisherName as PublisherName','','distinct id(AF) as n1, id(HY) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Affiliation','Proposition','','match (AF:Affiliation)-[PRODUCED]->(JR:JournalReference)-[:STUDIED]->(PR:Proposition) where 1=1','tolower(AF.name )Contains','tolower(PR.statement) Contains','','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','distinct id(PR) as id, "Proposition" as nodeLabel, PR.statement as Statement, PR.journalReferenceTitle as Title, PR.sourceTitle as SourceTitle, PR.year as Year, PR.affiliation as Affiliation, PR.publisherName as PublisherName','','distinct id(AF) as n1, id(PR) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Affiliation','JournalReference','','match (AF:Affiliation)-[PRODUCED]->(JR:JournalReference) where 1=1','tolower(AF.name) Contains','tolower(JR.title )Contains','','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','distinct id(JR) as id, "JournalReference" as nodeLabel, JR.title as Title, JR.sourceTitle as SourceTitle, JR.year as Year, JR.affiliation as Affiliation, JR.publisherName as PublisherName','','distinct id(AF) as n1, id(JR) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Affiliation','JournalPublication','','match (AF:Affiliation)-[PRODUCED]->(JR:JournalReference)-[:APPEARED_IN]->(JP:JournalPublication) where 1=1','tolower(AF.name )Contains','tolower(JP.name )Contains','','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','distinct id(JP) as id, "JournalPublication" as nodeLabel, JP.name as Name, JP.publisherName as PublisherName','','distinct id(AF) as n1, id(JP) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Affiliation','Author','','match (AF:Affiliation)-[PRODUCED]->(JR:JournalReference)-[:AUTHORIED_BY]->(AU:Author) where 1=1','tolower(AF.name) Contains','tolower(AU.fullName) Contains','','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','distinct id(AU) as id, "Author" as nodeLabel, AU.fullName as Name','','distinct id(AF) as n1, id(AU) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Affiliation','Keyword','','match (AF:Affiliation)-[PRODUCED]->(JR:JournalReference)-[:HAS]->(KE:Keyword) where 1=1','tolower(AF.name )Contains','tolower(KE.name) Contains','','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','distinct id(KE) as id, "Keyword" as nodeLabel, KE.name as Name, KE.journalReferenceTitle as Title, KE.sourceTitle as SourceTitle, KE.year as Year, KE.affiliation as Affiliation, KE.publisherName as PublisherName','','distinct id(AF) as n1, id(KE) as n2','',100,'');
INSERT INTO ld_query_builder (
  ld_node1,
  ld_node2,
  ld_node3,
  ld_match_query,
  ld_match_node1,
  ld_match_node2,
  ld_match_node3,
  LD_RETURN_node1,
  LD_RETURN_node2,
  LD_RETURN_node3,
    ld_return_edge1,
    ld_return_edge2,
  ld_limit,
    ld_edge_point_icon
) VALUES ('Affiliation','Funding','','match (AF:Affiliation)-[PRODUCED]->(JR:JournalReference)<-[:FUNDED]-(FU:Funding) where 1=1','tolower(AF.name) Contains','tolower(FU.name) Contains','','distinct id(AF) as id, "Affiliation" as nodeLabel, AF.name as Name','distinct id(FU) as id, "Funding" as nodeLabel, FU.name as Name','','distinct id(AF) as n1, id(FU) as n2','',100,'');