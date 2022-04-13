# Lesson 3 - Building simple transaction

In this session, we learned how to build transaction using `$ cardano-cli transaction build ..`.

## Building the transaction
```bash
cardano-cli transaction build \
--alonzo-era \
--tx-in ${UTXO1} \ # specify the UTxO TxHash#TxIx
--tx-out $(cat addr2.addr)+100000000 \ # send 100 ADA to addr2
--change-address $(cat addr1.addr) \ # send the change to original wallet
$TESTNET \
--out-file tx.raw
```

## Signing the transaction
```bash
cardano-cli transaction sign \
--signing-key-file payment1.skey \
--tx-body-file tx.raw \
$TESTNET \
--out-file tx.signed
```

## Finally, submit the transaction into the blockchain network
```bash
cardano-cli transaction submit --tx-file tx.signed $TESTNET
```
