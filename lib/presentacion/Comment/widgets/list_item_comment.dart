import 'package:flutter/material.dart';
import 'package:redsocial/domain/entities/comment_entity.dart';

class ListItemComment extends StatelessWidget {
  const ListItemComment({
    Key key,
    @required this.comment,
  }) : super(key: key);

  final CommentEntity comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Row(
        children: [
          Container(
            width: 40,
            padding: EdgeInsets.only(bottom: 45),
            child: Image.network(
                'https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_1280.png'),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: 210,
                // alignment: AlignmentDirectional.,
                decoration: BoxDecoration(
                    color: Color(0xFFE9ECEF),
                    borderRadius: BorderRadius.circular(10.0)),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      comment.body,
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
              Container(
                width: 210,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('11h', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Me gusta',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Responder',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
