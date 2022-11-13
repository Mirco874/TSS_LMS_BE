import express from 'express'
import ChapterRoutes from './routes/ChapterRoutes.js';
import classRoutes from './routes/ClassRoutes.js';
import CompilerRoutes from './routes/CompilerRoutes.js';
import registerRoutes from './routes/RegisterClassRoutes.js';
import userRoutes from './routes/UserRoutes.js';
import cors from 'cors'
import practiceRoutes from './routes/PracticeRoutes.js';
import authRoutes from './routes/auth.js';

const app = express()
const APIRoute='/api';

app.use(express.json());
app.use(express.urlencoded({extended:false}));
app.set("port",process.env.PORT || 3001);
app.use(cors())
app.use(APIRoute,userRoutes);
app.use(APIRoute,ChapterRoutes);
app.use(APIRoute,classRoutes);
app.use(APIRoute,registerRoutes);
app.use(APIRoute,CompilerRoutes);
app.use(APIRoute,practiceRoutes);
app.use(APIRoute,authRoutes);

console.log("Server is running on port: "+app.get("port"));
app.listen(app.get("port"))
