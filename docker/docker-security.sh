# generating trust key
docker trust key generate ihor

# public
cat ./ihor.pub

# private
cat $HOME/.docker/trust/private/*.key

# add signed repository
docker trust signer add --key ./ihor.pub ihor dyrman/hello-dotnet

# sign image
docker trust sign dyrman/hello-dotnet:latest

# automatically sign all images
export DOCKER_CONTENT_TRUST="1"

# when the environment variable DOCKER_CONTENT_TRUST is set to 1, 
# the Docker CLI will refuse to pull images without trust information

# check signers of the image
docker trust inspect --pretty dyrman/hello-dotnet:latest
