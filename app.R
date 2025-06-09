library(shiny)
library(shinydashboard)
library(plotly)
library(RColorBrewer)
library(ggplot2)
library(plotrix)
library(broom)
library(dplyr)
library(tidyr)
library(DT)  # for interactive tables

colors <- brewer.pal(length(labels), "Set2")

# Raw wide data for all years and provinces
# Each year is a separate data frame; then we combine them

# 2015-16
data_2015_16 <- data.frame(
  Province = c("TOTAL", "Punjab", "Sindh", "Khyber Pakhtunkhwa", "Balochistan"),
  Total = c(18.60, 14.86, 1.69, 0.95, 1.10),
  Canals = c(5.56, 3.35, 1.33, 0.44, 0.44),
  Tubewells_Govt = c(0.40, NA, NA, 0.29, 0.11),
  Tubewells_Private = c(3.60, 2.71, 0.36, 0.10, 0.43),
  Wells = c(0.35, 0.25, NA, 0.05, 0.05),
  Canal_Tubewells = c(8.15, 8.15, NA, NA, NA),
  Canal_Wells = c(0.28, 0.28, NA, NA, NA),
  Tanks = c(0.00, NA, NA, 0.00, NA),
  Others = c(0.26, 0.12, NA, 0.07, 0.07)
)
data_2015_16$Year <- "2015-16"

# 2016-17
data_2016_17 <- data.frame(
  Province = c("TOTAL", "Punjab", "Sindh", "Khyber Pakhtunkhwa", "Balochistan"),
  Total = c(18.22, 14.48, 1.69, 0.95, 1.10),
  Canals = c(5.53, 3.31, 1.33, 0.45, 0.44),
  Tubewells_Govt = c(0.36, NA, NA, 0.27, 0.09),
  Tubewells_Private = c(3.62, 2.67, 0.36, 0.11, 0.48),
  Wells = c(0.40, 0.29, NA, 0.05, 0.06),
  Canal_Tubewells = c(7.85, 7.85, NA, NA, NA),
  Canal_Wells = c(0.29, 0.29, NA, NA, NA),
  Tanks = c(0.00, NA, NA, 0.00, NA),
  Others = c(0.17, 0.07, NA, 0.07, 0.03)
)
data_2016_17$Year <- "2016-17"

# 2017-18
data_2017_18 <- data.frame(
  Province = c("TOTAL", "Punjab", "Sindh", "Khyber Pakhtunkhwa", "Balochistan"),
  Total = c(18.63, 14.89, 1.69, 0.95, 1.10),
  Canals = c(5.62, 3.40, 1.33, 0.45, 0.44),
  Tubewells_Govt = c(0.38, NA, NA, 0.28, 0.10),
  Tubewells_Private = c(3.60, 2.67, 0.36, 0.10, 0.47),
  Wells = c(0.44, 0.33, NA, 0.05, 0.06),
  Canal_Tubewells = c(8.15, 8.15, NA, NA, NA),
  Canal_Wells = c(0.27, 0.27, NA, NA, NA),
  Tanks = c(0.00, NA, NA, 0.00, NA),
  Others = c(0.17, 0.07, NA, 0.07, 0.03)
)
data_2017_18$Year <- "2017-18"

# 2018-19
data_2018_19 <- data.frame(
  Province = c("TOTAL", "Punjab", "Sindh", "Khyber Pakhtunkhwa", "Balochistan"),
  Total = c(18.33, 14.73, 1.65, 0.94, 1.01),
  Canals = c(5.33, 3.17, 1.29, 0.45, 0.42),
  Tubewells_Govt = c(0.32, NA, NA, 0.26, 0.06),
  Tubewells_Private = c(3.76, 2.87, 0.36, 0.09, 0.44),
  Wells = c(0.29, 0.17, NA, 0.05, 0.07),
  Canal_Tubewells = c(8.19, 8.19, NA, NA, NA),
  Canal_Wells = c(0.27, 0.27, NA, 0.02, NA),
  Tanks = c(0.02, NA, NA, 0.02, NA),
  Others = c(0.15, 0.06, NA, 0.07, 0.02)
)
data_2018_19$Year <- "2018-19"

# 2019-20
data_2019_20 <- data.frame(
  Province = c("TOTAL", "Punjab", "Sindh", "Khyber Pakhtunkhwa", "Balochistan"),
  Total = c(19.34, 15.47, 1.65, 0.94, 1.28),
  Canals = c(5.70, 3.31, 1.29, 0.44, 0.66),
  Tubewells_Govt = c(0.33, NA, NA, 0.26, 0.07),
  Tubewells_Private = c(4.06, 3.15, 0.36, 0.10, 0.45),
  Wells = c(0.27, 0.16, NA, 0.05, 0.06),
  Canal_Tubewells = c(8.47, 8.47, NA, NA, NA),
  Canal_Wells = c(0.24, 0.24, NA, 0.02, NA),
  Tanks = c(0.02, 0.00, NA, 0.02, NA),
  Others = c(0.25, 0.14, NA, 0.07, 0.04)
)
data_2019_20$Year <- "2019-20"

# 2020-21
data_2020_21 <- data.frame(
  Province = c("TOTAL", "Punjab", "Sindh", "Khyber Pakhtunkhwa", "Balochistan"),
  Total = c(19.47, 15.61, 1.63, 1.03, 1.20),
  Canals = c(5.39, 3.27, 1.16, 0.46, 0.50),
  Tubewells_Govt = c(0.38, 0.00, 0.00, 0.29, 0.09),
  Tubewells_Private = c(4.07, 3.09, 0.36, 0.10, 0.52),
  Wells = c(0.42, 0.18, 0.11, 0.08, 0.05),
  Canal_Tubewells = c(8.71, 8.71, NA, NA, NA),
  Canal_Wells = c(0.23, 0.23, NA, 0.00, 0.00),
  Tanks = c(0.00, 0.00, NA, 0.00, 0.00),
  Others = c(0.27, 0.13, NA, 0.10, 0.04)
)
data_2020_21$Year <- "2020-21"

# 2021-22
data_2021_22 <- data.frame(
  Province = c("TOTAL", "Punjab (R)", "Sindh", "Khyber Pakhtunkhwa", "Balochistan"),
  Total = c(19.42, 15.61, 1.66, 0.97, 1.18),
  Canals = c(5.52, 3.27, 1.30, 0.46, 0.49),
  Tubewells_Govt = c(0.36, 0.00, 0.00, 0.28, 0.08),
  Tubewells_Private = c(4.02, 3.09, 0.36, 0.10, 0.47),
  Wells = c(0.26, 0.18, 0.00, 0.04, 0.04),
  Canal_Tubewells = c(8.71, 8.71, NA, NA, NA),
  Canal_Wells = c(0.23, 0.23, NA, 0.00, 0.00),
  Tanks = c(0.00, 0.00, NA, 0.00, 0.00),
  Others = c(0.32, 0.13, NA, 0.09, 0.10)
)
data_2021_22$Year <- "2021-22"

# Combine all years into one data frame
all_data_wide <- bind_rows(
  data_2015_16, data_2016_17, data_2017_18, data_2018_19,
  data_2019_20, data_2020_21, data_2021_22
)

