---
title: "Data Science Language Analysis"
subtitle: <h1><u>Final Report</u></h1>
author: 
  - "Nazli Ozum Kafaee"
  - "Prash Medirattaa"
  - "Avinash Prabhakaran"
date: '2018-04-15'
output:
  html_document:
    keep_md: yes
    toc: true
    toc_float: true
    theme: united
    highlight: tango
    
---



# Introduction

It is common to hear from people working with data that they have a clear choice between R and Python. Almost everyone who has worked with both R and Python have one or the other as their favorite. We were curious if there might be a specific reason underlying such choice. After some brainstroming, we came up with the hypothesis that a person's choice between R and Python might be due to their preference in a specific data science task such as data visualization, data wrangling and machine learning. This hypothesis was based solely on observations and personal experience, but we set the goal to explore such causal relationship (if there exists one) with data in our data analysis project.

# Methods

## Data collection methods

Our primary data source was an online survey created on Google Forms and distributed to the MDS cohort, faculty and teaching assistants through Slack channels as well as to people in the authors' Linkedin and Whatsapp network. In the end, we managed to collect 85 responses.

One of the concerns we had to address was regarding the storage of the collected data. Since we used Google Forms for our survey, the data was hosted in the US. Assuming that a great majority of our respondents were Canadian residents, we made sure to inform them of the fact that the data being collected is hosted in the US and to get their consent before proceeding further in the survey. More information on this matter can be found in the [UBC Office of Research Ethics - Using Online Surveys](https://ethics.research.ubc.ca/sites/ore.ubc.ca/files/documents/Online_Survey-GN.pdf) document.

## Survey Study Design

In our survey, we wanted repondents to answer two main questions: "Which of the following programming languages do you prefer more?" and "What is your favorite data science task?". In the former, respondents were required to choose one of "R" or "Python" and in the latter, they could choose one of three options which were "Data wrangling", "Data visualization" and "Machine Learning". The answers to these two questions would provide us the information for the dependent and independent variables in our analysis, respectively. 

In order to fully discover the causal relationship between task preference and language preference, we also collected data about factors that could have an effect on both of our dependent and independent variable. The primary goal in collecting information on possible confounding variables was to ensure that we can control for these in our analysis later on. We determined five possible confounding variables that might have an effect on our analysis: academic background, attitude towards coding, the first programming language learnt, the number of programming languages actively used, and experience in programming in years.

We thought that academic background would be a confounding variable as people with Computer Science/Computer Engineering background would have been introduced to Python as part of their degree and people from Mathematics/Statistics degrees would have been introduced to R in general. However, we did not anticipate any bias towards R or Python by graduates of any other degrees. We also believed that the amount of coding experience could be a confounder as it can be indicate how open the user is in selecting a statistical programming language over a general-purpose programming language. However, we also realized that it is possible that a user can become highly opinionated when they have greater experience, and they might prefer Python. Therefore, we wanted to include this variable in our survey as it would be interesting to analyze. Another variable we wanted to collect information on was the user's attitude towards coding. The outlook towards coding could be a confounder as Python is a general-purpose programming language and it can be used in various areas, and its application is not limited to Data Science/Statistics whereas R is a statistical programming language and is mainly used only in the fields of Data Science and Statistics. Again, a person's first programming language would be very influential as it dictates their style of coding and would also be a deciding factor in what they seek for in other languages. Some of the programming languages are more closely related to Python whereas some others are more related to R. The number of programming languages a person actively uses could be a deciding factor too as it can dictate how comfortable the user is in using different syntaxes and will also be indicative of how flexible the user.

Our survey can be accessed fully [here](https://goo.gl/forms/zdl0VlHK2NwAfflE3).


## Analysis Methods

The data collected as a result of our survey was downloaded as a `csv` file and imported into R for analysis. All data wrangling and visualization was done in the R ecosystem. The code that downloads and wrangles data and creates plots can be found in [read_data.R](read_data.R), [clean_data.R]("src/clean_data.R") and [get_plots.R]("src/get_plots.R") respectively. 

# Analysis and Results

# Discussion

