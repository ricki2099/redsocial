import 'package:flutter/material.dart';
import 'package:redsocial/domain/entities/comment_entity.dart';
import 'package:redsocial/data/remote/comment_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'list_item_comment.dart';

class ListComments extends StatelessWidget {
  const ListComments({Key key, @required this.postId}) : super(key: key);
  final int postId;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<CommentEntity>>(
        future: CommentApiProvider().getCommentsPost(postId: this.postId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final List<CommentEntity> comment = snapshot.data;
          if (snapshot.hasData) {
            print(comment);
            if (comment.length == 0) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Todavía no hay comentarios.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    'Se el primero en comentar.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontStyle: FontStyle.normal),
                  ),
                ],
              ));
            }
            return ListView.builder(
              itemCount: comment.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return ListItemComment(comment: comment[index]);
              },
            );
          }
          // else {

          return Center(
              child: SpinKitRipple(
            color: Colors.black,
          ));
        },
      ),
    );
  }
}
