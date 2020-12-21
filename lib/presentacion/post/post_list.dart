import 'package:flutter/material.dart';
import 'package:redsocial/data/remote/post_api.dart';
import 'package:redsocial/domain/entities/post_entity.dart';
import 'package:redsocial/presentacion/post/widgets/card_widget.dart';

class PostList extends StatelessWidget {
  final postApi = new PostListApi();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            height: 50.0,
            child: TabBar(
              labelPadding: EdgeInsets.only(left: 1.0, right: 1.0),
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.blue,
              tabs: [
                Text('Inicio', style: TextStyle(fontSize: 10.0)),
                Text('Opiniones', style: TextStyle(fontSize: 10.0)),
                Text('Información', style: TextStyle(fontSize: 10.0)),
                Text('Videos', style: TextStyle(fontSize: 10.0)),
                Text('Fotos', style: TextStyle(fontSize: 10.0)),
                Text('En vivo', style: TextStyle(fontSize: 10.0)),
              ],
            ),
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
            Text('Aqui va el contenido de Información'),
            Text('Aqui va el contenido de Videos'),
            Text('Aqui va el contenido de Fotos'),
            Text('Aqui va el contenido de En vivo'),
          ],
        ),
      ),
    );
  }
}
