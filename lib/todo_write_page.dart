import 'package:flutter/material.dart';
import 'package:todo/data/todo.dart';

class TodoWritePage extends StatefulWidget {
  final Todo todo;

  const TodoWritePage({Key? key, required this.todo}) : super(key: key);

  @override
  _TodoWritePageState createState() => _TodoWritePageState();
}

class _TodoWritePageState extends State<TodoWritePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController memoController = TextEditingController();
  int colorIndex = 0;
  int categoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Text(
              '저장',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              widget.todo.title = titleController.text;
              widget.todo.memo = memoController.text;

              Navigator.of(context).pop(widget.todo);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Text(
                '제목',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          } else if (index == 1) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: TextField(
                controller: titleController,
              ),
            );
          } else if (index == 2) {
            return InkWell(
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '색상',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      color: Color(widget.todo.color),
                    ),
                  ],
                ),
              ),
              onTap: () {
                List<Color> colors = [
                  Color(0xFF80d3f4),
                  Color(0xFFa794fa),
                  Color(0xFFfb91d1),
                  Color(0xFFfb8a94),
                  Color(0xFFfebd9a),
                  Color(0xFF51e29d),
                  Color(0xFFFFFFFF),
                ];
                widget.todo.color = colors[colorIndex].value;
                colorIndex++;
                setState(() {
                  colorIndex = colorIndex % colors.length;
                });
              },
            );
          } else if (index == 3) {
            return InkWell(
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '카테고리',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(widget.todo.category),
                  ],
                ),
              ),
              onTap: () {
                List<String> category = ["공부", "운동", "게임"];
                widget.todo.category = category[categoryIndex];
                categoryIndex++;
                setState(() {
                  categoryIndex = categoryIndex % category.length;
                });
              },
            );
          } else if (index == 4) {
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Text(
                '메모',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          } else if (index == 5) {
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: 1,
                horizontal: 16,
              ),
              child: TextField(
                controller: memoController,
                maxLines: 10,
                minLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        },
        itemCount: 6,
      ),
    );
  }
}
