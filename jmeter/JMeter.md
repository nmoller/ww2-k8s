# JMeter

## Saving a test plan from the browser

http://jmeter.apache.org/usermanual/jmeter_proxy_step_by_step.pdf

http://jmeter.apache.org/usermanual/component_reference.html#HTTP_Proxy_Server

Use firefox with proxy setted to `localhost` port `8888`

Once the basic is saved. Proceed to use variables and capture the session id form the body of the response.

## File jmeter/webworkjmx

Install `jmeter` 

[jmeter](https://jmeter.apache.org/download_jmeter.cgi)

I've used `Apache JMeter 5.0` on Ubuntu 18.04
```
java --version
openjdk 10.0.2 2018-07-17
OpenJDK Runtime Environment (build 10.0.2+13-Ubuntu-1ubuntu0.18.04.2)
OpenJDK 64-Bit Server VM (build 10.0.2+13-Ubuntu-1ubuntu0.18.04.2, mixed mode)
```

So far, we have only one thread.... It is ready to put into more users.