rs.initiate({
    _id : "rs1",
     members : [
         {_id : 0, host : "mongo1:27017"},
         {_id : 1, host : "mongo2:27017"},
         {_id : 2, host : "mongo3:27017"},
         {_id : 3, host : "mongo4:27017"},
         {_id : 4, host : "mongo5:27017"},
     ]
});
