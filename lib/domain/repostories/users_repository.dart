import 'package:redsocial/data/remote/users_api.dart';
import 'package:redsocial/domain/entities/users.model.dart';

class UsersRepository {

  Future<List<UsersModel>> getLogin(String email, String password) async {
    UsersAPI api = UsersAPI();
    return await api.getLogin(email, password);
  }

  Future<UsersModel> createUsers(UsersModel model) async {
    UsersAPI api = UsersAPI();
    return await api.createUsers(model);
  }

}