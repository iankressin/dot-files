#!bin/bash
sensors | grep Tctl | tr -d 'Tctl: +'
