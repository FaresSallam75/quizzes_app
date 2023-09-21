import 'package:first/apilinks.dart';
import 'package:first/core/class/crud.dart';

class QuestionData {
  Crud crud;
  QuestionData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.view, {});
    return response.fold((l) => l, (r) => r);
  }
}
