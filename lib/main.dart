import 'package:center/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:center/LogOn.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(myapp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  List number = [1, 2, 3, 4];
  List emp = ['osama', 'ahmed', 'ali', 'asem'];
  List part = ['SE', 'IT', "CNM", 'SE'];
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: number.length,
        itemBuilder: (context, i) {
          return Container(
              child: Card(
            child: ListTile(
              leading: Text('${number[i]}'),
              title: Text(emp[i]),
              subtitle: Text(part[i]),
              trailing: Text('2022'),
            ),
          ));
        },
      ),
    ));
  }
}

class myapp extends StatefulWidget {
  const myapp({super.key});
  State<myapp> createState() => _myappful();
}

class _myappful extends State<myapp> with SingleTickerProviderStateMixin {
  bool login=false;
 late  SharedPreferences sharedPreferencesLogin;
@override
void isLogin() async{
  sharedPreferencesLogin =await SharedPreferences.getInstance();

  if( await sharedPreferencesLogin!.getBool('islog')==null){
    print('ok');
    await sharedPreferencesLogin!.setBool('islog',false);

}login  =await sharedPreferencesLogin!.getBool('islog')!;
setState(() {
  login  =login;
  print(login);
}
);

}
  void initState() {
    isLogin();
    super.initState();
}



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        fontFamily: 'GoogleSansCode',

      ),
      home: login ? HomePage() : LogOn()
    );
  }
}

class ListTileshort extends StatelessWidget {
  String? Name;
  String? Part;
  String? Date;
  String? NameImage;
  ListTileshort({super.key, this.Name, this.Part, this.Date, this.NameImage});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Card(
          child: ListTile(
            leading: Image.asset(
              'Image/$NameImage',
              fit: BoxFit.cover,
            ),
            title: Text('ENG\\$Name'),
            subtitle: Text('The Work :$Part'),
            trailing: Text('$Date'),
            tileColor: Colors.white30,
          ),
        ))
      ],
    );
  }
}

class Myapp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  int numb = 0;
  List number = [1, 2, 3, 4];
  List emp = ['osama', 'ahmed', 'ali', 'asem'];
  List part = ['SE', 'IT', "CNM", 'SE'];
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                numb++;
              },
              child: Icon(Icons.add),
            ),
            appBar: AppBar(),
            body: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 3),
                  borderRadius: BorderRadius.circular(3)),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          border: Border.all(color: Colors.black87, width: 2),
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        "$numb",
                        style: TextStyle(),
                      )),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          border: Border.all(color: Colors.black54, width: 3)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star)
                            ],
                          ),
                          Text('osama')
                        ],
                      )),
                  Container(
                    child: Row(
                      children: [
                        Column(
                          children: [],
                        )
                      ],
                    ),
                  ),
                  Container(
                      width: 500,
                      alignment: Alignment.center,
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.tealAccent[300],
                        textColor: Colors.cyan,
                        minWidth: 70,
                        child: Row(
                            children: [Icon(Icons.add_call), Text('Add Call')]),
                      )),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add_a_photo))
                ],
              ),
            )));
  }
}
