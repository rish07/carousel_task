import 'package:flutter/material.dart';
import 'package:temp/sample_class.dart';
import 'package:temp/stacked_widget.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<String> imageData = [
    "https://frontrow-prod.s3.ap-south-1.amazonaws.com/public/interview_question/card-1.png",
    "https://frontrow-prod.s3.ap-south-1.amazonaws.com/public/interview_question/card-2.png",
    "https://frontrow-prod.s3.ap-south-1.amazonaws.com/public/interview_question/card-3.png"
  ];

  List<String> avatarImage = [
    "https://frontrow-prod.s3.ap-south-1.amazonaws.com/public/interview_question/a.png",
    "https://frontrow-prod.s3.ap-south-1.amazonaws.com/public/interview_question/gr.png",
    "https://frontrow-prod.s3.ap-south-1.amazonaws.com/public/interview_question/b.png",
    "https://frontrow-prod.s3.ap-south-1.amazonaws.com/public/interview_question/s.png"
  ];

  List<SampleData> data = [];
  @override
  void initState() {
    for (int i = 100; i > 0; i--) {
      data.add(
        SampleData(
          imageUrl: imageData[i % 3],
          date: "23rd July, 2021",
          avatars: i - 1 > 10
              ? List.generate(
                  10,
                  (index) => Avatar(imageUrl: avatarImage[index % 4]),
                )
              : List.generate(
                  i - 1,
                  (index) => Avatar(
                    imageUrl: avatarImage[index % 4],
                  ),
                ),
          numberOfPeople: i - 1,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            List<Widget> items = [];
            for (int i = 0; i < data[index].avatars.length; i++) {
              items.add(
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      NetworkImage(data[index].avatars[i].imageUrl),
                ),
              );
            }
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    data[index].imageUrl,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Colors.black.withOpacity(0.45),
                              ),
                              child: Text(
                                "${data[index].numberOfPeople} participating",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            StackedWidget(widgets: items),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.4,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.black.withOpacity(0.45),
                          ),
                          child: Text(
                            "Ends: ${data[index].date}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Write your joke...",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
