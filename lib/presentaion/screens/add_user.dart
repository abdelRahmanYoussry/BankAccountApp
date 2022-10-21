import 'dart:ffi';

import 'package:basic_banking_app/presentaion/controller/app_cubit.dart';
import 'package:basic_banking_app/presentaion/widget/TextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/Utilis/app_constance.dart';
import '../widget/my_button.dart';

class AddUser extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var balanceController = TextEditingController();
  var phoneNumController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  AddUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            automaticallyImplyLeading: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Add User'),
                // IconButton(
                //   icon: const Icon(Icons.person, size: 30),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                children: [
                  MyTextFormField(
                      readOnly: false,
                      onTap: () {},
                      onSubmit: () {},
                      onChanged: (value) {},
                      control: nameController,
                      label: 'Name',
                      type: TextInputType.text,
                      isPassword: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Name Can not be Empty';
                        } else {
                          return null;
                        }
                      },
                      borderColor: Theme.of(context).primaryColor,
                      labelColor: Colors.black,
                      textColor: Colors.black,
                      backgroundColor: Colors.white),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                      readOnly: false,
                      onTap: () {},
                      onSubmit: () {},
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Email Can not be Empty';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                      control: emailController,
                      type: TextInputType.emailAddress,
                      label: 'Email',
                      isPassword: false,
                      borderColor: Theme.of(context).primaryColor,
                      labelColor: Colors.black,
                      textColor: Colors.black,
                      backgroundColor: Colors.white),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                      readOnly: false,
                      onTap: () {},
                      onSubmit: () {},
                      onChanged: (value) {},
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Phone Can not be Empty';
                        } else {
                          return null;
                        }
                      },
                      control: phoneNumController,
                      type: TextInputType.number,
                      label: 'Phone',
                      isPassword: false,
                      borderColor: Theme.of(context).primaryColor,
                      labelColor: Colors.black,
                      textColor: Colors.black,
                      backgroundColor: Colors.white),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                      readOnly: false,
                      textInputFormat:"[0-9]",
                      onTap: () {},
                      onSubmit: () {},
                      onChanged: (value) {},
                      control: balanceController,
                      label: 'Balance',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'balance Can not be Empty';
                        } else {
                          return null;
                        }
                      },
                      type: TextInputType.number,
                      isPassword: false,
                      borderColor: Theme.of(context).primaryColor,
                      labelColor: Colors.black,
                      textColor: Colors.black,
                      backgroundColor: Colors.white),
                  const SizedBox(
                    height: 20,
                  ),
                  const Spacer(),
                  MyButton(
                      text: 'Submit',
                      width: double.infinity,
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          AppCubit.get(context).insertToDataBase(
                              name: nameController.text,
                              date: 'date',
                              email: emailController.text,
                              transfersAmount: 0,
                              phone: phoneNumController.text,
                              balance: double.parse(balanceController.text));
                        }
                        ;
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
