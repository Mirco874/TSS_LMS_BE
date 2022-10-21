import express from 'express'
import routes from './routes/Routes.js'

const app = express()


app.use(express.json());
app.use(express.urlencoded({extended:false}));
app.set("port",process.env.PORT || 3000);

app.use('/api',routes)

app.listen(app.get("port"))