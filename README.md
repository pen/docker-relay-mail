# relay-mail

## Description

A Postfix container only relays virtual address.

If you have some internet domains and then many mail addresses,
You may want to read mails by one Gmail mailbox.

So run this container and set all domains' MX point to the host.

## Requiement

### to receive
MTAs in Internet can access the port 25 of your host.
And you need change MX record of your domains to the host.

### to relay
An ISP account you may use MTA via SMTP Auth.
Gmail rejects mails from anonymous MTA.

## Install

```shell
mkdir $HOME/relay-mail
vi $HOME/relay-mail/relay.conf
docker run -p 25:25 -v $HOME/relay-mail:/ext -d pengo/relay-mail
```

## Configuration

Basically, set VALUEs with Shell script syntax.
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

The container reads relay.conf at start only.
If you afraid of SMTP password, you can remove it after confirmed the service.
