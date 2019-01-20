# docker-pia

A simple image that connects to Private Internet Access's Sweden server on startup using supervisor.d

## Auth

The image relies on the builder adding a `.secrets` to the root of the project prior to building the image. This should include a user's PIA credentials in the format
```
USERNAME
PASSWORD
```

## Running

After building the image with an example name of `pia`, it can be run using
```
docker run -d --device=/dev/net/tun --cap-add=NET_ADMIN --dns 8.8.8.8 pia
```
