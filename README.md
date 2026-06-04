# Unstructured Databases

## Overview
This repository contains practical implementations and examples of Unstructured Database concepts using MongoDB. It covers database creation, CRUD operations, query operators, aggregation, indexing, and other essential NoSQL database topics.

## Topics Covered

### MongoDB Basics
- Database and Collection Creation
- Documents and BSON
- MongoDB Shell Commands

### CRUD Operations
- insertOne()
- insertMany()
- find()
- findOne()
- updateOne()
- updateMany()
- deleteOne()
- deleteMany()

### Query Operators
- $eq
- $gt
- $lt
- $gte
- $lte
- $in
- $and
- $or

### Aggregation Framework
- $match
- $group
- $sort
- $project
- $limit

### Indexing
- Single Field Indexes
- Compound Indexes

### Advanced Concepts
- Embedded Documents
- Arrays
- Data Modeling
- Aggregation Pipelines

## Sample Collection

```javascript
db.friends.insertMany([
{
    friend_id: 1,
    name: "Ali",
    age: 21,
    city: "Delhi",
    skills: ["Python", "MongoDB"]
},
{
    friend_id: 2,
    name: "Ahmed",
    age: 22,
    city: "Mumbai",
    skills: ["Java", "SQL"]
}
])
