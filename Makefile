# Driver script
# Nazli Ozum Kafaee, Prash Medirattaa, Avinash Prabhakaran, April 2018
# Script automates reading, processing and visualising data
#
# usage: make all


all: read_data

read_data:
	Rscript src/read_data.R
