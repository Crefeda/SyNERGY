# Script to run Caffe and profiling tool to collect performance counter data
import time
import utils
import os
import threading

class profiler(threading.Thread):
    def __init__(self, name, cmd):
        ''' Constructor. '''
        threading.Thread.__init__(self)
        self.name = name
	self.cmd = cmd
    def run(self):
	print("Start profiling...")
	os.system(self.cmd)
        print("Profiling completed...")

 
class caffe(threading.Thread):
    def __init__(self, name, cmd):
        ''' Constructor. '''
        threading.Thread.__init__(self)
        self.name = name
	self.cmd = cmd
    def run(self):
        time.sleep(10) # wait 10 sec for the profiler to set up

	print("Start Caffe inference...")
	os.system(self.cmd)
        print("Inference completed...")

 
# Run following code when the program starts
if __name__ == '__main__':
   runs=5 # Number of runs 
   config=["tx1-eigen", "tx1-openblas", "snap-eigen"]
   selection=1
   #model=["alexnet","squeezenet", "resnet50", "googlenet", "squeezenetRes", "vggsmall", "inceptionbn", "inceptionv3", "places", "allcnn", "wrn", "mobilenet", "densenet"]
   model=["googlenet"]
   for nmodel in model:
	   if(config[selection]=="tx1-eigen"):
		   s=" "
		   seq = ("./transfer_data_tx1_eigen.sh", str(runs), nmodel)
		   print("Starting transfer of model files...")
		   os.system(s.join( seq ))
	   elif(config[selection]=="tx1-openblas"):
		   s=" "
		   seq = ("./transfer_data_tx1_openblas.sh", str(runs), nmodel)
		   print("Starting transfer of model files...")
		   os.system(s.join( seq ))
           else:
		   s=" "
		   seq = ("./transfer_data_snap_eigen.sh", str(runs), nmodel)
		   print("Starting transfer of model files...")
		   os.system(s.join( seq ))
	   for nrun in range(1,runs+1):
                if(config[selection]=="tx1-eigen"):
			seq2 = ("./start_streamline.sh", str(nrun))
	   		myThreadOb1 = profiler(2, s.join( seq2 ))
	   		myThreadOb1.setName('Thread 2')
	  		seq3 = ("./start_tx1_caffe2.sh",  nmodel)
	        	myThreadOb2 = caffe(2, s.join(seq3))
	   		myThreadOb2.setName('Thread 2')

    		elif(config[selection]=="tx1-openblas"):
			seq2 = ("./start_streamline.sh", str(nrun))
	   		myThreadOb1 = profiler(2, s.join( seq2 ))
	   		myThreadOb1.setName('Thread 2')
	  		seq3 = ("./start_tx1_caffe_openblas.sh",  nmodel)
	        	myThreadOb2 = caffe(2, s.join(seq3))
	   		myThreadOb2.setName('Thread 2')
		else:			
			seq2 = ("./start_streamline_snap.sh", str(nrun))
	   		myThreadOb1 = profiler(2, s.join( seq2 ))
	   		myThreadOb1.setName('Thread 2')
	  		seq3 = ("./start_snap_caffe2.sh",  nmodel)
	        	myThreadOb2 = caffe(2, s.join(seq3))
	   		myThreadOb2.setName('Thread 2')

	   	# Start running the threads!
	  	myThreadOb1.start()
	   	myThreadOb2.start()
	 
	   	# Wait for the threads to finish...
	   	myThreadOb1.join()
	  	myThreadOb2.join()
	   if(config[selection]=="tx1-eigen"):
   	   	seq4 = ("./move_data.sh", str(runs), nmodel)
	   elif(config[selection]=="tx1-openblas"):
		seq31 = ("./rm_weight_model.sh")
		os.system(seq31)
                seq4 = ("./move_data_tx1_openblas.sh", str(runs), nmodel)
	   else:
 	        seq4 = ("./move_data_snap_eigen.sh", str(runs), nmodel)

   	   os.system(s.join( seq4 ))
   print('Main Terminating...')
