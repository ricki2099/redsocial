
import 'package:flutter/material.dart';
import 'package:redsocial/domain/entities/comment_entity.dart';
import 'package:redsocial/data/remote/comment_provider.dart';
import 'package:redsocial/presentacion/Comment/widgets/list_comment.dart';

class Comment extends StatelessWidget {
  const Comment({
    Key key, 
    @required this.postId
  }) : super(key: key);
  final int postId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back, color: Colors.grey),
        // backgroundColor: Colors.white,
        actions: [
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Icon(Icons.thumb_up),
            ),
        ],
      ),
      body: SafeArea(child: Mio(postId:this.postId)));
  }
}

final TextEditingController _comment =
    TextEditingController(text: '');

class Mio extends StatelessWidget {
  const Mio({
    Key key,
    @required this.postId
  }) : super(key: key);
  final int postId;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2, right: 2, bottom: 4),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Text(' '),
            //     Icon(
            //       Icons.arrow_back,
            //       color: Colors.black,
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       mainAxisSize: MainAxisSize.min,
            //       children: [Icon(
            //         Icons.thumb_up_alt,
            //         color: Colors.grey,
            //       ),]
            //     ),
            //   ],
            // ),
            Container(
              width: 9000,
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 8),
            Expanded(child: ListComments(postId: this.postId)),
            Container(
              width: 9000,
              height: 1,
              color: Colors.grey,
            ),
            Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.photo_camera_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 350,
                      color: Color(0xFFE9ECEF),
                      child: Comentar(),
                    ),
                  ),
                ])
          ],
        ));
  }


}

class Comentar extends StatelessWidget {
  const Comentar({
    Key key,
  }) : super(key: key);
  final postId = 122;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _comment,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.gif_outlined,
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () => _saveComennt(),
                  child: Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                ),
              ]),
        ),
        hintText: 'Escribe un comentario...',
      ),

      // autofocus: true,
    );
  }

  
  _saveComennt() async {
    final provider = new CommentApiProvider();
    CommentEntity comentario = new CommentEntity();
    comentario.body = _comment.text;
    comentario.email = "nelson@yopmail.com";
    comentario.name = "Nelson Londoño";
    comentario.postId = postId;
    provider.postCreateComment(comentario);
  }
}
