# kali-dockerfile
My preferred Kali Linux Docker image customization


## Clone this repo

```
git clone https://github.com/willc/kali-dockerfile
```

## Build the image

```
docker build -t yourname/kali-rolling .
```

## Run it

This command will run the Docker image you built above, publish ports 80 and 443 to your host, and share your Desktop folder (as it resides on Macos; change path for other OS) with the running Docker image for easy file transfers in and out.

```
docker run -ti -p 80:80 -p 443:443 -v /Users/yourname/Desktop:/root yourname/kali-rolling
```
