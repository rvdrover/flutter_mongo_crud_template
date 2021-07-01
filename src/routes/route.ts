import express from "express";
import { Todo } from "../models/usermodel";
const router = express.Router();
import { ObjectId } from 'mongodb';
import mongoose from "mongoose";

router.post("/add", async (req, res) => {
    const { _id, name, email, age } = req.body;
    const dataItem = new Todo({ _id, name, email, age });

    await dataItem.save();

    return res.status(200).json({
        data: dataItem,
    });

});

router.get("/", async (req, res) => {
    try {
        const dataitem = await Todo.find({});
        res.status(200).json({
            data: dataitem,
        });
    } catch (e) {
        console.log(e);
    }
});

router.delete("/delete", async (req, res) => {

    const filter = {
        id: req.body.id,
    };
    const dataitem = await Todo.deleteOne(filter).then((data) =>
        res.json({
            data: data,
        })
    ).catch((error) => {
        return res.send(error);
    })


});


router.put("/update", async (req, res) => {

    const filter = {
        id: req.body.id,
    };

    const updateData = {
        name: req.body.name,
        email: req.body.email,
        age: req.body.age,
    };
    const dataitem = await Todo.updateOne(filter, updateData).then((data) =>
        res.json({
            data: data,
        })
    ).catch((error) => {
        return res.send(error);
    })


});
export { router };