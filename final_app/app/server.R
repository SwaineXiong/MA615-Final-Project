library(shiny)
library(leaflet)
library(ggplot2)
library(DT)

data1 <- data.frame(
  Year = c(2023, 2020, 2015, 2010, 2005, 2000, 1995, 1990, 1985, 1980, 1975, 1970, 1965, 1960, 1955),
  Population = c(521021, 514438, 435582, 361575, 307018, 282507, 258208, 224957, 190383, 164887, 143126, 123243, 104566, 91650, 81823),
  Yearly_Percent_Change = c(-0.53, 1.97, 3.79, 3.33, 1.68, 1.82, 2.80, 3.39, 2.92, 2.87, 3.04, 3.34, 2.67, 2.29, 1.90),
  Yearly_Change = c(-2766, 9930, 14801, 10911, 4902, 4860, 6650, 6915, 5099, 4352, 3977, 3735, 2583, 1965, 1468),
  Migrants_Net = c(-8652, 1134, 12526, 6244, 195, 133, -518, -243, -472, -914, -140, 280, 1396, -41, 0),
  Median_Age = c(32.1, 29.9, 26.8, 23.4, 20.4, 17.8, 15.8, 15.5, 16.0, 15.8, 16.0, 16.3, 18.7, 19.4, 18.7),
  Fertility_Rate = c(1.67, 1.71, 1.99, 2.32, 2.24, 2.71, 4.32, 6.09, 7.02, 7.17, 7.19, 7.30, 7.02, 6.80, 6.38),
  Density_Pop_Km2 = c(1737, 1715, 1452, 1205, 1023, 942, 861, 750, 635, 550, 477, 411, 349, 306, 273),
  Urban_Pop_Percent = c(38.5, 36.3, 37.0, 36.7, 35.0, 27.5, 25.2, 25.6, 25.4, 21.4, 16.5, 11.2, 11.3, 11.0, 10.6),
  Urban_Population = c(200834, 186634, 161207, 132805, 107606, 77683, 65143, 57679, 48340, 35241, 23623, 13768, 11775, 10043, 8680),
  Country_Share_of_World_Pop = c(0.01, 0.01, 0.01, 0.01, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00),
  World_Population = c(8045311447, 7840952880, 7426597537, 6985603105, 6558176119, 6148898975, 5743219454, 5316175862, 4861730613, 4444007706, 4069437231, 3695390336, 3337111983, 3019233434, 2746072141),
  Maldives_Global_Rank = c(174, 174, 174, 178, 178, 177, 179, 179, 179, 180, 181, 180, 180, 179, 180)
)

mauritius_data <- data.frame(
  Year = c(2023, 2022, 2020, 2015, 2010, 2005, 2000, 1995, 1990, 1985, 1980, 1975, 1970, 1965, 1960, 1955),
  Population = c(1300557, 1299469, 1297828, 1293153, 1283330, 1258048, 1215930, 1160207, 1090290, 1025769, 954865, 888292, 830115, 758628, 676683, 596866),
  Yearly_Percent_Change = c(0.08, 0.04, 0.12, 0.15, 0.40, 0.68, 0.94, 1.25, 1.23, 1.44, 1.46, 1.36, 1.82, 2.31, 2.54, 2.58),
  Yearly_Change = c(1088, 554, 1549, 1965, 5056, 8424, 11145, 13983, 12904, 14181, 13315, 11635, 14297, 16389, 15963, 14285),
  Migrants_Net = c(0, 0, -478, -2747, -3194, -3221, -2522, -1305, -1646, 807, -1601, -3210, -2191, -2829, -2494, -1489),
  Median_Age = c(37.5, 37.1, 36.4, 34.1, 31.6, 29.5, 27.9, 26.3, 24.6, 22.4, 20.7, 19.1, 17.4, 16.2, 16.0, 16.7),
  Fertility_Rate = c(1.39, 1.39, 1.41, 1.37, 1.55, 1.88, 1.98, 2.14, 2.29, 2.08, 2.78, 3.20, 3.95, 5.51, 6.17, 5.83),
  Density = c(641, 640, 639, 637, 632, 620, 599, 572, 537, 505, 470, 438, 409, 374, 333, 294),
  Urban_Pop_Percent = c(40.2, 40.2, 40.0, 39.9, 40.4, 40.9, 41.6, 42.1, 42.5, 41.9, 42.8, 43.6, 42.4, 38.5, 34.2, 30.2),
  Urban_Population = c(523224, 521772, 519330, 516377, 518584, 514605, 505705, 488537, 463526, 429921, 409127, 387600, 351699, 292028, 231739, 180433),
  Country_Share_of_World_Pop = c(0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02),
  World_Population = c(8045311447, 7975105156, 7840952880, 7426597537, 6985603105, 6558176119, 6148898975, 5743219454, 5316175862, 4861730613, 4444007706, 4069437231, 3695390336, 3337111983, 3019233434, 2746072141),
  Mauritius_Global_Rank = c(157, 157, 157, 156, 154, 153, 153, 151, 150, 150, 149, 146, 145, 145, 145, 145)
)


