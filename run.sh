 	glRepos.py#!/bin/bash

if [[ 'a' == 'b' ]];
then
strt=0
for i in {0..5}
do fr=$(($i*20000000+$strt))
   to=$(($fr+20000000))
   python3 ghReposList.py ${un[$i]} ${ps[$i]} ghReposList201813 $fr $to &> ghReposList201812.$fr-$to &
done
wait
fi 

strt=120000000
for i in {0..4}
do fr=$(($i*20000000+$strt))
   to=$(($fr+20000000))
   python3 ghReposList.py ${un[$i]} ${ps[$i]} ghReposList201813 $fr $to &> ghReposList201812.$fr-$to &
done
python3 bbRepos.py 1980-01-01 bitbucket201813 &> bbRepos201813.out &

python3 extractSfGit.py sf201813 repos &

python3 	glRepos.py 1 gl201813 repos &

wait

#${un[$i]} ${ps[$i]} 
