import express from 'express'
import ChapterRoutes from './routes/ChapterRoutes.js';
import classRoutes from './routes/ClassRoutes.js';
import registerRoutes from './routes/RegisterClassRoutes.js';
import userRoutes from './routes/UserRoutes.js';

const app = express()
const APIRoute='/api';

app.use(express.json());
app.use(express.urlencoded({extended:false}));
app.set("port",process.env.PORT || 3000);

app.use(APIRoute,userRoutes);
app.use(APIRoute,ChapterRoutes);
app.use(APIRoute,classRoutes);
app.use(APIRoute,registerRoutes);

app.listen(app.get("port"))