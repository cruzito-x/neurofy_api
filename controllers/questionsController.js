const db = require("../config/db");
const crypto = require("crypto");

exports.getQuestion = (request, response) => {
  const question =
    "WITH randomQuestions AS (SELECT * FROM (SELECT id_question, id_area, question, ROW_NUMBER() OVER (PARTITION BY id_area ORDER BY RAND()) AS rn FROM questions) subquery WHERE rn <= 4) SELECT id_question, id_area, question FROM randomQuestions;";

  db.query(question, (error, result) => {
    if (error) {
      response.status(500).json({
        status: 500,
        icon: "error",
        message: "Error al obtener las preguntas. Error de servidor.",
      });

      return;
    }

    if (result.length > 0) {
      response.status(200).json({
        status: 200,
        id_question: result[0].id_question,
        id_area_question: result[0].id_area,
        question: result[0].question,
      });
    } else {
      response.status(401).json({
        status: 401,
        icon: "warning",
        message:
          "Error al obtener la pregunta correspondiente, por favor recargue la página.",
      });
    }
  });
};
