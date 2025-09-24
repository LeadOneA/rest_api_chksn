# NodeJS API Service

## Overview
This project is a Node.js-based API service using **Express** and **SQL SERVER**. It supports basic **POST** and **GET** requests and uses a JSON file as mock data storage.

---

## Installed Packages
The following dependencies are required for the application:

| Package | Version | Purpose |
|---------|---------|---------|
| `axios` | ^1.12.0 | HTTP client for external requests |
| `bcryptjs` | ^3.0.2 | Password hashing |
| `cors` | ^2.8.5 | Cross-Origin Resource Sharing |
| `dotenv` | ^17.2.2 | Environment variable management |
| `express` | ^5.1.0 | Web server framework |
| `express-handlebars` | ^8.0.3 | Template rendering engine |
| `jsonwebtoken` | ^9.0.2 | JWT-based authentication |
| `mssql` | ^11.0.1 | SQL Server database connection |

---

## Installation

Install dependencies using **npm**:

```bash
npm install axios bcryptjs cors dotenv express express-handlebars jsonwebtoken mssql
```


This runs the server using nodemon (nodemon app.js), which automatically refreshes the service whenever changes are made, without needing to restart it manually.

Note: Make sure your package.json includes the following scripts section:

```bash
"scripts": {
  "start": "node app.js",
  "dev": "nodemon app.js"
}
```

```bash
npm install --save nodemon

npm run dev
```

the project is executed using this url:
http://localhost:3000/

to make the POST here is the fake data
utlis > post_applicant.json
POST - http://localhost:3000/api/applicants