# Creating the data frame for Seychelles
seychelles_data <- data.frame(
  Year = c(2023, 2022, 2020, 2015, 2010, 2005, 2000, 1995, 1990, 1985, 1980, 1975, 1970, 1965, 1960, 1955),
  Population = c(107660, 107118, 105530, 99240, 92409, 85883, 80060, 74735, 71057, 67833, 65290, 60943, 54379, 48123, 43167, 39788),
  Yearly_Percent_Change = c(0.51, 0.61, 1.11, 1.44, 1.48, 1.41, 1.39, 1.01, 0.93, 0.77, 1.39, 2.31, 2.47, 2.20, 1.64, 0.87),
  Yearly_Change = c(542, 647, 1157, 1366, 1305, 1165, 1065, 736, 645, 509, 869, 1313, 1251, 991, 676, 336),
  Migrants_Net = c(-200, -200, 146, 245, 376, 251, 376, -48, -320, -601, -599, 93, 167, 56, 21, 51),
  Median_Age = c(33.1, 32.8, 32.2, 30.8, 29.2, 27.3, 25.2, 23.9, 22.2, 20.3, 18.7, 17.4, 17.3, 19.1, 20.8, 23.0),
  Fertility_Rate = c(2.29, 2.31, 2.38, 2.35, 2.20, 2.19, 2.07, 2.36, 2.61, 2.98, 3.79, 4.94, 5.76, 5.84, 5.27, 4.91),
  Density = c(234, 233, 229, 216, 201, 187, 174, 162, 154, 147, 142, 132, 118, 105, 94, 86),
  Urban_Pop_Percent = c(53.0, 52.7, 52.4, 52.3, 52.8, 53.4, 51.1, 50.9, 49.0, 50.7, 50.1, 45.2, 37.6, 32.2, 26.6, 26.8),
  Urban_Population = c(57062, 56504, 55308, 51933, 48752, 45854, 40927, 38070, 34796, 34423, 32727, 27570, 20458, 15492, 11496, 10683),
  Country_Share_of_World_Pop = c(0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00),
  World_Population = c(8045311447, 7975105156, 7840952880, 7426597537, 6985603105, 6558176119, 6148898975, 5743219454, 5316175862, 4861730613, 4444007706, 4069437231, 3695390336, 3337111983, 3019233434, 2746072141),
  Seychelles_Global_Rank = c(196, 195, 196, 199, 199, 199, 200, 199, 198, 198, 197, 197, 200, 197, 197, 197)
)

