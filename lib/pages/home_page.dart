import 'package:flutter/material.dart';
import 'package:flutter_with_provider/components/page_container.dart';
import 'package:flutter_with_provider/constants/value.dart';
import 'package:flutter_with_provider/providers/auth_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _logoutPressed() {
    Provider.of<AuthProvider>(context, listen: false).logout();
  }

  @override
  Widget build(BuildContext context) {
    const projects = [
      {
        "title": '博乐',
        "amount": '¥ 100',
      },
      {
        "title": 'T9',
        "amount": '¥ 160',
      },
      {
        "title": '发发',
        "amount": '¥ 1000',
      },
      {
        "title": '发发',
        "amount": '¥ 1000',
      },
      {
        "title": '发发',
        "amount": '¥ 1000',
      }
    ];
    return PageContainer(
      loading: Provider.of<AuthProvider>(context).isLoginLoading,
      doubleClickExit: true,
      child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '项目管理',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    InkWell(
                      onTap: _logoutPressed,
                      child: Icon(
                        Icons.logout,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: projects.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: defaultPadding,
                    mainAxisSpacing: defaultPadding,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) => ProjectCard(
                      title: projects[index]['title']!,
                      amount: projects[index]['amount']!),
                ),
              ],
            ),
          )),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String amount;

  const ProjectCard({
    Key? key,
    this.title = '',
    this.amount = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed('/projectDetail', arguments: title);
          // onClick(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  Theme.of(context).textTheme.caption?.copyWith(fontSize: 20),
            ),
            Text(
              amount,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
