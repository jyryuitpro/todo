import 'package:flutter/material.dart';
import 'package:todo/data/todo.dart';
import 'package:todo/data/utils.dart';
import 'package:todo/todo_write_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todos = [
    Todo(
      title: 'jyryuitpro 강의듣기1',
      memo: '앱개발 입문강의 듣기1',
      category: '공부',
      color: Colors.redAccent.value,
      done: 0,
      date: 20210913,
    ),
    Todo(
      title: 'jyryuitpro 강의듣기2',
      memo: '앱개발 입문강의 듣기2',
      category: '공부',
      color: Colors.blue.value,
      done: 1,
      date: 20210913,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(),
        preferredSize: Size.fromHeight(0),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              child: Text(
                '오늘 하루',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (index == 1) {
            List<Todo> undone = todos.where((element) {
              return element.done == 0;
            }).toList();

            return Container(
              child: Column(
                children: List.generate(
                  undone.length,
                  (index) {
                    Todo t = undone[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(t.color),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                t.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                t.done == 0 ? '미완료' : '완료',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 8,
                          ),
                          Text(
                            t.memo,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (index == 2) {
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              child: Text(
                '완료된 하루',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (index == 3) {
            List<Todo> done = todos.where((element) {
              return element.done == 1;
            }).toList();

            return Container(
              child: Column(
                children: List.generate(
                  done.length,
                  (index) {
                    Todo t = done[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(t.color),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                t.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                t.done == 0 ? '미완료' : '완료',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 8,
                          ),
                          Text(
                            t.memo,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }
          return Container();
        },
        itemCount: 4,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          Todo todo = await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TodoWritePage(
              todo: Todo(
                title: '',
                memo: '',
                category: '',
                color: 0,
                done: 0,
                date: Utils.getFormatTime(DateTime.now()),
              ),
            ),
          ));
          setState(() {
            todos.add(todo);
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.today_outlined),
            label: '오늘',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: '기록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: '더보기',
          ),
        ],
      ),
    );
  }
}
