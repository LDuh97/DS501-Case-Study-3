#Library setup
library(dplyr)
library (tibble)
library(plotly)

#Import data file and Read
NFL_Data = read.csv("spreadspoke_scores.csv")
NFL_StadiumInfo = read.csv("nfl_stadiums.csv")
NFL_TeamInfo = read.csv("nfl_teams.csv")

#Create Column for total points in game
NFL_Data = NFL_Data %>% add_column(Total_Points = NFL_Data$score_home + NFL_Data$score_away, .after = "team_away")

#Create Column for margin of victory
NFL_Data = NFL_Data %>% 
  mutate(Victory_Margin = if_else(score_home>score_away,score_home-score_away,score_away-score_home))

#Limit to Data of seasons 2000 and later
NFL_Data_After2000 = subset(NFL_Data, schedule_season >= 2000)

#Replace Home Team column with Home Team ID 
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Arizona Cardinals"] = "ARI"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Atlanta Falcons"] = "ATL"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Baltimore Ravens"] = "BAL"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Buffalo Bills"] = "BUF"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Carolina Panthers"] = "CAR"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Chicago Bears"] = "CHI"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Cincinnati Bengals"] = "CIN"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Cleveland Browns"] = "CLE"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Dallas Cowboys"] = "DAL"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Denver Broncos"] = "DEN"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Detroit Lions"] = "DET"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Green Bay Packers"] = "GB"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Houston Texans"] = "HOU"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Indianapolis Colts"] = "IND"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Jacksonville Jaguars"] = "JAX"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Kansas City Chiefs"] = "KC"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Los Angeles Chargers"] = "LAC"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "San Diego Chargers"] = "LAC"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Los Angeles Rams"] = "LAR"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "St. Louis Rams"] = "LAR"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Miami Dolphins"] = "MIA"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Minnesota Vikings"] = "MIN"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "New England Patriots"] = "NE"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "New Orleans Saints"] = "NO"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "New York Giants"] = "NYG"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "New York Jets"] = "NYJ"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Las Vegas Raiders"] = "LVR"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Oakland Raiders"] = "LVR"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Philadelphia Eagles"] = "PHI"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Pittsburgh Steelers"] = "PIT"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Seattle Seahawks"] = "SEA"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "San Francisco 49ers"] = "SF"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Tampa Bay Buccaneers"] = "TB"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Tennessee Titans"] = "TEN"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Washington Redskins"] = "WAS"
NFL_Data_After2000$team_home[NFL_Data_After2000$team_home == "Washington Football Team"] = "WAS"

#Replace Away Team column with Away Team ID 
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Arizona Cardinals"] = "ARI"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Atlanta Falcons"] = "ATL"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Baltimore Ravens"] = "BAL"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Buffalo Bills"] = "BUF"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Carolina Panthers"] = "CAR"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Chicago Bears"] = "CHI"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Cincinnati Bengals"] = "CIN"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Cleveland Browns"] = "CLE"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Dallas Cowboys"] = "DAL"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Denver Broncos"] = "DEN"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Detroit Lions"] = "DET"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Green Bay Packers"] = "GB"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Houston Texans"] = "HOU"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Indianapolis Colts"] = "IND"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Jacksonville Jaguars"] = "JAX"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Kansas City Chiefs"] = "KC"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Los Angeles Chargers"] = "LAC"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "San Diego Chargers"] = "LAC"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Los Angeles Rams"] = "LAR"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "St. Louis Rams"] = "LAR"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Miami Dolphins"] = "MIA"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Minnesota Vikings"] = "MIN"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "New England Patriots"] = "NE"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "New Orleans Saints"] = "NO"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "New York Giants"] = "NYG"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "New York Jets"] = "NYJ"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Las Vegas Raiders"] = "LVR"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Oakland Raiders"] = "LVR"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Philadelphia Eagles"] = "PHI"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Pittsburgh Steelers"] = "PIT"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Seattle Seahawks"] = "SEA"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "San Francisco 49ers"] = "SF"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Tampa Bay Buccaneers"] = "TB"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Tennessee Titans"] = "TEN"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Washington Redskins"] = "WAS"
NFL_Data_After2000$team_away[NFL_Data_After2000$team_away == "Washington Football Team"] = "WAS"

#Create Column for if Home team won
NFL_Data_After2000 = NFL_Data_After2000 %>%
  mutate(Home_Team_Win = if_else(score_home>score_away,TRUE,FALSE))

#Create Column for Indoor Stadium or not
NFL_Data_After2000 = NFL_Data_After2000 %>%
  mutate(Indoor_Stadium = if_else(weather_detail == "DOME",TRUE,FALSE))

#Create Column for Indoor Stadium with roof open or not
NFL_Data_After2000 = NFL_Data_After2000 %>%
  mutate(Indoor_Stadium_Open = if_else(weather_detail == "DOME (Open Roof)",TRUE,FALSE))