# Creating the data frame for Comoros
comoros_data <- data.frame(
  Year = c(2023, 2022, 2020, 2015, 2010, 2005, 2000, 1995, 1990, 1985, 1980, 1975, 1970, 1965, 1960, 1955),
  Population = c(852075, 836774, 806166, 730216, 656024, 592683, 536758, 483760, 431119, 375650, 328328, 280036, 242351, 214939, 194852, 177885),
  Yearly_Percent_Change = c(1.83, 1.84, 1.92, 2.17, 2.05, 2.00, 2.10, 2.33, 2.79, 2.73, 3.23, 2.93, 2.43, 1.98, 1.84, 1.91),
  Yearly_Change = c(15301, 15149, 15180, 14838, 12668, 11185, 10600, 10528, 11094, 9464, 9658, 7537, 5482, 4017, 3393, 3214),
  Migrants_Net = c(-2000, -2000, -1772, -1349, -2294, -2717, -2971, -2831, -1194, -987, 566, 1058, 430, -676, -741, -715),
  Median_Age = c(20.5, 20.3, 19.9, 18.6, 17.5, 16.1, 15.7, 15.5, 15.5, 15.7, 16.3, 16.5, 16.6, 17.9, 18.8, 19.6),
  Fertility_Rate = c(3.85, 3.91, 4.05, 4.42, 4.76, 5.03, 5.30, 5.78, 6.50, 6.96, 7.08, 7.12, 7.06, 7.00, 6.79, 6.35),
  Density = c(458, 450, 433, 392, 353, 318, 288, 260, 232, 202, 176, 150, 130, 115, 105, 96),
  Urban_Pop_Percent = c(32.8, 32.4, 31.7, 30.3, 29.4, 28.8, 28.4, 27.8, 26.6, 24.1, 21.8, 19.5, 18.4, 16.4, 12.3, 9.0),
  Urban_Population = c(279115, 270954, 255487, 221334, 192925, 170493, 152293, 134543, 114709, 90500, 71463, 54647, 44607, 35217, 23988, 16095),
  Country_Share_of_World_Pop = c(0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01),
  World_Population = c(8045311447, 7975105156, 7840952880, 7426597537, 6985603105, 6558176119, 6148898975, 5743219454, 5316175862, 4861730613, 4444007706, 4069437231, 3695390336, 3337111983, 3019233434, 2746072141),
  Comoros_Global_Rank = c(163, 163, 163, 165, 165, 166, 166, 166, 166, 166, 168, 170, 170, 170, 169, 170)
)

# Creating the data frame for Madagascar
madagascar_data <- data.frame(
  Year = c(2023, 2022, 2020, 2015, 2010, 2005, 2000, 1995, 1990, 1985, 1980, 1975, 1970, 1965, 1960, 1955),
  Population = c(30325732, 29611714, 28225177, 24850912, 21731053, 18792171, 16216431, 13869138, 11882762, 10297746, 8948162, 7720859, 6639751, 5780453, 5073342, 4467590),
  Yearly_Percent_Change = c(2.41, 2.41, 2.51, 2.72, 2.95, 2.99, 3.18, 3.14, 2.90, 2.85, 2.99, 3.06, 2.81, 2.64, 2.58, 2.47),
  Yearly_Change = c(714018, 696061, 692043, 623972, 587776, 515148, 469459, 397275, 317003, 269917, 245461, 216222, 171860, 141422, 121150, 102739),
  Migrants_Net = c(-1500, -1500, -742, 485, 485, 485, 485, 485, -1792, -1956, -4002, -5174, -2657, -560, 0, 0),
  Median_Age = c(19.3, 19.1, 18.8, 17.9, 17.0, 16.5, 16.3, 16.2, 15.9, 15.5, 15.3, 15.3, 15.5, 15.6, 17.0, 18.5),
  Fertility_Rate = c(3.73, 3.79, 3.92, 4.18, 4.76, 5.10, 5.40, 5.95, 6.16, 6.35, 6.73, 7.10, 7.27, 7.31, 7.30, 7.30),
  Density = c(52, 51, 49, 43, 37, 32, 28, 24, 20, 18, 15, 13, 11, 10, 9, 8),
  Urban_Pop_Percent = c(40.0, 39.3, 37.8, 34.3, 31.1, 28.1, 26.4, 25.1, 23.0, 20.5, 18.0, 16.0, 14.0, 12.4, 10.7, 9.3),
  Urban_Population = c(12141777, 11635629, 10670252, 8528793, 6755337, 5283543, 4276171, 3476130, 2733282, 2106614, 1614681, 1234215, 927259, 714199, 542656, 414442),
  Country_Share_of_World_Pop = c(0.38, 0.37, 0.36, 0.33, 0.31, 0.29, 0.26, 0.24, 0.22, 0.21, 0.20, 0.19, 0.18, 0.17, 0.17, 0.16),
  World_Population = c(8045311447, 7975105156, 7840952880, 7426597537, 6985603105, 6558176119, 6148898975, 5743219454, 5316175862, 4861730613, 4444007706, 4069437231, 3695390336, 3337111983, 3019233434, 2746072141),
  Madagascar_Global_Rank = c(50, 50, 51, 52, 55, 57, 58, 61, 59, 61, 66, 67, 69, 74, 73, 74)
)

