import 'package:get/get.dart';
import 'package:promptme/core/Routes/route.dart';
import 'package:promptme/view/projects/export_projects.dart';
import 'package:promptme/view/projects/prepare/export_start.dart';
import 'package:promptme/view/projects/start/export_start.dart';

class Nav {
  static List<GetPage<dynamic>> routes = [
    GetPage(
      title: 'projects',
      name: Routes.projects,
      page: () => const ProjectsPage(),
      binding: ProjectsControllerBinding(),
      children: [
        GetPage(
          title: 'start',
          name: Routes.start,
          page: () => const StartPage(),
          binding: StartControllerBinding(),
        ),
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
