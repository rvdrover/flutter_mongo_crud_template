import mongoose from "mongoose";


interface TodoDocument extends mongoose.Document {
    name: string;
    email: string;
    age: number;
}

const todoSchema = new mongoose.Schema({
    name: {type: String,required: true},
    email: {type: String,required: true},
    age: {type: Number,required: true}
});

const Todo = mongoose.model<TodoDocument>(
    "todocrud", todoSchema
);

export { Todo };