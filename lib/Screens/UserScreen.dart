import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try1_holistic_randomuser/Providers/userprovider.dart';
import 'package:try1_holistic_randomuser/Widgets/ScreenWidget.dart';
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Users'),
        centerTitle: true,
      ),
      body: Consumer<UserProvider>(builder: (context, provider, child) {
         final providerObject = provider.userModel;
         if(providerObject == null){
           provider.fetchUsers();
           return Center(child: CircularProgressIndicator(),);
         }
         else{
           return ListView.separated(
               itemBuilder: (context, index) {
                 final Name =  providerObject.results.elementAt(index)['Name'];
                 final Email =  providerObject.results.elementAt(index)['Email'];
                 final image =  providerObject.results.elementAt(index)['img'];
                // final discreption =  providerObject.results.elementAt(index)['timezone'];
                 return ScreenWidget(
                     name: Name,
                    // discreption: discreption,
                     image: image,
                   email: Email,
                 );
               },
               separatorBuilder: (context, index) => SizedBox(height: 10,),
               itemCount: providerObject.results.length
           );

         }
      },) ,
    );
  }
}