#How Often Favored Team wins
HomeTeam_FavoritedandWin = subset(NFL_Data_After2000, team_home == team_favorite_id & Home_Team_Win)
AwayTeam_FavoritedandWin = subset(NFL_Data_After2000, team_away == team_favorite_id & !Home_Team_Win)
Favorite_Wins = rbind(HomeTeam_FavoritedandWin, AwayTeam_FavoritedandWin)
nrow(Favorite_Wins)/nrow(NFL_Data_After2000)

#Create pie chart showing frequency of Home team winning when favored
labels = c('Favorite Wins','Underdog Wins')
values = c(nrow(Favorite_Wins)/nrow(NFL_Data_After2000),
           1-nrow(Favorite_Wins)/nrow(NFL_Data_After2000))

FigX = plot_ly(type='pie', labels=labels, values=values, title= "Favorite Team Wins/Losses", 
               textinfo='label+percent',
               insidetextorientation='radial')
FigX

#How Often Home Team Wins when favored
HomeTeam_Favored = subset(NFL_Data_After2000, team_home == team_favorite_id)
nrow(HomeTeam_FavoritedandWin)/nrow(HomeTeam_Favored)

#How Often Away Team wins when favored
AwayTeam_Favored = subset(NFL_Data_After2000, team_away == team_favorite_id)
nrow(AwayTeam_FavoritedandWin)/nrow(AwayTeam_Favored)

#Create pie chart showing frequency of Home team winning when favored
labels = c('Favorite at Home Wins','Favorite at Home Loses')
values = c(nrow(HomeTeam_FavoritedandWin)/nrow(HomeTeam_Favored),
           1-nrow(HomeTeam_FavoritedandWin)/nrow(HomeTeam_Favored))

Fig1 = plot_ly(type='pie', labels=labels, values=values, title= "Home Favorite Wins/Losses", 
               textinfo='label+percent',
               insidetextorientation='radial')
Fig1

#Create pie chart showing frequency of Away team winning when favored
labels = c('Away Favorite Wins','Away Favorite Loses')
values = c(nrow(AwayTeam_FavoritedandWin)/nrow(AwayTeam_Favored),
           1-nrow(AwayTeam_FavoritedandWin)/nrow(AwayTeam_Favored))

Fig2 = plot_ly(type='pie', labels=labels, values=values, title= "Away Favorite Wins/Losses", 
               textinfo='label+percent',
               insidetextorientation='radial')
Fig2

#How often the spread is covered when favored team wins
HomeFavoriteWins_andCovers = subset(HomeTeam_FavoritedandWin, score_home - score_away > abs(spread_favorite))
AwayFavoriteWins_andCovers = subset(AwayTeam_FavoritedandWin, score_away - score_home > abs(spread_favorite))
FavoriteWins_andCovers = rbind(HomeFavoriteWins_andCovers, AwayFavoriteWins_andCovers)
nrow(FavoriteWins_andCovers)/nrow(Favorite_Wins)

#How often is spread covered by losing team
#Favorites losing could never cover spread, only consider favored team wins
HomeFavoriteWins_LoserCovers = subset(HomeTeam_FavoritedandWin, score_home - score_away < abs(spread_favorite))
AwayFavoriteWins_LoserCovers = subset(AwayTeam_FavoritedandWin, score_away - score_home < abs(spread_favorite))
FavoriteWins_LoserCovers = rbind(HomeFavoriteWins_LoserCovers, AwayFavoriteWins_LoserCovers)
nrow(FavoriteWins_LoserCovers)/nrow(Favorite_Wins)

#How often spread is a push (causes tie)
HomeFavoriteWins_Push = subset(HomeTeam_FavoritedandWin, score_home - score_away == abs(spread_favorite))
AwayFavoriteWins_Push = subset(AwayTeam_FavoritedandWin, score_away - score_home == abs(spread_favorite))
FavoriteWins_Push = rbind(HomeFavoriteWins_Push, AwayFavoriteWins_Push)
nrow(FavoriteWins_Push)/nrow(Favorite_Wins)

#Create Pie chart showing frequency of spread being covered in favored team win
labels = c('Favorite Covers','Loser Covers','Push')
values = c(nrow(FavoriteWins_andCovers)/nrow(Favorite_Wins),
           nrow(FavoriteWins_LoserCovers)/nrow(Favorite_Wins),
           nrow(FavoriteWins_Push)/nrow(Favorite_Wins))

Fig3 = plot_ly(type='pie', labels=labels, values=values, title= "Results with Spread when Favorite Wins",
               textinfo='label+percent',
               insidetextorientation='radial')
Fig3

#How often over is hit in games played in Dome
DomeGames = subset(NFL_Data_After2000, Indoor_Stadium == TRUE)
OverHit_Dome = subset(DomeGames, Total_Points > over_under_line)
nrow(OverHit_Dome)/nrow(DomeGames)

