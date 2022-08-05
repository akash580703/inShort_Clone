import 'package:flutter/material.dart';
import 'package:news99/screens/home.dart';


class BasicSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.red,
              expandedHeight: 200,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://source.unsplash.com/random?monochromatic+dark',
                  fit: BoxFit.cover,
                ),
                title: Text('Flexible Title'),
                centerTitle: true,
              ),
              //title: Text('My App Bar'),
              leading: Icon(Icons.arrow_back),
              actions: [
                Icon(Icons.settings),
                SizedBox(width: 12),
              ],
            ),
            // HomeScreenState(key: key,).buildList(),
          ],
        ),
      );


}