# Creating the data frame for Sri Lanka
sri_lanka_data <- data.frame(
  Year = c(2023, 2022, 2020, 2015, 2010, 2005, 2000, 1995, 1990, 1985, 1980, 1975, 1970, 1965, 1960, 1955),
  Population = c(21893579, 21832143, 21715079, 21336697, 20668557, 19673866, 18776371, 18177572, 17204094, 16092338, 14943645, 13662873, 12388769, 11035224, 9783871, 8749627),
  Yearly_Percent_Change = c(0.28, 0.27, 0.30, 0.64, 0.99, 0.94, 0.65, 1.11, 1.35, 1.49, 1.81, 1.98, 2.34, 2.44, 2.26, 1.95),
  Yearly_Change = c(61436, 58702, 65415, 133628, 198938, 179499, 119760, 194696, 222351, 229739, 256154, 254821, 270709, 250271, 206849, 160730),
  Migrants_Net = c(-77495, -77495, -92400, -98598, -26603, -36955, -91900, -73695, -36199, -53596, -66398, -37505, -16297, -8295, -12606, -11697),
  Median_Age = c(33.0, 32.7, 32.2, 30.8, 29.2, 27.8, 26.4, 24.8, 23.2, 21.6, 20.5, 19.6, 18.8, 18.3, 18.4, 19.2),
  Fertility_Rate = c(1.96, 1.97, 2.00, 2.09, 2.20, 2.28, 2.19, 2.30, 2.52, 2.88, 3.64, 3.79, 4.36, 5.00, 5.47, 5.42),
  Density = c(349, 348, 346, 340, 330, 314, 299, 290, 274, 257, 238, 218, 198, 176, 156, 140),
  Urban_Pop_Percent = c(18.7, 18.5, 18.2, 17.7, 17.8, 18.2, 18.4, 18.5, 18.7, 18.7, 18.7, 18.2, 17.7, 17.2, 16.6, 15.7),
  Urban_Population = c(4083985, 4034302, 3945488, 3781471, 3681427, 3573620, 3452171, 3367985, 3212099, 3011554, 2797666, 2489237, 2197238, 1901067, 1622519, 1373606),
  Country_Share_of_World_Pop = c(0.27, 0.27, 0.28, 0.29, 0.30, 0.30, 0.31, 0.32, 0.32, 0.33, 0.34, 0.34, 0.34, 0.33, 0.32, 0.32),
  World_Population = c(8045311447, 7975105156, 7840952880, 7426597537, 6985603105, 6558176119, 6148898975, 5743219454, 5316175862, 4861730613, 4444007706, 4069437231, 3695390336, 3337111983, 3019233434, 2746072141),
  Sri_Lanka_Global_Rank = c(61, 61, 58, 57, 57, 54, 52, 49, 48, 45, 45, 44, 43, 45, 44, 45)
)

locations <- data.frame(
  country = c("Maldives", "Mauritius", "Seychelles", "Comoros", "Madagascar", "Sri Lanka"),
  lat = c(3.2028, -20.3484, -4.6796, -11.6455, -18.7669, 7.8731),
  lng = c(73.2207, 57.5522, 55.4915, 43.3333, 46.8691, 80.7718)
)



country_data_list <- list(
  Maldives = data1,
  Mauritius = mauritius_data,
  Seychelles = seychelles_data,
  Comoros = comoros_data,
  Madagascar = madagascar_data,
  Sri_lanka = sri_lanka_data)



