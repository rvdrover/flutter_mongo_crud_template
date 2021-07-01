import express from "express";
import { Todo } from "../models/usermodel";
const router = express.Router();

router.post("/add", async (req, res) => {
    const { name, email, age } = req.body;
    const dataItem = new Todo({ name, email, age });

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
        "_id": req.body.id
    };

    try {
        const dataitem = await Todo.deleteOne(filter);
        res.status(200).json({
            data: dataitem,
        });
    } catch (error) {
        return res.send(error);
    }


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

    try {

        const dataitem = await Todo.updateOne(filter, updateData);
        res.json({ data: dataitem, });
    } catch (error) {
        return res.send(error);
    }


});
export { router };