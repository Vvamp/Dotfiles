#!/bin/bash 

doge=`curl -s "eur.rate.sx/1doge?q"`
printf "%0.4f\n" $doge
