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

const updateShoeStockLevel = (request, response) => {
  const { id, newStockLevel } = request.body;

  pool.query(
    "UPDATE shoes SET stock = $2 WHERE id = $1",
    [id, newStockLevel],
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(201).json(results.rows);
    }
  );
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
  const pattern = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
  if (pattern.test(email)) {
    pool.query(
      "INSERT INTO users (email) VALUES ($1) RETURNING id",
      [email],
      (error, results) => {
        if (error) {
          throw error;
        }

        response.status(201).send(results.rows);
      }
    );
  } else {
    response.status(500).send(results);
  }
};

const putUserDetails = (request, response) => {
  const { id, firstName, lastName, street, town, postCode } = request.body;

  pool.query(
    "UPDATE users SET(first_name, last_name, street, town, post_code) = ($2, $3, $4, $5, $6) WHERE id = $1",
    [id, firstName, lastName, street, town, postCode],
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
  updateShoeStockLevel,
  getUsers,
  postUserEmail,
  putUserDetails,
  getUsernames,
  getUserById
};
