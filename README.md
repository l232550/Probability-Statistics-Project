Interactive Irrigation Data Dashboard (Probability & Statistics Project)

Overview:
This project is an interactive dashboard developed using R Shiny as part of the MT2005 Probability and Statistics course. It visualizes and analyzes irrigation data across Pakistan from 2015 to 2022, focusing on the area irrigated by different water sources such as canals, tubewells, and wells across various provinces.

Features:
- Interactive data table for filtering and sorting irrigation data by province and year
- Multiple visualization types including histograms, bar charts, boxplots, and pie charts
- Regression analysis tools (linear and multiple regression) to explore relationships in the data
- User-friendly interface built with `shinydashboard` and enhanced with `plotly` for interactive plots
- Data cleaning and transformation using `dplyr` and `tidyr`

DataSet Source:
The irrigation data is sourced from the Pakistan Bureau of Statistics:  
[Area Irrigated by Different Sources (2015-2022)](https://www.pbs.gov.pk/sites/default/files/tables/agriculture_statistics/new/Area_Irrigated_by_Different_Sources.pdf)

Installation and Usage:
->Prerequisites:
Make sure you have R (version 4.0 or higher) and RStudio installed. Install the required packages if you don’t have them:

```
install.packages(c("shiny", "shinydashboard", "plotly", "ggplot2", "DT", "dplyr", "tidyr", "broom", "RColorBrewer", "plotrix"))
```

->Running the App:
1. Clone this repository:
   ```
   git clone https://github.com/USERNAME/REPOSITORY.git
   ```
2. Open the project folder in RStudio.
3. Run the Shiny app by opening `app.R` and clicking **Run App** or by running:
   ```
   shiny::runApp()
   ```

Project Team:
- Tooba Nadeem (23L-2550)  
- Abdullah Habib (23F-3061)  
- Section: BS(SE)-4A  
- Instructor: Dr. Haris Khurram

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
