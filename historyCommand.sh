    1  sudo apt-get install curl
    2  sudo apt-get update -y
    3  ssh -i "morokey.pem" ubuntu@ec2-18-142-251-17.ap-southeast-1.compute.amazonaws.com
    4  sudo apt-get install git
    5  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    6  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/boyang/.bashrc
    7  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    8  brew install wget
    9  brew install gcc
   10  brew install helm
   11  helm
   12  clear
   13  nano common.sh
   14  ./common.sh
   15  chmod a
   16  chmod
   17  chmod --help
   18  chmod u
   19  chmod u+x common.sh
   20  ./common.sh
   21  nano master.sh
   22  chmod u+x master.sh
   23  ./master.sh
   24  systemctl status kubelet
   25  journalctl -xeu kubelet
   26  kubectl get nodes
   27  sudo swapoff -a
   28  nano /etc/fstab
   29  swapon --show
   30  sudo nano /etc/fstab
   31  sudo swapoff -a
   32  ./master.sh
   33  sudo kubeadm reset
   34  ./master.sh
   35  cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

   36  sudo modprobe overlay
   37  sudo modprobe br_netfilter
   38  cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

   39  sudo sysctl --system
   40  lsmod | grep overlay
   41  lsmod | grep br_netfilter
   42  sysctl net.bridge.bridge-nf-call-iptables net.bridge.bridge-nf-call-ip6tables net.ipv4.ip_forward
   43  sudo apt-get update
   44  sudo apt-get install ca-certificates curl gnupg
   45  sudo install -m 0755 -d /etc/apt/keyrings
   46  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   47  sudo chmod a+r /etc/apt/keyrings/docker.gpg
   48  echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   49  sudo apt-get update
   50  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   51  sudo mkdir /etc/docker
   52  cat <<EOF | sudo tee /etc/docker/daemon.json
{
 "exec-opts": ["native.cgroupdriver=systemd"],
 "log-driver": "json-file",
 "log-opts": {
 "max-size": "100m"
 },
 "storage-driver": "overlay2"
 }
 EOF
EOF

   53  nano /etc/docker/daemon.json
   54  sudo nano /etc/docker/daemon.json
   55  sudo docker run hello-world
   56  sudo swapoff -a
   57  sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
   58  sudo -i
   59  sudo apt-get update
   60  sudo apt-get install -y apt-transport-https ca-certificates curl
   61  curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
   62  echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
   63  sudo apt-get update
   64  sudo apt-get install -y kubelet kubeadm kubectl
   65  sudo apt-mark hold kubelet kubeadm kubectl
   66  ifconfig
   67  sudo apt install net-tools
   68  ifconfig
   69  NODENAME=$(hostname -s)
   70  POD_CIDR="10.244.0.0/16"
   71  sudo kubeadm config images pull
   72  sudo systemctl disable crio
   73  sudo systemctl stop  crio
   74  sudo kubeadm config images pull
   75  MASTER_PUBLIC_IP=$(curl ifconfig.me && echo "")
   76  sudo kubeadm init --control-plane-endpoint="$MASTER_PUBLIC_IP" --apiserver-cert-extra-sans="$MASTER_PUBLIC_IP" --pod-network-cidr="$POD_CIDR" --node-name "$NODENAME" --ignore-preflight-errors Swap --v=5
   77  sudo kubeadm reset
   78  sudo kubeadm init --control-plane-endpoint="$MASTER_PUBLIC_IP" --apiserver-cert-extra-sans="$MASTER_PUBLIC_IP" --pod-network-cidr="$POD_CIDR" --node-name "$NODENAME" --ignore-preflight-errors Swap --v=5
   79  sudo kubeadm reset -y
   80  sudo kubeadm reset 
   81  sudo lsof -i :6443
   82  kubectl cluster-info
   83  sudo kill -9 5722
   84  sudo lsof -i :10259
   85  sudo lsof -i :10257
   86  sudo lsof -i :2379
   87  sudo lsof -i :2380
   88  [200~sudo lsof -i :10259
   89  sudo lsof -i :10257
   90  sudo lsof -i :10259
   91  sudo lsof -i :10257
   92  sudo lsof -i :2379
   93  sudo lsof -i :2380
   94  sudo lsof -i :2379
   95  sudo lsof -i :10257
   96  sudo kubeadm init --control-plane-endpoint="$MASTER_PUBLIC_IP" --apiserver-cert-extra-sans="$MASTER_PUBLIC_IP" --pod-network-cidr="$POD_CIDR" --node-name "$NODENAME" --ignore-preflight-errors Swap --v=5
   97  sudo systemctl status kubelet.service
   98  sudo systemctl status containerd
   99  sudo systemctl restart containerd
  100  sudo systemctl status containerd
  101  sudo systemctl daemon-reload
  102  sudo kubeadm reset
  103  sudo kubeadm init --control-plane-endpoint="$MASTER_PUBLIC_IP" --apiserver-cert-extra-sans="$MASTER_PUBLIC_IP" --pod-network-cidr="$POD_CIDR" --node-name "$NODENAME" --ignore-preflight-errors Swap --v=5
  104  sudo kubeadm reset
  105  sudo systemctl restart kubelet
  106  sudo systemctl status kubelet
  107  sudo nano /usr/bin/kubelet
  108  journalctl -u kubelet
  109  sudo kubeadm reset 
  110  sudo apt-get install -y kubelet kubeadm kubectl
  111  sudo apt-mark hold kubelet kubeadm kubectl
  112  kubeadm init
  113  sudo kubeadm init
  114  mkdir -p $HOME/.kube
  115  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  116  sudo chown $(id -u):$(id -g) $HOME/.kube/config
  117  kubectl get pods
  118  kubectl get pods -n kube-system
  119  kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml
  120  curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/custom-resources.yaml -O
  121  kubectl create -f custom-resources.yaml
  122  kubectl get pods -n kube-system
  123  kubectl get namespaces
  124  kubectl get all
  125  kubectl get nodes
  126  kubectl get pods -n default
  127  kubectl get namespace
  128  kubectl get pods tigera-operator
  129  history >> history-cmd-10jan.txt