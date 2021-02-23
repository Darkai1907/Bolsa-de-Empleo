import express from 'express';
import morgan from 'morgan';
import cors from 'cors';
import userRoutes from './routes/user.routes'
import {createConnection} from 'typeorm'
import "reflect-metadata";
const app = express();

createConnection();


app.use(cors());
app.use(express.json());
app.use(morgan('dev'));


app.use(userRoutes);
app.listen(3000);

console.log('Server on port', 3000);