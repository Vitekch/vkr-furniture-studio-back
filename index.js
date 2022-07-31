const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
const mailer = require("nodemailer");

const app = express();
app.use(cors());

const transporter = mailer.createTransport({
    host: "smtp.gmail.com",
    auth: {
        user: "gertruda123654@gmail.com",
        pass: "wxcwyqqktswyuuuc",
    }
})

app.use(express.json());

const connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    database: "furniture_studio",
    password: "root",
    connectTimeout: 3600000
}).promise();

connection.connect();

// TODO: функционал поиска менее нагруженных сотрудников и отправки писем
app.get("/mail", async function(req, res){
    
    const html = `
        <html>
            <div style="background-color: #eeeeee; display: flex; justify-content: center; align-items: center; width: 100%; height: 400px">
                <div style="background-color: white; display: flex; flex-direction: column; justify-content: space-around; align-items: center; padding: 20px; border-radius: 10px; box-shadow: 0 3px 1px -2px rgb(0 0 0 / 20%), 0 2px 2px 0 rgb(0 0 0 / 14%), 0 1px 5px 0 rgb(0 0 0 / 12%)">
                    <h1>Заказ №12</h1>
                    <h2>Дизайнер - Смертный Николай</h2>
                    <h2>Номер телефона дизайнера - 89123334551</h2>
                    В ближайшее время вам поступит звонок для уточнения времени визита дизайнера
                </div>
            <div>
        </html>
    `

    var mailOptions = {
        from: '"Little Furniture Studio" <gertruda123654@gmail.com>',
        to: 'vitek123654@list.ru',
        subject: 'Заказ инивидуального дизайна',
        text: 'Заказ №12. Дизайнер - Смертный Николай. Номер телефона дизайнера - 89123334551. В ближайшее время вам поступит звонок для уточнения времени визита дизайнера', // plaintext body
        html
    };

    transporter.sendMail(mailOptions);
})

app.get("/feedbacks", async function(req, res){
    const sql = `SELECT f.id, f.name, f.feedback
                 FROM feedback AS f LEFT JOIN  feedback_types AS ft ON f.id_type = ft.id
                 WHERE ft.name = "Отзыв" AND f.is_submited = 1`;
    try {
        const result = await connection.query(sql);
        res.send(result[0]);
    } catch (e) {
        console.log(e)
        res.send([]);
    }
});

app.get("/admin-feedbacks", async function(req, res){
    const sql = `SELECT f.id, f.name, f.email, ft.name AS type, f.feedback, f.is_submited
                 FROM feedback AS f LEFT JOIN  feedback_types AS ft ON f.id_type = ft.id`;
    try {
        const result = await connection.query(sql);
        res.send(result[0]);
    } catch (e) {
        res.send([]);
    }
});

app.get("/admin-ord-furniture", async function(req, res){
    const sql = `SELECT f.id, ft.name AS type, cf.name AS name, f.id_order
                 FROM (ordered_furniture AS f LEFT JOIN catalog_furniture AS cf ON f.id_furniture = cf.id)
                 LEFT JOIN furniture_types AS ft ON ft.id = cf.id_type`;
    try {
        const result = await connection.query(sql);
        res.send(result[0]);
    } catch (e) {
        console.log(e)
        res.send([]);
    }
});

app.get("/admin-orig-furniture", async function(req, res){
    const sql = `SELECT f.id, ft.name AS type, b.name AS brigade, f.id_order, f.price
                 FROM (original_furniture AS f LEFT JOIN  furniture_types AS ft ON f.id_type = ft.id)
                 LEFT JOIN brigades AS b ON b.id = f.id_brigade`;
    try {
        const result = await connection.query(sql);
        res.send(result[0]);
    } catch (e) {
        console.log(e)
        res.send([]);
    }
});

app.get("/admin-catalog", async function(req, res){
    const sql = `SELECT f.id, ft.name AS type, w.name AS designer, f.image, f.name, f.price
                 FROM (catalog_furniture AS f LEFT JOIN  furniture_types AS ft ON f.id_type = ft.id)
                 LEFT JOIN workers AS w ON f.id_designer = w.id`;
    try {
        const result = await connection.query(sql);
        res.send(result[0]);
    } catch (e) {
        res.send([]);
    }
});

app.get("/furniture", async function(req, res){

    const sql = `SELECT cf.id, d.name AS designer, t.name AS type, image, price, cf.name
                 FROM (catalog_furniture AS cf LEFT JOIN workers AS d ON d.id = cf.id_designer)
                        LEFT JOIN furniture_types AS t ON cf.id_type = t.id`

    try {
        const result = await connection.query(sql);
        const finalData = [
            {
                category: "sofas",
                items: [],
            },
            {
                category: "armchairs",
                items: [],
            },
            {
                category: "coffee-tables",
                items: [],
            },
            {
                category: "tv-cabinets",
                items: [],
            },
            {
                category: "beds",
                items: [],
            },
            {
                category: "cabinets",
                items: [],
            },
            {
                category: "wardrobes",
                items: [],
            },
            {
                category: "tables",
                items: [],
            },
            {
                category: "chairs",
                items: [],
            },
        ]
        result[0].forEach((el) => {
            switch (el.type) {
                case "Диван":
                    finalData[0].items.push(el);
                    break;
                case "Кресло":
                    finalData[1].items.push(el);
                    break;
                case "Столик жулнальный":
                    finalData[2].items.push(el);
                    break;
                case "Тумба под телевизор":
                    finalData[3].items.push(el);
                    break;
                case "Кровать":
                    finalData[4].items.push(el);
                    break;
                case "Тумба прикроватная":
                    finalData[5].items.push(el);
                    break;
                case "Гардероб":
                    finalData[6].items.push(el);
                    break;
                case "Стол":
                    finalData[7].items.push(el);
                    break;
                case "Стул":
                    finalData[8].items.push(el);
                    break;
                default:
                    break;
              }
        });
        res.send(finalData);
    } catch (e) {
        console.log(e);
        res.send([])
    }
});