#Create Pie chart showing frequency of over being hit when game is played in a Dome
labels = c('Over Hit','Over not Hit')
values = c(nrow(OverHit_Dome)/nrow(DomeGames),
           1-nrow(OverHit_Dome)/nrow(DomeGames))

Fig4 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Over is Hit when Playing in Dome", 
               textinfo='label+percent',
               insidetextorientation='radial')
Fig4

#How often over is hit in games Played in Dome (Open Roof)
OpenRoofDome_Games = subset(NFL_Data_After2000, Indoor_Stadium_Open == TRUE)
OverHit_OpenRoofDome = subset(OpenRoofDome_Games, Total_Points > over_under_line)
nrow(OverHit_OpenRoofDome)/nrow(OpenRoofDome_Games)

#Create Pie chart showing frequency of over being hit when game is played in a Dome (Open Roof)
labels = c('Over Hit','Over not Hit')
values = c(nrow(OverHit_OpenRoofDome)/nrow(OpenRoofDome_Games),
           1-nrow(OverHit_OpenRoofDome)/nrow(OpenRoofDome_Games))

Fig5 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Over is Hit when Playing in Dome (Open Roof)",
               textinfo='label+percent',
               insidetextorientation='radial')
Fig5

#How often over is hit in games played outdoors
OutdoorGames = subset(NFL_Data_After2000, Indoor_Stadium == FALSE & Indoor_Stadium_Open == FALSE)
OverHit_Outdoor = subset(OutdoorGames, Total_Points > over_under_line)
nrow(OverHit_Outdoor)/nrow(OutdoorGames)

#Create Pie chart showing frequency of over being hit when game is played Outdoors
labels = c('Over Hit','Over not Hit')
values = c(nrow(OverHit_Outdoor)/nrow(OutdoorGames),
           1-nrow(OverHit_Outdoor)/nrow(OutdoorGames))

Fig6 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Over is Hit when Playing Outdoors",
               textinfo='label+percent',
               insidetextorientation='radial')
Fig6

#Create Subset of all games where over is hit
Over_Hit = subset(NFL_Data_After2000, Total_Points > over_under_line)
nrow(Over_Hit)/nrow(NFL_Data_After2000)

#Percentage of time game is in Dome if over is hit
nrow(OverHit_Dome)/nrow(Over_Hit)

#Percentage of time game is in Dome (Roof Open) if over  is hit
nrow(OverHit_OpenRoofDome)/nrow(Over_Hit)

#Percentage of time game is Outdoors if over is hit
nrow(OverHit_Outdoor)/nrow(Over_Hit)

#Create Pie Chart showing percentage of the time the game is at each stadium type given the over hits
labels = c('Dome','Dome (Open Roof)','Outdoor')
values = c(nrow(OverHit_Dome)/nrow(Over_Hit),
           nrow(OverHit_OpenRoofDome)/nrow(Over_Hit),
           nrow(OverHit_Outdoor)/nrow(Over_Hit))

Fig7 = plot_ly(type='pie', labels=labels, values=values, title= "Stadium Type Likelihood if Over Hits",
               textinfo='label+percent',
               insidetextorientation='radial')
Fig7

#Create Column for if it is raining
NFL_Data_After2000 = NFL_Data_After2000 %>%
  mutate(Rain = if_else(weather_detail == "Rain",TRUE,FALSE))

#Create Column for if it is snowing
NFL_Data_After2000 = NFL_Data_After2000 %>%
  mutate(Snow = if_else(weather_detail == "Snow",TRUE,FALSE))

##Create Column for if it is Foggy
NFL_Data_After2000 = NFL_Data_After2000 %>%
  mutate(Fog = if_else(weather_detail == "Fog",TRUE,FALSE))

#Create Column for if it is Rain and Fog
NFL_Data_After2000 = NFL_Data_After2000 %>%
  mutate(Rain_Fog = if_else(weather_detail == "Rain | Fog",TRUE,FALSE))

#Create Column for if it is Snow and Fog
NFL_Data_After2000 = NFL_Data_After2000 %>%
  mutate(Snow_Fog = if_else(weather_detail == "Snow | Fog",TRUE,FALSE))

#Create Column for if it is Snow and Freezing Rain
NFL_Data_After2000 = NFL_Data_After2000 %>%
  mutate(Snow_FreezingRain = if_else(weather_detail == "Snow | Freezing Rain",TRUE,FALSE))

#Frequency of Over hitting if Raining
RainGames = subset(NFL_Data_After2000, Rain == TRUE)
OverHit_Rain = subset(RainGames, Total_Points > over_under_line)
nrow(OverHit_Rain)/nrow(RainGames)

