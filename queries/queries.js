const Pool = require("pg").Pool;
const pool = new Pool({
  user: "Tam",
  host: "localhost",
  database: "shoe_store",
  password: "password",
  port: 5432
});

const getShoes = (request, response) => {
  pool.query("SELECT * FROM shoes ORDER BY id ASC", (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).json(results.rows);
  });
};

const getShoeById = (request, response) => {
  const id = parseInt(request.params.id);

  pool.query("SELECT * FROM shoes WHERE id = $1", [id], (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).json(results.rows);
  });
};

// Users

const getUsers = (request, response) => {
  pool.query("SELECT * FROM users ORDER BY id ASC", (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).json(results.rows);
  });
};

const postUserEmail = (request, response) => {
  const { email } = request.body;

  pool.query(
    "INSERT INTO users (email) VALUES ($1)",
    [email],
    (error, results) => {
      if (error) {
        throw error;
      }

      response.status(201).send(results.rows);
    }
  );
};

const getUsernames = (request, response) => {
  pool.query(
    "SELECT username, id FROM users ORDER BY id ASC",
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};

const getUserById = (request, response) => {
  const id = parseInt(request.params.id);

  pool.query("SELECT * FROM users WHERE id = $1", [id], (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).json(results.rows);
  });
};

module.exports = {
  getShoes,
  getShoeById,
  getUsers,
  postUserEmail,
  getUsernames,
  getUserById
};
