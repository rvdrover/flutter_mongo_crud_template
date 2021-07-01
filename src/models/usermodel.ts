import mongoose from "mongoose";


interface TodoDocument extends mongoose.Document {
    _id: string,
    name: string;
    email: string;
    age: number;
}

const todoSchema = new mongoose.Schema({
    _id: mongoose.Types.ObjectId,
    name: { type: String, required: true },
    email: { type: String, required: true },
    age: { type: Number, required: false }
});

const Todo = mongoose.model<TodoDocument>(
    "todocrud", todoSchema
);

export { Todo };