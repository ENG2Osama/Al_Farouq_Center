import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:center/LogOn.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return homepage();

  }

}

class homepage extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController? tabControl;
  int indexSelect = 0;
  GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();
 late SharedPreferences sharedPreferencesLogin;
 String? UserName;
 String? Email;
 void initSharedPreferences() async{
    sharedPreferencesLogin=await SharedPreferences.getInstance();
    UserName=await sharedPreferencesLogin.getString('UserName');
    Email=await sharedPreferencesLogin.getString('Email');

 }
  @override
  void initState() {
   initSharedPreferences();

    tabControl =
        TabController(length: 3, vsync: this, initialIndex: indexSelect);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKey,

      appBar: AppBar(

        title: Text(
          'Home Page',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),

        bottom: TabBar(
          controller: tabControl,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          labelStyle: TextStyle(fontSize: 17),
          unselectedLabelStyle: TextStyle(fontSize: 13),
          indicatorColor: Colors.blueAccent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          tabs: [
            Tab(
              text: 'Main',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'About Me',
              icon: Icon(Icons.help_outline),
            ),
            Tab(
              text: 'Log out',
              icon: Icon(Icons.exit_to_app),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          PopupMenuButton(  onSelected: (val){
            if(val==1)
              print('Setting');//new Page
            else  print('Help');
          },
              onOpened: (){

              },
              onCanceled: (){

              },iconColor: Colors.white,
              color: Colors.grey[200],
              iconSize: 25,


              itemBuilder:(context)=>
        [PopupMenuItem(child: Text('Setting',style: TextStyle(fontSize: 19,),),
        onTap: (){

        },value: 1,),
    PopupMenuItem(child: Text('Help'),onTap: (){

    },value: 2,)

         ]),
        ],

      ),

      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 110,
              width: 230,
              color: Colors.blue[50],
              child: ListTile(
                tileColor: Colors.blue[100],
                title: Text('${UserName}'),
                subtitle: Text('${Email}'),
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      'Image/osan.jpg',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              color: Colors.white,
              child: ListTile(
                title: Text('Main'),
                leading: Icon(Icons.home),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              color: Colors.white,
              child: ListTile(
                title: Text('Favarites'),
                leading: Icon(Icons.favorite),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              color: Colors.white,
              child: ListTile(
                title: Text('Setting'),
                leading: Icon(Icons.settings),
              ),
            ),
            Divider(
              height: 5,
              color: Colors.blue,
            ),
            Container(
              color: Colors.blue[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.telegram_sharp)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.map)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.maps_ugc)),
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
          child: TabBarView(
        controller: tabControl,
        children: [
          Container(
            child: Column
              (
              children: [ Expanded(child: Texet(3, 'Textth'))],
            ),
          )

        ,
          Text('data'),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 250),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 2, color: Colors.black87),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white10,
                      offset: Offset(10, 0),
                      spreadRadius: 2,
                      blurRadius: 10)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Are you sure you want to log out :',
                      style: TextStyle(fontSize: 23),
                    )),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 35,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(7),
                            border:
                                Border.all(width: 2, color: Colors.white60)),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(7),
                            border:
                                Border.all(width: 2, color: Colors.white60)),
                        child: MaterialButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('warning'),
                                    content: Text('Are you sure :'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LogOn()));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text("Done Sign out"),
                                              action: SnackBarAction(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  HomePage()));
                                                },
                                                label: 'Back',
                                              ),
                                              duration: Duration(seconds: 7),
                                            ));
                                          },
                                          child: Text('Ok')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Cancel'))
                                    ],
                                  );
                                });
                            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LogOn()));
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ])
              ],
            ),
          )
        ],
      )),
    );
  }  int indexOff=1;
  Texet(indexR,Textth){

    return ListView.builder(
        itemCount: indexOff,
        itemBuilder: (context,index){
    return  Container(decoration: BoxDecoration(
      color: Colors.blue[100],
      borderRadius: BorderRadius.circular(10)
    ),
      
          child: MaterialButton(onPressed: (){
        indexR--;
        if(indexR==0)
          setState(() {
            indexOff=0;
          },);
        print(indexOff);
        print(indexR);
      },child: Text("${Textth}"),),);

    });

  }
}
class pageOne extends StatefulWidget{


  @override
  State<pageOne> createState() {
  return _pageone();
  }


}
class _pageone extends   State<pageOne> {
  int indexR=3;
  int? indexOff=1;
  String? Textth;
  _pageone({this.indexR=3,this.Textth});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(onPressed: (){
        indexR--;
        if(indexR==0)
          setState(() {
            indexOff=0;
          },);
      },child: Text("${Textth}"),),
    );

  }

}