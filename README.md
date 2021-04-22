# meetups.nyc
Public repository for meetups.nyc landing page, etc

# To run
Make sure you have Docker installed.

Build the development image. The app will be deployed to an without docker, the
Dockerfile is only for development.

```bash
# the following will build the docker image
$ make build
```

After the image is built, run the image
```bash
$ ./scripts/run.sh
```

Then simply view the website in your browser at [http://localhost:8080](http://localhost:8080) for HTTP and [https://localhost:8081](https://localhost:8081) for HTTPS (just for development).

## SSL
For dev only, to ensure SSL works, make sure to allow self-signed certs for
localhost in the Chrome settings. Open
`chrome://flags/#allow-insecure-localhost` in your browser, then enable and
relaunch.
