echo "starting docker image deployment"
DOCKER_IMAGE=aryansr/python-cicd-app:latest
sudo docker pull $DOCKER_IMAGE
sudo docker stop -a
sudo docker rm -a
sudo docker run -d -p 8000:8000 aryansr/python-cicd-app:latest
