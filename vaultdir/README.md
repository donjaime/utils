# vault
Simple local secrets management. Securely backup your passwords, certificates, and more.\

Vault does this very simply: It compresses and encrypts your current working directory to a single timestamp-versioned, password protected, encrypted blob.

## Intallation
- Clone this repo.
- Add `vseal`, `vrestore` and `vgc` to your `PATH` so you can invoke them from the terminal.

# Getting Started
- Pick a folder (eg. `/path/to/your/vault/folder`) on your disk that you want to store your encrypted blobs.
- `cd` to a folder you want to compress and encrypt (eg. `cd /path/to/your/personal/files`).
- Run `vseal /path/to/your/vault/folder` which will create a file in `/path/to/your/vault/folder` called `vault-<YYYYMMDDHHMMSS>`

## Restoring from your vault
- `cd` to a folder you want to extract and decrypt the contents of your vault into (eg. `cd /path/to/your/personal/files-restored`).
- You can restore the newest vault file by pointing `vrestore` (it will automatically select the file based on the timestamped filename) at the vault directory.
  - eg. `vrestore /path/to/your/vault/folder`
- OR you can restore a specific file simply by pointing `vrestore` to that specific file.
  - eg. `vrestore /path/to/your/vault/folder/vault-<YYYYMMDDHHMMSS>`

## Usecases
- Keep your passwords in a text file. Backup an encrypted copy!
- Keep personal SSL certificates backed up!
- ...

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
