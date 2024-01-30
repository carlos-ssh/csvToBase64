import express from 'express'
import { handler } from './pocCsv.js'

const app = express();
const port = 8000;

app.use(express.json());

app.post('/', handler);


app.listen(port, () => {
    console.log(`Servidor corriendo en http://localhost:${port}`);
});
