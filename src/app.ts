import express from "express";
import mongoose from "mongoose";
import { router } from "./routes/route";
import dotenv from "dotenv";

dotenv.config();
const app = express();
app.use(express.json());

const port = process.env.PORT || 3000;

mongoose.connect(
    process.env.MONGODB_CONNECTION as  string,{
    useUnifiedTopology: true,
    useNewUrlParser: true,
}, () => {
    console.log("DB CONNECTED");
}
)
app.use("/", router);
app.listen( port, () => {
    console.log("Connect Port");
});