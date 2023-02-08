
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_get_reverpod/model/model.dart';
import 'package:http_get_reverpod/service/swervice.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async{
  return ref.watch(userProvider).getUsers();
});