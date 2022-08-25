import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:pricelist/providers/address_provider.dart';
import 'package:pricelist/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SetAddress extends StatefulWidget {
  const SetAddress({Key? key}) : super(key: key);

  @override
  State<SetAddress> createState() => _SetAddressState();
}

class _SetAddressState extends State<SetAddress> {
  final _formkey = GlobalKey<FormState>();

  void showResult(int resType) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(resType == 1
            ? 'Check your internet connection'
            : 'Update successful!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // context.read<Address>().setUserID = context.read<UserState>().getUserID;

    context.read<Address>().readAddress(context.read<UserState>().getUserID);

    TextEditingController roomNumberController =
        TextEditingController(text: context.read<Address>().roomNumber);
    TextEditingController streetController =
        TextEditingController(text: context.read<Address>().street);
    TextEditingController barangayController =
        TextEditingController(text: "Ampayon");
    TextEditingController cityController =
        TextEditingController(text: "Butuan City");
    TextEditingController moreDescriptionController =
        TextEditingController(text: context.read<Address>().moreDescription);

    void updateResult() {
      context.read<Address>().updateAddress(
            roomNumberController.text,
            streetController.text,
            barangayController.text,
            cityController.text,
            moreDescriptionController.text,
            context.read<UserState>().getUserID,
            context,
          );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.0,
        backgroundColor: const Color(0xff27ae60),
        title: const Text(
          'Edit Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(11.0),
          ),
        ),
        actions: <Widget>[
          Container(
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.edit)),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          key: _formkey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 29.0, vertical: 8.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.error,
                          color: Color(0xff219653),
                        ),
                        Flexible(
                          child: Text(
                            ' We only cater Brgy. Ampayon for now.',
                            style: TextStyle(
                              color: Color(0xff219653),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(19.0, 0.0, 19.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        //container for floor
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          child: TextFormField(
                            controller: roomNumberController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              labelText: 'Floor/Unit?Room#',
                              hintStyle: const TextStyle(fontSize: 14),
                            ),
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                        //Container for street
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          child: TextFormField(
                            controller: streetController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              labelText: 'Street',
                              hintStyle: const TextStyle(fontSize: 14),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        //Container for barangay
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          child: TextFormField(
                            controller: barangayController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              labelText: 'Barangay (default)',
                              hintStyle: const TextStyle(fontSize: 14),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        //Container for city
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          child: TextFormField(
                            readOnly: true,
                            controller: cityController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              labelText: 'City (default)',
                              hintStyle: const TextStyle(fontSize: 14),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),

                        //Container for more description
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(8.0, 11.0, 8.0, 75.0),
                          child: TextFormField(
                            controller: moreDescriptionController,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            minLines: 1,
                            maxLines: 5,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              hintText: 'Add Description \n\n\n',
                              hintStyle: const TextStyle(fontSize: 14),
                            ),
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  //A free space container
                  // Container(
                  //   padding: const EdgeInsets.all(57.0),
                  // ),
                  //A container with one border and text button
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var connectivityResult = await (Connectivity().checkConnectivity());
          if (connectivityResult == ConnectivityResult.mobile ||
              connectivityResult == ConnectivityResult.wifi) {
            if (_formkey.currentState!.validate()) {
              updateResult();
              showResult(0);
            }
          } else {
            showResult(1);
          }
        },
        label: const Text('Save Changes'),
        icon: const Icon(Icons.check),
        backgroundColor: const Color(0xff27ae60),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
