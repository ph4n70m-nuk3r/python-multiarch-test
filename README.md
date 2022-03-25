python-multiarch-test
=====================

Simple Python Flask application served using Waitress.  
Aim is to use GitHub Actions to build and deploy images for amd64 and arm64 architectures using QEMU and Docker Buildx.  

# Building container locally  
`buildah bud -t python-multiarch-test`  
or  
`docker build -t python-multiarch-test .`  

# Running container locally  
`podman run -p 5000:5000 python-multiarch-test`  
or  
`docker run -p 5000:5000 python-multiarch-test`  

