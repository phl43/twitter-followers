library(twitteR)
library(purrr)

# see https://medium.com/@GalarnykMichael/accessing-data-from-twitter-api-using-r-part1-b387a1c7d3e to
# learn how to create a Twitter application and obtain the various keys you need here
consumer_key <- #YOUR_CONSUMER_KEY
consumer_secret <- #YOUR_CONSUMER_SECRET
access_token <- #YOUR_ACCESS_TOKEN
access_secret <- #YOUR_ACCESS_SECRET

# set up the OAuth credentials for the twitteR session
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# ask for the screen names of the users of interest (the script will tell
# you who, among the people who follow user 1, is followed by user 2)
user1_screen_name <- readline(prompt = "Enter user 1's screen name: ")
user2_screen_name <- readline(prompt = "Enter user 2's screen name: ")

# get the user objects for user 1 and user 2
user1 <- getUser(user1_screen_name)
user2 <- getUser(user2_screen_name)

# get the IDs of user 1's followers
followers <- user1$getFollowerIDs()

# get the IDs of the people followed by user 2
followed <- user2$getFriendIDs()

# get the user objects for the people followed by user 2 who follow user 1
users <- lookupUsers(intersect(followers, followed))

# print the screen names of the users in question
unname(unlist(map(users, ~ .$screenName)))
