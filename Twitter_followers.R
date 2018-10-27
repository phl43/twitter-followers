library(rtweet)

# see https://medium.com/@GalarnykMichael/accessing-data-from-twitter-api-using-r-part1-b387a1c7d3e to
# learn how to create a Twitter application and obtain the various keys you need here
consumer_key <- #YOUR_CONSUMER_KEY
consumer_secret <- #YOUR_CONSUMER_SECRET
access_token <- #YOUR_ACCESS_TOKEN
access_secret <- #YOUR_ACCESS_SECRET

# set up the OAuth credentials
create_token(consumer_key = #YOUR_CONSUMER_KEY,
             consumer_secret = #YOUR_CONSUMER_SECRET,
             access_token = #YOUR_ACCESS_TOKEN,
             access_secret = #YOUR_ACCESS_SECRET)

# ask for the screen names of the users of interest (the script will tell
# you who, among the people who follow user 1, is followed by user 2)
user1_screen_name <- readline(prompt = "Enter user 1's screen name: ")
user2_screen_name <- readline(prompt = "Enter user 2's screen name: ")

# get the IDs of user 1's followers
followers <- get_followers(user1_screen_name, n = 75000, retryonratelimit = TRUE)

# get the IDs of the people followed by user 2
followed <- get_friends(user2_screen_name, n = 75000, retryonratelimit = TRUE)

# get the user objects for the people followed by user 2 who follow user 1
users <- lookup_users(intersect(followers$user_id, followed$user_id))

# print the screen names of the users in question
users$screen_name