plainfile=${1:-vault.plain_text}
vaultfile=${plainfile%.plain_text}.enc

if [ ! -f $plainfile ]; then
  echo "File $plainfile does not exists."
  exit 1
fi

echo "This will replace $plainfile with an encrypted file $vaultfile"

read -p "OR type 'abort' to abort." answer
if [[ $answer = "abort" ]] ; then
  echo "Doing nothing..."
  exit 0
else
  echo "Encrypting and deleting plain text..."
  
  openssl des3 -salt -in $plainfile -out $vaultfile
  rm -f ./$plainfile
  rm -f ./*plain_text*
  rm -f ./#*
  rm -f ./*~
  echo "done!"
fi