# Convert to long format
all_data_long <- all_data_wide %>%
  pivot_longer(
    cols = -c(Province, Year),
    names_to = "Source",
    values_to = "Area"
  ) %>%
  # Optional: Clean Source names (replace underscores with spaces)
  mutate(Source = gsub("_", " ", Source))

# View the tidy data
print(all_data_long)



# Define UI using shinydashboard for better layout and navigation
ui <- dashboardPage(
  dashboardHeader(title = "Statistical Dashboard"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Data Table", tabName = "datatable", icon = icon("table")),
      menuItem("Histogram Analysis", tabName = "histograms", icon = icon("bar-chart-o"),
               menuSubItem("By Source", tabName = "hist_source"),
               menuSubItem("By Province", tabName = "hist_province")
      ),
      menuItem("Bar Charts", tabName = "barcharts", icon = icon("bars")),
      menuItem("Boxplots", tabName = "boxplots", icon = icon("box")),
      menuItem("Pie Charts", tabName = "piecharts", icon = icon("chart-pie")),
      menuItem("Component Bar Chart", tabName = "compbar", icon = icon("layer-group")),
      menuItem("Multiple Bar Charts", tabName = "multibar", icon = icon("th")),
      menuItem("Regression Analysis", icon = icon("project-diagram"),
               menuSubItem("Linear Regression", tabName = "linear_regression"),
               menuSubItem("Multiple Regression", tabName = "multiple_regression")
      ),
      menuItem("Normal Distribution", tabName = "normaldist", icon = icon("chart-area")),
      menuItem("Conclusion", tabName = "conclusion", icon = icon("flag-checkered"))
    )
  ),
  
  dashboardBody(
    # Include custom CSS
    tags$head(
      tags$style(HTML("
        .content-wrapper, .right-side { background-color: #f8f9fa; }
        .content { padding: 15px; }
        .section-header { 
          color: #2c3e50; 
          border-bottom: 2px solid #3498db; 
          padding-bottom: 10px; 
          margin-bottom: 20px;
        }
        .control-panel {
          background-color: white;
          padding: 15px;
          border-radius: 8px;
          box-shadow: 0 2px 5px rgba(0,0,0,0.1);
          margin-bottom: 20px;
        }
        .viz-panel {
          background-color: white;
          padding: 20px;
          border-radius: 8px;
          box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .custom-box {
          background-color: white;
          padding: 20px;
          border-radius: 8px;
          margin-bottom: 20px;
          box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .info-tag {
          display: inline-block;
          padding: 4px 8px;
          background-color: #3498db;
          color: white;
          border-radius: 4px;
          font-size: 12px;
          margin-right: 5px;
        }
        .feature-description {
          color: #7f8c8d;
          margin-top: 8px;
        }
      "))
    ),
    
    tabItems(
      # HOME TAB - Already Enhanced
      tabItem(tabName = "home",
              fluidRow(
                column(12,
                       div(class = "jumbotron", style = "background-color: #f8f9fa; padding: 2rem; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);",
                           h1("Probability & Statistics Project", style = "color: #2c3e50; font-weight: 700; margin-bottom: 20px;"),
                           h3("Interactive Analysis of Irrigation Data Across Pakistan", style = "color: #3498db; font-weight: 400; margin-bottom: 20px;"),
                           p("Use the sidebar navigation to explore different visualizations and analyses.", style = "font-size: 16px; line-height: 1.6;")
                       )
                )
              ),
              
              fluidRow(
                column(12,
                       div(class = "team-box", style = "background-color: white; padding: 20px; border-radius: 8px; margin-top: 20px; box-shadow: 0 2px 5px rgba(0,0,0,0.1);",
                           h3("Project Team", style = "color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px;"),
                           
                           div(style = "display: flex; margin-top: 15px;",
                               div(style = "flex: 1;",
                                   h4("Presented By:", style = "color: #3498db; font-weight: 600;"),
                                   tags$div(style = "padding: 10px 0;",
                                            tags$p(tags$b("Tooba Nadeem"), style = "margin: 5px 0; font-size: 15px;"),
                                            tags$p("Roll No. 23L-2550", style = "margin: 5px 0; color: #7f8c8d; font-size: 14px;"),
                                            tags$br(),
                                            tags$p(tags$b("Abdullah Habib"), style = "margin: 5px 0; font-size: 15px;"),
                                            tags$p("Roll No. 23F-3061", style = "margin: 5px 0; color: #7f8c8d; font-size: 14px;")
                                   )
                               ),
                               div(style = "flex: 1;",
                                   h4("Course Details:", style = "color: #3498db; font-weight: 600;"),
                                   tags$div(style = "padding: 10px 0;",
                                            tags$p("Section: BS(SE)-4A", style = "margin: 5px 0; font-size: 15px;"),
                                            tags$p("Subject: MT2005 Probability and Statistics", style = "margin: 5px 0; font-size: 15px;"),
                                            tags$br(),
                                            h4("Presented To:", style = "color: #3498db; font-weight: 600; margin-top: 5px;"),
                                            tags$p(tags$b("Dr. Haris Khurram"), style = "margin: 5px 0; font-size: 15px;")
                                   )
                               )
                           )
                       )
                )
              ),
              
              fluidRow(
                column(12,
                       div(style = "background-color: white; padding: 20px; border-radius: 8px; margin-top: 20px; box-shadow: 0 2px 5px rgba(0,0,0,0.1);",
                           h3("Getting Started", style = "color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px;"),
                           div(style = "display: flex; justify-content: space-around; flex-wrap: wrap; margin-top: 15px;",
                               div(class = "feature-box", style = "text-align: center; padding: 15px; width: 180px;",
                                   icon("chart-line", style = "font-size: 40px; color: #3498db;"),
                                   h4("Histograms", style = "margin-top: 15px;"),
                                   p("Visualise shape of the data", style = "color: #7f8c8d;")
                               ),
                               div(class = "feature-box", style = "text-align: center; padding: 15px; width: 180px;",
                                   icon("chart-bar", style = "font-size: 40px; color: #3498db;"),
                                   h4("Bar Charts", style = "margin-top: 15px;"),
                                   p("Compare categorical data", style = "color: #7f8c8d;")
                               ),
                               div(class = "feature-box", style = "text-align: center; padding: 15px; width: 180px;",
                                   icon("chart-pie", style = "font-size: 40px; color: #3498db;"),
                                   h4("Pie Charts", style = "margin-top: 15px;"),
                                   p("Visualize proportions", style = "color: #7f8c8d;")
                               ),
                               div(class = "feature-box", style = "text-align: center; padding: 15px; width: 180px;",
                                   icon("box", style = "font-size: 40px; color: #3498db;"),
                                   h4("Boxplots", style = "margin-top: 15px;"),
                                   p("Show data distribution", style = "color: #7f8c8d;")
                               ),
                               div(class = "feature-box", style = "text-align: center; padding: 15px; width: 180px;",
                                   icon("code-branch", style = "font-size: 40px; color: #3498db;"),
                                   h4("Regression", style = "margin-top: 15px;"),
                                   p("Analyze relationships", style = "color: #7f8c8d;")
                               )
                           )
                       )
                )
              )
      ),
      
      # DATA TABLE TAB - Enhanced
      tabItem(tabName = "datatable",
              fluidRow(
                column(12,
                       div(class = "custom-box",
                           h2("Irrigation Data Table", class = "section-header"),
                           p(HTML(
                             "This table presents the complete dataset used for our irrigation analysis across Pakistan. 
                       You can search, filter, and sort the data to explore patterns and relationships. 
                       <br><br>
                       <a href='https://www.pbs.gov.pk/sites/default/files/tables/agriculture_statistics/new/Area_Irrigated_by_Different_Sources.pdf' 
                          target='_blank'>Click here to view the original data source (PBS Pakistan)</a>."
                           ), class = "feature-description"),
                           div(class = "viz-panel",
                               DT::dataTableOutput("main_data_table")
                           )
                       )
                )
              )
      ),
      
      # HISTOGRAM BY SOURCE TAB - Enhanced
      tabItem(tabName = "hist_source",
              fluidRow(
                column(12,
                       div(class = "custom-box",
                           h2("Histogram Analysis by Water Source", class = "section-header"),
                           p("Explore the distribution of irrigation data for different water sources across Pakistan.", 
                             class = "feature-description")
                       )
                )
              ),
              fluidRow(
                column(4,
                       div(class = "control-panel",
                           h4("Control Panel", style = "color: #3498db; margin-bottom: 15px;"),
                           selectInput("hist_source_choice", "Choose Source:",
                                       choices = c("Canals", "Tubewells", "Wells", "Canal Tubewells", "Canal Wells", "Others")
                           ),
                           tags$div(
                             tags$p(icon("info-circle"), style = "color: #3498db; display: inline;",
                                    " Histograms show the frequency distribution of irrigated area values for the selected water source.",
                                    style = "font-style: italic; color: #7f8c8d; margin-top: 15px;")
                           )
                       )
                ),
                column(8,
                       div(class = "viz-panel",
                           plotOutput("hist_source_plot")
                       )
                )
              )
      ),
      
      # HISTOGRAM BY PROVINCE TAB - Enhanced
      tabItem(tabName = "hist_province",
              fluidRow(
                column(12,
                       div(class = "custom-box",
                           h2("Histogram Analysis by Province", class = "section-header"),
                           p("Explore the distribution of irrigation data for different provinces of Pakistan.",
                             class = "feature-description")
                       )
                )
              ),
              fluidRow(
                column(4,
                       div(class = "control-panel",
                           h4("Control Panel", style = "color: #3498db; margin-bottom: 15px;"),
                           selectInput("hist_province_choice", "Choose Province:",
                                       choices = c("Punjab", "Sindh", "KPK", "Balochistan")
                           ),
                           tags$div(
                             tags$p(icon("info-circle"), style = "color: #3498db; display: inline;",
                                    " Histograms show the frequency distribution of irrigated area values for the selected province.",
                                    style = "font-style: italic; color: #7f8c8d; margin-top: 15px;")
                           )
                       )
                ),
                column(8,
                       div(class = "viz-panel",
                           plotOutput("hist_province_plot")
                       )
                )
              )
      ),
      
      # BAR CHARTS TAB - Enhanced
      tabItem(tabName = "barcharts",
              fluidRow(
                column(12,
                       div(class = "custom-box",
                           h2("Bar Chart Analysis", class = "section-header"),
                           p("Compare irrigation methods across different regions using interactive bar charts.",
                             class = "feature-description")
                       )
                )
              ),
              fluidRow(
                column(4,
                       div(class = "control-panel",
                           h4("Control Panel", style = "color: #3498db; margin-bottom: 15px;"),
                           selectInput("barchart_choice", "Choose Bar Chart:",
                                       choices = c(
                                         "All Provinces" = "all_provinces",
                                         "Punjab" = "punjab",
                                         "Sindh" = "sindh",
                                         "Khyber PakhtunKhwa" = "khyber_pakhtunKhwa",
                                         "Balochistan" = "balochistan"
                                       )
                           ),
                           tags$div(
                             tags$p(icon("info-circle"), style = "color: #3498db; display: inline;",
                                    " Bar charts help visualize and compare categorical data across different irrigation sources.",
                                    style = "font-style: italic; color: #7f8c8d; margin-top: 15px;")
                           )
                       )
                ),
                column(8,
                       div(class = "viz-panel",
                           plotOutput("barchart_plot")
                       )
                )
              )
      ),
      
      # BOXPLOTS TAB - Enhanced
      tabItem(tabName = "boxplots",
              fluidRow(
                column(12,
                       div(class = "custom-box",
                           h2("Boxplot Visualizations", class = "section-header"),
                           p("Explore the distribution, median, quartiles, and potential outliers in the irrigation data.",
                             class = "feature-description")
                       )
                )
              ),
              fluidRow(
                column(4,
                       div(class = "control-panel",
                           h4("Control Panel", style = "color: #3498db; margin-bottom: 15px;"),
                           selectInput("boxplot_choice", "Choose Province:",
                                       choices = c(
                                         "All Provinces" = "all_provinces",
                                         "Punjab" = "punjab",
                                         "Sindh" = "sindh",
                                         "Khyber Pakhtunkhwa" = "kpk",
                                         "Balochistan" = "balochistan"
                                       )
                           ),
                           tags$div(
                             tags$p(icon("info-circle"), style = "color: #3498db; display: inline;",
                                    " Boxplots show median, quartiles, and potential outliers in the data distribution.",
                                    style = "font-style: italic; color: #7f8c8d; margin-top: 15px;")
                           )
                       )
                ),
                column(8,
                       div(class = "viz-panel",
                           plotOutput("boxplot_output", height = "600px")
                       )
                )
              )
      ),
      
      # PIE CHARTS TAB - Enhanced
      tabItem(tabName = "piecharts",
              fluidRow(
                column(12,
                       div(class = "custom-box",
                           h2("3D Pie Chart Visualizations", class = "section-header"),
                           p("View the proportional distribution of irrigation sources using interactive 3D pie charts.",
                             class = "feature-description")
                       )
                )
              ),
              fluidRow(
                column(4,
                       div(class = "control-panel",
                           h4("Control Panel", style = "color: #3498db; margin-bottom: 15px;"),
                           selectInput("pie_choice", "Choose Pie Chart:",
                                       choices = c(
                                         "All Provinces" = "all_provinces",
                                         "Punjab" = "punjab",
                                         "Sindh" = "sindh",
                                         "Khyber PakhtunKhwa" = "kpk",
                                         "Balochistan" = "balochistan"
                                       )
                           ),
                           tags$div(
                             tags$p(icon("info-circle"), style = "color: #3498db; display: inline;",
                                    " Pie charts help visualize the proportional contribution of different irrigation sources.",
                                    style = "font-style: italic; color: #7f8c8d; margin-top: 15px;")
                           )
                       )
                ),
                column(8,
                       div(class = "viz-panel",
                           plotOutput("pie3d_chart", height = "600px")
                       )
                )
              )
      ),
      
      # COMPONENT BAR CHART TAB - Enhanced
      tabItem(tabName = "compbar",
              fluidRow(
                column(12,
                       div(class = "custom-box",
                           h2("Component Bar Chart Analysis", class = "section-header"),
                           p("Analyze irrigation sources by province using stacked bar visualization.",
                             class = "feature-description")
                       )
                )
              ),
              fluidRow(
                column(12,
                       div(class = "viz-panel",
                           tags$div(style = "margin-bottom: 15px;",
                                    span("What is a Component Bar Chart?", class = "info-tag"),
                                    span("A stacked bar chart showing how different sources contribute to the total irrigation in each province", 
                                         style = "color: #7f8c8d;")
                           ),
                           plotOutput("compBarPlot")
                       )
                )
              )
      ),
      
      # MULTIPLE BAR CHARTS TAB - Enhanced
      tabItem(tabName = "multibar",
              fluidRow(
                column(12,
                       div(class = "custom-box",
                           h2("Multiple Bar Chart Analysis", class = "section-header"),
                           p("Compare irrigation data using different bar chart configurations.",
                             class = "feature-description")
                       )
                )
              ),
              fluidRow(
                column(4,
                       div(class = "control-panel",
                           h4("Control Panel", style = "color: #3498db; margin-bottom: 15px;"),
                           selectInput("multibar_choice", "Choose Bar Chart Type:",
                                       choices = c(
                                         "By Province" = "by_province",
                                         "By Irrigation Source" = "by_source"
                                       )
                           ),
                           tags$div(
                             tags$p(icon("info-circle"), style = "color: #3498db; display: inline;",
                                    " Multiple bar charts allow for flexible comparison across different categories.",
                                    style = "font-style: italic; color: #7f8c8d; margin-top: 15px;")
                           )
                       )
                ),
                column(8,
                       div(class = "viz-panel",
                           plotOutput("multiBarPlot")
                       )
                )
              )
      ),
      
      # LINEAR REGRESSION TAB - Enhanced
      tabItem(tabName = "linear_regression",
              fluidRow(
                column(12,
                       div(class = "custom-box",
                           h2("Linear Regression Analysis", class = "section-header"),
                           p("Analyze relationships and trends in irrigation data using linear regression models.",
                             class = "feature-description")
                       )
                )
              ),
              fluidRow(
                column(4,
                       div(class = "control-panel",
                           h4("Analysis Options", style = "color: #3498db; margin-bottom: 15px;"),
                           selectInput("linear_reg_choice", "Choose Analysis:",
                                       choices = c(
                                         "Time Trend - National" = "time_national",
                                         "Time Trend - Provincial" = "time_provincial",
                                         "Cross-Source Relationship" = "cross_source",
                                         "Canal Usage Over Time" = "canal_usage"
                                       )
                           ),
                           conditionalPanel(
                             condition = "input.linear_reg_choice == 'time_provincial' || input.linear_reg_choice == 'canal_usage'",
                             selectInput("linear_province", "Choose Province:",
                                         choices = c("Punjab", "Sindh", "KPK", "Balochistan")
                             )
                           ),
                           tags$div(
                             tags$p(icon("info-circle"), style = "color: #3498db; display: inline;",
                                    " Linear regression helps identify relationships between variables and predict future trends.",
                                    style = "font-style: italic; color: #7f8c8d; margin-top: 15px;")
                           )
                       )
                ),
                column(8,
                       div(class = "viz-panel",
                           plotOutput("linear_regression_plot", height = "500px"),
                           div(style = "margin-top: 20px; background-color: #f8f9fa; padding: 15px; border-radius: 5px;",
                               h4("Regression Results", style = "color: #2c3e50; margin-bottom: 10px;"),
                               tableOutput("linear_regression_prediction")
                           )
                       )
                )
              )
      ),
      
      # MULTIPLE REGRESSION TAB - Enhanced
      tabItem(tabName = "multiple_regression",
              fluidRow(
                column(12,
                       div(class = "custom-box",
                           h2("Multiple Regression Analysis", class = "section-header"),
                           p("Explore complex relationships between multiple variables in the irrigation data.",
                             class = "feature-description")
                       )
                )
              ),
              fluidRow(
                column(12,
                       div(class = "viz-panel",
                           div(style = "margin-bottom: 15px;",
                               span("Advanced Analysis", class = "info-tag"),
                               span("Multiple regression examines how several independent variables affect a dependent variable simultaneously", 
                                    style = "color: #7f8c8d;")
                           ),
                           plotOutput("multiple_regression_plot", height = "500px"),
                           div(style = "margin-top: 20px; background-color: #f8f9fa; padding: 15px; border-radius: 5px;",
                               h4("Regression Summary", style = "color: #2c3e50; margin-bottom: 10px;"),
                               tableOutput("multiple_regression_summary")
                           )
                       )
                )
              )
      ),
      tabItem(tabName = "normaldist",
              fluidRow(
                column(4,
                       div(class = "control-panel",
                           h4("Choose Variable", style = "color: #3498db; margin-bottom: 15px;"),
                           selectInput("norm_var", "Variable:",
                                       choices = c("Total", "Canals", "Tubewells", "Wells", "Canal Tubewells", "Canal Wells", "Others")
                           ),
                           tags$p(icon("info-circle"), style = "color: #3498db; display: inline;",
                                  " Visualize normality for each variable: histogram, normal curve, Q-Q plot, and Shapiro-Wilk test."
                           )
                       )
                ),
                column(8,
                       div(class = "viz-panel",
                           plotOutput("norm_hist"),
                           plotOutput("norm_qq"),
                           verbatimTextOutput("norm_shapiro")
                       )
                )
              )
      ),
      # CONCLUSION TAB - Already Enhanced
      tabItem(tabName = "conclusion",
              fluidRow(
                column(12,
                       div(class = "conclusion-header", style = "background-color: #f8f9fa; padding: 20px; border-radius: 10px; box-shadow: 0 2px 6px rgba(0,0,0,0.1); margin-bottom: 25px;",
                           h2("Conclusion", style = "color: #2c3e50; font-weight: 700; text-align: center;"),
                           h4("Summary, Learnings, and Final Remarks", style = "color: #3498db; text-align: center; font-weight: 400; margin-top: 10px;")
                       )
                )
              ),
              
              fluidRow(
                column(6,
                       div(class = "insight-box", style = "background-color: white; border-left: 4px solid #3498db; padding: 20px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); height: 100%;",
                           h3("Key Insights", style = "color: #2c3e50; border-bottom: 1px solid #eee; padding-bottom: 10px;"),
                           tags$ul(style = "padding-left: 20px; line-height: 1.8;",
                                   tags$li(tags$strong("Regional Distribution:"), " Punjab has the highest irrigated area among all provinces, indicating its agricultural significance.", style = "margin-bottom: 12px;"),
                                   tags$li(tags$strong("Irrigation Sources:"), " Tubewells and canals are the most significant sources of irrigation across Pakistan.", style = "margin-bottom: 12px;"),
                                   tags$li(tags$strong("Temporal Trends:"), " Multiple regression analysis shows a strong relationship between year and irrigated area, suggesting changing agricultural patterns over time.", style = "margin-bottom: 12px;")
                           )
                       )
                ),
                
                column(6,
                       div(class = "learning-box", style = "background-color: white; border-left: 4px solid #e74c3c; padding: 20px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); height: 100%;",
                           h3("Learnings", style = "color: #2c3e50; border-bottom: 1px solid #eee; padding-bottom: 10px;"),
                           p("This project enhanced our understanding of:", style = "margin-bottom: 15px;"),
                           tags$div(style = "display: flex; flex-wrap: wrap;",
                                    tags$div(style = "width: 50%; padding: 5px;",
                                             tags$div(style = "display: flex; align-items: center;",
                                                      icon("chart-bar", style = "color: #e74c3c; margin-right: 10px;"),
                                                      "Data visualization techniques"
                                             )
                                    ),
                                    tags$div(style = "width: 50%; padding: 5px;",
                                             tags$div(style = "display: flex; align-items: center;",
                                                      icon("table", style = "color: #e74c3c; margin-right: 10px;"),
                                                      "Statistical analysis"
                                             )
                                    ),
                                    tags$div(style = "width: 50%; padding: 5px;",
                                             tags$div(style = "display: flex; align-items: center;",
                                                      icon("code", style = "color: #e74c3c; margin-right: 10px;"),
                                                      "R programming skills"
                                             )
                                    ),
                                    tags$div(style = "width: 50%; padding: 5px;",
                                             tags$div(style = "display: flex; align-items: center;",
                                                      icon("calculator", style = "color: #e74c3c; margin-right: 10px;"),
                                                      "Statistical modeling"
                                             )
                                    )
                           )
                       )
                )
              ),
              
              fluidRow(
                column(12,
                       div(style = "background-color: white; padding: 20px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); margin-top: 25px; text-align: center;",
                           h3("Final Remarks", style = "color: #2c3e50; margin-bottom: 15px;"),
                           p("The analysis of irrigation patterns across Pakistan's provinces reveals significant insights into agricultural practices and resource distribution. Our findings suggest several opportunities for optimizing water resource management and improving agricultural productivity.", 
                             style = "font-size: 16px; line-height: 1.6; margin-bottom: 20px; text-align: left;"),
                           p("Future research could explore seasonal variations in irrigation patterns and the impact of climate change on water resource availability.",
                             style = "font-size: 16px; line-height: 1.6; margin-bottom: 30px; text-align: left;"),
                           div(class = "thank-you", style = "background-color: #f8f9fa; padding: 20px; border-radius: 5px; margin-top: 10px;",
                               h4("Thank you for exploring our project!", style = "color: #3498db; margin-bottom: 5px;"),
                               p("We hope the insights from this analysis contribute to a better understanding of Pakistan's irrigation systems.",
                                 style = "font-style: italic; margin-bottom: 0;")
                           )
                       )
                )
              )
      )
    )
  )
)

server <- function(input, output) {
  output$main_data_table <- DT::renderDataTable({
    DT::datatable(all_data_long,
                  options = list(pageLength = 15, scrollX = TRUE),
                  rownames = FALSE)
  })
  
  # Histogram 
  output$hist_source_plot <- renderPlot({
    # Get selected source
    source_choice <- input$hist_source_choice
    
    # Data and parameters for each source
    source_data <- switch(source_choice,
                          "Canals" = list(data = c(5.96, 5.89, 6, 5.65, 6.03, 5.77, 5.88),
                                          main = "Histogram of Canals",
                                          xlab = "Area (million hectares)",
                                          col = "steelblue"),
                          "Tubewells" = list(data = c(3.60, 3.62, 3.60, 3.76, 4.06, 4.07, 4.02),
                                             main = "Histogram of Tubewells",
                                             xlab = "Area (million hectares)",
                                             col = "steelblue"),
                          "Wells" = list(data = c(0.35, 0.40, 0.44, 0.32, 0.27, 0.42, 0.26),
                                         main = "Histogram of Wells",
                                         xlab = "Area (million hectares)",
                                         col = "steelblue"),
                          "Canal Tubewells" = list(data = c(8.15, 7.85, 8.15, 8.19, 8.47, 8.71, 8.71),
                                                   main = "Histogram of Canal Tubewells",
                                                   xlab = "Area (million hectares)",
                                                   col = "steelblue"),
                          "Canal Wells" = list(data = c(0.28, 0.29, 0.27, 0.27, 0.24, 0.23, 0.23),
                                               main = "Histogram of Canal Wells",
                                               xlab = "Area (million hectares)",
                                               col = "steelblue"),
                          "Others" = list(data = c(0.26, 0.17, 0.17, 0.15, 0.25, 0.27, 0.32),
                                          main = "Histogram of Others",
                                          xlab = "Area (million hectares)",
                                          col = "steelblue")
    )
    
    # Create the histogram
    hist(source_data$data,
         col = source_data$col,
         main = source_data$main,
         xlab = source_data$xlab,
         ylab = "Frequency",
         border = "white",
         breaks = 5
    )
  })
  
  # Histogram by Province
  output$hist_province_plot <- renderPlot({
    # Get selected province
    province_choice <- input$hist_province_choice
    
    # Data and parameters for each province
    province_data <- switch(province_choice,
                            "Punjab" = list(data = c(14.86, 14.48, 14.89, 14.73, 15.47, 15.61, 15.61),
                                            main = "Histogram of Total Irrigated Area in Punjab",
                                            xlab = "Area (million hectares)",
                                            col = "steelblue"),
                            "Sindh" = list(data = c(1.69, 1.66, 1.69, 1.65, 1.65, 1.63, 1.66),
                                           main = "Histogram of Total Irrigated Area in Sindh",
                                           xlab = "Area (million hectares)",
                                           col = "steelblue"),
                            "KPK" = list(data = c(0.94, 0.95, 0.95, 0.94, 0.94, 1.03, 0.97),
                                         main = "Histogram of Total Irrigated Area in KPK",
                                         xlab = "Area (million hectares)",
                                         col = "steelblue"),
                            "Balochistan" = list(data = c(1.11, 1.10, 1.10, 1.01, 1.28, 1.20, 1.18),
                                                 main = "Histogram of Total Irrigated Area in Balochistan",
                                                 xlab = "Area (million hectares)",
                                                 col = "steelblue")
    )
    
    # Create the histogram
    hist(province_data$data,
         col = province_data$col,
         main = province_data$main,
         xlab = province_data$xlab,
         ylab = "Frequency",
         border = "black",
         breaks = 5
    )
  })
  
  output$barchart_plot <- renderPlot({
    # Make sure RColorBrewer is available
    library(RColorBrewer)
    
    # Set colors
    colors <- brewer.pal(n = 8, name = "Set2")  # Adjusted the number of colors
    
    # Switch statement to determine which bar chart to display
    switch(input$barchart_choice,
           "all_provinces" = {
             # Bar chart for all provinces
             provinces <- c("Punjab", "Sindh", "Khyber PakhtunKhwa", "Balochistan")
             total_per_province <- c(15.61, 1.66, 0.97, 1.18)
             bp <- barplot(total_per_province,
                           names.arg = provinces,
                           col = colors[1:4], # Ensure we use the first 4 colors
                           main = "Total Irrigated Area in Each Province (2021-22)",
                           ylab = "Area (million hectares)",
                           ylim = c(0, max(total_per_province) * 1.2))
             
             text(x = bp, 
                  y = total_per_province,
                  label = total_per_province, 
                  pos = 3,
                  cex = 0.8,
                  col = "black")
           },
           "punjab" = {# Bar chart for Punjab
             sources <- c("Canals", "Tubewells", "Wells", "Canal Tube-Wells", "Canal Wells", "Others")
             total_per_source <- c(3.27, 3.09, 0.18, 8.71, 0.23, 0.13)
             
             bp <- barplot(total_per_source,
                           names.arg = sources,
                           col = colors[1:6],  # Ensure we use the first 6 colors
                           main = "Irrigated Area by Source in Punjab (2021-22)",
                           ylab = "Area (million hectares)",
                           ylim = c(0, max(total_per_source) * 1.2))
             
             text(x = bp, 
                  y = total_per_source,
                  label = total_per_source, 
                  pos = 3,
                  cex = 0.8,col = "black")
           },
           "sindh" = {
             sources <- c("Canals", "Tubewells", "Wells", "Canal Tube-Wells", "Canal Wells", "Others")
             total_per_source <- c(1.30, 0.36, 0.00, 0.00, 0.00, 0.00)
             
             # Filter out zero values and their corresponding sources
             nonzero_idx <- total_per_source != 0
             sources_nz <- sources[nonzero_idx]
             values_nz <- total_per_source[nonzero_idx]
             
             bp <- barplot(values_nz,
                           names.arg = sources_nz,
                           col = colors[1:length(values_nz)],
                           main = "Irrigated Area by Source in Sindh (2021-22)",
                           ylab = "Area (million hectares)",
                           ylim = c(0, max(values_nz) * 1.2))
             
             text(x = bp,
                  y = values_nz,
                  label = values_nz,
                  pos = 3,
                  cex = 0.8,
                  col = "black")
           },
           "khyber_pakhtunKhwa" = {
             sources <- c("Canals", "Tubewells", "Wells", "Canal Tube-Wells", "Canal Wells", "Others")
             total_per_source <- c(0.74, 0.10, 0.04, 0.00, 0.00, 0.09)
             
             nonzero_idx <- total_per_source != 0
             sources_nz <- sources[nonzero_idx]
             values_nz <- total_per_source[nonzero_idx]
             
             bp <- barplot(values_nz,
                           names.arg = sources_nz,
                           col = colors[1:length(values_nz)],
                           main = "Irrigated Area by Source in Khyber PakhtunKhwa (2021-22)",
                           ylab = "Area (million hectares)",
                           ylim = c(0, max(values_nz) * 1.2))
             
             text(x = bp,
                  y = values_nz,
                  label = values_nz,
                  pos = 3,
                  cex = 0.8,
                  col = "black")
           },
           "balochistan" = {
             sources <- c("Canals", "Tubewells", "Wells", "Canal Tube-Wells", "Canal Wells", "Others")
             total_per_source <- c(0.57, 0.47, 0.04, 0.00, 0.00, 0.10)
             
             nonzero_idx <- total_per_source != 0
             sources_nz <- sources[nonzero_idx]
             values_nz <- total_per_source[nonzero_idx]
             
             bp <- barplot(values_nz,
                           names.arg = sources_nz,
                           col = colors[1:length(values_nz)],
                           main = "Irrigated Area by Source in Balochistan (2021-22)",
                           ylab = "Area (million hectares)",
                           ylim = c(0, max(values_nz) * 1.2))
             
             text(x = bp,
                  y = values_nz,
                  label = values_nz,
                  pos = 3,
                  cex = 0.8,
                  col = "black")
           }
    )
  })
  
  # Boxplot
  library(ggplot2)
  
  output$boxplot_output <- renderPlot({
    choice <- input$boxplot_choice
    
    # Define years vector once
    years <- c("2015-16", "2016-17", "2017-18", "2018-19", "2019-20", "2020-21", "2021-22")
    
    # Prepare data frames for each province
    df_punjab <- data.frame(Year = years,
                            Area = c(14.86, 14.48, 14.89, 14.73, 15.47, 15.61, 15.61))
    
    df_sindh <- data.frame(Year = years,
                           Area = c(1.69, 1.69, 1.69, 1.65, 1.65, 1.63, 1.66))
    
    df_kpk <- data.frame(Year = years,
                         Area = c(0.95, 0.95, 0.95, 0.94, 0.94, 1.03, 0.97))
    
    df_balochistan <- data.frame(Year = years,
                                 Area = c(1.10, 1.10, 1.10, 1.01, 1.28, 1.20, 1.18))
    
    # Plot based on choice
    if (choice == "punjab") {
      ggplot(df_punjab, aes(x = "Punjab", y = Area)) +
        geom_boxplot(
          fill = "skyblue",
          outlier.colour = "red",
          outlier.shape = 8,      # Star shape
          outlier.size = 3
        ) +
        theme_bw() +
        labs(
          title = "Distribution of Irrigated Area in Punjab (2015–2022)",
          x = "",
          y = "Area (million hectares)"
        )
      
    } else if (choice == "sindh") {
      ggplot(df_sindh, aes(x = "Sindh", y = Area)) +
        geom_boxplot(
          fill = "skyblue",
          outlier.colour = "red",
          outlier.shape = 8,
          outlier.size = 3
        ) +
        theme_bw() +
        labs(
          title = "Distribution of Irrigated Area in Sindh (2015–2022)",
          x = "",
          y = "Area (million hectares)"
        )
      
    } else if (choice == "kpk") {
      ggplot(df_kpk, aes(x = "Khyber Pakhtunkhwa", y = Area)) +
        geom_boxplot(
          fill = "skyblue",
          outlier.colour = "red",
          outlier.shape = 8,
          outlier.size = 3
        ) +
        theme_bw() +
        labs(
          title = "Distribution of Irrigated Area in Khyber Pakhtunkhwa (2015–2022)",
          x = "",
          y = "Area (million hectares)"
        )
      
    } else if (choice == "balochistan") {
      ggplot(df_balochistan, aes(x = "Balochistan", y = Area)) +
        geom_boxplot(
          fill = "skyblue",
          outlier.colour = "red",
          outlier.shape = 8,
          outlier.size = 3
        ) +
        theme_bw() +
        labs(
          title = "Distribution of Irrigated Area in Balochistan (2015–2022)",
          x = "",
          y = "Area (million hectares)"
        )
      
    } else if (choice == "all_provinces") {
      # Optional combined boxplot for all provinces
      
      # Combine all data frames with a Province column
      df_all <- rbind(
        data.frame(Province = "Punjab", df_punjab),
        data.frame(Province = "Sindh", df_sindh),
        data.frame(Province = "Khyber Pakhtunkhwa", df_kpk),
        data.frame(Province = "Balochistan", df_balochistan)
      )
      
      ggplot(df_all, aes(x = Province, y = Area, fill = Province)) +
        geom_boxplot(outlier.colour = "red", outlier.shape = 8, outlier.size = 3) +
        scale_fill_brewer(palette = "Set2") +
        theme_bw() +
        labs(
          title = "Distribution of Irrigated Area by Province (2015–2022)",
          x = "Province",
          y = "Area (million hectares)"
        ) +
        theme(legend.position = "none")
    }
  })
  
  
  #piecharts
  output$pie3d_chart <- renderPlot({
    
    choice <- input$pie_choice
    
    if (choice == "all_provinces") {
      labels <- c("Punjab", "Sindh", "Khyber PakhtunKhwa", "Balochistan")
      values <- c(15.61, 1.66, 0.97, 1.18)
    } else if (choice == "punjab") {
      labels <- c("Canals", "Tubewells", "Wells", "Canal Tube-Wells", "Canal Wells", "Others")
      values <- c(3.27, 3.09, 0.18, 8.71, 0.23, 0.13)
    } else if (choice == "sindh") {
      labels <- c("Canals", "Tubewells")
      values <- c(1.30, 0.36)
    } else if (choice == "kpk") {
      labels <- c("Canals", "Tubewells", "Wells", "Others")
      values <- c(0.74, 0.10, 0.04, 0.09)
    } else if (choice == "balochistan") {
      labels <- c("Canals", "Tubewells", "Wells", "Others")
      values <- c(0.57, 0.47, 0.04, 0.10)
    }
    
    # Calculate percentages for labels
    percentages <- round(100 * values / sum(values), 2)
    labels_pct <- paste0(percentages, "%")
    
    
    
    par(mar = c(4, 4, 4, 4))  # Adjust margins if needed
    
    pie3D(values,
          labels = labels_pct,
          explode = 0.1,
          main = "Irrigated Area (million hectares)",
          col = colors,
          labelcex = 0.8,
          border = "black")
    # Set legend inset depending on province
    if (choice == "punjab") {
      legend("bottomleft", inset = c(0, -0.17), legend = labels, fill = colors, cex = 1, bty = "n", xpd = TRUE)
    } else {
      legend("bottomleft", inset = c(0, -0.17),legend = labels, fill = colors, cex = 1, bty = "n", xpd = TRUE)
    }
    #legend("topright", legend = labels, fill = colors, cex = 0.9, bty = "n")
    
  }, res = 120)  # Use res argument for better resolution on retina screens
  
  
  # Component Bar Chart
  output$compBarPlot <- renderPlot({
    # Define data
    provinces <- c("PUNJAB", "SINDH", "KPK", "BALOCHISTAN")
    components <- c("Canals","Tubewells","Wells","Canal-Tubewells","Canal-Wells","Others")
    
    # Data from image (area in million hectares)
    punjab <- c(3.27,3.09,0.18,8.71,0.23,0.13)
    sindh <- c(1.30,0.36,0.00,0.00,0.00,0.00)
    kpk <- c(0.74,0.10,0.04,0.00,0.00,0.09)
    balochistan <- c(0.57,0.47,0.04,0.00,0.00,0.10)
    # Create matrix
    irrigationMatrix <- rbind(punjab, sindh, kpk, balochistan)
    
    # Create component bar chart
    barplot(
      irrigationMatrix,
      beside = FALSE,  # FALSE for component bar chart
      names.arg = components,
      col = c("#8DD3C7", "#FFFFB3", "#BEBADA", "#FB8072"),
      xlab = "Irrigation Sources",
      ylab = "Area (million hectares)",
      main = "Irrigation by Province",
      legend.text = provinces,
      las = 1
    )
  })
  
  # Multiple Bar Charts
  output$multiBarPlot <- renderPlot({
    # Define data
    provinces <- c("PUNJAB", "SINDH", "KPK", "BALOCHISTAN")
    components <- c("Canals","Tubewells","Wells","Canal-Tubewells","Canal-Wells","Others")
    
    # Data from image (area in million hectares)
    punjab <- c(3.27,3.09,0.18,8.71,0.23,0.13)
    sindh <- c(1.30,0.36,0.00,0.00,0.00,0.00)
    kpk <- c(0.74,0.10,0.04,0.00,0.00,0.09)
    balochistan <- c(0.57,0.47,0.04,0.00,0.00,0.10)
    
    # Create matrix
    irrigationMatrix <- rbind(punjab, sindh, kpk, balochistan)
    if(input$multibar_choice == "by_province") {
      # Multiple bar chart by province
      barplot(
        irrigationMatrix,
        beside = TRUE,  # TRUE for multiple bar chart
        names.arg = components,
        col = c("#8DD3C7", "#FFFFB3", "#BEBADA", "#FB8072"),
        xlab = "Irrigation Sources",
        ylab = "Area (million hectares)",
        main = "Irrigation by Province",
        legend.text = provinces,
        las = 1
      )
    } else {# Multiple bar chart by irrigation source
      barplot(
        t(irrigationMatrix),
        beside = TRUE,
        names.arg = provinces,
        col = c("#8DD3C7", "#FFFFB3", "#BEBADA", "#FB8072","#FDB462","#B3DE69"),
        xlab = "Provinces",
        ylab = "Area (million hectares)",
        main = "Irrigation Sources",
        legend.text = components,
        las = 1
      )
    }
  })
  #Regression Analysis
  # Linear Regression Server Logic
  output$linear_regression_plot <- renderPlot({
    req(input$linear_reg_choice)
    
    years <- c(2015.5, 2016.5, 2017.5, 2018.5, 2019.5, 2020.5, 2021.5)
    prediction_year <- 2022.5
    
    if(input$linear_reg_choice == "time_national") {
      data <- data.frame(
        Year = years,
        Total_Irrigation = c(18.60, 18.22, 18.63, 18.33, 19.34, 19.47, 19.42)
      )
      model_linear <- lm(Total_Irrigation ~ Year, data = data)
      model_poly <- lm(Total_Irrigation ~ poly(Year, 2), data = data)
      pred_linear <- predict(model_linear, newdata = data.frame(Year = prediction_year))
      pred_poly <- predict(model_poly, newdata = data.frame(Year = prediction_year))
      
      data_pred <- rbind(data, data.frame(Year = prediction_year, Total_Irrigation = NA))
      
      ggplot(data_pred, aes(x = Year, y = Total_Irrigation)) +
        geom_point(data = data, size = 3, color = "darkblue") +
        geom_smooth(method = "lm", se = FALSE, color = "blue") +
        geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE, color = "red", linetype = "dashed") +
        geom_point(aes(x = prediction_year, y = pred_linear), color = "blue", size = 3, shape = 17) +
        geom_point(aes(x = prediction_year, y = pred_poly), color = "red", size = 3, shape = 17) +
        annotate("text", x = prediction_year, y = pred_linear + 0.1, label = paste("Linear:", round(pred_linear, 2)), hjust = -0.2, color = "blue") +
        annotate("text", x = prediction_year, y = pred_poly - 0.2, label = paste("Poly:", round(pred_poly, 2)), hjust = -0.2, color = "red") +
        labs(title = "Time Trend and Prediction of Total Irrigation Area (2015–2023)",
             x = "Year", y = "Total Irrigated Area (million hectares)") +
        scale_x_continuous(breaks = c(data$Year, prediction_year)) +
        theme_minimal()
      
    } else if(input$linear_reg_choice == "time_provincial") {
      province_data <- switch(input$linear_province,
                              "Punjab" = c(14.86,14.48,14.89,14.73,15.47,15.61,15.61),
                              "Sindh" = c(1.69,1.69,1.69,1.65,1.65,1.63,1.66),
                              "KPK" = c(0.95,0.95,0.95,0.94,0.94,1.03,0.97),
                              "Balochistan" = c(1.10,1.10,1.10,1.01,1.28,1.20,1.18)
      )
      data <- data.frame(Year = years, Total_Irrigation = province_data)
      
      ggplot(data, aes(x = Year, y = Total_Irrigation)) +
        geom_point(size = 3) +
        geom_smooth(method = "lm", se = FALSE, color = "blue") +
        geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE, color = "red", linetype = "dashed") +
        labs(title = paste(input$linear_province, "Irrigation Area Time Trend"),
             x = "Year", y = "Total Irrigated Area (million hectares)") +
        theme_minimal()
      
    } else if(input$linear_reg_choice == "cross_source") {
      data <- data.frame(
        Tubewells = c(3.60,3.62,3.60,3.76,4.06,4.07,4.02),
        Canals = c(5.56,5.53,5.62,5.33,5.70,5.39,5.52)
      )
      ggplot(data, aes(x = Tubewells, y = Canals)) +
        geom_point(size = 3) +
        geom_smooth(method = "lm", se = FALSE, color = "blue") +
        labs(title = "Tubewells vs Canal Irrigation Relationship",
             x = "Tubewell Area", y = "Canal Area")
      
    } else if(input$linear_reg_choice == "canal_usage") {
      canal_data <- switch(input$linear_province,
                           "Punjab" = c(3.35,3.31,3.4,3.17,3.31,3.27,3.27),
                           "Sindh" = c(1.33,1.33,1.33,1.29,1.29,1.16,1.30),
                           "KPK" = c(0.73,0.72,0.73,0.71,0.70,0.75,0.74),
                           "Balochistan" = c(0.55,0.53,0.54,0.48,0.73,0.59,0.57)
      )
      data <- data.frame(Year = years, Canal_Usage = canal_data)
      
      ggplot(data, aes(x = Year, y = Canal_Usage)) +
        geom_point(size = 3) +
        geom_smooth(method = "lm", se = FALSE, color = "blue") +
        labs(title = paste(input$linear_province, "Canal Usage Over Time"),
             x = "Year", y = "Canal Usage (million hectares)")
    }
  })
  
  output$linear_regression_prediction <- renderTable({
    years <- c(2015.5, 2016.5, 2017.5, 2018.5, 2019.5, 2020.5, 2021.5)
    prediction_year <- 2022.5
    
    # Default: National time trend
    data <- data.frame(
      Year = years,
      Total_Irrigation = c(18.60, 18.22, 18.63, 18.33, 19.34, 19.47, 19.42)
    )
    
    # If provincial, switch data
    if (input$linear_reg_choice == "time_provincial") {
      province_data <- switch(input$linear_province,
                              "Punjab" = c(14.86,14.48,14.89,14.73,15.47,15.61,15.61),
                              "Sindh" = c(1.69,1.69,1.69,1.65,1.65,1.63,1.66),
                              "KPK" = c(0.95,0.95,0.95,0.94,0.94,1.03,0.97),
                              "Balochistan" = c(1.10,1.10,1.10,1.01,1.28,1.20,1.18)
      )
      data <- data.frame(Year = years, Total_Irrigation = province_data)
    }
    
    model_linear <- lm(Total_Irrigation ~ Year, data = data)
    model_poly <- lm(Total_Irrigation ~ poly(Year, 2), data = data)
    
    pred_linear <- predict(model_linear, newdata = data.frame(Year = prediction_year))
    pred_poly <- predict(model_poly, newdata = data.frame(Year = prediction_year))
    
    data.frame(
      Model = c("Linear", "Polynomial (2nd degree)"),
      Prediction = c(round(pred_linear, 3), round(pred_poly, 3)),
      Year = prediction_year
    )
  })
  
  
  # Multiple Regression Server Logic
  output$multiple_regression_plot <- renderPlot({
    years <- c(2015.5, 2016.5, 2017.5, 2018.5, 2019.5, 2020.5, 2021.5)
    data <- data.frame(
      Year = rep(years, each = 4),
      Province = rep(c("Punjab", "Sindh", "KPK", "Balochistan"), times = length(years)),
      Total_Area = c(
        10.67, 5.90, 1.51, 0.52,
        10.49, 5.88, 1.48, 0.37,
        10.97, 5.89, 1.49, 0.28,
        10.74, 5.68, 1.49, 0.42,
        10.82, 6.29, 1.64, 0.59,
        10.87, 6.29, 1.68, 0.63,
        10.74, 6.38, 1.65, 0.65
      )
    )
    
    model <- lm(Total_Area ~ Year + Province, data = data)
    prediction_year <- 2022.5
    prediction_data <- expand.grid(
      Year = prediction_year,
      Province = unique(data$Province)
    )
    prediction_data$Predicted_Area <- predict(model, newdata = prediction_data)
    
    ggplot(data, aes(x = Year, y = Total_Area, color = Province)) +
      geom_point(size = 3) +
      geom_line(aes(group = Province), linetype = "dotted") +
      geom_point(data = prediction_data, aes(x = Year, y = Predicted_Area, color = Province), shape = 17, size = 4) +
      labs(title = "Multiple Regression: Total Area ~ Year + Province",
           x = "Year",
           y = "Total Irrigated Area (million hectares)") +
      theme_minimal()
  })
  output$multiple_regression_summary <- renderTable({
    years <- c(2015.5, 2016.5, 2017.5, 2018.5, 2019.5, 2020.5, 2021.5)
    data <- data.frame(
      Year = rep(years, each = 4),
      Province = rep(c("Punjab", "Sindh", "KPK", "Balochistan"), times = length(years)),
      Total_Area = c(
        10.67, 5.90, 1.51, 0.52,
        10.49, 5.88, 1.48, 0.37,
        10.97, 5.89, 1.49, 0.28,
        10.74, 5.68, 1.49, 0.42,
        10.82, 6.29, 1.64, 0.59,
        10.87, 6.29, 1.68, 0.63,
        10.74, 6.38, 1.65, 0.65
      )
    )
    model <- lm(Total_Area ~ Year + Province, data = data)
    broom::tidy(model)
  })
  observe({
    # Define the values for each variable
    norm_data <- list(
      "Total" = c(18.60, 18.22, 18.63, 18.33, 19.34, 19.47, 19.42),
      "Canals" = c(5.96, 5.89+0.36, 6, 5.65, 6.03, 5.77, 5.88),
      "Tubewells" = c(3.60, 3.62, 3.60, 3.76, 4.06, 4.07, 4.02),
      "Wells" = c(0.35, 0.40, 0.44, 0.29, 0.27, 0.42, 0.26),
      "Canal Tubewells" = c(8.15, 7.85, 8.15, 8.19, 8.47, 8.71, 8.71),
      "Canal Wells" = c(0.28, 0.29, 0.27, 0.27, 0.24, 0.23, 0.23),
      "Others" = c(0.26, 0.17, 0.17, 0.06, 0.25, 0.10, 0.13)
    )
    
    # Reactive: Get selected values
    norm_values <- reactive({
      req(input$norm_var)
      norm_data[[input$norm_var]]
    })
    
    # Histogram + Normal Curve
    output$norm_hist <- renderPlot({
      vals <- norm_values()
      hist(vals, probability = TRUE, main = paste("Histogram:", input$norm_var),
           xlab = input$norm_var, col = "lightblue", border = "white")
      curve(dnorm(x, mean=mean(vals), sd=sd(vals)), col="red", lwd=2, add=TRUE)
    })
    
    # Q-Q Plot
    output$norm_qq <- renderPlot({
      vals <- norm_values()
      qqnorm(vals, main = paste("Q-Q Plot:", input$norm_var))
      qqline(vals, col = "red", lwd = 2)
    })
    
    # Shapiro-Wilk Test
    output$norm_shapiro <- renderPrint({
      vals <- norm_values()
      shapiro.test(vals)
    })
  })
  
}

shinyApp(ui, server)
