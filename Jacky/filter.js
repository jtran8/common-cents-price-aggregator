module.exports = function(){
    var express = require('express');
    var router = express.Router();

    function getCategories(res, mysql, context, complete){
        mysql.pool.query(
            "SELECT catId, name FROM categories ORDER BY name ASC;",
            function(error, results, fields){
               if(error){
                    res.write(JSON.stringify(error));
                    res.end();
                }
                context.categories = results;
                complete();
            }
        );
    }

    function getBrands(res, mysql, context, category, complete){
        var sql = "SELECT brands.brandId, name FROM brands INNER JOIN categoryBrand ON brands.brandId=categoryBrand.brandId WHERE categoryBrand.catId=? ORDER BY name ASC";
        var inserts = [category];

        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.brands = results;
            complete();
        });
    }

    function getProducts(res, mysql, context, category, brand, complete){
        var sql = "SELECT name, upc FROM products WHERE brandId=? AND catId=? ORDER BY name ASC;";
        var inserts = [category, brand];

        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.products = results;
            complete();
        });
    }
    
    router.get('/', function(req, res){
        var mysql = req.app.get('mysql');
        var callbackCount = 0;
        var context = {};

        getCategories(res, mysql, context, complete);

        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.send(context);
                res.end();
            }
        }
    });

    router.get('/:category', function(req, res){
        var mysql = req.app.get('mysql');
        var callbackCount = 0;
        var context = {};

        getBrands(res, mysql, context, req.params.category, complete);

        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.send(context);
                res.end();
            }
        }
    });

    router.get('/:category/:brand', function(req, res){
        var mysql = req.app.get('mysql');
        var callbackCount = 0;
        var context = {};
        getProducts(res, mysql, context, req.params.category, req.params.brand, complete);

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
