# R-SVM
PROBLEM
#
#  The bank needs to increase the number of low cost deposits.  This is a key source of funds to use for
#  retail and commercial loans.
#
#  SOLUTION
#
#  Identify new bank customers to determine if any customers might be candidates for a deposit account.  Develop
#  a model to predict if a person would open an account.
#
#  ANALYTICS
#
#  The data is from direct marketing campaigns of a bank, based on phone calls and other marketing effort.
#  Often, more than one contact of the same potential customer was required to determine if the product (bank term deposit)
#  would (or would not) be bought. The goal is to predict if the client will subscribe or not (the target variable or
#  LABEL). The marketing department can focus on the most promising leads and increase the overall ROI of the campaign.
#
#  The approach is to use the data described below and the Support Vector Machine algorithm to predict if the person
#  would or would not open a new account.
#
#  BANK MARKETING DATA (45,212 records)		
#
#  FEATURES	        DEFINITION	                          ALLOWED VALUES
#    AGE	          Age of the person in years	          Integer
#    JOB	          Type of Job the person has	          'admin.','unknown','unemployed','management',
#                                                         'housemaid','entrepreneur','student', 'blue-collar',
#                                                         'self-employed','retired','technician','services'
#    MARITAL	      Marital Status	                      'married','divorced','single'; note: 'divorced' means
#                                                           divorced or widowed
#    EDUCATION	    Level of education reached	          'unknown','secondary','primary','tertiary'
#    DEFAULT	      Has credit in default	                "Yes" or "No"
#    BALANCE	      Average yearly balance in euros	      Number
#    HOUSING	      Has a mortgage	                      "Yes" or "No"
#    LOAN	          Has a personal loan	                  "Yes" or "No"
#    CONTACT	      Contact communication type            'unknown','telephone','cellular'
#    DAY	          The last contact day of the month	    Integer between 1 and 31
#    MONTH	        The last contact month of year	      'jan', 'feb', 'mar', ..., 'nov', 'dec'
#    DURATION	      The last contact duration, in seconds	Number
#    CAMPAIGN	      The number of contacts performed
#                     during this campaign and for this
#                     client	                            Integer
#    PDAYS	        The number of days that passed by
#                     after the client was last contacted
#                     from a previous campaign	          Integer.  -1 means client was not previously contacted
#    PREVIOUS	      The number of contacts performed
#                     before this campaign and for this
#                     client	                            Integer
#    POUTCOME	      The outcome of the previous marketing
#                     campaign	                          'unknown','other','failure','success'
#    Y	            Has the client subscribed a term
#                     deposit?	                          "Yes" or "No"
