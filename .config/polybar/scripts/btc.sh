#!/bin/bash 

bt=`curl -s "eur.rate.sx/1btc?q"`
printf "%0.4f\n" $bt
