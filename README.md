# Data modeling artifacts

## What is it?

To sum up, this repository contains data modeling stuff: diagrams, SQL scripts, and other files that might be useful in the creation or restoration of databases. 

## Why?

Saving SQL DDL scripts and data modeling files that provide a high-level vision of databases is particularly useful - not only for obvious backup reasons, but also to use them as a blueprint/template for new databases and business needs.

## What are the contents?

* **pilot-course-relational-schema:** a relational, traditional database schema for information related to a pilot course, including columns about flight club members, pilots, instructors, students, and classes (in Portuguese);

* **sales-star-schema:** a simple star schema for information related to business sales, including products, locations, and time (in English);

* **location-based-service-nosql:** while it is unusual to define a NoSQL database structure as a rigid schema, as opposed to a traditional schema we could define in a relational (SQL) database, this repo provides a certain blueprint for MongoDB queries that create a document collection in a location-base service, including information about personal information, purchase patterns, and geographic coordinates (in English).

## What is the tech stack?

The stack comprises:

* SQL
* [DB Designer](https://www.dbdesigner.net/)
* [dbdiagram.io](https://dbdiagram.io/)

## DISCLAIMER

Whenever you use these files to create data solutions to store or analyze personal data with the consent of its owners, remember to do some additional research and implement the security measures and data protection standards required for your specific project (e.g. industry-related guidelines or GDPR). 

It is highly recommended that you implement data anonymization and encryption techniques and make sure that you understand how data flows across entry points, systems, databases, data lakes, data warehouses, cloud instances, BI dashboards, ML models, etc.