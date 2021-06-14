# MongoDB Connector for BI

[The MongoDB Connector for Business Intelligence (BI)](https://docs.mongodb.com/bi-connector/master/) allows users to create queries with SQL and visualize, graph, and report on their MongoDB Enterprise data using existing relational business intelligence tools such as Tableau, MicroStrategy, and Qlik.

## Docker Image

This chart uses custom made Docker image to operate, see **Dockerfile** for in-depth understanding of what was done.

## Chart

This is a simple chart with single pod deployement, see **values.yaml** and **templates/deployment.yaml**, **templates/service.yaml** for in-depth understanding of deployemnt