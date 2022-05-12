const bip39 = require('bip39');
const CardanoWasm = require('@emurgo/cardano-serialization-lib-nodejs');


function harden(num) {
    return 0x80000000 + num;
}

const mnemonic = ["cash", "antique", "chimney", "egg", "enact", "blast", "embody", "ecology", "dust", "fiction", "hope", "black", "crisp", "thunder", "tiny", "fame", "mixture", "object", "text", "boil", "odor", "minor", "ordinary", "deer"].join(' ')

console.log("mnemonic: " + mnemonic);
const entropy = bip39.mnemonicToEntropy(mnemonic);

// console.log("entropy: " + entropy);

const rootKey = CardanoWasm.Bip32PrivateKey.from_bip39_entropy(
    Buffer.from(entropy, 'hex'),
    Buffer.from(''),
);

// console.log("rootKey: " + rootKey.to_bech32());

const accountKeyPrv = rootKey
    .derive(harden(1852)) // purpose
    .derive(harden(1815)) // coin type
    .derive(harden(0)); // account #0

//console.log("accountKeyPrv: " + accountKeyPrv.to_bech32());

const accountKeyPub = accountKeyPrv.to_public();
//console.log("accountKeyPub: " + accountKeyPub.to_bech32());

const utxoPrvKey = accountKeyPrv
    .derive(0) // external
    .derive(0);
console.log("utxoPrvKey: " + utxoPrvKey.to_bech32());
const utxoPubKey = utxoPrvKey
    .to_public();
console.log("utxoPubKey: " + utxoPubKey.to_bech32());

const utxoPubKey1 = accountKeyPrv
    .derive(0) // external
    .derive(1)
    .to_public();
// console.log("utxoPubKey1: " + utxoPubKey1.to_bech32());


const stakeKey = accountKeyPrv
    .derive(2) // chimeric
    .derive(0)
    .to_public();

// console.log("stakeKey: " + stakeKey.to_bech32());

// base address with staking key
const baseAddr = CardanoWasm.BaseAddress.new(
    // CardanoWasm.NetworkInfo.testnet().network_id(),
    CardanoWasm.NetworkInfo.mainnet().network_id(),
    CardanoWasm.StakeCredential.from_keyhash(utxoPubKey.to_raw_key().hash()),
    CardanoWasm.StakeCredential.from_keyhash(stakeKey.to_raw_key().hash()),
);
console.log("baseAddr: " + baseAddr.to_address().to_bech32());

// second address with staking key
// const addr1 = CardanoWasm.BaseAddress.new(
//     CardanoWasm.NetworkInfo.testnet().network_id(),
//     CardanoWasm.StakeCredential.from_keyhash(utxoPubKey1.to_raw_key().hash()),
//     CardanoWasm.StakeCredential.from_keyhash(stakeKey.to_raw_key().hash()),
// );
// console.log("addr1: " + addr1.to_address().to_bech32());

const ptrAddr = CardanoWasm.PointerAddress.new(
    CardanoWasm.NetworkInfo.testnet().network_id(),
    CardanoWasm.StakeCredential.from_keyhash(utxoPubKey.to_raw_key().hash()),
    CardanoWasm.Pointer.new(
        26074006, // slot
        0,   // tx index in slot
        0    // cert index in tx
    )
);
console.log("ptraddr: " + ptrAddr.to_address().to_bech32());