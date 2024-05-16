sudo docker build -t ghcr.io/westhecool/hackerbox:base .
sudo docker build -t ghcr.io/westhecool/hackerbox:default -f dockerfile.default .
sudo docker build -t ghcr.io/westhecool/hackerbox:large -f dockerfile.large .
sudo docker build -t ghcr.io/westhecool/hackerbox:everything -f dockerfile.everything .