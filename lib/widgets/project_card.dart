import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/main.dart';
import 'package:nexsync/models/employee_model.dart';
import 'package:nexsync/models/project_details.dart';
import 'package:nexsync/router/app_router_constants.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.projectDetails});
  final ProjectDetails projectDetails;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pushNamed(AppRouterConstants.insideProject,
              extra: widget.projectDetails);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.adaptiveSize(10)),
          ),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                  height: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: widget.projectDetails.backgroundImage,
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(context.adaptiveSize(10)),
                      topRight: Radius.circular(context.adaptiveSize(10)),
                    ),
                  )),
              Container(
                height: 1,
                color: Colors.black,
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Department Head: ${widget.projectDetails.departmentHead}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: context.adaptiveSize(20),
                            ),
                          ),
                          Text(
                              "Department: ${widget.projectDetails.department}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: context.adaptiveSize(20))),
                          Text(
                            "Project Name: ${widget.projectDetails.projectName}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: context.adaptiveSize(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
