import 'package:flutter/material.dart';
import 'package:job_app/class_providers/jobdata.dart';
import 'package:job_app/screens/screens.dart';
import 'package:job_app/widgets/widgets.dart';
import 'package:job_app/components/components.dart';
import 'package:provider/provider.dart';

import '../class_providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);


  // @override
  // initState(){
  //   super.initState();
  //
  // }

  @override
  Widget build(BuildContext context) {
    context.read<JobData>().getData;
    context.read<JobData>().getRecentPost;
    context.read<JobData>().getJobFilter;
    return Scaffold(
      body: Consumer<JobData>(builder: (context, jobData, child) => Container(
          child: (jobData.jobData.isEmpty && !jobData.error)
              ? const Center(child: CircularProgressIndicator())
              : jobData.error
                  ? text(40, TextAlign.center, true, jobData.errorMessage,
                      FontWeight.w600)
                  : ListView(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 44,
                                    width: 44,
                                    child: Image.asset('assets/icons/menu_button.png')
                                  ),
                                  CircleAvatar(
                                    backgroundImage: AssetImage(Provider.of<UserProvider>(context).userInformation[0].imgUrl),
                                    radius: 23.0,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20.0),
                              child: TopSearchBar(data: jobData.jobFilter),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 20.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  text(20, TextAlign.center, false, 'Popular Job',
                                      FontWeight.w600),
                                  text(12, TextAlign.center, false, 'Show All'),
                                ],
                              ),
                            ),
                            const FilterResultScreen(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  text(20, TextAlign.center, false, 'Recent Post',
                                      FontWeight.w600),
                                  InkWell(
                                    child: text(
                                        12, TextAlign.center, false, 'Show All'),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RecentPostScreen(data: jobData,),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            (jobData.recentPost.isEmpty && !jobData.error)
                                ? const Center(child: CircularProgressIndicator())
                                : jobData.error
                                    ? text(40, TextAlign.center, true,
                                        jobData.errorMessage, FontWeight.w600)
                                    : RecentPost(data: jobData.recentPost,),
                          ],
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
