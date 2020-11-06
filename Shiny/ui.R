#
# User-interface definition.
#

library(shiny)

shinyUI(
    navbarPage("Shiny Application",
               tabPanel("Analysis",
                        fluidPage(
                            titlePanel("The interdependence among the variables and miles per gallon (MPG)"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("#cylinders" = "cyl",
                                                  "Cubic inches displacements" = "disp",
                                                  "Net horsepower" = "hp",
                                                  "Ratio of rear axel" = "drat",
                                                  "Weight in 1000lbs" = "wt",
                                                  "Quarter mile time" = "qsec",
                                                  "Versus" = "vs",
                                                  "Transmission 0-automatic 1-manual" = "am",
                                                  "#Forward gears" = "gear",
                                                  "#carburetor" = "carb"
                                                )),
                                    
                                    checkboxInput("outliers", "Showing BoxPlot's outliers", FALSE)
                                ),
                                
                                mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                                tabPanel("Regression model", 
                                                         plotOutput("mpgPlot"),
                                                         verbatimTextOutput("fit")
                                                )
                                    )
                                )
                            )
                        )
               ),
               tabPanel("About the Data Set",
                        
                        h3("Coursera Regression Models Course Project"),
                        helpText("You work for Motor Trend, a magazine about the automobile industry Looking at a data set of a collection of cars, they are interested in exploring the relationship",
                                 "between a set of variables and miles per gallon (MPG) (outcome). They are particularly interested in the following two questions: Is an automatic or manual transmission better for MPG. Quantify the MPG difference between automatic and manual transmissions"),
                        h3("Important"),
                        p("A data frame with 32 observations on 11 variables."),
                        
                        a("https://class.coursera.org/regmods-008")
               ),
               tabPanel("More Data Detail",
                        h2("Motor Trend Car Road Tests"),
                        hr(),
                        h3("Description"),
                        helpText("The data was extrapolated from the 1974 Motor Trend US magazine,",
                                 " and consists of fuel consumption and all the other 10 aspects of automobile design and efficiency",
                                 " for 32 automobiles in the range (1973-74 models)."),
                        h3("Format"),
                        p("A data frame with 32 observations on 11 variables."),
                        
                        p("  1.   mpg    Miles/Gallon"),
                        p("  2.	 cyl	 #cylinders"),
                        p("  3.	 disp	 Displacement in cubic inches"),
                        p("  4.	 hp	 Net horsepower in HP"),
                        p("  5.	 drat	 Ratio of rear axle"),
                        p("  6.	 wt	 weight in 1000lbs"),
                        p("  7.	 qsec	 quarter mile time"),
                        p("  8.	 vs	 versus"),
                        p("  9.	 am	 Type of Transmission 0-automatic; 1-manual (0 = automatic, 1 = manual)"),
                        p("  10. gear	 #forward gears"),
                        p("  11. carb	 #carburetors"),
                        
                        h3("Source"),
                        
                        p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.")
               ),
               tabPanel("About",
                        hr(),
                        h4("I hope you like the Shiny App"),
                        h4("The name of the repository is Developing Data Products Week 4 Course Project")
               )
    )
)