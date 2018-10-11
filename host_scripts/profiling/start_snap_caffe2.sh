#!/bin/bash

if [ $1 == 'alexnet' ]
then
	adb shell ./data/local/tmp/mobile_speedbenchmark --init_net=/data/local/tmp/init_net.pb --net=/data/local/tmp/predict_net.pb  --warmup=0 --iter=1 --input_dims="1,3,227,227"

elif [ $1 == 'squeezenet' ]
then
       adb shell ./data/local/tmp/mobile_speedbenchmark --init_net=/data/local/tmp/init_net.pb --net=/data/local/tmp/predict_net.pb  --warmup=0 --iter=1 --input_dims="1,3,227,227"

elif [ $1 == 'resnet50' ]
then
       adb shell ./data/local/tmp/mobile_speedbenchmark --init_net=/data/local/tmp/init_net.pb --net=/data/local/tmp/predict_net.pb --warmup=0 --iter=1 --input_dims="1,3,224,224"

elif [ $1 == 'squeezenetRes' ]
then
       adb shell ./data/local/tmp/mobile_speedbenchmark --init_net=/data/local/tmp/init_net.pb --net=/data/local/tmp/predict_net.pb  --net=predict_net.pb --warmup=0 --iter=1 --input_dims="1,3,227,227"

elif [ $1 == 'vggsmall' ]
then
       adb shell ./data/local/tmp/mobile_speedbenchmark --init_net=/data/local/tmp/init_net.pb --net=/data/local/tmp/predict_net.pb  --warmup=0 --iter=1 --input_dims="1,3,224,224"

elif [ $1 == 'googlenet' ]
then
       adb shell ./data/local/tmp/mobile_speedbenchmark --init_net=/data/local/tmp/init_net.pb --net=/data/local/tmp/predict_net.pb  --warmup=0 --iter=1 --input_dims="1,3,224,224"

elif [ $1 == 'inceptionbn' ]
then
       adb shell ./data/local/tmp/mobile_speedbenchmark --init_net=/data/local/tmp/init_net.pb --net=/data/local/tmp/predict_net.pb  --warmup=0 --iter=1 --input_dims="1,3,224,224"

elif [ $1 == 'inceptionv3' ]
then
       adb shell ./data/local/tmp/mobile_speedbenchmark --init_net=/data/local/tmp/init_net.pb --net=/data/local/tmp/predict_net.pb  --warmup=0 --iter=1 --input_dims="1,3,299,299"
elif [ $1 == 'mobilenet' ]
then
       adb shell ./data/local/tmp/mobile_speedbenchmark --init_net=/data/local/tmp/init_net.pb --net=/data/local/tmp/predict_net.pb  --warmup=0 --iter=1 --input_dims="1,3,224,224"
elif [ $1 == 'places' ]
then
       adb shell ./data/local/tmp/mobile_speedbenchmark --init_net=/data/local/tmp/init_net.pb --net=/data/local/tmp/predict_net.pb  --warmup=0 --iter=1 --input_dims="1,3,227,227"
elif [ $1 == 'allcnn' ]
then
       adb shell ./data/local/tmp/mobile_speedbenchmark --init_net=/data/local/tmp/init_net.pb --net=/data/local/tmp/predict_net.pb  --warmup=0 --iter=1 --input_dims="1,3,32,32"

elif [ $1 == 'densenet' ]
then
      adb shell ./data/local/tmp/mobile_speedbenchmark --init_net=/data/local/tmp/init_net.pb --net=/data/local/tmp/predict_net.pb  --warmup=0 --iter=1 --input_dims="1,3,224,224"

elif [ $1 == 'wrn' ]
then
       adb shell ./data/local/tmp/mobile_speedbenchmark --init_net=/data/local/tmp/init_net.pb --net=/data/local/tmp/predict_net.pb  --warmup=0 --iter=1 --input_dims="1,3,224,224"

fi





