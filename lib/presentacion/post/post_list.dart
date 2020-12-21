import 'package:flutter/material.dart';
import 'package:redsocial/data/remote/post_api.dart';
import 'package:redsocial/domain/entities/post_entity.dart';
import 'package:redsocial/presentacion/post/widgets/card_widget.dart';
import 'package:redsocial/presentacion/product/product.dart';

class PostList extends StatelessWidget {
  final postApi = new PostListApi();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back, color: Colors.white),
          title: Container(
            alignment: Alignment.centerLeft,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(width: 1, color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(width: 1, color: Colors.blue),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                contentPadding: EdgeInsets.all(5.0),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Icon(Icons.redo),
            ),
          ],
          bottom: TabBar(
            // // labelPadding: EdgeInsets.only(left: 1.0, right: 1.0),
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.video_library)),
              Tab(icon: Icon(Icons.shopping_cart)),
              Tab(icon: Icon(Icons.videogame_asset_outlined)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.menu)),
              // Text('Opiniones', style: TextStyle(fontSize: 10.0)),
              // // Text('Información', style: TextStyle(fontSize: 10.0)),
              // Text('Videos', style: TextStyle(fontSize: 10.0)),
              // Text('Fotos', style: TextStyle(fontSize: 10.0)),
              // Text('En vivo', style: TextStyle(fontSize: 10.0)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: postApi.getPostList(),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<PostEntity>> snapshot,
              ) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (countext, i) {
                      return CardWidget(post: snapshot.data[i]);
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  );
                }
              },
            ),
            Text('Aqui va el contenido de Opciones'),
            ProductsPage(),
            Text('Aqui va el contenido de Información'),
            // Text('Aqui va el contenido de Videos'),
            Text('Aqui va el contenido de Fotos'),
            Text('Aqui va el contenido de En vivo'),
          ],
        ),
      ),
    );
  }
}
