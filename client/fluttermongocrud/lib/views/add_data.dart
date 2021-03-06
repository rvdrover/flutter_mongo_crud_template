import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermongocrud/providers/crud_provider.dart';
import 'package:provider/provider.dart';

final namecontroller = TextEditingController();
final emailcontroller = TextEditingController();
final agecontroller = TextEditingController();

addDatawidget(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 300,
        width: 400,
        child: Column(
          children: [
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(hintText: 'Enter Name'),
            ),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(hintText: 'Enter Email'),
            ),
            TextField(
              controller: agecontroller,
              decoration: InputDecoration(hintText: 'Enter Age'),
            ),
            ElevatedButton(
                onPressed: () {
                  if (namecontroller.text.isNotEmpty &&
                      emailcontroller.text.isNotEmpty) {
                    Provider.of<CrudProvider>(context, listen: false).addData({
                      "name": namecontroller.text,
                      "email": emailcontroller.text,
                      "age": agecontroller.text,
                    });
                  }
                },
                child: Text("Submit"))
          ],
        ),
      );
    },
  );
}

updateDatawidget(BuildContext context, String id) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 300,
        width: 400,
        child: Column(
          children: [
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(hintText: 'Enter Name'),
            ),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(hintText: 'Enter Email'),
            ),
            TextField(
              controller: agecontroller,
              decoration: InputDecoration(hintText: 'Enter Age'),
            ),
            ElevatedButton(
                onPressed: () {
                  if (namecontroller.text.isNotEmpty &&
                      emailcontroller.text.isNotEmpty) {
                    Provider.of<CrudProvider>(context, listen: false)
                        .updateData({
                      "_id": id,
                      "name": namecontroller.text,
                      "email": emailcontroller.text,
                      "age": agecontroller.text,
                    });
                  }
                },
                child: Text("update"))
          ],
        ),
      );
    },
  );
}
