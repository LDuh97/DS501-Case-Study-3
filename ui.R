library (tibble)
library(plotly)
library(shiny)
library(dplyr)

fluidPage(
  #Navigation Bar
  navbarPage("NFL Data and Betting",
             #Tab One
             tabPanel("App",
                      #Header Panel
                      titlePanel(title = h3("NFL Games and Betting Results and Trends For Games after Year 2000", align="center")),
                      titlePanel(title = h5("Created By Louis Duh", align="center")),
                      sidebarLayout(
                        #Sidebar Panel
                        sidebarPanel(
                          selectInput("Scenario", "Select a Scenario", Scenarios_Charts$Scenario, multiple=F, selected="Favored Team                            Wins")),
                        #Main Panel
                        mainPanel(
                          plotlyOutput("Pie_Chart"))
                      )
             ),
             #Tab Two
             tabPanel("About",
                      tags$div("This site provides insight into performance trends in different areas of NFL games and Betting",
                               tags$br(), " ", tags$br(),
                               "This site was created as a deliverable for a Case Study in the course DS 501 at Worcester                                        Polytechnic Institute"),
                      tags$br(), " ", tags$br(),
                      "Further information and instructions on how to use this application can be found in the tutorial tab",
                      tags$br(), " ", tags$br(),
                      "The data that I collected for use in this case study and application came from a data set on Kaggle.com. The data set was titled 'NFL scores and betting data'. This data set included information such as the date and season year of the game, in what week of the season it took place, the names of the home and away teams and their scores, betting data such as the spread and over/under line, and stadium and weather information. This data set contained all games going back to the 1966 season, however betting data didn't start until 1978.",
                      tags$br(), " ", tags$br(),
                      "This topic is interesting to me because I love almost anything to do with the sport of football. I have played football for 14 years and have been constantly surrounded by the game. Sunday afternoons have been focused around watching as many NFL games as possible for years. One of the most interesting parts of the games to me is tracking and analyzing statistics. This goes beyond player statistics. I am quite interested in how different factors impact a team's chances to win a football game and the amount of scoring in the game. I am also fascinated by the concept of oddsmaking and Betting. Athough not a gambling myself, I find the concept and decision making of what to bet on to be incredibly interesting. I believe it is extra interesting when data and trends between scenarios and conditions can be analyzed to help choose bets.",
                      tags$br(), " ", tags$br(),
                      "I analyzed the data in a couple of ways. The first step was to clean the data so that it was suitable for use for my purposes and the observations I wanted to make. To do this, I made a subset data frame that restricted the data to only games that happened in the year 2000 or after. I chose this year as the cutoff because that is about when the modern passing era of the NFL began so it would make the model more true to today's NFL. I had to add some columns to the data frame in order to make analysis easier at later steps. Some of these columns were: If Home Team Won, Total Points, and individual columsn for each stadium type. I then changed the team names of the home and away team columns to be the two or three letter IDs so that they would match up with the existing colum 'favorite team id'. The main way I analyzed the data was to create subsets of the data frame that reflected the conditions that needed to be met for a given scenario. I then divided the number of items in that specific subset by the number in the collective subset for that condition set. I created pie charts for every scenario and analysis I completed using plotly.",
                      tags$br(), " ", tags$br(),
                      "There were many observations that I made based on the trends found from testing scenarios. I will name a few of them here. One observation is that the over tends to hit more frequently in games where the weather is not clear (Rain, Snow, fog, etc.). This is the opposite of what I thought would be true because bad weather is usually associated with less productive offense. I think this shows that the oddsmakers often overcompensate for the bad weatehr when making the betting lines for that game. This causes the over to be hit more frequently with less points scored than usual. Another observation is that favorites tend to win more often in Weeks 9-17 of the season than they do in weeks 1-8 and in the postseason. This could be because after the halfway point of the season, enough about the teams is known to begin making more accurate odds. Another big observation I make from the data is that Favored teams cover the spread far less in clear weather than they do in inclement weather such as rain, fog, or snow. In clear weather, the favorite covers about 46% of the time, while for all types of inclement weather, the favorite covers a percentage in the 50s. This could indicate that better teams play better and handle bad weather better than bad teams.",
                      tags$br(), " ", tags$br(),
                      "Code for this app can be found at:",
                      tags$br(), " ", tags$br(),
                      "Author: Louis Duh,  WPI '21"
             ),
             #Tab Three
             tabPanel("Tutorial",
                      tags$div("This app allows you to explore performance trends for NFL game stats and betting information",
                               tags$br(), " ", tags$br(),
                               "How To Use:",
                               tags$br(),
                               "Use dropdown box to select the scenario you are interested in exploring. There are 34 options to choose from and range from a simple 'How often Favored team wins' to How often favored team covers the spread in a variety of different weather types.",
                               tags$br(), " ", tags$br(),
                               "Once you select the scenario you would like to consider, a pie chart will appear in the main panel of the screen that will show the frequency/likelihood of the scenario occurring versus not. The pie chart will include a legend that clearly identifies which color of the chart represents which outcome",
                               tags$br(), " ", tags$br(),
                               "Explore all of the different scenarios, especially the ones you would have never thought to consider. These trends and data can be used as a predictive betting model if you are looking to get into NFL betting. Alternatively, If you are looking to be the envy of your friends and be able to predict the various outcomes of NFL games and their betting lines, this app will work great for you.",
                               tags$br(), " ", tags$br(),
                               "Enjoy exploring the trends and please bet responsibly")
                      
             )))

