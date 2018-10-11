#!/bin/bash
mkdir TX1_caffe2_$1_run
if [ $2 == 'alexnet' ]
then
	mkdir -p TX1_caffe2_$1_run/$2/
	
	scp /localhome/crefeda/snapdragondata/alexnet/* nvidia@rpc466.cs.man.ac.uk:/home/nvidia/caffe2/.
elif [ $2 == 'squeezenet' ]
then
	mkdir -p TX1_caffe2_$1_run/$2/
	
	scp /localhome/crefeda/snapdragondata/squeezenet/* nvidia@rpc466.cs.man.ac.uk:/home/nvidia/caffe2/.
elif [ $2 == 'resnet50' ]
then
	mkdir -p TX1_caffe2_$1_run/$2/
	
	scp /localhome/crefeda/snapdragondata/resnet50/* nvidia@rpc466.cs.man.ac.uk:/home/nvidia/caffe2/.
elif [ $2 == 'squeezenetRes' ]
then
	mkdir -p TX1_caffe2_$1_run/$2/
	
	scp /localhome/crefeda/snapdragondata/squeezenetRes/* nvidia@rpc466.cs.man.ac.uk:/home/nvidia/caffe2/.
elif [ $2 == 'googlenet' ]
then
	mkdir -p TX1_caffe2_$1_run/$2/
	
	scp /localhome/crefeda/snapdragondata/googlenet/* nvidia@rpc466.cs.man.ac.uk:/home/nvidia/caffe2/.
elif [ $2 == 'vggsmall' ]
then
	mkdir -p TX1_caffe2_$1_run/$2/
	
	scp /localhome/crefeda/snapdragondata/vggsmall/* nvidia@rpc466.cs.man.ac.uk:/home/nvidia/caffe2/.
elif [ $2 == 'inceptionbn' ]
then
	mkdir -p TX1_caffe2_$1_run/$2/
	
	scp /localhome/crefeda/snapdragondata/inceptionnbn/* nvidia@rpc466.cs.man.ac.uk:/home/nvidia/caffe2/.
elif [ $2 == 'inceptionv3' ]
then
	mkdir -p TX1_caffe2_$1_run/$2/
	
	scp /localhome/crefeda/snapdragondata/inceptionv3/* nvidia@rpc466.cs.man.ac.uk:/home/nvidia/caffe2/.
elif [ $2 == 'mobilenet' ]
then
	mkdir -p TX1_caffe_$1_run/$2/

	scp /localhome/crefeda/snapdragondata/mobilenet/* nvidia@rpc466.cs.man.ac.uk:/home/nvidia/caffe2/.
elif [ $2 == 'places' ]
then
	mkdir -p TX1_caffe2_$1_run/$2/

	scp /localhome/crefeda/snapdragondata/places/* nvidia@rpc466.cs.man.ac.uk:/home/nvidia/caffe2/.
elif [ $2 == 'allcnn' ]
then
	mkdir -p TX1_caffe2_$1_run/$2/
	
	scp /localhome/crefeda/snapdragondata/allcnn/* nvidia@rpc466.cs.man.ac.uk:/home/nvidia/caffe2/.
elif [ $2 == 'densenet' ]
then
	mkdir -p TX1_caffe2_$1_run/$2/
	
	scp /localhome/crefeda/snapdragondata/densenet/* nvidia@rpc466.cs.man.ac.uk:/home/nvidia/caffe2/.
elif [ $2 == 'wrn' ]
then
	mkdir -p TX1_caffe2_$1_run/$2/
	
	scp /localhome/crefeda/snapdragondata/wrn/* nvidia@rpc466.cs.man.ac.uk:/home/nvidia/caffe2/.
fi