#Frequency of Over hitting if Snowing
SnowGames = subset(NFL_Data_After2000, Snow == TRUE)
OverHit_Snow = subset(SnowGames, Total_Points > over_under_line)
nrow(OverHit_Snow)/nrow(SnowGames)

#Frequency of Over hitting if Foggy
FogGames = subset(NFL_Data_After2000, Fog == TRUE)
OverHit_Fog = subset(FogGames, Total_Points > over_under_line)
nrow(OverHit_Fog)/nrow(FogGames)

#Frequency of Over hitting if Raining and Foggy
RainFog_Games = subset(NFL_Data_After2000, Rain_Fog == TRUE)
OverHit_RainFog = subset(RainFog_Games, Total_Points > over_under_line)
nrow(OverHit_RainFog)/nrow(RainFog_Games)

#Frequency of Over hitting if Snowing and Foggy
SnowFog_Games = subset(NFL_Data_After2000, Snow_Fog == TRUE)
OverHit_SnowFog = subset(SnowFog_Games, Total_Points > over_under_line)
nrow(OverHit_SnowFog)/nrow(SnowFog_Games)

#Frequency of Over hitting if Clear weather
ClearGames = subset(NFL_Data_After2000, Rain_Fog == FALSE & Snow_Fog == FALSE & Snow == FALSE & Rain == FALSE & Fog == FALSE & Snow_FreezingRain == FALSE )
OverHit_Clear = subset(ClearGames, Total_Points > over_under_line)
nrow(OverHit_Clear)/nrow(ClearGames)

#Create Pie chart for frequency of over hitting in Rain Games
labels = c('Over Hit','Over not Hit')
values = c(nrow(OverHit_Rain)/nrow(RainGames),
           1-nrow(OverHit_Rain)/nrow(RainGames))

Fig8 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Over is Hit when Raining",
               textinfo='label+percent',
               insidetextorientation='radial')
Fig8

#Create Pie chart for frequency of over hitting in Snow Games
labels = c('Over Hit','Over not Hit')
values = c(nrow(OverHit_Snow)/nrow(SnowGames),
           1-nrow(OverHit_Snow)/nrow(SnowGames))

Fig9 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Over is Hit when Snowing",
               textinfo='label+percent',
               insidetextorientation='radial')
Fig9

#Create Pie chart for frequency of over hitting in Fog Games
labels = c('Over Hit','Over not Hit')
values = c(nrow(OverHit_Fog)/nrow(FogGames),
           1-nrow(OverHit_Fog)/nrow(FogGames))

Fig10 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Over is Hit when Foggy",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig10

#Create Pie chart for frequency of over hitting in Games where it is raining and foggy
labels = c('Over Hit','Over not Hit')
values = c(nrow(OverHit_RainFog)/nrow(RainFog_Games),
           1-nrow(OverHit_RainFog)/nrow(RainFog_Games))

Fig11 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Over is Hit when Raining and Foggy",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig11

#Create Pie chart for frequency of over hitting in Games where it is snowing and foggy
labels = c('Over Hit','Over not Hit')
values = c(nrow(OverHit_SnowFog)/nrow(SnowFog_Games),
           1-nrow(OverHit_SnowFog)/nrow(SnowFog_Games))

Fig12 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Over is Hit when Snowing and Foggy",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig12

#Create Pie chart for frequency of over hitting in Games where it is Clear
labels = c('Over Hit','Over not Hit')
values = c(nrow(OverHit_Clear)/nrow(ClearGames),
           1-nrow(OverHit_Clear)/nrow(ClearGames))

Fig13 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Over is Hit when Clear",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig13

#Create Subset of just regular season games and Subset of postseason games
RegularSeason_Games = subset(NFL_Data_After2000, schedule_playoff == FALSE)
PostSeason_Games = subset(NFL_Data_After2000, schedule_playoff == TRUE)

#Frequency of Favored Team winning in weeks 1-8
FirstHalf_Games = subset(RegularSeason_Games, schedule_week == "1" | schedule_week == "2" |  schedule_week == "3" |  schedule_week == "4" |  schedule_week == "5" |  schedule_week == "6" |  schedule_week == "7" |  schedule_week == "8")
HomeTeam_FavoredWin_First = subset(FirstHalf_Games, team_home == team_favorite_id & Home_Team_Win)
AwayTeam_FavoredWin_First = subset(FirstHalf_Games, team_away == team_favorite_id & !Home_Team_Win)
Favorite_Wins_First = rbind(HomeTeam_FavoredWin_First, AwayTeam_FavoredWin_First)
nrow(Favorite_Wins_First)/nrow(FirstHalf_Games)

