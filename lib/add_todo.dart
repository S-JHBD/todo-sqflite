import 'package:flutter/material.dart';
import 'database.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {

  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  List<DataModel> todos = [];
  bool fetching = true;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
              padding: const EdgeInsets.all(20),
              children: <Widget>[
                TextFormField(
                  controller: idController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'ID',
                      hintText: 'Ex. 2022123456'
                  ),
                  validator: (value){
                    return (value == '')? "Please enter ID" : null;
                  },
                ),
                TextFormField(
                  controller: titleController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      labelText: 'Title',
                      hintText: 'Ex. wash clothes'
                  ),
                  validator: (value){
                    return (value == '')? "Please enter title" : null;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        DataModel dataLocal = DataModel(
                            // id: todos[todos.length - 1].id! + 1,
                            id: int.parse(idController.text),
                            title: titleController.text);
                        // dataLocal.id = todos[todos.length - 1].id! + 1;
                        const snackBar = SnackBar(
                            content: Text('Created successfully')
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        setState(() {
                        });
                        Navigator.pop(context, dataLocal);
                      }
                    },
                    child: const Text('Add')
                ),
            ],
        )
      ),
    );
  }
}
