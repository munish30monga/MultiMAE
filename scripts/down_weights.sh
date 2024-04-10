echo "Downloading weights for MultiMAE..."
mkdir -p checkpoints
cd checkpoints
gdown https://drive.google.com/uc?id=1ctQXDPPL8SQGoVR4IWCJ_K8v_PF-nFPe -O checkpoints.zip
unzip checkpoints.zip
rm checkpoints.zip
echo "Done."