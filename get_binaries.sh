set -e

echo STARTING!!!
echo $1
env
if [ "${TARGETPLATFORM}" == "linux/arm64" ]; then
  curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/arm64/kubectl"
  curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "/root/awscliv2.zip"
elif [ "${TARGETPLATFORM}" == "linux/amd64" ]; then
  curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/root/awscliv2.zip"
else
  echo Unsupported platform
  exit
fi

chmod a+x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
cd /root
unzip awscliv2.zip
./aws/install

