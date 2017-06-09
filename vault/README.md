# vault

Simple local vault management.

## Protip 1
Put this in your `.bash_profile`.
```
# Password gen
genpasswd() { 
    pwgen -s $@ |pbcopy |pbpaste; echo “Has been copied to clipboard”
}
```

You can use it to generate passwords of a specified length (in this case 12 characters) like:
`genpasswd 12`
