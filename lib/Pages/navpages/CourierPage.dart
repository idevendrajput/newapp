import 'package:flutter/material.dart';

import '../../api_helper/network_helper.dart';
import '../../api_helper/rest_client.dart';
import '../../dialogs/DialogAlert.dart';
import '../../main.dart';
import '../../model/BookingData.dart';
import '../../utils/AppConst.dart';

 class CourierPage extends StatelessWidget {

   final _formKey = GlobalKey<FormState>();
   final TextEditingController _nameController = TextEditingController();
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _phoneController = TextEditingController();
   final TextEditingController _pickUpDateController = TextEditingController();
   final TextEditingController _moveFromController = TextEditingController();
   final TextEditingController _moveToController = TextEditingController();
   final TextEditingController _detailsController = TextEditingController();

   var type = AppConst.COURIER;

   late DateTime _selectedDate = DateTime.now();

   final maxLinesDetails = 5;

  @override
  Widget build(BuildContext context) {

    _pickUpDateController.text = _selectedDate != null
        ? "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}"
        : '';


    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 160,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(colors: [
                    Colors.purpleAccent,
                    Colors.white54,

                  ], stops: [
                    0.4,
                    1.0,
                  ], begin: Alignment.topRight, end: Alignment.bottomRight),
                ),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        "Get Call Back In 10 Min",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "BOOK YOUR SHIFTING",
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(
                    AppConst.defaultMargin, 10, AppConst.defaultMargin, 0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Name',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black54,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(
                    AppConst.defaultMargin, 10, AppConst.defaultMargin, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Enter Your Email',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black54,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(
                    AppConst.defaultMargin, 10, AppConst.defaultMargin, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Enter Mobile Number',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      prefixText: '+91 ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black54,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your mobile number';
                      } else if (value.length < 8) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null && picked != _selectedDate) {
                    _selectedDate = picked;
                    _pickUpDateController.text = _selectedDate != null
                        ? "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}"
                        : '';
                  }
                },
                child: IgnorePointer(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(
                        AppConst.defaultMargin, 10, AppConst.defaultMargin, 0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Pick-Up Date',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black54,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          suffixIcon: const Icon(Icons.calendar_today),
                        ),
                        controller: _pickUpDateController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter pickup date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(
                    AppConst.defaultMargin, 10, AppConst.defaultMargin, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: TextFormField(
                    controller: _moveFromController,
                    decoration: InputDecoration(
                      labelText: 'Pickup From',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black54,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is mandatory';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(
                    AppConst.defaultMargin, 10, AppConst.defaultMargin, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: TextFormField(
                    controller: _moveToController,
                    decoration: InputDecoration(
                      labelText: 'Drop To',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black54,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Drop Point)';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(
                    AppConst.defaultMargin, 10, AppConst.defaultMargin, 0),
                height: maxLinesDetails * 24,
                child: TextFormField(
                  maxLines: maxLinesDetails,
                  controller: _detailsController,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Item Details...',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black54,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(
                    AppConst.defaultMargin, 10, AppConst.defaultMargin, 0),
                padding: const EdgeInsets.all(AppConst.defaultMargin),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BookingData request = BookingData();
                      request.phone = _phoneController.value.text;
                      request.email = _emailController.value.text;
                      request.moveFrom = _moveFromController.value.text;
                      request.moveTo = _moveToController.value.text;
                      request.date = _pickUpDateController.value.text;
                      request.name = _nameController.value.text;
                      request.type = type;
                      _submitForm(request, context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: AppConst.defaultMargin),
                    // Set button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(18), // Set button border radius
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),

      ),
    );
  }

   _submitForm(BookingData request, BuildContext context) {
     RestClient? client;
     NetworkHelper? networkHelper;
     getRestClient().then((data) {
       client = data;
       networkHelper = NetworkHelper(client!, context);
       networkHelper?.newBooking(request, (bool success) async {
         _openBookingSuccessDialog(context);
       });
     });
   }

   _openBookingSuccessDialog(BuildContext context) {
     showGeneralDialog(
       context: context,
       pageBuilder: (ctx, a1, a2) {
         return Container();
       },
       transitionBuilder: (ctx, a1, a2, child) {
         var curve = Curves.easeInOut.transform(a1.value);
         return Transform.scale(
           scale: curve,
           child: DialogAlert(
             onDoneClick: () {
               Navigator.pop(context);
             },
           ),
         );
       },
       transitionDuration: const Duration(milliseconds: 300),
     );
   }

}