#Frequency of Favored Team winning in weeks 9-17
SecondHalf_Games = subset(RegularSeason_Games, schedule_week == "9" | schedule_week == "10" |  schedule_week == "11" |  schedule_week == "12" |  schedule_week == "13" |  schedule_week == "14" |  schedule_week == "15" |  schedule_week == "16" | schedule_week == "17")
HomeTeam_FavoredWin_Second = subset(SecondHalf_Games, team_home == team_favorite_id & Home_Team_Win)
AwayTeam_FavoredWin_Second = subset(SecondHalf_Games, team_away == team_favorite_id & !Home_Team_Win)
Favorite_Wins_Second = rbind(HomeTeam_FavoredWin_Second, AwayTeam_FavoredWin_Second)
nrow(Favorite_Wins_Second)/nrow(SecondHalf_Games)

#Frequency of Favored Team winning in PostSeason
HomeTeam_FavoredWin_PostSeason = subset(PostSeason_Games, team_home == team_favorite_id & Home_Team_Win)
AwayTeam_FavoredWin_PostSeason = subset(PostSeason_Games, team_away == team_favorite_id & !Home_Team_Win)
Favorite_Wins_PostSeason = rbind(HomeTeam_FavoredWin_PostSeason, AwayTeam_FavoredWin_PostSeason)
nrow(Favorite_Wins_PostSeason)/nrow(PostSeason_Games)

#Create Pie chart for frequency of favored team winning in weeks 1-8
labels = c('Favorite Win','Favorite Loss')
values = c(nrow(Favorite_Wins_First)/nrow(FirstHalf_Games),
           1-nrow(Favorite_Wins_First)/nrow(FirstHalf_Games))

Fig14 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Favorite Wins in Weeks 1-8",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig14

#Create Pie chart for frequency of favored team winning in weeks 9-17
labels = c('Favorite Win','Favorite Loss')
values = c(nrow(Favorite_Wins_Second)/nrow(SecondHalf_Games),
           1-nrow(Favorite_Wins_Second)/nrow(SecondHalf_Games))

Fig15 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Favorite Wins in Weeks 9-17",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig15

#Create Pie chart for frequency of favored team winning in PostSeason
labels = c('Favorite Win','Favorite Loss')
values = c(nrow(Favorite_Wins_PostSeason)/nrow(PostSeason_Games),
           1-nrow(Favorite_Wins_PostSeason)/nrow(PostSeason_Games))

Fig16 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Favorite Wins in Postseason",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig16

#Frequency of favored team covering spread in weeks 1-8
HomeTeam_FavoredWinCover_First = subset(HomeTeam_FavoredWin_First, score_home - score_away > abs(spread_favorite))
AwayTeam_FavoredWinCover_First = subset(AwayTeam_FavoredWin_First, score_away - score_home > abs(spread_favorite))
Favorite_WinsCovers_First = rbind(HomeTeam_FavoredWinCover_First, AwayTeam_FavoredWinCover_First)
nrow(Favorite_WinsCovers_First)/nrow(FirstHalf_Games)

#Frequency of favored team covering spread in weeks 9-17
HomeTeam_FavoredWinCover_Second = subset(HomeTeam_FavoredWin_Second, score_home - score_away > abs(spread_favorite))
AwayTeam_FavoredWinCover_Second = subset(AwayTeam_FavoredWin_Second, score_away - score_home > abs(spread_favorite))
Favorite_WinsCovers_Second = rbind(HomeTeam_FavoredWinCover_Second, AwayTeam_FavoredWinCover_Second)
nrow(Favorite_WinsCovers_Second)/nrow(SecondHalf_Games)

#Frequency of favored team covering spread in Postseason
HomeTeam_FavoredWinCover_PostSeason = subset(HomeTeam_FavoredWin_PostSeason, score_home - score_away > abs(spread_favorite))
AwayTeam_FavoredWinCover_PostSeason = subset(AwayTeam_FavoredWin_PostSeason, score_away - score_home > abs(spread_favorite))
Favorite_WinsCovers_PostSeason = rbind(HomeTeam_FavoredWinCover_PostSeason, AwayTeam_FavoredWinCover_PostSeason)
nrow(Favorite_WinsCovers_PostSeason)/nrow(PostSeason_Games)

#Create Pie chart for frequency of favored team covering in weeks 1-8
labels = c('Favorite Covers','Favorite Does Not Cover')
values = c(nrow(Favorite_WinsCovers_First)/nrow(FirstHalf_Games),
           1-nrow(Favorite_WinsCovers_First)/nrow(FirstHalf_Games))

Fig17 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Favorite Covers in Weeks 1-8",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig17

#Create Pie chart for frequency of favored team covering in weeks 9-17
labels = c('Favorite Covers','Favorite Does Not Cover')
values = c(nrow(Favorite_WinsCovers_Second)/nrow(SecondHalf_Games),
           1-nrow(Favorite_WinsCovers_Second)/nrow(SecondHalf_Games))

Fig18 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Favorite Covers in Weeks 9-17",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig18

