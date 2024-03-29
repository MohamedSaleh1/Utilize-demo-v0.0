import 'package:flutter/material.dart';
import 'pages.dart';
import 'package:travel_budget/views/home_view.dart';
import 'package:travel_budget/views/new_trips/location_view.dart';
import 'package:travel_budget/models/Trip.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeView(),
    ExplorePage(),
    PastTripsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final newTrip = new Trip(null, null, null, null, null);
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Budget App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewTripLocationView(trip: newTrip,)),
              );
            },
          )
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.explore),
              title: new Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.history),
              title: new Text("Past Trips"),
            ),
          ]
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}