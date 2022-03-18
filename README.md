# RR 
## Description
A container for running [rr](https://github.com/GuntherRademacher/rr).

## Building

```bash
docker build --build-arg UID=$(id -u) --build-arg RELEASE=v1.63 -t rr:v1.63 .
```

## Running

```bash
docker run --rm -v $PWD:/home/rr rr:v1.63 grammar.ebnf
```
