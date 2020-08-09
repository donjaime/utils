# vault

Simple local secrets management.

## Getting Started

- Pick a folder to contain your vault (I recommend an encrypted disk image that you can easily automate the backing up of).
- `cd` into that folder. Let's call that your "vault folder".
- Install the scripts: Copy `open.sh` and `seal.sh` into your vault folder.
- Put your secrets in a file `vault.plain_text` in the vault folder.
- Seal your vault by running `seal.sh`.


## Opening and editing your vault
Once you've sealed your vault, you never need to run `seal.sh` again for that vault.

Just run `open.sh` when cd'ed into your your vault folder to open your vault and launch your favorite text editor. 

Make changes, and it will handle re-encrypting, and cleaning up plain text from disk.

## Protip 1
Put this in your `.bash_profile`.
```
# Password gen
genpasswd() { 
    pwgen -s $@ |pbcopy |pbpaste; echo “Has been copied to clipboard”
}
```

You can use it to generate passwords of a specified length (in this case 12 characters) like:
```
genpasswd 12
```


## Protip 2
Vault will use your `$EDITOR`. If `$EDITOR` is unset, it will default to `emacs`. If you like `vi`, then set `$EDITOR` to it.