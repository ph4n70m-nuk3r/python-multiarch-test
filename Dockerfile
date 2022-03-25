FROM python:3.8.12-slim 

## Ensure all output is sent directly to stdout without any buffering
ENV PYTHONUNBUFFERED 1

## Update package lists
## Upgrade all existing packages
## Install the packages required for installing and running the app
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -q && \
    ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt-get install -y -q git gcc g++ && \
    pip install --upgrade pip

## Set up the working directory
WORKDIR /app

## Copy python requirements files
COPY requirements.txt requirements-production.txt ./

## Install python requirements
RUN pip install -r requirements.txt && \
    pip install -r requirements-production.txt

## Remove the unnecesary system packages only used for build
RUN apt-get remove -y -q curl gnupg git gcc g++ autoconf automake autotools-dev binutils binutils-common && \
    apt-get autoremove -y -q && \
    apt-get clean -y -q

## copy the app from the source
COPY . .

## Expose the port we're running on
EXPOSE 5000

## Run the application
ENTRYPOINT ["waitress-serve", "--host=0.0.0.0", "--port=5000", "--no-ipv6", "--url-scheme=http", "--ident=PythonMultiArchTest", "app:app"]
