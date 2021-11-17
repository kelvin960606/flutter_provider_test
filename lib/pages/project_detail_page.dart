import 'package:flutter/material.dart';
import 'package:flutter_with_provider/constants/value.dart';
import 'package:get/get.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '项目: ' + Get.arguments,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              '服务',
              style:
                  Theme.of(context).textTheme.caption?.copyWith(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CDN'),
                Text('阿里云'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CDN'),
                Text('阿里云'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CDN'),
                Text('阿里云'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CDN'),
                Text('阿里云'),
              ],
            ),
            Text(
              '花费',
              style:
                  Theme.of(context).textTheme.caption?.copyWith(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CDN'),
                Text('¥100'),
              ],
            ),
            Text(
              '域名',
              style:
                  Theme.of(context).textTheme.caption?.copyWith(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('bole.com'),
                Text('Name.com'),
              ],
            ),
            Text(
              '服务器',
              style:
                  Theme.of(context).textTheme.caption?.copyWith(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('101.9.10.2'),
                Text('阿里云'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
