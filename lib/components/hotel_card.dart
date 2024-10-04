import 'package:trial/components/favourite_icon_button.dart';
import 'package:flutter/material.dart';
import 'blurred_card.dart';

class HotelCard extends StatelessWidget {
  final String hotel1Path;
  final String placeName;
  final String countryName;
  final double rating;
  final int price;
  final int distance;
  final int available;
  final String hotelName;

  const HotelCard({
    super.key,
    required this.hotel1Path,
    required this.placeName,
    required this.countryName,
    required this.rating,
    required this.price,
    required this.distance,
    required this.available,
    required this.hotelName,});

  @override
  Widget build(BuildContext context) {
    return Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(hotel1Path), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.star, color: Colors.purple, size: 15,),
                Text("$rating", style: TextStyle(color: Colors.white),)
              ],
            ),  Row(
              children: [
                FavoriteIconButton(),
                // IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline_outlined, color: Colors.white),),
                SizedBox(width: 10,),
              ],
            ),
              ],),
            Positioned(
              bottom: -80,
              left: 7,
              right: 7,
              child: BlurredCard(
                tHeight: 130,
                tWidth: 350,
                tChild: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 15),
                        Text("$hotelName, $placeName", style: TextStyle(color: Colors.white,fontSize: 25)),
                      ],
                    ),
                    SizedBox(height:30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("COST", style: TextStyle(color: Colors.grey,)),
                            Text("\$ $price CAD/night", style: TextStyle(color: Colors.white))
                          ],
                        ),
                        // VerticalDivider(
                        //   color: Colors.grey,
                        //   thickness:0.8,
                        //   width: 20,
                        // ),
                        Column(
                          children: [
                            Text("MAPS", style: TextStyle(color: Colors.grey,)),
                            Row(children: [
                              Icon(Icons.pin_drop, color: Colors.purple, size: 12,),
                              Text("$distance Km away CAD/night", style: TextStyle(color: Colors.white))
                            ],),
                          ],
                        ),
                        // VerticalDivider(
                        //   color: Colors.grey[400],
                        //   thickness: 0.8,
                        //   width: 20,
                        // ),
                        Column(
                          children: [
                            Text("AVAILABLE", style: TextStyle(color: Colors.grey,)),
                            Row(children: [
                              Text("$available ", style: TextStyle(color: Colors.purple)),
                              Text("left", style: TextStyle(color: Colors.white))
                            ],),
                          ],
                        ),
                      ],),
                  ],
                ),
              ),
            ),
          ],
      );
  }
}
