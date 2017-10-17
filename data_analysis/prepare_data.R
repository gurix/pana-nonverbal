library("RSQLite")
library("plyr")

# Establish database connection
con = dbConnect(SQLite(), dbname="data/production.sqlite3")

# Uncomment the line below to drop the view first if the view has been changed
# dbSendStatement(con, "DROP VIEW IF EXISTS valid_ratings")

# Select statement to aggregate data for the view
view_sql = "
SELECT ratings.*,
  CASE WHEN ratings.emoji_id == ratings.choosen_id THEN 1 ELSE 0 END AS correct,
  Cast ((JulianDay(ratings.rated_at) - JulianDay(ratings.showed_at)) * 24 * 60 * 60 As Integer) AS reaction_time,
  emojis.`set` || '_' || emojis.dimension  ||  '_'  || emojis.polarity || '_'  || emojis.verbal AS name,
  emojis.`set`,
  emojis.dimension,
  emojis.polarity,
  emojis.verbal,
  emojis.only_verbal
FROM ratings 
INNER JOIN emojis ON emojis.id = ratings.emoji_id
WHERE ratings.rated_at >= '2017-10-02'
"
# Create view
rs <- dbSendStatement(con, paste("CREATE VIEW IF NOT EXISTS valid_ratings AS", view_sql))

# Import the aggregated ratings into the R environment
ratings <- dbGetQuery(con, 'SELECT * FROM valid_ratings WHERE reaction_time <= 30')

# Aggregate data per emoji
per_emoji <- ddply(ratings,c('emoji_id','name', 'set', 'dimension', 'verbal'), summarise,
  n = length(id), 
  mean_reaction_time=mean(reaction_time),
  sd_reaction_time=sd(reaction_time),
  correct=sum(correct)
)

# Calculate correctness
per_emoji$incorrect = per_emoji$n - per_emoji$correct
per_emoji$correct_percent = per_emoji$correct / per_emoji$n
per_emoji$incorrect_percent = 1 - per_emoji$correct_percent

# Aggregate data per set
per_set <- ddply(ratings,c('set'), summarise,
  n = length(id), 
  mean_reaction_time=mean(reaction_time),
  sd_reaction_time=sd(reaction_time),
  correct=sum(correct)
)

# Calculate correctness
per_set$incorrect = per_set$n - per_set$correct
per_set$correct_percent = per_set$correct / per_set$n
per_set$incorrect_percent = 1 - per_set$correct_percent

# Save aggregated data for R
save(per_emoji,per_set, file = "data/aggregated_data.Rdata")

# Save aggregated data for SPSS via dat
library('foreign')
write.dta(per_emoji, file = "data/aggregated_data_per_emoji.dat")
write.dta(per_set, file = "data/aggregated_data_per_set.dat")

# Save aggregated data for SPSS via dat
library('xlsx')
write.xlsx2(per_emoji, file = "data/aggregated_data.xlsx", sheetName = "per_emoji")
write.xlsx2(per_set, file = "data/aggregated_data.xlsx", sheetName = "per_set", append = T)