#Create Pie chart for frequency of favored team covering in Postseason
labels = c('Favorite Covers','Favorite Does Not Cover')
values = c(nrow(Favorite_WinsCovers_PostSeason)/nrow(PostSeason_Games),
           1-nrow(Favorite_WinsCovers_PostSeason)/nrow(PostSeason_Games))

Fig19 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Favorite Covers in Postseason",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig19

#Frequency of Over hitting in Weeks 1-8
OverHit_First = subset(FirstHalf_Games, Total_Points > over_under_line)
nrow(OverHit_First)/nrow(FirstHalf_Games)

#Frequency of Over hitting in Weeks 9-17
OverHit_Second = subset(SecondHalf_Games, Total_Points > over_under_line)
nrow(OverHit_Second)/nrow(SecondHalf_Games)

#Frequency of Over hitting in Postseason
OverHit_PostSeason = subset(PostSeason_Games, Total_Points > over_under_line)
nrow(OverHit_PostSeason)/nrow(PostSeason_Games)

#Create Pie chart for frequency of over hitting in weeks 1-8
labels = c('Over Hit','Over not Hit')
values = c(nrow(OverHit_First)/nrow(FirstHalf_Games),
           1-nrow(OverHit_First)/nrow(FirstHalf_Games))

Fig20 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Over is Hit Weeks 1-8",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig20

#Create Pie chart for frequency of over hitting in weeks 9-17
labels = c('Over Hit','Over not Hit')
values = c(nrow(OverHit_Second)/nrow(SecondHalf_Games),
           1-nrow(OverHit_Second)/nrow(SecondHalf_Games))

Fig21 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Over is Hit Weeks 9-17",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig21

#Create Pie chart for frequency of over hitting in Postseason
labels = c('Over Hit','Over not Hit')
values = c(nrow(OverHit_PostSeason)/nrow(PostSeason_Games),
           1-nrow(OverHit_PostSeason)/nrow(PostSeason_Games))

Fig22 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency Over is Hit in Postseason",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig22

#Frequency of Favorite covering spread if Raining
HomeFavoriteWin_Rain = subset(RainGames, team_home == team_favorite_id & Home_Team_Win)
AwayFavoriteWin_Rain = subset(RainGames, team_away == team_favorite_id & !Home_Team_Win)
FavoriteWin_Rain = rbind(HomeFavoriteWin_Rain, AwayFavoriteWin_Rain)
HomeFavoriteCover_Rain = subset(HomeFavoriteWin_Rain, score_home - score_away > abs(spread_favorite))
AwayFavoriteCover_Rain = subset(AwayFavoriteWin_Rain, score_away - score_home > abs(spread_favorite))
FavoriteWinCover_Rain = rbind(HomeFavoriteCover_Rain, AwayFavoriteCover_Rain)
nrow(FavoriteWinCover_Rain)/nrow(RainGames)

#Frequency of Favorite covering spread if Snowing
HomeFavoriteWin_Snow = subset(SnowGames, team_home == team_favorite_id & Home_Team_Win)
AwayFavoriteWin_Snow = subset(SnowGames, team_away == team_favorite_id & !Home_Team_Win)
FavoriteWin_Snow = rbind(HomeFavoriteWin_Snow, AwayFavoriteWin_Snow)
HomeFavoriteCover_Snow = subset(HomeFavoriteWin_Snow, score_home - score_away > abs(spread_favorite))
AwayFavoriteCover_Snow = subset(AwayFavoriteWin_Snow, score_away - score_home > abs(spread_favorite))
FavoriteWinCover_Snow = rbind(HomeFavoriteCover_Snow, AwayFavoriteCover_Snow)
nrow(FavoriteWinCover_Snow)/nrow(SnowGames)

#Frequency of Favorite covering spread if Foggy
HomeFavoriteWin_Fog = subset(FogGames, team_home == team_favorite_id & Home_Team_Win)
AwayFavoriteWin_Fog = subset(FogGames, team_away == team_favorite_id & !Home_Team_Win)
FavoriteWin_Fog = rbind(HomeFavoriteWin_Fog, AwayFavoriteWin_Fog)
HomeFavoriteCover_Fog = subset(HomeFavoriteWin_Fog, score_home - score_away > abs(spread_favorite))
AwayFavoriteCover_Fog = subset(AwayFavoriteWin_Fog, score_away - score_home > abs(spread_favorite))
FavoriteWinCover_Fog = rbind(HomeFavoriteCover_Fog, AwayFavoriteCover_Fog)
nrow(FavoriteWinCover_Fog)/nrow(FogGames)

