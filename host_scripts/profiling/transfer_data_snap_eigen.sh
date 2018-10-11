#!/bin/bash
mkdir snap_caffe2_$1_run
adb root
if [ $2 == 'alexnet' ]
then
	mkdir -p snap_caffe2_$1_run/$2/
	adb push /localhome/crefeda/snapdragondata/alexnet/init_net.pb /data/local/tmp/
	adb push /localhome/crefeda/snapdragondata/alexnet/predict_net.pb /data/local/tmp/
elif [ $2 == 'squeezenet' ]
then
	mkdir -p snap_caffe2_$1_run/$2/
	adb push /localhome/crefeda/snapdragondata/squeezenet/init_net.pb /data/local/tmp/
	adb push /localhome/crefeda/snapdragondata/squeezenet/predict_net.pb /data/local/tmp/
elif [ $2 == 'resnet50' ]
then
	mkdir -p snap_caffe2_$1_run/$2/
	adb push /localhome/crefeda/snapdragondata/resnet50/init_net.pb /data/local/tmp/
	adb push /localhome/crefeda/snapdragondata/resnet50/predict_net.pb /data/local/tmp/
elif [ $2 == 'squeezenetRes' ]
then
	mkdir -p snap_caffe2_$1_run/$2/
	adb push /localhome/crefeda/snapdragondata/squeezenetRes/init_net.pb /data/local/tmp/
	adb push /localhome/crefeda/snapdragondata/squeezenetRes/predict_net.pb /data/local/tmp/
elif [ $2 == 'googlenet' ]
then
	mkdir -p snap_caffe2_$1_run/$2/
	adb push /localhome/crefeda/snapdragondata/googlenet/init_net.pb /data/local/tmp/
	adb push /localhome/crefeda/snapdragondata/googlenet/predict_net.pb /data/local/tmp/
elif [ $2 == 'vggsmall' ]
then
	mkdir -p snap_caffe2_$1_run/$2/
	adb push /localhome/crefeda/snapdragondata/vggsmall/init_net.pb /data/local/tmp/
	adb push /localhome/crefeda/snapdragondata/vggsmall/predict_net.pb /data/local/tmp/
elif [ $2 == 'inceptionbn' ]
then
	mkdir -p snap_caffe2_$1_run/$2/
	adb push /localhome/crefeda/snapdragondata/inceptionbn/init_net.pb /data/local/tmp/
	adb push /localhome/crefeda/snapdragondata/inceptionbn/predict_net.pb /data/local/tmp/
elif [ $2 == 'inceptionv3' ]
then
	mkdir -p snap_caffe2_$1_run/$2/
	adb push /localhome/crefeda/snapdragondata/inceptionv3/init_net.pb /data/local/tmp/
	adb push /localhome/crefeda/snapdragondata/inceptionv3/predict_net.pb /data/local/tmp/
elif [ $2 == 'mobilenet' ]
then
	mkdir -p snap_caffe2_$1_run/$2/
	adb push /localhome/crefeda/snapdragondata/mobilenet/init_net.pb /data/local/tmp/
	adb push /localhome/crefeda/snapdragondata/mobilenet/predict_net.pb /data/local/tmp/
elif [ $2 == 'places' ]
then
	mkdir -p snap_caffe2_$1_run/$2/
	adb push /localhome/crefeda/snapdragondata/places/init_net.pb /data/local/tmp/
	adb push /localhome/crefeda/snapdragondata/places/predict_net.pb /data/local/tmp/
elif [ $2 == 'allcnn' ]
then
	mkdir -p snap_caffe2_$1_run/$2/
	adb push /localhome/crefeda/snapdragondata/allcnn/init_net.pb /data/local/tmp/
	adb push /localhome/crefeda/snapdragondata/allcnn/predict_net.pb /data/local/tmp/
elif [ $2 == 'densenet' ]
then
	mkdir -p snap_caffe2_$1_run/$2/
	adb push /localhome/crefeda/snapdragondata/densenet/init_net.pb /data/local/tmp/
	adb push /localhome/crefeda/snapdragondata/densenet/predict_net.pb /data/local/tmp/
elif [ $2 == 'wrn' ]
then
	mkdir -p snap_caffe2_$1_run/$2/
	adb push /localhome/crefeda/snapdragondata/wrn/init_net.pb /data/local/tmp/
	adb push /localhome/crefeda/snapdragondata/wrn/predict_net.pb /data/local/tmp/
fi
