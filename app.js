const fs = require('fs');
const path = require('path');

// Verificar si existe el archivo .env
const envPath = path.resolve(__dirname, '.env');
if (!fs.existsSync(envPath)) {
  console.error('⚠️  Warning: .env file not found! Call at administrator.');
} else {
  console.log('.env file loaded successfully.');
}

// Cargar variables de entorno
require('dotenv').config();

const express = require('express');
const cors = require('cors');
const exphbs = require('express-handlebars');


const applicantRoutes = require('./routes/applicants');
const { connectToDb } = require('./db');


const app = express();
const PORT = process.env.PORT || 3000;


// Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.use(express.static(path.join(__dirname, 'public')));


// Handlebars
app.engine('handlebars', exphbs.engine({ defaultLayout: 'main' }));
app.set('view engine', 'handlebars');
app.set('views', path.join(__dirname, 'views'));

// Start server after DB connection
connectToDb()
.then(() => {
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
})
.catch(err => {
console.error('Failed to connect to DB:', err.message);
process.exit(1);
});


// Routes
app.use('/api/applicants', applicantRoutes);
app.get('/', (req, res) => res.render('home'));
