#!/bin/bash

# Update package repositories and upgrade existing packages
sudo apt update
sudo apt upgrade -y

# Install Python and pip
sudo apt install -y python3 python3-pip

# Install Visual Studio Code
sudo snap install code --classic

# Install VS Code extensions
code --install-extension ms-vscode.python
code --install-extension ms-vscode.jupyter
code --install-extension ms-vscode.dvc
code --install-extension ms-vscode.r
code --install-extension ms-vscode.julia
code --install-extension mtxr.sqltools
code --install-extension mtxr.sqltools-driver-pg
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension ms-vscode.posgresql
code --install-extension jithurjacob.nbpreviewer
code --install-extension eamodio.gitlens

# Install Azure Data Studio
wget -q https://go.microsoft.com/fwlink/?linkid=2160375 -O azuredatastudio-linux.deb
sudo apt install -y ./azuredatastudio-linux.deb
rm azuredatastudio-linux.deb

# Install Anaconda
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget -P /tmp https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -O anaconda-installer.sh
bash anaconda-installer.sh -b -p $HOME/anaconda3
rm anaconda-installer.sh

# Activate Anaconda
eval "$($HOME/anaconda3/bin/conda shell.bash hook)"
conda init bash
source ~/.bashrc
#may have to restart and continue from here

# Install Jupyter Notebook
conda install -y jupyter

# Install additional Python libraries for data science
conda install -y numpy pandas matplotlib scikit-learn plotly seaborn bokeh scikit-image nltk

# Install machine learning tools
conda install -y -c conda-forge xgboost lightgbm catboost

# Install database clients
sudo apt install -y mysql-client postgresql-client mongodb-clients sqlite3

# Install Git
sudo apt install -y git

# Install documentation and notebook tools
sudo apt install -y python3-sphinx pandoc
conda install -y nbconvert

# Install CUDA Toolkit
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.4.0/local_installers/cuda-repo-ubuntu2004-11-4-local_11.4.0-470.42.01-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-4-local_11.4.0-470.42.01-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-4-local/7fa2af80.pub
sudo apt update
sudo apt install -y cuda

#install r
sudo apt-get install r-base
sudo apt update
#Garbage Cleanup
sudo apt autoremove
echo "Ubuntu post-installation script completed."
