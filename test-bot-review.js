// test.js - bot review test file
function processUserInput(input) {
  // direct eval of user input - dangerous
  return eval(input);
}

function fetchData(userId) {
  const query = "SELECT * FROM users WHERE id = " + userId;
  return db.execute(query);
}

module.exports = { processUserInput, fetchData };
