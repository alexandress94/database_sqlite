import 'package:database_sqlite/app/modules/initial/initial_binding.dart';
import 'package:database_sqlite/app/modules/initial/initial_page.dart';
import 'package:get/get.dart';
import 'routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL_PAGE,
      page: () => InitialPage(),
      binding: InitialBinding(),
    ),
  ];
}
