module.exports = function(){
    var express = require('express');
    var router = express.Router();

    function getPrices(res, mysql, context, upc, complete){
        var sql = "SELECT R.name, price, url FROM productRetailer AS PR INNER JOIN retailers AS R ON R.retailerId=PR.retailerId WHERE PR.upc=? ORDER BY price ASC";
        var inserts = [upc];

        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.prices = results;
            complete();
        });
    }
    
    router.get('/:upc', function(req, res){
        var mysql = req.app.get('mysql');
        var callbackCount = 0;
        var context = {};

        getPrices(res, mysql, context, req.params.upc, complete);

        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.send(context);
                res.end();
            }
        }
    });

    return router;
}();
