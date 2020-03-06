# tutorial-elastic-apm

#### Pre-requisite

Before we get started, please make sure that you already installed `docker` and `go` in your machine.

Minimum `go` version should be in `v1.13.5`

Please follow below steps to continue to play around with elastic stack.

1. Pull following docker images:

```
docker.elastic.co/elasticsearch/elasticsearch:7.6.0
docker.elastic.co/kibana/kibana:7.6.0
docker.elastic.co/apm/apm-server:7.6.0
```

2. Execute the `run-elasticsearch-kibana.sh` file.

```
$ chmod +x run-elasticsearch-kibana.sh
$ ./run-elasticsearch-kibana.sh
```

3. Both `elastic search` and `kibana` might take times to be started. You can tail the logs to see it by opening 2 terminals

Terminal 1
```
$ docker logs -f elasticsearch
```

Terminal 2
```
$ docker logs -f kibana
```

4. Try to access kibana by opening your favorite browser and hit this url `http://localhost:5601/`

5. Then you can start the APM server by executing following command.

```
$ chmod +x run-elastic-apm.sh
$ ./run-elastic-apm.sh
```

6. Tail the logs to see what happen.

```
$ docker logs -f apm-server
```

Congrats!! You are done in setuping the elasticsearch, kibana and apm-server.

---

Now let's go to the sample app.

1. Let's install the dependencies.

```
$ go mod vendor
```

2. Open the `run-go-app.sh` file. You can change the app name by replacing the value in this environment variable

```
ELASTIC_APM_SERVICE_NAME={change_your_app_name_here}
```

3. Start the app!

```
$ chmod +x run-go-app.sh
$ ./run-go-app.sh
```

4. Open your browser and hit this url `http://localhost:3000`

There are two routes, as following:

Success route:
```
http://localhost:3000
```

Error route:
```
http://localhost:3000/error
```

Hit both routes for several times

---

Go back to Kibana, go to the APM menu and see the result.