localities_data <- data.frame(
  Name = c("Malé", "Addu City", "Fuvahmulah", "Kulhudhuffushi", "Thinadhoo", 
           "Naifaru", "Hinnavaru", "Dhuvaafaru", "Dhidhdhoo", "Gan"),
  Division = c("Malé", "Addu Atoll", "Gnaviyani Atoll", "Haa Dhaalu", "Gaafu Dhaalu",
               "Lhaviyani", "Lhaviyani", "Raa", "Haa Alifu", "Laamu"),
  Pop = c(252768, 34503, 13037, 10210, 7487, 5542, 4901, 4760, 4246, 3860)
)




shinyServer(function(input, output, session) {
  output$map1 <- renderLeaflet({
    # Get Maldives map data
    # Create a leaflet map
    leaflet() %>%
      setView(lng = 73.15, lat = -0.637, input$zoom) %>%
      addTiles()  # Set the initial view coordinates
  })
  
  output$map2 <- renderLeaflet({
    leaflet() %>%
      addTiles() %>% # Default OpenStreetMap tiles
      setView(lng = 73, lat = 3, zoom = 2) %>% # Set view to show world map
      addMarkers(lng = 73.5, lat = 3.2, popup = "Maldives") # Add marker for Maldives
  })
  
  output$populationHist <- renderPlot({
    # Filter data based on selected year range
    filtered_data <- data1[data1$Year >= input$yearRange[1] & data1$Year <= input$yearRange[2],]
    
    # Create the histogram
    ggplot(filtered_data, aes(x = Year, y = Population)) +
      geom_bar(stat = "identity", fill = "skyblue", color = "black") +
      geom_text(aes(label = Population), vjust = -0.5) + 
      theme_minimal()+
      labs(title = "Population Histogram", x = "Year", y = "Population")
  })
  
  
  output$urban_popHist <- renderPlot({
    # Filter data based on selected year range
    filtered_data <- data1[data1$Year >= input$yearRangeurban[1] & data1$Year <= input$yearRangeurban[2],]
    
    # Create the histogram
    ggplot(filtered_data, aes(x = Year)) +
      geom_bar(aes(y = Urban_Population), stat = "identity", fill = "skyblue", position = "identity") +
      geom_text(aes(y = Urban_Population, label = Urban_Population), vjust = -0.5, color = "black", size = 3) +
      geom_line(aes(y = Urban_Pop_Percent * 1000), color = "red", group = 1) +  
      scale_y_continuous(
        name = "Urbanized Population",   
        sec.axis = sec_axis(~./100000, name = "Urbanization Percentage")  
      ) +
      labs(title = "Urbanization Histogram",
           x = "Year") +
      theme_minimal()
  })
  
  output$populationcomparion<- renderPlot({
    selected_data <- reactive({
      lapply(input$countries, function(country) country_data_list[[country]])
    })
    
    ggplot() +
      
      lapply(seq_along(selected_data()), function(i) {
        geom_line(
          data = selected_data()[[i]],
          aes(x = Year, y = Population, color = input$countries[i], linetype = input$countries[i]),
          size = 1.2,
          show.legend = TRUE
        )
      }) +
      labs(title = "Population Trends by Country", x = "Year", y = "Population") +
      scale_color_manual(name = "Country", values = c("Maldives" = "red", "Mauritius" = "blue", "Seychelles" = "green", "Comoros" = "orange", "Madagascar" = "purple", "Sri_lanka" = "brown")) +
      scale_linetype_manual(name = "Country", values = rep("solid", length(input$countries))) +
      theme_minimal() +
      theme(legend.position = "right") 
    })
  
  output$location <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = 55, lat = -10, zoom = 4) %>%
      addMarkers(data = locations, ~lng, ~lat, popup = ~country)
  })
  
  
  output$pop_loc <- renderPlot({
    
    ggplot(localities_data) +
      aes(x = Division, y = Pop) +
      geom_col(fill = "#112446") +
      labs(title = "Population by Division", x = "Division", y = "Population")+
      theme_minimal()
  })
  
  output$myTable <- renderDT({
    datatable(localities_data)
  })
  
  })
    
  


 