#Frequency of Favorite covering spread if Raining and Foggy
HomeFavoriteWin_RainFog = subset(RainFog_Games, team_home == team_favorite_id & Home_Team_Win)
AwayFavoriteWin_RainFog = subset(RainFog_Games, team_away == team_favorite_id & !Home_Team_Win)
FavoriteWin_RainFog = rbind(HomeFavoriteWin_RainFog, AwayFavoriteWin_RainFog)
HomeFavoriteCover_RainFog = subset(HomeFavoriteWin_RainFog, score_home - score_away > abs(spread_favorite))
AwayFavoriteCover_RainFog = subset(AwayFavoriteWin_RainFog, score_away - score_home > abs(spread_favorite))
FavoriteWinCover_RainFog = rbind(HomeFavoriteCover_RainFog, AwayFavoriteCover_RainFog)
nrow(FavoriteWinCover_RainFog)/nrow(RainFog_Games)

#Frequency of Favorite covering spread if Snowing and Foggy
HomeFavoriteWin_SnowFog = subset(SnowFog_Games, team_home == team_favorite_id & Home_Team_Win)
AwayFavoriteWin_SnowFog = subset(SnowFog_Games, team_away == team_favorite_id & !Home_Team_Win)
FavoriteWin_SnowFog = rbind(HomeFavoriteWin_SnowFog, AwayFavoriteWin_SnowFog)
HomeFavoriteCover_SnowFog = subset(HomeFavoriteWin_SnowFog, score_home - score_away > abs(spread_favorite))
AwayFavoriteCover_SnowFog = subset(AwayFavoriteWin_SnowFog, score_away - score_home > abs(spread_favorite))
FavoriteWinCover_SnowFog = rbind(HomeFavoriteCover_SnowFog, AwayFavoriteCover_SnowFog)
nrow(FavoriteWinCover_SnowFog)/nrow(SnowFog_Games)

#Frequency of Favorite covering spread if Clear
HomeFavoriteWin_Clear = subset(ClearGames, team_home == team_favorite_id & Home_Team_Win)
AwayFavoriteWin_Clear = subset(ClearGames, team_away == team_favorite_id & !Home_Team_Win)
FavoriteWin_Clear = rbind(HomeFavoriteWin_Clear, AwayFavoriteWin_Clear)
HomeFavoriteCover_Clear = subset(HomeFavoriteWin_Clear, score_home - score_away > abs(spread_favorite))
AwayFavoriteCover_Clear = subset(AwayFavoriteWin_Clear, score_away - score_home > abs(spread_favorite))
FavoriteWinCover_Clear = rbind(HomeFavoriteCover_Clear, AwayFavoriteCover_Clear)
nrow(FavoriteWinCover_Clear)/nrow(ClearGames)

#Create Pie chart for frequency of Favorite covering spread in Rain Games
labels = c('Favorite Covered','Favorite Did Not Cover')
values = c(nrow(FavoriteWinCover_Rain)/nrow(RainGames),
           1-nrow(FavoriteWinCover_Rain)/nrow(RainGames))

Fig23 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency of Favorite Covering Spread when Raining",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig23

#Create Pie chart for frequency of Favorite covering spread in Snow Games
labels = c('Favorite Covered','Favorite Did Not Cover')
values = c(nrow(FavoriteWinCover_Snow)/nrow(SnowGames),
           1-nrow(FavoriteWinCover_Snow)/nrow(SnowGames))

Fig24 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency of Favorite Covering Spread when Snowing",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig24

#Create Pie chart for frequency of Favorite covering spread in Foggy Games
labels = c('Favorite Covered','Favorite Did Not Cover')
values = c(nrow(FavoriteWinCover_Fog)/nrow(FogGames),
           1-nrow(FavoriteWinCover_Fog)/nrow(FogGames))

