#!/usr/bin/env sh

#sudo apt-get update --yes
#sudo apt-get install maven --yes

cd athena-federation-sdk
mvn clean install -Dmaven.test.skip

cd athena-federation-integ-test
mvn clean install -Dmaven.test.skip

cd athena-jdbc
mvn clean install -Dmaven.test.skip
mvn package -Dmaven.test.skip

mv ./athena-jdbc/target/athena-jdbc-*.jar ./athena-jdbc/target/athena-jdbc.jar

aws s3 cp "./athena-jdbc/target/athena-jdbc.jar" s3://milan-managed-lambdas-test/
