# sentiment-data-shiny

The app.R file compiles to create a Shiny app in R that visualises sentiment data. This sentiment data was collected in the first week of semester 2, 2023 through a Google Form by the STATS 399 course instructors at the University of Auckland. The sentiment data includes three columns of data:
- approximately 4 feelings felt by students prior to the course
- how students thought their peers felt about the course
- how students thought their instructors felt about the course

The data used in the app has been cleaned into 4 columns and 15 rows.
The columns are:
- feelings
- frequency
- sentiment of the feeling (positive/ negative)
- individuals who the sentiment applies to (personal/ instructor/ classmates)

The shiny app visualises the data by the 3 categories: personal/ instructor/ classmates. By picking one of these labels from the drop down bar at the left hand side of the interface, the app will visualise the counts of the 5 most frequently used word in that category coloured by whether the word has a positive or negative connotation.
