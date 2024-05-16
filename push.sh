sudo docker push ghcr.io/westhecool/hackerbox:base
sudo docker push ghcr.io/westhecool/hackerbox:default
sudo docker push ghcr.io/westhecool/hackerbox:large
sudo docker push ghcr.io/westhecool/hackerbox:everything
# use default as latest
sudo docker tag ghcr.io/westhecool/hackerbox:default ghcr.io/westhecool/hackerbox:latest
sudo docker push ghcr.io/westhecool/hackerbox:latest