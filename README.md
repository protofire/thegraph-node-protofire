# graph-node-protofire

This image is based on graph-node from @graphprotocol and it contains also both graph-cli and indexer-cli to help us to manage the indexer.


## Versions 

The idea is to maintain the same version than graph-node in @graphprotocol repository to avoid confusions. Currently this image is builded using these versions:

* nodejs      -> 14
* graph-node  -> v0.22.0
* graph-cli   -> v0.20.0 
* indexer-cli -> v0.13.0

## Build container

You just run the following command:

```
chmod +x build.sh
bash -x build.sh
```
