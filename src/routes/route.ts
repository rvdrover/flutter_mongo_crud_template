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
        _id: req.body._id
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
        _id: req.body._id
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