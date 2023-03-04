FILE_NAME=tupleCheck
jsDIR=${FILE_NAME}_js

node $jsDIR/generate_witness.js $jsDIR/${FILE_NAME}.wasm input1.json witness1.wtns
snarkjs groth16 prove ${FILE_NAME}_0001.zkey witness1.wtns proof1.json public1.json

node $jsDIR/generate_witness.js $jsDIR/${FILE_NAME}.wasm input2.json witness2.wtns
snarkjs groth16 prove ${FILE_NAME}_0001.zkey witness2.wtns proof2.json public2.json