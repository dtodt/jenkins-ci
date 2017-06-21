sudo mkdir -p /workspace/jenkins_home

sudo chown -R 1000:1000 /workspace/jenkins_home/

docker run -p 8080:8080 -p 50000:50000 -v /workspace/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --name jenkins -d --restart=unless-stopped jenkins-docker