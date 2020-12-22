import 'package:redsocial/data/manager/http_manager.dart';
import 'package:redsocial/domain/entities/comment_entity.dart';

class CommentApiProvider {
  final HttpManager httpManager = HttpManager();

  Future<List<CommentEntity>> getCommentsPost({int postId}) async {
    var response =
        await httpManager.get('posts/' + postId.toString() + '/comments');
    final responseJson = CommentEntity.fromJSONList(response['data']);
    return responseJson;
  }

  Future<int> getTotalCommentsPost({int postId}) async {
    var response =
        await httpManager.get('posts/' + postId.toString() + '/comments');
    final responseJson = response['meta'];
    var total = responseJson["pagination"];
    return total["total"];
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
