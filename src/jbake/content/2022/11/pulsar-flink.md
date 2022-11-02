title=Pulsar Flink
date=2022-11-02
type=post
tags=streaming,pulsar,flink
status=published
id=pulsar-flink
~~~~~~

# Pulsar Flink

I have been messing around with yet another streaming demo (YASD). You really just cannot have too many.

I am a fan of [server sent events](https://en.wikipedia.org/wiki/Server-sent_events), why ? because they are HTML5 native. No messing around with web sockets. I have a a [small quarkus app](https://github.com/eformat/quote-generator) that generates stock quotes:

<div id="lightbox"></div>
<img src="https://raw.githubusercontent.com/eformat/quote-generator/master/images/quotes.gif" width="500" class="zoom">

that you can easily run it locally or on OpenShift:

```bash
oc new-app quay.io/eformat/quote-generator:latest
oc create route edge quote-generator --service=quote-generator --port=8080
``` 

and then retrieve the events in the browser or by curl:

```bash
curl -H "Content-Type: application/json" --max-time 9999999 -N http://localhost:8080/quotes/stream
```

So, first challenge - How might we consume these SSE's using Flink? I found a handy [AWS Kinesis SSE demo](https://github.com/aws-samples/amazon-kinesis-data-analytics-apache-flink-server-sent-events-sse/tree/main/kinesis-data-analytics-sse) which i snarfed the SSE/OKHttp code from. I wired this into flinks `RichSourceFunction`:

<script src="https://gist.github.com/eformat/4d5fd40d8566e99e866e1e7fd4cb6388.js"></script>

So now i could consume this SSE source as a `DataStream`

<script src="https://gist.github.com/eformat/c63c765710b00b9ce15201edd9aca87b.js"></script>

In the example, i wire in the stock quotes for `NFLX` and `RHT`. Next step, process these streams. Since i am new to flink, i started with a simple print function, then read this [stock price](https://flink.apache.org/news/2015/02/09/streaming-example.html) example from 2015! cool. So i implemented a simple `BuyFunction` class that makes stock buy recommendations: 

<script src="https://gist.github.com/eformat/156cabbd95543e22f4faf90f9529a192.js"></script>

Lastly, it needs to be put to a sink. Again, i started by using a simple print sink:

<script src="https://gist.github.com/eformat/783e1d4a37bc33e91393416109a92b67.js"></script>

Friends of mine have been telling me how much more awesome `Pulsar` is compared to `Kafka` so i also tried out sending to a local pulsar container that you can run using:

```bash
podman run -it -p 6650:6650 -p 8081:8080 --rm --name pulsar docker.io/apachepulsar/pulsar:2.10.2 bin/pulsar standalone
```

And sent to using a simple class utilizing the pulsar java client:

<script src="https://gist.github.com/eformat/90121414185b9142d884b72cb1e7af1c.js"></script>

And then consume messages to make sure they are there !

```bash
podman exec -i pulsar bin/pulsar-client consume -s my-subscription -n 0 persistent://public/default/orders
```

And i need to write this post as well .. getting it to run in OpenShift ...

<img src="/2022/11/flink-stocks-ocp.png" width="600" class="zoom">

</br>
Source code is here - https://github.com/eformat/flink-stocks
