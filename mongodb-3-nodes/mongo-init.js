rs.initiate({
    _id : "rs0",
     members : [
         {_id : 0, host : "mongo1:27017", priority: 1},
         {_id : 1, host : "mongo2:27017", priority: 0.5},
         {_id : 2, host : "mongo3:27017", priority: 0.5},
     ]
});

db.products.insert(
   [
     { _id: 11, item: "pencil", qty: 50, type: "no.2" },
     { item: "pen", qty: 20 },
     { item: "eraser", qty: 25 }
   ]
)
