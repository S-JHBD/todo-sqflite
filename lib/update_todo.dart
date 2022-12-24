import 'package:flutter/material.dart';
import 'database.dart';

class UpdateTodo extends StatefulWidget {

  final DataModel data;

  const UpdateTodo({
    required this.data,
    Key? key}) : super(key: key);

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {

  final TextEditingController titleController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  List<DataModel> todos = [];
  bool fetching = true;
  int currentIndex = 0;
  final db = NewDatabase();

  @override
  void initState() {
    super.initState();
    db.initDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update"),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: titleController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  labelText: 'Title',
              ),
              validator: (value){
                return (value == '')? "Please enter title" : null;
              },
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                int currentId =  widget.data.id;
                DataModel dataLocal = DataModel(
                    id:   currentId,
                    title: titleController.text);
                db.update(dataLocal, currentId);
                const snackBar = SnackBar(
                    content: Text('Updated successfully')
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                setState(() {
                });
                Navigator.pop(context, true);
              },
              child: const Text('Update'),
            ),
          ],
        )
      ),
    );
  }
}
