import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Package Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PackageScreen(),
    );
  }
}

class PackageScreen extends StatefulWidget {
  const PackageScreen({Key? key}) : super(key: key);

  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  PackageInfo packageInfo = PackageInfo(
      appName: "appName",
      packageName: "packageName",
      version: "version",
      buildNumber: "buildNumber");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Package Info"),
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              SizedBox(
                height: 20,
              ),
              Card(
                color: Colors.grey,
                child: Center(
                  child: Text(
                    "App Name" + " : " + packageInfo.appName,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Package name" + " : " + packageInfo.packageName),
              Text("App version" + " : " + packageInfo.version),
              Text("Build number" + " : " + packageInfo.buildNumber),
              Text("Build signature" + " : " + packageInfo.buildSignature),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: refreshData,
          child: Icon(Icons.refresh),
        ));
  }

  Future<void> refreshData() async {
    packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = packageInfo;
    });
  }
}
