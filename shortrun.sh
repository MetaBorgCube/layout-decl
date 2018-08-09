#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Error. No benchmark passed. Please run ./shortrun.sh <BenchmarkName>"
  exit 1
fi

if [ "$1" = "org.metaborg.LayoutSensitiveParsingCorrectness" ]; then
    mvn clean verify -Dmain-class=$1 -Dshortrun=true

elif [ "$1" = "org.metaborg.LayoutSensitivePrettyPrint" ]; then
  mvn clean verify -Dmain-class=$1 -Dshortrun=true

elif [ "$1" = "org.metaborg.LayoutSensitiveParsingPerformance" ]; then
  mvn clean verify -Dmain-class=org.metaborg.CreateRandomFiles -Dshortrun=true
	mvn clean verify -Dmain-class=org.metaborg.LayoutSensitiveParsingPerformanceShortRun

elif [ "$1" = "org.metaborg.LayoutSensitiveParsingPerformanceShortRun" ]; then
  mvn clean verify -Dmain-class=CreateRandomFiles -Dshortrun=true
	mvn clean verify -Dmain-class=org.metaborg.LayoutSensitiveParsingPerformanceShortRun

else
 echo "Error. Invalid benchmark name."
 exit 1
fi
