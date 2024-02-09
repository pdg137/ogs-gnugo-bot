```
node2nix -i gtp2ogs-packages.json --pkg-name nodejs_18 -o gtp2ogs-packages.nix -c gtp2ogs.nix
nix-shell
$gtp2ogs/bin/gtp2ogs -c $config --beta --apikey <apikey>
```