app.post("/send-feedback", function(req, res) {
     const data = req.body;
     if (data) {
        const sql = `INSERT INTO feedback
                    VALUES (NULL, ${data.action === "feedback" ? 2 : 1}, '${data.name}', '${data.email}', '${data.feedback}', 0)`
        try {
            connection.query(sql);
            res.send({ isOk: true });
        } catch (e) {
            console.log(e);
            res.send({ isOk: false });
        }
     } else {
         res.send({ isOk: false });
     }
});

app.post("/order-design", async function(req, res) {
    const data = req.body;
    if (data) {
        const control_sql = `SELECT id 
                            FROM clients
                            WHERE name = '${data.name}' OR phone = '${data.phone}'`;
       const sql_1 = `INSERT INTO clients
                   VALUES (NULL, '${data.name}', '${data.phone}', '${data.address}', '${data.email}')`
       try {
            const control_res = await connection.query(control_sql);
            let id = "";
            console.log(control_res[0])
            if (control_res[0][0]) {
                id = control_res[0][0].id;
            } else {
                const result = await connection.query(sql_1);
                id = result[0].insertId;
            }
            if (id) {
                const sql_2 = `INSERT INTO orders
                VALUES (NULL, 1, NULL, '${id}', 0)`;
                const resultOrder = await connection.query(sql_2);
                const sql_3 = `INSERT INTO original_furniture
                VALUES (NULL, ${resultOrder[0].insertId}, NULL, NULL, NULL)`;
                connection.query(sql_3)
                res.send({ isOk: true });
            } else {
                res.send({ isOk: false });
            }
       } catch (e) {
           console.log(e);
           res.send({ isOk: false });
       }
    } else {
        res.send({ isOk: false });
    }
});

app.post("/auth", async function(req, res) {
    const { login, password } = req.body;
    if (login && password) {
        const sql = `SELECT * FROM users WHERE username = '${login}'`;
        try {
            const resSql = await connection.query(sql);
            if (resSql[0].length) {
                if (Buffer.from(resSql[0][0].password, "base64").toString() === password) {
                    res.send({ isOk: true });
                } else {
                    throw new Error("Wrong password");
                }
            } else {
                throw new Error("Wrong username");
            }
        } catch (e) {
            console.log(e);
            res.send({ isOk: false });
        }
    }
})

app.get("/count-clients", async function(req, res) {
    try {
        const sql = `SELECT COUNT(id) AS count FROM clients`;
        const resultSql = await connection.query(sql);
        res.send({ count: resultSql[0][0].count});
    } catch (e) {
        console.log(e);
        res.send({ count: 0 })
    }
})

app.get("/count-orders", async function(req, res) {
    try {
        const sql = `SELECT COUNT(id) AS count FROM orders WHERE is_completed = 0`;
        const resultSql = await connection.query(sql);
        res.send({ count: resultSql[0][0].count});
    } catch (e) {
        console.log(e);
        res.send({ count: 0 })
    }
})


app.get("/orders", async function(req, res) {
    const sql = `SELECT o.id AS id, m.name AS manager, s.name AS service, c.name AS client, o.is_completed AS status
                 FROM ((orders AS o LEFT JOIN clients AS c ON o.id_client = c.id) 
                 LEFT JOIN workers AS m ON o.id_manager = m.id)
                 LEFT JOIN services AS s ON o.id_service = s.id`;
    try {
        const resultSql = await connection.query(sql);
        res.send(resultSql[0]);
    } catch (e) {
        console.log(e)
        res.send([])
    }
})

app.delete("/deleteItem", async function(req, res) {
    try {
    const { id, table } = req.body;
    if (id) {
        const sql = `DELETE FROM ${table} WHERE id=${id}`;
        const resultSql = await connection.query(sql);
        if (resultSql[0].affectedRows) {
            res.send({ isOk: true });
        } else {
            throw new Error("Something went wrong");
        }
    } else {
        throw new Error("Invalid request");
    }
    } catch (e) {
        console.log(e);
        res.send({ isOk: false });
    }
    
})

app.get("/clients", async function(req, res) {
    const sql = `SELECT * FROM clients`;
    try {
        const resultSql = await connection.query(sql);
        res.send(resultSql[0]);
    } catch (e) {
        console.log(e)
        res.send([])
    }
})

app.post("/order-furniture", async function(req, res) {
    const data = req.body;
    if (data) {
        const control_sql = `SELECT id 
                            FROM clients
                            WHERE name = '${data.name}' OR phone = '${data.phone}'`;
       const sql_1 = `INSERT INTO clients
                   VALUES (NULL, '${data.name}', '${data.phone}', NULL, '${data.email}')`
       try {
            const control_res = await connection.query(control_sql);
            let id = "";
            if (control_res[0][0]) {
                id = control_res[0][0].id;
            } else {
                const result = await connection.query(sql_1);
                id = result[0].insertId;
            }
            if (id) {
                const sql_2 = `INSERT INTO orders
                VALUES (NULL, 2, NULL, '${id}', 0)`;
                const resultOrder = await connection.query(sql_2);
                const sql_3 = `INSERT INTO ordered_furniture
                VALUES (NULL, '${data.id}', ${resultOrder[0].insertId})`;
                connection.query(sql_3)
                res.send({ isOk: true });
            } else {
                res.send({ isOk: false });
            }
       } catch (e) {
           console.log(e);
           res.send({ isOk: false });
       }
    } else {
        res.send({ isOk: false });
    }

});


app.listen(3000);