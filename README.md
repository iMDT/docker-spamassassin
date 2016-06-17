# docker-spamassassin
Run spamassassin (>=3.4.1) as a docker container

The latest spamassassin version is used from the arch linux repository.  [here](https://www.archlinux.org/packages/?name=spamassassin)

# Quick start
1. Clone the repository
2. Build image (docker build .)
3. Create container (docker create -p 783:783 <image-uuid>)

