#!/bin/bash

defaultPass="CustomerAdmin1"
hostname="ce06b4f8ae4542a08357c542c4882795.s1.eu.hivemq.cloud"

# Hostname input
read -p "please input the hostname of the broker:  (default [$hostname]): " hostnameInput
hostname=${hostnameInput:-$hostname}   # set the default hostname (if user skips this entry)
echo "the hostname is:  $hostname"

# Password input
read -p "please input the password you wish to use:  (default [$defaultPass]): " passInput
defaultPass=${passInput:-$defaultPass}   # set the default password (if user skips this entry)
echo "the password is:  $defaultPass"

# Default file names and passwords
brokerCertName="server"
brokerKeystoreName="broker-keystore"
brokerKeystorePass=$defaultPass
brokerTruststoreName="broker-truststore"
brokerTruststorePass=$defaultPass
clientCertName="client-cert"
clientKeyName="client-key"
clientKeyPass=$defaultPass
clientKeystoreName="client-keystore"
clientKeystorePass=$defaultPass
clientName="client"
clientTruststoreName="client-truststore"
clientTruststorePass=$defaultPass

# Check the time
time1=$(date +%s)
# Create output directory
outDirName="certs_$time1"
mkdir $outDirName
# Go to output directory
pushd $outDirName

# Create new broker .jks keystore
keytool -genkey -keyalg RSA -alias "hivemq" -keystore $brokerKeystoreName.jks -storepass $brokerKeystorePass -validity 360 -keysize 2048 -dname "CN=$hostname"

# Export broker's cert .pem from the keystore
keytool -exportcert -alias "hivemq" -keystore $brokerKeystoreName.jks -rfc -file $brokerCertName.pem -storepass $brokerKeystorePass

# Generate the client certificate using correct subject format
openssl req -x509 -newkey rsa:2048 -keyout "$clientKeyName.pem" -out "$clientCertName.pem" -days 360 -passout pass:"$clientKeyPass" -subj "//CN=$clientName"

# Check if the client certificate was created successfully
if [ ! -f "$clientCertName.pem" ]; then
    echo "Error: $clientCertName.pem was not created. Check OpenSSL configuration."
    exit 1
fi

# Convert client .pem certificate to .crt
openssl x509 -outform der -in $clientCertName.pem -out $clientCertName.crt

# Import client-cert into the broker's truststore
printf "yes\n" | keytool -import -file $clientCertName.crt -alias "client" -keystore $brokerTruststoreName.jks -storepass $brokerTruststorePass

# Create client P12 keystore
openssl pkcs12 -export -in $clientCertName.pem -inkey $clientKeyName.pem -certfile $clientCertName.pem -out $clientKeystoreName.p12 -passin pass:$clientKeyPass -passout pass:$clientKeystorePass

# Convert client P12 keystore to JKS keystore
keytool -importkeystore -srckeystore $clientKeystoreName.p12 -srcstoretype pkcs12 -destkeystore $clientKeystoreName.jks -deststoretype JKS -storepass $clientKeystorePass -srcstorepass $clientKeystorePass 2>/dev/null

# Restore original directory
popd

echo "$outDirName"
