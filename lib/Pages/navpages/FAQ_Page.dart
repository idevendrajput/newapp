import 'package:flutter/material.dart';

import 'QuestionsList.dart';

class FAQPage extends StatefulWidget {
  FAQPage({Key? key}) : super(key: key);

  late VoidCallback onPressed;

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Image.asset("assets/img/Untitled design.png"),
            const SizedBox( height: 50,
              child: Text(
                "COMMON QUESTIONS",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
            QuestionsList(
              questionsAndAnswers: const [
                {
                  'question': 'WHY ARE WEEKEND AND MONTH-END PRICES DIFFERENT',
                  'answer': 'The quote is calculated based on the availability of slots. Since there is high demand for movement during weekend and month-end, prices are generally high on these days.'
                },
                {
                  'question': 'CAN I RESCHEDULE MY MOVEMENT AFTER I HAVE PAID THE TOKEN AMOUNT?',
                  'answer': 'You can reschedule your movement by informing your dedicated move manager whose details are included in the confirmation email. Your move manager will reschedule the movement based on the availability of slots'
                },
                {
                  'question': 'MY MOVEMENT DATE IS NOT FIXED YET. HOW CAN I BOOK IN ADVANCE?',
                  'answer': 'You can notify your dedicated movement manager to reschedule movement upto 2 days before the booked date. Change in movement date is FREE of cost for following categories: weekdays to weekdays, weekend to weekend, weekend to weekdays.'
                },
                {
                  'question': 'WILL THE MOVERS AND PACKERS ALSO DISMANTLE BEDS AND OTHER FURNITURE? ',
                  'answer': 'Yes, we can dismantle and assemble beds and other furniture without any extra cost. However, you will have to notify your dedicated move manager before movement.'
                },
                {
                  'question': 'WE HAVE VERY FEW ITEMS TO MOVE. THE QUOTATION IS VERY COSTLY.',
                  'answer': 'Please contact us at +91 1234567890. We can arrange a small transportation for such movements at a lower cost.s'
                },
                {
                  'question': 'IS PRELIMINARY INSPECTION REQUIRED BEFORE BOOKING THE MOVEMENT?',
                  'answer': 'No, instant quotes are generated as per the apartment size/inventory list, movement date and the movement distance.'
                },
                {
                  'question': 'ARE THE PACKING MATERIALS ARE INCLUDED IN THE PACKAGE? ARE THERE ANY HIDDEN CHARGES?',
                  'answer': 'Yes, all packing materials and labour cost are provided by the vendor and included in the package.'
                },
                {
                  'question': 'DO YOU PROVIDE INSURANCE FOR THE GOODS?',
                  'answer': 'Yes, you can insure your goods by informing your dedicated move manager. You will be required to purchase our secured package addon. This addon has many other benefits along with insurance.'
                },
                {
                  'question': 'CAN I ALSO MOVE MY CAR OR BIKE?',
                  'answer': 'Yes, you can also move your car or bike for inter-city movements. Special closed containers will be used to transport your vehicle safely to your new home.'
                },
                {
                  'question': 'CITIES WHERE VRL PROVIDES VRL CARGO PACKERS AND MOVERS SERVICES',
                  'answer': 'We Provide All Over India Moving Service With 500+ Pan Branches Held all around India'
                },
                {
                  'question': 'WHY SHOULD NOT I PAY ANY TOKEN IN ADVANCE BEFORE THE MOVE?',
                  'answer': 'We survey your quote once it final we provide the proper estimate we charge 80% on day of packing and remaning 20% at delivery point.'
                },
              ],
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: Text("Latest Updates",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.red,
                    ),
                    ),
                  ),
                  SizedBox(
                    height: 200, width:320,
                  ),


                ],
              ),
            ),
            // Footer(),


          ],
        ),
      ),
    );
  }
}