# relay-mail

## Description

A Postfix container only relays virtual address.

If you have some internet domains and then many mail addresses,
You may want to handle mails by one Gmail mailbox.

## Requiement

### to receive
Set your MX records point your internet-reachable host which can use port 25.

### to relay
You need an ISP account that you may use MTA by SMTP Auth.
Gmail rejects to receive from anonymous MTA.

## Install

```shell
mkdir $HOME/relay-mail
vi $HOME/relay-mail/relay.conf
docker run -p 25:25 -v $HOME/relay-mail:/ext -d pengo/relay-mail
```

## Configuration

Simply set VALUEs with /bin/sh syntax.
`RELAY` is a bit complicated.  Don't miss quotes.

```shell
DOMAINS="foo.example.net bar.example.jp"
ISP_SMTP=isp.example.com
ISP_SMTP_ID=you@isp.example.com
ISP_SMTP_PW=foo123bar
RELAY="
real-name@main.example.org = nick@foo.example.net nick@bar.example.jp
anothr.example@gmail.com   = test@foo.example.net
"
```

## Note

The container reads relay.conf only at start.
If you afraid of password remove it after confirmed the service.
