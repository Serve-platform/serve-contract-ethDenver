FILE_NAME=tupleCheck

# ptau
snarkjs powersoftau new bn128 12 pot12_0000.ptau -v
snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau \
  --name="First contribution" -v -e="$(head -n 4096 /dev/urandom | openssl sha1)"
snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v

# zkey
snarkjs groth16 setup ${FILE_NAME}.r1cs pot12_final.ptau ${FILE_NAME}_0000.zkey
snarkjs zkey contribute ${FILE_NAME}_0000.zkey ${FILE_NAME}_0001.zkey \
  --name="1st Contributor Name" -v -e="$(head -n 4096 /dev/urandom | openssl sha1)"
snarkjs zkey export verificationkey ${FILE_NAME}_0001.zkey verification_key.json