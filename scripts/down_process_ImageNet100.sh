mkdir -p datasets
cd datasets
mkdir -p image_net_100
cd image_net_100

kaggle datasets download "ambityga/imagenet100" -p "./" --unzip

echo "Downloaded ImageNet100 dataset"