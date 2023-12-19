library(shiny)
library(leaflet)
library(ggplot2)
library(DT)

shinyUI(fluidPage(
  navlistPanel(
  "Welcome to Maldives",
  tabPanel("Map of Maldives",sliderInput("zoom", "Zoom Level:",
                                         min = 11, max = 20, value = 12), HTML("<br/>"),
           leafletOutput("map1"),img(src = "https://www.worldatlas.com/r/w1200/upload/73/6d/0d/mal.jpg", width = 400, height = 300),
           tags$style(HTML('
    body {
      background-image: url("https://pic.52112.com/180725/EPS-180725_218/SwSyxUUEzR_small.jpg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      height: 100vh;
      background-color: rgba(255, 255, 255, 0.5);
    }
  ')),),
  tabPanel("Location of Maldives",HTML("<br/> Maldives, independent island country in the north-central Indian Ocean. It consists of a chain of about 1,200 small coral islands and sandbanks (some 200 of which are inhabited), grouped in clusters, or atolls.</br> <br/>"), leafletOutput("map2"),img(src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHRrgdaG3FWokmm_AMAx2ieoU3-fA8Q0wIM8LXGuTB6dy29gKXuN-9i29NcQFxRCGGeIE&usqp=CAU", width = 400, height = 300)),
  tabPanel("Key facts of Maldives", HTML("<strong>1.1.	Less than a fifth of the island are inhabited.</strong> <br/>
             The Maldives is home to around 540,000 people, roughly the same amount of residents as Manchester. However, only around 200 out of the 1,200 islands in the archipelago are inhabited. <br/>
A ban was introduced in 1984 on visiting the inhabited islands, but this was lifted in 2009 so visitors can experience the cultural side of the Maldives beyond the resorts and help the tourism industry.
<br/> <br/>"),img(src = "https://www.authenticindiatours.com/app/uploads/2022/04/Maldives-Islands-Ocean-Tropical-Beach-940x585-c-default.jpg", width = 500, height = 300),HTML("<br/> <br/>
             1.2.	<strong>It has only been a holiday destination for 50 years.</strong> <br/>
             The Maldives is a relatively new tourist destination, despite being around for a few thousand years! It was a secret destination for surfers and divers before the first resort opened in 1972.<br/>
Former President Maumoon Abdul Gayoom gave tourism a huge boost during his first term in power and in 2019, 1.7 million tourists visited the Maldives.<br/> <br/> 
            1.3.	<strong>The beaches are extremely rare.</strong> <br/>
            Next on our list of 10 facts about the Maldives is the pure white sand of the Maldives. It not only looks attractive but it’s actually made from coral. Coraline beaches make up only 5% of the world’s beaches, with most beach sand being made of quartz.<br/> <br/> 
            1.4.	<strong>Shells were used as currency.</strong> <br/>
            Shells were used as a method of international trading currency in the 1800s, something which the Maldives had by the bucketload! These cowrie shells are distinctive, lightweight, and cannot be forged, making them an ideal money substitution. The shell-money trade is long since gone, and the cowrie shell is worthless these days, although it remains as the emblem of the Maldives Monetary Authority. <br/> <br/> 
            "),img(src = "https://www.authenticindiatours.com/app/uploads/2022/05/Cowrie-shell-1200px-Cypraea_caputserpentis-wikipedia-940x585-c-default.jpg", width = 400, height = 300),HTML("<br/> <br/>
            1.5.	 <strong>Swim with enormous fish.</strong> <br/>
            The Maldives is known for its variety of marine life, but the king of the waves here is the whale shark. The largest fish in the ocean, whale sharks can grow up to 20ft long, but you don’t need to fear a ‘Jaws’ type scenario as they live off a diet of plankton.<br/>
            If you want to spot these enormous beasts all year round, then head to the southern part of Sun Island’s reef on the South Ari Atoll. Other spots are Rangali Island and the uninhabited Hanifaru Bay. <br/> <br/> 
             "),img(src = "https://www.authenticindiatours.com/app/uploads/2022/05/Maldives-whale-sharkpxhere-940x585-c-default.jpg", width = 500, height = 300),HTML("<br/> <br/>
            1.6.	<strong>The Maldives is the world’s lowest nation.</strong> <br/>
            The Maldives are merely eight feet above sea level at their highest natural point, which is lower than every other country on the planet. The 1,200 islands are on average around seven feet above sea level. The archipelago is protected from monsoon season swells by a natural barrier of coral reefs. <br/> <br/> 
            1.7.	<strong>The Maldives held the first underwater cabinet meeting.</strong> <br/>
            One of the benefits of being the world’s lowest nation is being able to hold a cabinet meeting at the bottom of the sea! This is what Maldivian President Mohamed Nasheed did in 2009 as a gesture for help over rising sea levels that would submerge some of the low lying areas by 2100. <br/>
            The 11 ministers signed a document calling for global cuts to carbon emissions, and their signed wetsuits were auctioned to raise money for coral reef protection. This is definitely our favorite 10 facts about the Maldives! <br/> <br/> 
             "),img(src = "https://www.authenticindiatours.com/app/uploads/2022/05/Underwater-cabinet-meeting-940x585-c-default.jpg", width = 500, height = 300),HTML("<br/> <br/>
            1.8.	<strong>The islands have been inhabited for over 3,000 years.</strong> <br/>
            There is archaeological evidence to suggest that the Maldives had inhabitants as long ago as 1500 BCE. <br/>
            Before the Maldives converted to Islam in 1153 CE, Buddhists are thought to have arrived from Sri Lanka and settled briefly. For years, the islands had been used as a stopping point by Arab traders on their way to Asia, and many of them decided to stay. <br/> <br/> 
            1.9.	<strong>Language.</strong> <br/>
            Although most Maldivians can speak English with no problems (and resort staff often speak a range of other international languages), the national language is Dhivehi. Why not learn a few phrases and words to impress the locals? <br/>
            Hello – Assalaamu Alaikum (from Arabic, meaning peace be with you) <br/> <br/> 
Nice to meet you – Baddhalu vee thi varah ufavejje <br/>
Goodbye – Dhanee/Vakivelan <br/>
What is your name? – Kon nameh tha kiyanee? <br/>
My name is (name) – Aharenge namakee (name) <br/>
Yes – Aan <br/>
No – Noon <br/>
Please – Adhes kohfa (not commonly used as it means “I beg you”) <br/>
Thank you – Shukriyaa <br/>
You’re welcome – Maruhabaa <br/>
Excuse me – Ma-aaf kurey <br/>
Do you speak English? – Ingireysin vaahaka dhakkan ingeytha? <br/>
I don’t understand – Ahannakah neyngunu <br/>
Good morning – Baajjaveri hendhuneh <br/>
Good evening – Baajjaveri haveereh <br/>
Good night – Baajjaveri reygande <br/>
Good night (when you retire to bed) – Ufaaveri nidhumeh <br/> <br/>")),
  tabPanel("This is Maldives", HTML("The Maldives, an idyllic tropical paradise, is a nation composed of 26 atolls, which are made up of over 1,000 coral islands, in the Indian Ocean. Renowned for its stunning white-sand beaches, crystal-clear turquoise waters, and vibrant marine life, the Maldives is a sought-after destination for tourists seeking luxury and tranquility. The islands are famous for their overwater bungalows, offering a unique experience of living atop the serene waters.<br/> <br/>
                                      Its rich marine life includes an array of colorful fish, sharks, and rays, making it a premier destination for snorkeling and diving enthusiasts. The Maldivian culture is a blend of influences from the Indian subcontinent, Africa, and Arabia, reflected in the local cuisine, music, and art. <br/> <br/>
The Maldives also faces significant environmental challenges, particularly from climate change, as the low-lying islands are vulnerable to rising sea levels. The nation has been at the forefront of advocating for global climate action, emphasizing the urgency of protecting such fragile ecosystems. Despite these challenges, the Maldives continues to enchant visitors with its breathtaking natural beauty and serene atmosphere. <br/> <br/>
<br/>"),img(src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcB5IzMidmt0GdEbCm6LGLVvE0XNyIR4re9Zhelw-TTjSc5o9ylTIqouY9jg&s", width = 500, height = 300)),
  "Key Demographics",
  tabPanel("Population",HTML("<br/> Population in Maldives from 1955 to 2023. <br/> <br/>"), sliderInput("yearRange", "Select Year Range:",
                                     min = 1955, max = 2023, value = c(1955, 2023)),plotOutput("populationHist")),
  tabPanel("Population in each city",HTML("<br/> Population in each city. <br/> <br/>"), DTOutput("myTable"),plotOutput("pop_loc")),
  tabPanel("Language", HTML("The official and national language is Dhivehi, an Indo-Aryan language closely related to the Sinhala language of Sri Lanka. The first known script used to write Dhivehi is the eveyla akuru script, which is found in the historical recording of kings (raadhavalhi). Later a script called dhives akuru was used for a long period. The present-day script is called Thaana and is written from right to left. Thaana is said to have been introduced by the reign of Mohamed Thakurufaanu. <br/> <br/>

English is widely spoken by the locals of the Maldives: 'Following the nation's opening to the outside world, the introduction of English as a medium of instruction at the secondary and tertiary levels of education, and its government's recognition of the opportunities offered through tourism, English has now firmly established itself in the country. As such, the Maldives are quite similar to the countries in the Gulf region .... The nation is undergoing vast societal change, and English is part of this.'<br/>"),
           img(src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7vo3rA9o974vgYRwhcHRudcfUXpZ83-A9sSH0HFe30IXAd5Pb_nKSXuAmnJVBR5g9SQ&usqp=CAU", width = 500, height = 200)),
  tabPanel("Religion", HTML("After the long Buddhist period of Maldivian history, Muslim traders introduced Islam. Maldivians converted to Islam by the mid-12th century. The islands have had a long history of Sufic orders, as can be seen in the history of the country such as the building of tombs. They were used until as recently as the 1980s for seeking the help of buried saints. They can be seen next to some old mosques and are considered a part of the Maldives's cultural heritage.<br/>
<br/>
Other aspects of tassawuf, such as ritualised dhikr ceremonies called Maulūdu (Mawlid) - the liturgy of which included recitations and certain supplications in a melodic tone - existed until very recent times. These Maulūdu festivals were held in ornate tents specially built for the occasion. At present Islam is the official religion of the entire population, as adherence to it is required for citizenship. <br/>
<br/>
According to Arab traveller Ibn Battuta, the person responsible for this conversion was a Sunni Muslim visitor named Abu al-Barakat Yusuf al-Barbari, sailing from what is today Morocco. He is also referred to as Tabrizugefaanu. His venerated tomb now stands on the grounds of Medhu Ziyaaraiy, across the street from the Friday Mosque, or Hukuru Miskiy, in Malé. Built in 1656, this is the country's oldest mosque. <br/>
<br/>
In 2013, scholar Felix Wilfred of Oxford University estimates the number of Christians in Maldives as 1,400 or 0.4% of the country's population.<br/>
<br/>
In 2020, studies found that 0.3% of the population is Christian (roughly split between Catholic and Protestant).<br/>"),
           img(src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYnuRIMILYNVyYWVC6_6w2P6AvoqUwoDb_1Q&usqp=CAU", width = 500, height = 300)),
  tabPanel("Urbanization", sliderInput("yearRangeurban", "Select Year Range:",
                                       min = 1955, max = 2023, value = c(1955, 2023)),plotOutput("urban_popHist")),
  tabPanel("Education", HTML("The Maldives National University is one of the country's three institutions of higher education. In 1973, the Allied Health Services Training Centre (the forerunner of the Faculty of Health Sciences) was established by the Ministry of Health. The Vocational Training Centre was established in 1974, providing training for mechanical and electrical trades. In 1984, the Institute for Teacher Education was created and the School of Hotel and Catering Services was established in 1987 to provide trained personnel for the tourist industry. In 1991, the Institute of Management and Administration was created to train staff for public and private services. In 1998, the Maldives College of Higher Education was founded. The Institute of Shar'ah and Law was founded in January 1999. In 2000 the college launched its first-degree programme, Bachelor of Arts. On 17 January 2011 the Maldives National University Act was passed by the President of the Maldives; The Maldives National University was named on 15 February 2011. In 2015 under a Presidential decree the College of Islamic Studies was changed into the Islamic University of Maldives (IUM). <br/>
<br/>
The Maldivian government now offers 3 different scholarships to students that have completed their higher secondary education with results above a certain threshold, with ranks of the scholarship received depending on the merits achieved by students on their year 12 examinations. <br/>")
           ,img(src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbEup8JhzG3e-bTWYg83pMRo3jFNxaVEVN4rpv9TsOaCiVbhkQfakHAfVlpYWbMBq0GL4&usqp=CAU", width = 500, height = 300)),
  tabPanel("Health", HTML("<br/> On 24 May 2021, the Maldives had the world's fastest-growing COVID-19 outbreak, with the highest number of infections per million people over the prior 7 and 14 days, according to data compiled by Bloomberg.[150] Doctors warned that increasing demand for COVID-19 care could hinder their ability to handle other health emergencies in the Maldives. The reason for the outbreak was the Delta variant.<br/>
"),img(src = "https://media.istockphoto.com/id/1319031310/photo/doctor-writing-a-medical-prescription.jpg?s=612x612&w=0&k=20&c=DWZGM8lBb5Bun7cbxhKT1ruVxRC_itvFzA9jxgoA0N8=", width = 500, height = 300)),
  tabPanel("Culture", HTML("The culture of the Maldives is influenced by the cultures of the people of different ethnicities who have settled on the islands throughout the times.<br/>
<br/>
Since the 12th century AD, there were also influences from Arabia in the language and culture of the Maldives because of the conversion to Islam and its location as a crossroads in the central Indian Ocean. This was due to the long trading history between the far east and the middle east.<br/>
<br/>
Reflective of this is the fact that the Maldives has had the highest national divorce rate in the world for many decades. This, it is hypothesised, is due to a combination of liberal Islamic rules about divorce and the relatively loose marital bonds that have been identified as common in non- and semi-sedentary peoples without a history of fully developed agrarian property and kinship relations. <br/>")
           ,img(src = "https://lilybeachmaldives.com/wp-content/uploads/2017/04/boduberu.jpg", width = 500, height = 300)),
  tabPanel("Transportation", HTML("Velana International Airport is the principal gateway to the Maldives; it is adjacent to the capital city Malé and is connected by a bridge. International travel is available on government-owned Island Aviation Services (branded as Maldivian), which operates DHC-6 Twin Otter seaplanes and to nearly all Maldivian domestic airports with several Bombardier Dash 8 aircraft, and one Airbus A320 with international service to India, Bangladesh, Sri Lanka, Malaysia and Thailand. <br/>
                                  <br/>
                                  In the Maldives, there are three main ways to travel between islands: by domestic flight, by seaplane, or by boat.[153] For several years there were two seaplane companies operating: TMA (Trans Maldivian Airways) and Maldivian Air Taxi, but these merged in 2013 under the name TMA. The seaplane fleet is entirely made up of DHC-6 Twin Otters. There is also another airline, Flyme, which operates using ATR planes to domestic airports, principally Villa-Maamigili, Dharavandhoo and some others. Manta Air began its first scheduled seaplane service in 2019. Its seaplane fleet is made up of DHC-6 Twin Otter aircraft. In addition to the seaplane service, Manta Air utilises ATR 72–600 aircraft to operate domestic flights to Dhaalu Airport, Dharavandhoo Airport and Kooddoo Airport from the main Velana International Airport. Depending on the distance of the destination island from the airport, resorts organise speedboat transfers or seaplane flights directly to the resort island jetty for their guests. Several daily flights operate from Velana International Airport to the 18 domestic and international airports in the country. Scheduled ferries also operate from Malé to many of the atolls. The traditional Maldivian boat is called a dhoni. Speedboats and seaplanes tend to be more expensive, while travel by dhoni, although slower, is relatively cheaper and convenient. <br/>")
           ,img(src = "https://i.ytimg.com/vi/BPvgTVT4nxI/hqdefault.jpg", width = 500, height = 300)),
  "Why Maldives is Unqiue",
  tabPanel("Islands in Indian Ocean",HTML("<br/> Mauritius, Seychelles, Comoros, Madagascar, Sri Lanka are near Maldives. <br/> <br/>"),leafletOutput("location")),
  tabPanel("Population of Islands in Indian Ocean",checkboxGroupInput("countries", "Select Countries:", choices = names(country_data_list), selected = names(country_data_list)),plotOutput("populationcomparion")),
  "SWOT Analysis for Maldives",
  tabPanel("Strengths", HTML("(i) Natural resources: pristine environment and rich marine resources. <br/> <br/> 
(ii) Strong private sector tourism industry. <br/> <br/> 
(iii) Fast growing economy: 7% GDP growth during the last decade, 18.2% in 2006
based on the strong recovery in the tourism industry. <br/> <br/> 
(iv) Relatively high GNP per capita ($2,400) and low poverty incidence (only 3% of the
population below $1/day). <br/> <br/> 
(v) Generally stable political environment with the ongoing reform agenda. <br/> <br/> 
(vi) Government pushes on local governance and decentralization. <br/> <br/> 
(vii) Reasonably good primary and secondary education and English language skills.
")),
  tabPanel("Weaknesses", HTML("(i) A narrow economy base: tourism accounting for a third of the GDP, followed by
transport/communications (15%), manufacturing (8%), and fisheries (6%). <br/> <br/> 
(ii) Income inequalities and poor access to basic social service for many scattered coral
atolls. <br/> <br/> 
(iii) Lack of adequate human resources in the country hampering sustained economic
growth and development. <br/> <br/> 
(iv) Institutional deficit: weak institutions managing the development process and large
expansion of civil service and subsidized social services. <br/> <br/> 
(v) Low absorptive capacity for external assistance and currently too many externallyfunded projects. <br/> <br/> 
(vi) Lack of social and physical infrastructure supporting scattered atolls and tourism. <br/> <br/> 
(vii) Governance deficit: primarily on account of absence of independent institutions and
statutory bodies and lack of transparency in the decision making process. <br/> <br/> 
(viii) Large inequalities and inequities between the capital Malé and outer atolls. <br/> <br/> 
(ix) Very high youth unemployment rate and heavy reliance on expatriate labor.
")),
  tabPanel("Opportunities", HTML("(i) Increased foreign investment in core sectors and promotion of private investment by
locals (especially at atolls). <br/> <br/> 
(ii) Diversification of industry through developing local industries. <br/> <br/> 
(iii) Strengthening of institutional capacity in pubic sector. <br/> <br/> 
(iv) Strengthening of governance and economic management. <br/> <br/> 
(v) Development of a merit-based civil service structure and efficient human resource
management.
")),
  tabPanel("Threats", HTML("(i) Rising sea level, tsunamis, and mismanagement of environment and pollution. <br/> <br/> 
(ii) Social and political tension from large social and economic inequities between Malé
and outer atolls. <br/> <br/> 
(iii) Potential fiscal and economic instability: unless the Government addresses the
rapidly growing fiscal deficits before its debt reaches unsustainable levels, high
economic growth would be difficult. <br/> <br/> 
(iv) Increase in political tensions in the short-term due to the transition to multi-party
democracy."))

)) ) 
