This is a simple [Nix](https://nixos.org/) package that sets up an
[OGS](https://online-go.com/) bot, using
[gtp2ogs](https://github.com/online-go/gtp2ogs) and
[GnuGo](https://www.gnu.org/software/gnugo/) on the back end.

To build it, first install nix and set up an OGS bot. By default, the
script in this repository expects a bot on the beta server.

Then run

```s
APIKEY=<apikey> nix-build -o ogs-gnugo-bot
```

in this folder, where `<apikey>` is the API key for your bot. Nix
will download gtp2ogs and GnuGo and set up a configuration file and a
script to launch the bot:

```sh
$ APIKEY=XYZXYZXYZ nix-build -o ogs-gnugo-bot
these 4 derivations will be built:
  /nix/store/mb2rrzgnfq16l3nhli8m626a0bqsw5p7-gtp2ogs-config.json.drv
  /nix/store/1wsyg9gq7s1786ibl0xymk9kl8lspijf-ogs-gnugo-bot.drv
  /nix/store/qx2sisi3ip0i088v3swc6vriw4l334lx-builder.sh.drv
  /nix/store/74mhb82kri2jvzgsshc0lxmvsfg3rdqj-ogs-gnugo-bot.drv
building '/nix/store/mb2rrzgnfq16l3nhli8m626a0bqsw5p7-gtp2ogs-config.json.drv'...
building '/nix/store/1wsyg9gq7s1786ibl0xymk9kl8lspijf-ogs-gnugo-bot.drv'...
building '/nix/store/qx2sisi3ip0i088v3swc6vriw4l334lx-builder.sh.drv'...
building '/nix/store/74mhb82kri2jvzgsshc0lxmvsfg3rdqj-ogs-gnugo-bot.drv'...
/nix/store/r0c8x9ng96q67zg752564bbp8jx6440x-ogs-gnugo-bot
```

The last line of the output is the path to the script, which you can
inspect to find the executables and configuration file.  It is also
symbolically linked as `ogs-gnugo-bot` in the current directory.

Run `./ogs-gnugo-bot` to start your bot. It should connect to the beta
server and start accepting games. To adjust the configuration of the
bot, for example to put it on the production server, you can edit the
`config` section of `default.nix` and rebuild.
