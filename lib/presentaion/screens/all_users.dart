import 'package:basic_banking_app/presentaion/controller/app_cubit.dart';
import 'package:basic_banking_app/presentaion/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllUsersScreen extends StatelessWidget {
  AllUsersScreen({Key? key}) : super(key: key);
  int transferAmount = 0;

  @override
  Widget build(BuildContext context) {
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
                // Spacer(),
                Text('All Users'),
                // Spacer(),
                // IconButton(
                //   icon: const Icon(Icons.person, size: 30),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => const Divider(
                            height: 15,
                            color: Colors.yellow,
                          ),
                      itemCount:
                          AppCubit.get(context).allUsersWithoutFirstItem.length,
                      itemBuilder: (
                        context,
                        index,
                      ) =>
                          allUsersItem(
                              map: AppCubit.get(context)
                                  .allUsersWithoutFirstItem[index],
                              context: context)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget allUsersItem({required Map map, context}) {
    // map['transfersAmount']=transferAmount;
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.2),
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(10),
            left: Radius.circular(10),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Text(
                      '${map['name']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                    child: Text('${map['phone']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: AppCubit.get(context).showTransfer,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        transferAmount = transferAmount - 1;
                        // map['transferAmount']=transferAmount;
                        AppCubit.get(context).changeTransferAmount(
                            transfersAmount: transferAmount, id: map['id']);
                      },
                      icon: const Icon(Icons.remove)),
                  Text('${map['transfersAmount']} \$',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.red)),
                  IconButton(
                      onPressed: () {
                        transferAmount = transferAmount + 1;
                        // map['transferAmount']=transferAmount;
                        AppCubit.get(context).changeTransferAmount(
                            transfersAmount: transferAmount, id: map['id']);
                        print('${transferAmount}this is transfer amount');
                        // AppCubit.get(context).plusTransferAmount();
                      },
                      icon: const Icon(Icons.add)),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${map['balance']} \$',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red)),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyButton(
                  text: AppCubit.get(context).showTransfer
                      ? 'Submit'
                      : 'Transfer',
                  width: 100,
                  onPress: () {
                    AppCubit.get(context).changeTransferVisibility();
                    if (!AppCubit.get(context).showTransfer) {
                      print('${map['balance']}aaaaaaaaaaaaaaaaaaaaaa');
                      print(transferAmount + map['balance']);
                      AppCubit.get(context).changeBalanceAmount(
                        transferAmount: transferAmount,
                          data: DateTime.now().toString(),
                          balance: (transferAmount + map['balance']).toInt(),
                          id: map['id']);
                    }
                  },
                  height: 30,
                  fontSize: 14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
