MYEDITOR=${EDITOR:-emacs}
vaultfile=${1:-vault.enc}
plainfile=${vaultfile%.enc}.plain_text

if [ ! -f $vaultfile ]; then
  echo "File $vaultfile does not exists."
  exit 1
fi

openssl des3 -d -salt -in $vaultfile -out $plainfile

if [ ! -f $plainfile ]; then
  echo "Decrypted $plainfile does not exists. Exiting..."
  exit 1
fi

hash1=$(shasum "$plainfile")

$MYEDITOR $plainfile

hash2=$(shasum "$plainfile")

if [ "$hash1" != "$hash2" ] ; then
  echo "File modified. Re-encrypting."
  openssl des3 -salt -in $plainfile -out $vaultfile
else
  echo -e "\nNo changes to file detected."
fi

echo -e "\nCleaning up plain text. <any key> to proceed."

read -p "OR type 'abort' to skip and leave plain text. " answer
if [[ $answer = "abort" ]] ; then
  echo "WARNING: Aborting cleanup! Please remember to delete your plaintext..."
  exit 0
else
  # Cleanup
  echo -e "\ncleaning up plain text..."
  rm -f ./$plainfile
  rm -f ./*plain_text*
  rm -f ./#*
  rm -f ./*~
  echo "done!"
fi
