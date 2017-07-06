#!/bin/bash

cd sparky
perl6 db-init.pl6 && sparkyd --timeout=10

