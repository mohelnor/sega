import 'package:get/get.dart';

import 'const.dart';

class DbProvider extends GetConnect {
  Future<Response> fetch(Map data) => post('${myUrl}select/', data);
  Future<Response> add(Map data) => post('${myUrl}insert/', data);
  Future<Response> edit(Map data) => post('${myUrl}update/', data);
  Future<Response> remove(Map data) => post('${myUrl}delete/', data);
  Future<Response> queryData(Map data) => post('${myUrl}query/', data);
}
