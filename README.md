# Metrics Demo

This scenario adds support for metrics use cases to the LogStream demo. We open a metrics input on dogstatsd and graphite protocols. We add pipelines for processing that data. We add pipelines for processing weblog data, aggregating it into metric events and then outputting to Influxdb. This scenario also adds InfluxDB as a datastore and Grafana as a visualization engine.

## Notable URLs

| Description                | URL                                                                                                    | Username | Password  |
|----------------------------|--------------------------------------------------------------------------------------------------------|----------|-----------|
| Cribl                      | http://localhost:9000                                                                                  | admin    | cribldemo |
| Grafana                    | http://localhost:8200                                                                                  | admin    | cribldemo |


## Network monitoring notable URLs
| Description                | URL                                                                                                    | Username | Password  |
|----------------------------|--------------------------------------------------------------------------------------------------------|----------|-----------|
| MTR Pipeline               | http://localhost:9000/pipelines/mtr                                                                    | admin    | cribldemo |
| Logs To Metrics Pipeline   | http://localhost:9000/pipelines/logs_to_metrics                                                        | admin    | cribldemo |

## Network Dashboard

In [Grafana](http://localhost:8200), we ship a dashboard which shows the output of [MTR](https://github.com/traviscross/mtr) which is kind of a combination of ping and traceroute. We have `mtr` output JSON, and use `nc` to send the data to a Cribl TCPJSON input. The [MTR Pipeline](http://localhost:9000/pipelines/mtr) takes the JSON from `mtr` and explodes it into an event for every hop along the network path. It then resolves the host IP from DNS and publishes each of the hops as a metric to InfluxDB.

This shows a practical use case for taking data output by standard utilities and munging it easily into a format expected by another downstream datastore, in this case InfluxDB.
