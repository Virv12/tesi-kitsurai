Introduction

- motivazioni:
  - importance of replicated storage services in Cloud Computing
    ==> reliability
  - increasing trend in using NoSQL storage solutions
    => lower overheads & better scalability w.r.t. traditional SQL DBs
       (much simpler operations)
  - increasing importance of data access latency in emerging use-cases,
    witnessed by DynamoDB ("single-digit millisecond latency"),
    BigTable
- providing guarantees in distributed, multi-tenant is difficult
  => open-source? MongoDB, Cassandra -> best effort, no latency guarantees
- emerging trend in adopting new languages like Go, Rust, ...
  Rust interesting for safety, performance, ... ...???

- first attempt at realizing a replicated key-value store with guaranteed
  per-client/per-table performance, in the Rust programming language.

Related Work

- survey on related works
  - Dynamo (SOSP 2006)
  - DynamoDB (202x)
  - Real-Time DB
  - Related Work from RT-MongoDB
    https://retis.santannapisa.it/~tommaso/papers/closer21.php
    https://retis.santannapisa.it/~tommaso/papers/ieeetcc23.php

Proposed Approach

- focus on SSD storage, rotational would be impossible

- technical description: software architecture
  (Rust run-time | Tokio | Kitsumai)
  - hash-based ring, with heterogeneous capacity handling
  - replication protocol: sequence/diagram
    configurable "write concern" (can implement quorum-based protocols)
  - total disk capacity sliced per-table
  - throttling mechanism for clients trying to exceed their capacity

Experimental Evaluation
- platform description
- example run, results
- run with vs without capacity slicing / throttling
- run single-replica vs multi-replicas

Conclusions
- works? really works?
- limitations
  => access control model
  => table names?
  => read conflicts? (lack of a catch-up protocol)
