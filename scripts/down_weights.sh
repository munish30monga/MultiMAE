echo "Downloading checkpoints for MultiMAE model..."
mkdir -p checkpoints
cd checkpoints
gdown https://drive.google.com/uc?id=1ctQXDPPL8SQGoVR4IWCJ_K8v_PF-nFPe -O checkpoints.zip
unzip checkpoints.zip
rm checkpoints.zip

echo "Downloading Omnidata rgb2depth model..."
wget https://datasets.epfl.ch/vilab/iccv21/weights/omnidata_rgb2depth_dpt_hybrid.pth 

echo "Done."