Fig25 = plot_ly(type='pie', labels=labels, values=values, title= "Frequency of Favorite Covering Spread when Foggy",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig25

#Create Pie chart for frequency of Favorite covering spread in Games where it is raining and foggy
labels = c('Favorite Covered','Favorite Did Not Cover')
values = c(nrow(FavoriteWinCover_RainFog)/nrow(RainFog_Games),
           1-nrow(FavoriteWinCover_RainFog)/nrow(RainFog_Games))

Fig26 = plot_ly(type='pie', labels=labels, values=values, 
                title= "Frequency of Favorite Covering Spread when Raining and Foggy",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig26

#Create Pie chart for frequency of Favorite covering spread in Games where it is snowing and foggy
labels = c('Favorite Covered','Favorite Did Not Cover')
values = c(nrow(FavoriteWinCover_SnowFog)/nrow(SnowFog_Games),
           1-nrow(FavoriteWinCover_SnowFog)/nrow(SnowFog_Games))

Fig27 = plot_ly(type='pie', labels=labels, values=values, 
                title= "Frequency of Favorite Covering Spread when Snowing and Foggy",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig27

#Create Pie chart for frequency of Favorite covering spread in Games where it is clear
labels = c('Favorite Covered','Favorite Did Not Cover')
values = c(nrow(FavoriteWinCover_Clear)/nrow(ClearGames),
           1-nrow(FavoriteWinCover_Clear)/nrow(ClearGames))

Fig28 = plot_ly(type='pie', labels=labels, values=values, 
                title= "Frequency of Favorite Covering Spread when Clear",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig28

#Over Hitting and Favorite covers spread
HomeFavoriteWin = subset(NFL_Data_After2000, team_home == team_favorite_id & Home_Team_Win)
AwayFavoriteWin = subset(NFL_Data_After2000, team_away == team_favorite_id & !Home_Team_Win)
FavoriteWin = rbind(HomeFavoriteWin, AwayFavoriteWin)
HomeFavoriteCover = subset(HomeFavoriteWin, score_home - score_away > abs(spread_favorite))
AwayFavoriteCover = subset(AwayFavoriteWin, score_away - score_home > abs(spread_favorite))
FavoriteWinCover = rbind(HomeFavoriteCover, AwayFavoriteCover)
FavoriteWinCover_OverHits = subset(FavoriteWinCover, Total_Points > over_under_line)
nrow(FavoriteWinCover_OverHits)/nrow(NFL_Data_After2000)

#Create Pie chart for frequency of Favorite covering spread and Over hitting in same game
labels = c('Favorite Covered and Over Hit','Did not Happen')
values = c(nrow(FavoriteWinCover_OverHits)/nrow(NFL_Data_After2000),
           1-nrow(FavoriteWinCover_OverHits)/nrow(NFL_Data_After2000))

Fig29 = plot_ly(type='pie', labels=labels, values=values, 
                title= "Frequency of Favorite Covering Spread and Over Hitting in Same Game",
                textinfo='label+percent',
                insidetextorientation='radial')
Fig29

#Create Variables for Scenarios investigated and Pie Chart Figures
Scenario = c("Favored Team Wins","Home Team Wins when Favored", "Away Team Wins when Favored", "Spread is Covered given Favored Team Wins", "Losing Team Covers Spread", "Spread is a Push (Tie)", "Over Hits in Game Played in Dome", "Over Hits in Game Played in Dome (Open Roof)", "Over Hits in Game Played Outdoors", "Game is in Dome if Over Hits", "Game is in Dome (Open Roof) if Over Hits", "Game is Outdoors if Over hits", "Over Hits in Rain", "Over Hits in Snow", "Over Hits in Fog", "Over Hits in Rain and Fog", "Over Hits in Snow and Fog", "Over Hits in Clear Weather", "Favored Team Wins in Weeks 1-8", "Favored Team Wins in Weeks 9-17", "Favored Team Wins in Postseason", "Favored Team Covers Spread in Weeks 1-8", "Favored Team Covers Spread in Weeks 9-17", "Favored Team Covers Spread in Postseason", "Over Hits in Weeks 1-8", "Over Hits in Weeks 9-17", "Over Hits in Postseason", "Favorite Covers Spread in Rain", "Favorite Covers Spread in Snow", "Favorite Covers Spread in Fog", "Favorite Covers Spread in Rain and Fog", "Favorite Covers Spread in Snow and Fog", "Favorite Covers Spread in Clear Weather", "Favorite Covers Spread and Over Hits in Same Game")

Figure = c("FigX", "Fig1", "Fig2", "Fig3", "Fig3", "Fig3", "Fig4", "Fig5", "Fig6", "Fig7", "Fig7", "Fig7", "Fig8", "Fig9", "Fig10", "Fig11", "Fig12", "Fig13", "Fig14", "Fig15", "Fig16", "Fig17", "Fig18", "Fig19", "Fig20", "Fig21", "Fig22", "Fig23", "Fig24", "Fig25", "Fig26", "Fig27", "Fig28", "Fig29")

#Create Dataframe of Scenarios and corresponding Pie Chart Figures
Scenarios_Charts = data.frame(Scenario, Figure)
Scenarios_Charts

#Assign Character to Figure
assign("FigX",FigX)
assign("Fig1",Fig1)
assign("Fig2",Fig2)
assign("Fig3",Fig3)
assign("Fig4",Fig4)
assign("Fig5",Fig5)
assign("Fig6",Fig6)
assign("Fig7",Fig7)
assign("Fig8",Fig8)
assign("Fig9",Fig9)
assign("Fig10",Fig10)
assign("Fig11",Fig11)
assign("Fig12",Fig12)
assign("Fig13",Fig13)
assign("Fig14",Fig14)
assign("Fig15",Fig15)
assign("Fig16",Fig16)
assign("Fig17",Fig17)
assign("Fig18",Fig18)
assign("Fig19",Fig19)
assign("Fig20",Fig20)
assign("Fig21",Fig21)
assign("Fig22",Fig22)
assign("Fig23",Fig23)
assign("Fig24",Fig24)
assign("Fig25",Fig25)
assign("Fig26",Fig26)
assign("Fig27",Fig27)
assign("Fig28",Fig28)
assign("Fig29",Fig29)

