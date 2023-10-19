```mermaid
graph TD
  Node1["1. Data Ingestion and Preprocessing"] --> Node2["2. Determining the number of factors"]
  Node2 --> Node3["3. Examination of the number of factors"]
  Node3 --> Node4["4. Execution of Factor Analysis"]
  Node4 --> Node5["5. Interpret factor loadings"]
  Node5 --> NodeR(["Is a simple structure obtained? etc."])
  NodeR -- No --> Node3
  NodeR -- No --> Node4
  NodeR -- Yes --> Node6["6. Factor Interpretation"]
  Node6 --> Node7["7. Interpretation and application of results"]
```
