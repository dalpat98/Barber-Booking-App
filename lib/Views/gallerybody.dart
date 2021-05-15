import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  List<Widget> models;

  List<String> url = [
    'https://images.pexels.com/photos/792381/pexels-photo-792381.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/227675/pexels-photo-227675.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/1193743/pexels-photo-1193743.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/1149831/pexels-photo-1149831.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/556667/pexels-photo-556667.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/1413412/pexels-photo-1413412.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/459225/pexels-photo-459225.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/853168/pexels-photo-853168.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/220201/pexels-photo-220201.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/1939485/pexels-photo-1939485.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/1008155/pexels-photo-1008155.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/853199/pexels-photo-853199.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/278887/pexels-photo-278887.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800'
  ];
  Widget model(int i) {
    //return Stack(
      //children: <Widget>[
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: url[i],
            height: 85,
            width: 85,
            fit: BoxFit.cover,
          ),
        );
        // Container(
        //   height: 80,
        //   width: 80,
        //   decoration: BoxDecoration(
        //     color: Colors.black26,
        //     borderRadius: BorderRadius.circular(8),
        //   ),
        // ),
        // Container(
        //   height: 80,
        //   width: 80,
        //   alignment: Alignment.center,
        //   child: Text(
        //     names[i],
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 20,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ),
      //],
    //);
  }
}

class GalleryBody extends StatefulWidget {
  @override
  _GalleryBodyState createState() => _GalleryBodyState();
}

class _GalleryBodyState extends State<GalleryBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black12,
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          childAspectRatio:1.1,
          crossAxisCount: 3,
          padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
          // Generate 100 widgets that display their index in the List.
          children: List.generate(14, (index) {
            return Center(child: CategoryModel().model(index));
          }),
        ),
      );
    
  }
}
