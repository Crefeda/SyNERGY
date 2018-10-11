#!/bin/bash
mkdir TX1_caffe_$1_run
if [ $2 == 'alexnet' ]
then
	mkdir -p TX1_caffe_$1_run/$2/
	
	scp /localhome/crefeda/convertmodels/alexnet/deploy.prototxt  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
	scp /localhome/crefeda/convertmodels/alexnet/bvlc_alexnet.caffemodel  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
elif [ $2 == 'squeezenet' ]
then
	mkdir -p TX1_caffe_$1_run/$2/
	scp /localhome/crefeda/convertmodels/squeezenet/deploy.prototxt  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
	scp  /localhome/crefeda/convertmodels/squeezenet/squeezenet_v1.0.caffemodel nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
elif [ $2 == 'resnet50' ]
then
	mkdir -p TX1_caffe_$1_run/$2/
	
	scp /localhome/crefeda/convertmodels/resnet50/ResNet-50-deploy.prototxt  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
	scp  /localhome/crefeda/convertmodels/resnet50/ResNet-50-model.caffemodel nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
elif [ $2 == 'squeezenetRes' ]
then
	mkdir -p TX1_caffe_$1_run/$2/
	
	scp /localhome/crefeda/convertmodels/squeezenetRes/deploy.prototxt  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
	scp  /localhome/crefeda/convertmodels/squeezenetRes/SqueezeNet_residual_top1_0.6038_top5_0.8250.caffemodel nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
elif [ $2 == 'googlenet' ]
then
	mkdir -p TX1_caffe_$1_run/$2/
	
	scp /localhome/crefeda/convertmodels/googlenet/deploy.prototxt  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
	scp /localhome/crefeda/convertmodels/googlenet/bvlc_googlenet.caffemodel nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
elif [ $2 == 'vggsmall' ]
then
	mkdir -p TX1_caffe_$1_run/$2/
	
	scp /localhome/crefeda/convertmodels/vggsmall/VGG_CNN_S_deploy.prototxt  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
	scp /localhome/crefeda/convertmodels/vggsmall/VGG_CNN_S.caffemodel nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
elif [ $2 == 'inceptionbn' ]
then
	mkdir -p TX1_caffe_$1_run/$2/
	
	scp /localhome/crefeda/convertmodels/InceptionBN/deploy.prototxt  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
	scp /localhome/crefeda/convertmodels/InceptionBN/Inception21k.caffemodel nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
elif [ $2 == 'inceptionv3' ]
then
	mkdir -p TX1_caffe_$1_run/$2/
	
	scp /localhome/crefeda/convertmodels/inceptionv3/deploy_inception-v3.prototxt  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
	scp /localhome/crefeda/convertmodels/inceptionv3/inception-v3.caffemodel nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
elif [ $2 == 'mobilenet' ]
then
	mkdir -p TX1_caffe_$1_run/$2/
	scp /localhome/crefeda/convertmodels/mobilenet/MobileNet_deploy.prototxt  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
	scp /localhome/crefeda/convertmodels/mobilenet/MobileNet_deploy.caffemodel nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
elif [ $2 == 'places' ]
then
	mkdir -p TX1_caffe_$1_run/$2/
	scp /localhome/crefeda/convertmodels/places/deploy.prototxt  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
	scp /localhome/crefeda/convertmodels/places/8conv3fc_DSN.caffemodel nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
elif [ $2 == 'allcnn' ]
then
	mkdir -p TX1_caffe_$1_run/$2/
	
	scp /localhome/crefeda/convertmodels/allcnn/ALL_CNN_C_train_val.prototxt  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
	scp /localhome/crefeda/convertmodels/allcnn/ALL_CNN_C_iter_52000.caffemodel nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
elif [ $2 == 'densenet' ]
then
	mkdir -p TX1_caffe_$1_run/$2/
	scp /localhome/crefeda/convertmodels/densenet/DenseNet_121.prototxt  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
	scp /localhome/crefeda/convertmodels/densenet/DenseNet_121.caffemodel nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
elif [ $2 == 'wrn' ]
then
	mkdir -p TX1_caffe_$1_run/$2/
	
	scp /localhome/crefeda/convertmodels/wrn/deploy_wrn50-2.prototxt  nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
	scp /localhome/crefeda/convertmodels/wrn/wrn50-2.caffemodel nvidia@rpc466.cs.man.ac.uk:/home/nvidia/Documents/caffe/.
fi
