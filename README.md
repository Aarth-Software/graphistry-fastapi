# Python-Neo4j-Api

This Python Api is used to connect with neo4j for doing CRUD Operations

## Installation
Detailed steps to load project
- install Python Poetry. using below link.
    https://python-poetry.org/docs/#installation
- run the command : poetry update
- run the command : poetry shell
- run the command : uvicorn neo4j_acc.main:app --reload
application will be running on uvicorn

## Development
- update .env file with credentials of local or cloud neo4j DB
- initial routes are present in main.py. you may take it as a reference and create based on that.