#!/bin/bash
# setup streamline
export PATH=$PATH:/usr/local/DS-5_v5.28.1/bin/


streamline -capture -duration 55 /home/PhD15/rodriguc/Desktop/session_snapdragon.xml  # stops after 55 secs
streamline -report /home/PhD15/rodriguc/Desktop/session_snapdragon.apc -format space -bookmarks 2<&1 | tee streamlineb_Itr$1.txt
streamline -report -timeline /home/PhD15/rodriguc/Desktop/session_snapdragon.apc -format space 2<&1 | tee streamlinep_Itr$1.txt




