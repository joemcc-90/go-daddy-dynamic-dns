# go-daddy-dynamic-dns
Go Daddy Dynamic DNS Docker Imag

Docker image which uses GoDaddy API to update DNS record
Based on - https://github.com/UnklAdM/update-godaddy-dnse

To build
docker build -t image:tag .

To Run

To run supply all variables, the API requires all variables to be set

Example: docker run -d
--name dns-update
--env key=notareal_key
--env secret=NoTaReAlSeCrEt
--env domain=example.co.uk
--env type=A
--env name=@
--env ttl=600
--env port=1
--env weight=1
--network bridge
joem93874/go-daddy-dynamic-dns:latest
