# relay-mail

## Description

A Postfix container only relays virtual address.

If you have some internet domains and then many mail addresses,
You may want to handle mails by one Gmail mailbox.

## Requiement

MX records point this container.

## Install

```shell
mkdir conf
vi conf/relay.conf
docker run -p 25:25 -v $PWD/conf:/ext -d pengo/relay-mail
```

## Configuration

```
alice***@gmail.com = alice@example.net me@alice.example.jp
bob***@gmail.com   = bar@example.net info@bar.example.org
   :
```
