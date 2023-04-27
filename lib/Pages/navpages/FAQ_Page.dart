import 'package:flutter/material.dart';
import 'package:newapp/base/BaseState.dart';
import 'package:newapp/common/CommonText.dart';
import 'package:newapp/common/IconTextArrow.dart';
import 'package:newapp/model/HelpPageData.dart';

import '../HelpPageDetails.dart';
import 'QuestionsList.dart';

class FAQPage extends StatefulWidget {
  FAQPage({Key? key}) : super(key: key);

  late VoidCallback onPressed;

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends BaseState<FAQPage> {

  List<HelpPageData> helpPageList = [];

  @override
  void init() {
    _getPages();
  }

  @override
  Widget view() {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Frequently asked questions",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            QuestionsList(
              questionsAndAnswers: const [
                {
                  'question': 'WHY ARE WEEKEND AND MONTH-END PRICES DIFFERENT',
                  'answer':
                  'The quote is calculated based on the availability of slots. Since there is high demand for movement during weekend and month-end, prices are generally high on these days.'
                },
                {
                  'question':
                  'CAN I RESCHEDULE MY MOVEMENT AFTER I HAVE PAID THE TOKEN AMOUNT?',
                  'answer':
                  'You can reschedule your movement by informing your dedicated move manager whose details are included in the confirmation email. Your move manager will reschedule the movement based on the availability of slots'
                },
                {
                  'question':
                  'MY MOVEMENT DATE IS NOT FIXED YET. HOW CAN I BOOK IN ADVANCE?',
                  'answer':
                  'You can notify your dedicated movement manager to reschedule movement upto 2 days before the booked date. Change in movement date is FREE of cost for following categories: weekdays to weekdays, weekend to weekend, weekend to weekdays.'
                },
                {
                  'question':
                  'WILL THE MOVERS AND PACKERS ALSO DISMANTLE BEDS AND OTHER FURNITURE? ',
                  'answer':
                  'Yes, we can dismantle and assemble beds and other furniture without any extra cost. However, you will have to notify your dedicated move manager before movement.'
                },
                {
                  'question':
                  'WE HAVE VERY FEW ITEMS TO MOVE. THE QUOTATION IS VERY COSTLY.',
                  'answer':
                  'Please contact us at +91 1234567890. We can arrange a small transportation for such movements at a lower cost.s'
                },
                {
                  'question':
                  'IS PRELIMINARY INSPECTION REQUIRED BEFORE BOOKING THE MOVEMENT?',
                  'answer':
                  'No, instant quotes are generated as per the apartment size/inventory list, movement date and the movement distance.'
                },
                {
                  'question':
                  'ARE THE PACKING MATERIALS ARE INCLUDED IN THE PACKAGE? ARE THERE ANY HIDDEN CHARGES?',
                  'answer':
                  'Yes, all packing materials and labour cost are provided by the vendor and included in the package.'
                },
                {
                  'question': 'DO YOU PROVIDE INSURANCE FOR THE GOODS?',
                  'answer':
                  'Yes, you can insure your goods by informing your dedicated move manager. You will be required to purchase our secured package addon. This addon has many other benefits along with insurance.'
                },
                {
                  'question': 'CAN I ALSO MOVE MY CAR OR BIKE?',
                  'answer':
                  'Yes, you can also move your car or bike for inter-city movements. Special closed containers will be used to transport your vehicle safely to your new home.'
                },
                {
                  'question':
                  'CITIES WHERE READY TO MOVE PROVIDE PACKERS AND MOVERS SERVICES',
                  'answer':
                  'We Provide All Over India Moving Service With 500+ Pan Branches Held all around India'
                },
                {
                  'question':
                  'WHY SHOULD NOT I PAY ANY TOKEN IN ADVANCE BEFORE THE MOVE?',
                  'answer':
                  'We survey your quote once it final we provide the proper estimate we charge 80% on day of packing and remaning 20% at delivery point.'
                },
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 7,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonText(text: "Latest Updates", color: Colors.red, fontWeight: FontWeight.bold,),
                    ),
                    _pagesList()
                  ],
                ),
              ),
            ),
            // Footer(),
          ],
        ),
      ),
    );
  }

  Widget _pagesList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: helpPageList.length,
        itemBuilder: (context, index) {
          return _pageRow(
            helpPageList[index],
          );
        });
  }

  Widget _pageRow(HelpPageData helpPageData) {
    return IconTextArrow(text: helpPageData.title ?? "", onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HelpPageDetails(content: helpPageData.content ?? "", title: helpPageData.title ?? "",)));
    });
  }

  void _getPages() {
    networkHelper.helpPages((List<HelpPageData> value) async {
      setState(() {
        helpPageList = value;
      });
    });
  }

}
