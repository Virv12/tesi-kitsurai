Paper Structure
===

Titolo: Kitsurai -- a distributed real-time key-value store in Rust

# Abstract
Quello che si è fatto in breve:
- Database completamente distribuito (e fault-tolerant) scalabile [real-time] multi-tenant key-value/NoSQL
  > È capace di [allocare la banda] di una tabella su più nodi e successivamente di far rispettare il vincolo tramite throttling.
    > Dove la banda è il numero di richieste al secondo.
- Sviluppato un algoritmo di allocazione banda e successivamente di distribuzione delle chiavi,
    rispettando i vincoli di ridondanza, che permette di rispettare la banda allocata senza coordinazione.

(Problema del noisy neighbour)

# Introduction
## Perché / Premesse
- Necessità di un database scalabile capace anche di garantire performance per applicazioni (soft) real-time.
- Nuovo linguaggio: Rust = blazingly fast TM
- ?
- ?
- ?

## Paper Contributions
Cosa si è fatto nel paper:
- Sviluppato un algoritmo di allocazione banda e successivamente di distribuzione delle chiavi,
    rispettando i vincoli di ridondanza, che permette di rispettare la banda allocata **senza coordinazione**. 

(Paper Organization)

# Related Work
- Cassandra, DynamoDB, MondoDB... (vedi deep research)
- Hashing

Più underlying work ma volendo:
- Tokio?
- HTTP2/3?
- xxhash?

# Descrizione
> Copiando da un paper di Cucinotta, qui descriverei solo il modello di cluster 
    e l'API di ogni nodo sia per i client che per nodi.

**No coordinazione.**
Altre varie assunzioni:
- Modello di cluster (possono esplodere per tempo finito).
- Modello di banda.
- No Consistenza: si fa con un layer aggiuntivo
- API client + tabelle senza nome

# Implementazione

### Algoritmo di distribuzione con formula diretta
assumendo tabella distribuita su più az
"Algoritmo"/Esempio get + set, concetto di router

## Creazione e Distruzione Tabelle
Descrizione dello stato di una tabella = Growing Save, stato locale (meta tabella) e stato globale
Sync con Gossip e importantissime Merkle Tree
### Algoritmo di allocazione
prepare + commit
rispettando i vincoli
### Distruzione

## Note su RPC e HTTP2

# Risultati Sperimentali
## Stress Singole Macchine 
## Stress Cluster (con tabella su un singolo nodo, H->M)
## Stress Cluster (con tabella su tutti i nodi)
## Stress con Isolamento

# Piccole conclusioni
