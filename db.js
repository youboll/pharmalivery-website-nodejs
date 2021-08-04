const mysql = require('mysql');
const db = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'pharma'
}
)
db.connect( (err) => {
    if (err) {
        throw err;
    } else {
        console.log("Banco conectado");
    }
})
//Exporta o modelo
module.exports = db;