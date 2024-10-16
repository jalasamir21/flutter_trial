import 'package:flutter/material.dart';
import 'package:trial/components/blurred_card.dart';
import 'package:trial/components/cards.dart';
import 'package:trial/components/build_categories.dart';
import 'package:trial/components/gradient_color.dart';
import 'package:trial/components/build_categories.dart';
import 'package:trial/components/place_details.dart';
import 'package:trial/components/scrolls_view.dart';

class HomeView extends StatefulWidget {


  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientColor(),
          Column(
            children: [
              SizedBox(width: 50),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(20.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Location",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.8,
                indent: 0,
                endIndent: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.purple, size: 30),
                          SizedBox(width: 5),
                          Text("New York, USA",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )),
                  SizedBox(width: 80),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notification_add_rounded, color: Colors.purple, size: 30),

                  )
                ],
              ),
              SizedBox(height: 17),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 20),
                  Container(
                      width: 310,
                      decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          border: Border.all(color: Color(0xFFD8D0D0), width: 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: IconButton(
                        alignment: Alignment.topLeft,
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(),
                          );
                        },
                        icon: const Icon(Icons.search, color: Colors.purple),
                      )),
                  SizedBox(width: 5),
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.purple,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      iconSize: 32,
                      icon: const Icon(Icons.filter_list),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Categories",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  SizedBox(width: 60),
                  InkWell(
                    onTap: (){},
                    child: Text("See All",
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                  ),
                ],
              ),

              SizedBox(height: 20),
              BuildCategories(),
              ScrollsView(),
              SizedBox(height:30),
              PlaceDetails( countryName: "USA", rating: 5, description:"The United States of America, often referred to as the USA, is a vast and diverse country located in North America. Known for its iconic cities like New York, Los Angeles, the USA is home to a wide range of landscapes. ")
            ],
          ),
        ],
      ),
      bottomNavigationBar: BlurredCard(
        tHeight: 60,
        tWidth: 500,
        tChild: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Location',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}


class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms=[
    'Canada',
    'Usa',
    'Germany',
    'France',
    'Japan',
    'United Kingdom',
    'Australia',
    'Egypt',
    'China',
    'India',
    'Indonesia',
    'Philippines',
    'Thailand',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color:Colors.purple),
        onPressed: (){
          query ='';
        },
      ),
    ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.purple,),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in searchTerms){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in searchTerms){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
  }


