export PUSERNAME=postgres
export PPASSWORD=4-v3ry-53cr37-p455w0rd

export SQLUID=4dm1n157r470r
export SQLPWD=4-v3ry-53cr37-p455w0rd

alias hasura=/home/yassine/hasura/terrazura/hasura

terraform init

terraform apply \
  -var 'server=terrazuraserverfx' \
  -var 'username='$PUSERNAME'' \
  -var 'password='$PPASSWORD'' \
  -var 'sqluid='$SQLUID'' \
  -var 'sqlpwd='$SQLPWD'' \
  -var 'pgdatabase=terrazuradb' \
  -var 'sqlserverdb=salesregions' \
  -var 'apiport=80'

#cd migrations

#echo "Preparing to migrate database schemas."
#sleep 5

#./hasura migrate apply --all-databases

#sleep 5

#./hasura metadata apply
#./hasura seeds apply --database-name default

#./hasura console
