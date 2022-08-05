import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news99/screens/firestore/data.dart';
import 'package:news99/screens/firestore/news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
        title: "ListView.builder",
        theme: ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        // home : new ListViewBuilder(),  NO Need To Use Unnecessary New Keyword
        home: HomeScreenState());
  }
}

class HomeScreenState extends StatefulWidget {
  HomeScreenState({Key? key}) : super(key: key);

  @override
  State<HomeScreenState> createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreenState> {
  int? idx = null;
  String? head;
  String? bod;

  _HomeScreenStateState();

  Stream<List<Data>> get categoriesStream {
    final CollectionReference collection =
        FirebaseFirestore.instance.collection('news99');
    return collection
        .orderBy('name')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((DocumentSnapshot documentSnapshot) {
        return Data.fromJson(
          id: documentSnapshot.id,
          json: documentSnapshot.data() as Map<String, dynamic>,
        );
      }).toList();
    });
  }

  // @override
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: Color.fromARGB(0, 191, 63, 63),
          child: CustomScrollView(
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
                actions: const [
                  Icon(Icons.settings),
                  SizedBox(width: 12),
                ],
              ),
              StreamBuilder<List<Data>>(
                stream: categoriesStream,
                builder: (context, AsyncSnapshot<List<Data>> snapshot) {
                  final categories = snapshot.data;
                  print(
                      "KFHBSLKNDLSNKDNSLDNSLDNLDNSBDKS DSDSKDKSBDSBDKBSDNSDJ");
                  print(categories?.length);
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        // return ListTile(
                        //   title: Text(categories![index].name.toString()),
                        // );

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              idx = index;
                              head = categories![index].name.toString();
                              bod = categories[index].id.toString();
                            });

                            print(categories![index].name.toString());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => News(
                                      heading:
                                          categories[index].name.toString(),
                                      body: categories[index].id.toString(),
                                      item:categories[index]),
                                      ),
                            );
                            // News.news( context,categories[index].name.toString(),categories[index].id.toString());
                            // This Will Call When User Click On ListView Item
                          },
                          // Card Which Holds Layout Of ListView Item
                          child: Card(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: Container(
                                    child: Hero(
                                      tag: categories![index],
                                      child: Image.network(
                                        'https://source.unsplash.com/random?monochromatic+dark',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        categories[index].name.toString(),
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 100,
                                        child: Text(
                                          categories[index].name.toString(),
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[500]),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                        //
                      },
                      childCount: snapshot.hasData ? categories?.length : 0,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );

  // @override
  Widget buildList(BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
    final categories = snapshot.data;

    // carder(context),

    //  Positioned(
    // top: 250.0,
    //           left: 20.0,
    //           right:0.0,
    //            bottom:0.0,

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          _buildCategoryItem(context, categories![index]),
      itemCount: categories?.length,

// )
    );
  }

  // Widget buildImages() => SliverToBoxAdapter(
  Widget _buildCategoryItem(BuildContext context, Data category) {
    return GestureDetector(
      onTap: () {
        // This Will Call When User Click On ListView Item
      },
      // Card Which Holds Layout Of ListView Item
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    category.name,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      category.id,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
          ],
        ),
      );
}
