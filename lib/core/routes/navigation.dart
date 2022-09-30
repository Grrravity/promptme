import 'package:get/get.dart';
import 'package:promptme/core/Routes/route.dart';
import 'package:promptme/view/projects/export_projects.dart';
import 'package:promptme/view/projects/prepare/export_prepare.dart';

class Nav {
  static List<GetPage<dynamic>> routes = [
    GetPage(
      title: 'projects',
      name: Routes.projects,
      page: () => const ProjectsPage(),
      binding: ProjectsControllerBinding(),
      children: [
        GetPage(
          title: 'prepare',
          name: Routes.prepare,
          page: () => const PreparePage(),
          binding: PrepareControllerBinding(),
        ),
      ],
    ),
  ];
}
