import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  
  static String routeName = 'homeScreen';

  @override
  _HomePagePage createState() => _HomePagePage();
}

class _HomePagePage extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  String title = "Home";  

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple,
            brightness: Brightness.light,
            accentColor: Colors.red),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: new Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
          ),
          body: TabBarView(
            children: <Widget>[
              FirstTab(),
              MyBody("Page Two"),
              MyBody("Page Three")
            ],
            controller: tabController,
          ),
          bottomNavigationBar: Material(
            color: Colors.purple,
            child: TabBar(
              onTap: (indedx) {
                if (indedx == 0) {
                  setState(() {
                    title = "Home";
                  });
                } else if (indedx == 1) {
                  setState(() {
                    title = "Tab Two";
                  });
                } else if (indedx == 2) {
                  setState(() {
                    title = "Tab Three";
                  });
                }
              },
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.favorite_border),
                  text: "ONE",
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  text: "TWO",
                ),
                Tab(
                  icon: Icon(Icons.add_box),
                  text: "THREE",
                ),
              ],
              controller: tabController,
            ),
          ),
        ));
  }
}

class FirstTab extends StatefulWidget {
  @override
  FirstTabState createState() => FirstTabState();
}

class FirstTabState extends State<FirstTab>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            height: 50.0,
            child: new TabBar(
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.blue,
              tabs: [
                Tab(
                  text: "ONE",
                ),
                Tab(
                  text: "TWO",
                ),
                Tab(
                  text: "THREE",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Text("TAB ONE CONTENT"),
            Text("TAB TWO CONTENT"),
            Text("TAB THREE CONTENT"),
          ],
        ),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  final String title;

  MyBody(this.title);

  final mySnackBar = SnackBar(
    content: Text(
      "Hello There!",
      style: TextStyle(color: Colors.white),
    ),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text(title + "  Click me"),
              onPressed: () => {Scaffold.of(context).showSnackBar(mySnackBar)}),
        ],
      ),
    );
  }
}
