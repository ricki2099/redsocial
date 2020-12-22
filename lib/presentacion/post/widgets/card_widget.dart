import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redsocial/data/remote/comment_provider.dart';
import 'package:redsocial/data/remote/user_api.dart';
import 'package:redsocial/domain/entities/post_entity.dart';
import 'package:redsocial/presentacion/Comment/comment.dart';

class CardWidget extends StatelessWidget {
  final PostEntity post;
  CardWidget({@required this.post});
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMM. ').format(post.createdAt);
    return Card(
      elevation: 10.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://png.pngtree.com/png-vector/20190629/ourlarge/pngtree-business-people-avatar-icon-user-profile-free-vector-png-image_1527664.jpg',
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FutureBuilder<String>(
                                  future: UserApi()
                                      .getUserNameById(userId: post.userId),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text('${snapshot.data}');
                                    } else {
                                      return Text('Usuario...');
                                    }
                                  },
                                ),
                                Icon(Icons.more_horiz),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  formattedDate,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                Icon(
                                  Icons.public,
                                  size: 12.0,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('${post.body}'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up_alt,
                          color: Colors.blue,
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text('4', style: TextStyle(fontSize: 14.0)),
                      ],
                    ),
                    FutureBuilder<int>(
                      future: CommentApiProvider()
                          .getTotalCommentsPost(postId: post.id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text('${snapshot.data} comentarios');
                        } else {
                          return Text('Cargando comentarios...');
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 15.0,
            thickness: 1.0,
            indent: 7.0,
            endIndent: 7.0,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Me gusta',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => _goToComments(context, this.post.id),
                  child: Row(
                    children: [
                      Icon(
                        Icons.comment_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Comentar',
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Compartir',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _goToComments(context, postId) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Comment(
          postId: postId,
        ),
      ),
    );
  }
}
