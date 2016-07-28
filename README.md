# docker-java-waitfor-postgres
A java docker file that waits with starting until a postgres db is available. To be used with `docker-compose`.

This fixes the problem with Play plus evolutions as described in [this Play issue](https://github.com/playframework/playframework/issues/4675).  
The docker file implements [the solution from the docker-compose documentation](https://docs.docker.com/compose/startup-order/).

It uses java 8 and Postgres 9.4. See the Dockerfile.

To use it add lines like the following to your `compose.yml`.  
```
entrypoint: /wait-for-postgres.sh db01 bin/play-app-name
environment:
  - PGPASSWORD=postgres
  - PGUSER=postgres
```

The script `wait-for-postgres.sh` expects two arguments: 
 - the name of the db host
 - the command to run when the db host is available. If you're using `sbt-native` to build a Play app as a docker image that will be `bin/<play-app-name>`.

