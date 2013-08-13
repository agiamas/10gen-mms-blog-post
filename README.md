10gen-mms-blog-post
===================

a repo for mongodb and ruby code comparing performance against a map reduce intensive operation and an aggregation framework operation.
The collection will have entries resembling stories structure:_id (story_id), userid, create_date, text, last_update_date, logged_ip and the MR/Agg framework will calculate # of posts per userid and date.

Another example could be calculating likes for a given story with a collection:

user_data:
   - _id (userid)
   - date
   - likes:
      - post_id subdocument (that the user liked) with key being post_id and value being timestamp of the like date
   - favorites:
      - post_id subdocument (that the user favorited) with similar structure as likes
   
===alternative more flexible but more storage space hungry solution===

user_data:

{_id:"userId1", action_date:ISODate("2013-09-01T23:59:59.000Z"), action:"like", item:"postId1"}

{_id:"userId1", action_date:ISODate("2013-09-01T23:59:59.000Z"), action:"favorite", item:"postId2"}

DB BLOGPOST, collection useractions
> db.useractions.insert({uid:"userId1", a_d:new ISODate(), a:"favorite", i:"postId1"})
> db.useractions.insert({uid:"userId1", a_d:new ISODate(), a:"like", i:"postId1"})
> db.useractions.insert({uid:"userId1", a_d:new ISODate(), a:"like", i:"postId2"})

totals
   - postId1, 1 like, 1 favorites
   - postId2, 1 like, 0 favorites
