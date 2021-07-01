import 'package:flutter/material.dart';
import 'package:fluttermongocrud/providers/crud_provider.dart';
import 'package:fluttermongocrud/views/add_data.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<CrudProvider>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addDatawidget(context),
      ),
      appBar: AppBar(title: Text("Flutter mongo crud")),
      body: Container(
        child: Consumer<CrudProvider>(
          builder: (context, model, _) => FutureBuilder(
            future: model.fetchData(),
            builder: (context, snapshot) => ListView.builder(
              itemCount: model.crudData.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  onLongPress: () {
                    print(model.crudData[index]["_id"] + " first");
                    model.deleteData(model.crudData[index]["_id"]);
                  },
                  onTap: () {
                    updateDatawidget(context, model.crudData[index]["_id"]);
                  },
                  title: Text(model.crudData[index]["name"]),
                  subtitle: Text(model.crudData[index]["email"]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
