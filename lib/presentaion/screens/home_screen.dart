import 'package:basic_banking_app/core/Utilis/app_constance.dart';
import 'package:basic_banking_app/presentaion/controller/app_cubit.dart';
import 'package:basic_banking_app/presentaion/screens/add_user.dart';
import 'package:basic_banking_app/presentaion/screens/all_transactions.dart';
import 'package:basic_banking_app/presentaion/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/user_model.dart';
import 'all_users.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // List<UserModel> usersList = [
  //   UserModel(id: 1, balance: 0, name: 'Ahmed', email: 'Ahmed@Gmail.com'),
  //   UserModel(id: 2, balance: 10, name: 'Mohamed', email: 'Mohamed@Gmail.com'),
  //   UserModel(id: 3, balance: 20, name: 'Youssry', email: 'Youssry@Gmail.com'),
  //   UserModel(
  //       id: 4,
  //       balance: 30,
  //       name: 'AbdelRahman',
  //       email: 'abdoabdo8384@gmail.com'),
  //   UserModel(id: 5, balance: 40, name: 'Younes', email: 'Younes@gmail.com'),
  //   UserModel(id: 6, balance: 50, name: 'Jode', email: 'jode@gmail.com'),
  //   UserModel(id: 7, balance: 60, name: 'Fatma', email: 'fatma@gmail.com'),
  //   UserModel(id: 8, balance: 70, name: 'Mohy', email: 'mohy@gmail.com'),
  //   UserModel(id: 9, balance: 80, name: 'Islam', email: 'Islam@gmail.com'),
  //   UserModel(id: 10, balance: 90, name: 'Ghada', email: 'Ghada@gmail.com'),
  // ];
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Spacer(),
                  Text('A-Bank'),
                  Spacer(),
                ],
              ),
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppCubit.get(context).allUsers.isNotEmpty?   Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('MyAccount',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30)),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.person,
                          color: Colors.orange, size: 30),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('${'Abdelrahman'}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email,
                          size: 30, color: Colors.orange),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('${'Abdelrahman@gmail.com'}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.phone,
                          size: 30, color: Colors.orange),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('01282088582',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.monetization_on,
                          size: 30, color: Colors.green),
                      const SizedBox(
                        width: 5,
                      ),
                      if (AppCubit.get(context).allUsers.isNotEmpty)
                        Text(
                            '${AppCubit.get(context).allUsers[0]['balance']}\$',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red)),
                    ],
                  ),
                ],
              )
                            : const Center(
                          child: Text('No Users To Show',style: TextStyle(color: Colors.grey,fontSize: 28)),
                        ),


                          const Spacer(),
                        MyButton(
                            text: 'All Users',
                            width: double.infinity,
                            onPress: () {
                              navigateTo(context, widget: AllUsersScreen());
                            }),
                        const SizedBox(height: 30,),
                        MyButton(
                            text: 'All Transactions',
                            width: double.infinity,
                            onPress: () {
                              navigateTo(context, widget:const AllTranscationsScreen() );
                            }),
                        const SizedBox(height: 30,),
                        // const Spacer(),
                        MyButton(
                            text: 'Add User',
                            width: double.infinity,
                            onPress: () {
                              navigateTo(context, widget: AddUser());
                            })
                      ],
                    )

            ));
      },
    );
  }
}
