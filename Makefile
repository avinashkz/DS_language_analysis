# Driver script
# Nazli Ozum Kafaee, Prash Medirattaa, Avinash Prabhakaran, April 2018
# Script automates reading, processing and visualising data
#
# usage: make all


all: report

#Reads the data in from the spreadsheets
read_data:
	Rscript src/read_data.R

#To generate bar and proportion plots
eda: read_data
	Rscript src/visualizations.R

#To create the report.
report: eda
	Rscript -e 'rmarkdown::render("src/eda.Rmd", output_dir = "results")'

#To delete all the files created.
remove:	clean
	rm data/*

#To delete all the files created for analysis
clean:
	rm docs/*
	rm results/*