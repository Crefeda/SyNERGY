#!/bin/bash

if [ $1 == 'alexnet' ]
then
	ssh -X nvidia@rpc466.cs.man.ac.uk 'cd Documents/caffe && export OMP_NUM_THREADS=1 && tools/caffe test -model deploy.prototxt -weights bvlc_alexnet.caffemodel -iterations 1'

elif [ $1 == 'squeezenet' ]
then
       ssh -X nvidia@rpc466.cs.man.ac.uk 'cd Documents/caffe && export OMP_NUM_THREADS=1 && tools/caffe test -model deploy.prototxt -weights squeezenet_v1.0.caffemodel -iterations 1'

elif [ $1 == 'resnet50' ]
then
       ssh -X nvidia@rpc466.cs.man.ac.uk 'cd Documents/caffe && export OMP_NUM_THREADS=1 && tools/caffe test -model ResNet-50-deploy.prototxt -weights ResNet-50-model.caffemodel -iterations 1'

elif [ $1 == 'squeezenetRes' ]
then
       ssh -X nvidia@rpc466.cs.man.ac.uk 'cd Documents/caffe && export OMP_NUM_THREADS=1 && tools/caffe test -model deploy.prototxt -weights SqueezeNet_residual_top1_0.6038_top5_0.8250.caffemodel -iterations 1'

elif [ $1 == 'vggsmall' ]
then
       ssh -X nvidia@rpc466.cs.man.ac.uk 'cd Documents/caffe && export OMP_NUM_THREADS=1 && tools/caffe test -model VGG_CNN_S_deploy.prototxt -weights VGG_CNN_S.caffemodel -iterations 1'

elif [ $1 == 'googlenet' ]
then
       ssh -X nvidia@rpc466.cs.man.ac.uk 'cd Documents/caffe && export OMP_NUM_THREADS=4 && tools/caffe test -model deploy.prototxt -weights bvlc_googlenet.caffemodel -iterations 1'

elif [ $1 == 'inceptionbn' ]
then
       ssh -X nvidia@rpc466.cs.man.ac.uk 'cd Documents/caffe && export OMP_NUM_THREADS=1 && tools/caffe test -model deploy.prototxt -weights Inception21k.caffemodel -iterations 1'

elif [ $1 == 'inceptionv3' ]
then
       ssh -X nvidia@rpc466.cs.man.ac.uk 'cd Documents/caffe && export OMP_NUM_THREADS=1 && tools/caffe test -model deploy_inception-v3.prototxt -weights inception-v3.caffemodel -iterations 1'
elif [ $1 == 'mobilenet' ]
then
       ssh -X nvidia@rpc466.cs.man.ac.uk 'cd Documents/caffe && export OMP_NUM_THREADS=1 && tools/caffe test -model MobileNet_deploy.prototxt -weights MobileNet_deploy.caffemodel -iterations 1'
elif [ $1 == 'places' ]
then
       ssh -X nvidia@rpc466.cs.man.ac.uk 'cd Documents/caffe && export OMP_NUM_THREADS=1 && tools/caffe test -model deploy.prototxt -weights 8conv3fc_DSN.caffemodel -iterations 1'
elif [ $1 == 'allcnn' ]
then
             ssh -X nvidia@rpc466.cs.man.ac.uk 'cd Documents/caffe && export OMP_NUM_THREADS=1 && tools/caffe test -model ALL_CNN_C_train_val.prototxt -weights ALL_CNN_C_iter_52000.caffemodel -iterations 1'
elif [ $1 == 'densenet' ]
then
             ssh -X nvidia@rpc466.cs.man.ac.uk 'cd Documents/caffe && export OMP_NUM_THREADS=1 && tools/caffe test -model DenseNet_121.prototxt -weights DenseNet_121.caffemodel -iterations 1'

elif [ $1 == 'wrn' ]
then
              ssh -X nvidia@rpc466.cs.man.ac.uk 'cd Documents/caffe && export OMP_NUM_THREADS=1 && tools/caffe test -model deploy_wrn50-2.prototxt -weights wrn50-2.caffemodel -iterations 1'

fi
