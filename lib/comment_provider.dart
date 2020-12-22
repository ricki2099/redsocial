import 'package:redsocial/comment_entity.dart';
import 'package:redsocial/http_manager.dart';

class CommentApiProvider {
  final HttpManager httpManager = HttpManager();

  Future<List<CommentEntity>> getCommentsPost({int postId}) async {
    var response =
        await httpManager.get('posts/' + postId.toString() + '/comments');
    // print(response);
    final responseJson = CommentEntity.fromJSONList(response['data']);
    return responseJson;
  }

  Future<bool> postCreateComment(CommentEntity comment) async {
    var response = await httpManager.post(
        'posts/' + comment.postId.toString() + '/comments', comment.toJson());
    print(response);
    var respuesta = false;
    if (response.data) {
      respuesta = true;
    }
    return respuesta;
  }
}
