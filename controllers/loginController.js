const db = require("../config/db");
const crypto = require("crypto");

exports.login = (request, response) => {
  const { email, password } = request.body;
  const encryptedPassword = crypto.createHash('md5').update(password).digest('hex');
  const login = "SELECT * FROM users WHERE email = ? AND password = ?";

  db.query(login, [email, encryptedPassword], (error, result) => {
    if (error) {
      response.status(500).json({
        status: 500,
        icon: "error",
        message: "Error al iniciar sesión. Error de servidor.",
      });

      return;
    }

    if (result.length > 0) {
      response.status(200).json({
        status: 200,
        icon: "success",
        message: `Bienvenido/a ${result[0].username}`,
        role: result[0].role,
        id: result[0].user_id,
      });
    } else {
      response.status(401).json({
        status: 401,
        icon: "warning",
        message:
          "Usuario no encontrado, por favor revise los datos introducidos",
      });
    }
  });
};
