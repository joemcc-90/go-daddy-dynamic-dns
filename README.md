# go-daddy-dynamic-dns
Go Daddy Dynamic DNS Docker Imag

Docker image which uses GoDaddy API to update DNS record
Based on - https://github.com/UnklAdM/update-godaddy-dns

You can use the built image here https://hub.docker.com/r/joemcc/go-daddy-dynamic-dns pull image - docker.io/joemcc/go-daddy-dynamic-dns:latest

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
image:tag
