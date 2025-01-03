import 'package:flutter/material.dart';
import 'package:flutter_model_view/screens/flutter_3d_controller.dart';
import 'package:flutter_model_view/screens/model_viewer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Flutter 3D Model View",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 1.0,
          bottom: TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Column(
                children: [
                  Tab(
                    icon: Icon(
                      Icons.view_in_ar,
                    ),
                  ),
                  Text(
                    "Model Viewer",
                  )
                ],
              ),
              Column(
                children: [
                  Tab(
                    icon: Icon(
                      Icons.camera_enhance,
                    ),
                  ),
                  Text(
                    "Flutter Controller",
                  )
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Model3DViewer(),
            Flutter3dController(),
          ],
        ),
      ),
    );
  }
}
