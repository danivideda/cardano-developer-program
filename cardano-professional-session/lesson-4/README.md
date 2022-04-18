# Lesson 4 - Building and signing transactions using build-raw

[Link to material](https://github.com/mallapurbharat/cardano-tx-sample/blob/main/exercise2_txbuildraw.md)

env:
```
TESTNET=--testnet-magic 1097911063
```

## Steps:

### Query wallet UTXOs in address
1. `cardano-cli query utxo --address $(cat addr1.addr) $TESTNET`
2. Save **TxHash#TxIndex** into **$UTXO1**, like so:  `UTXO1=401fc74ab5ceb5cfc673b36702c78d2f477d56e84639921849c511995e921b8a#0`
3. For this example, we will send UTXO from `addr2.addr` to `addr1.addr`

### Query Protocol Params
1. This will be used for calculating minimum fees, because there's information about base fee + lovelace per bytes in this file
2. `cardano-cli query protocol-parameters $TESTNET --file-out protocolparams.json`


### Build Tx Draft
```bash
$ cardano-cli transaction build-raw \
--tx-in $UTXO1 \
--tx-out $(cat addr1.addr)+250000000 \
--tx-out $(cat addr2.addr)+0 \
--invalid-hereafter 0 \
--fee 0 \
--out-file tx.draft
```
Leave the change-address `--tx-out {own address}` and fees `--fee` to zero, we don't need this for now.

### Calculate minimum fee
```bash
$ cardano-cli transaction calculate-min-fee \
--tx-body-file tx2.draft \
--tx-in-count 1 \
--tx-out-count 2 \
--witness-count 1 \
--protocol-params-file protocolparams.json \
$TESTNET
```
Then save the output into variable, like so: `FEE=177073`

### Build Tx Raw
```bash
$ cardano-cli transaction build-raw \
--tx-in $UTXO1 \
--tx-out $(cat addr1.addr)+250000000 \
--tx-out $(cat addr2.addr)+$BALANCE \
--invalid-hereafter $VALIDTIL \
--fee $FEE \
--out-file tx.raw
```
1. Calculate the balance with `BALANCE=$(expr {your UTXO - intended sent lovelaces} - $FEE)`
2. Calculate slot for "valid until slot" `VALIDTIL=$(expr {current tip slot} + 600)` -> meaning 10 minutes timeframe

### Sign the transaction
```bash
$ cardano-cli transaction sign \
--tx-body-file tx.raw \
--signing-key-file payment2.skey \
$TESTNET \
--out-file tx.signed
```

### Submit the transaction into blockchain
```bash
$ cardano-cli transaction submit \
--tx-file tx.signed \
$TESTNET
```

### Check if it's already submitted into blockchain

You will see this message on `cardano-node` terminal:
```
[cardanod:cardano.node.Mempool:Info:76] [2022-04-17 05:43:26.40 UTC] fromList [("kind",String "TraceMempoolRemoveTxs"),("mempoolSize",Object (fromList [("bytes",Number 0.0),("numTxs",Number 0.0)])),("txs",Array [Object (fromList [("txid",String "f49cf93c")])])]
[cardanod:cardano.node.ChainDB:Info:68] [2022-04-17 05:43:26.57 UTC] Block fits onto some fork: af9e705fa6216f9a29e77ec20744bfc2f2aeff17d1e4d8637cd776c0db115964 at slot 55804990

```

- Check the TxHash in cardanoscan `cardano-cli transaction txid --tx-file tx.signed`
- Check respective address utxos to see any changes