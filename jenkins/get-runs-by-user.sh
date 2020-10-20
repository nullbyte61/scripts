#! /bin/bash

jobUrl=$1 #https://<jenkins-Job-URL>/
searchUser=$2 #<short-username>
#lastBuild=$(curl -s $jobUrl/api/json\?pretty\=true | jq '.lastBuild.number')
##TODO: 
# Calculate fist and last available build numbers
# Generate the range from those numbers...
for runId in {2114..2164}
do
    runApiUrl="$jobUrl$runId/api/json?pretty=true"
    user=$(curl -s $runApiUrl | jq '.actions[1].causes[0].userId')
    [ $user ] && [ $user = \"$searchUser\" ] && echo $user triggered build number $runId
done