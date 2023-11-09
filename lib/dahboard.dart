import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mgt/UserBloc/user_bloc.dart';
import 'package:flutter_bloc_mgt/user_model.dart';

import 'api_repository.dart';
import 'UserBloc/app_event.dart';
import 'UserBloc/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(UserRepository()),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(title: const Text('The BloC App')),
          body: customAPIWidegt(),
          floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add))),
    );
  }


Widget customAPIWidegt() {
  return BlocProvider(
    create: (context) => UserBloc(UserRepository())..add(LoadUser1Event()),
     child: BlocBuilder<UserBloc, APIState>(
        builder: (context, state) {
          if (state is APILoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
            if (state is APIErrorState) {
            return const Center(child:  Text("Error"));
          }
          
          if (state is APILoaded1State) {
            List userGetList = state.users1;
              return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                itemCount: userGetList.length,
                itemBuilder: (_, index) {
                  var itemData = userGetList[index];
                  debugPrint("userList1 :: $itemData");
                  
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                        color: Theme.of(context).primaryColorDark,
                        child: ListTile(
                            title: Text(
                              '${itemData['first_name']}  ${itemData['last_name']}',
                              style: const TextStyle(color: Colors.white),
                            ),
  
                            subtitle: Text(
                              '${itemData["email"]}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  itemData['avatar'].toString()),
                            ))),
                  );
                });
          } 
  
          return Container();
        },
      ),
              
  );
}
Widget blocBody() {
    return ListView(children:[firstWidget(),secondWidget()]);
    // ListView(
    //       children: <Widget>[
    //         ListView.builder(
    //           shrinkWrap: true,
    //           itemCount: 10,
    //           itemBuilder: (context, index) {
    //             return ListTile(
    //               title: Text('Item $index in ListView 1'),
    //             );
    //           },
    //         ),
    //         ListView.builder(
    //           shrinkWrap: true,
    //           itemCount: 10,
    //           itemBuilder: (context, index) {
    //             return ListTile(
    //               title: Text('Item $index in ListView 2'),
    //             );
    //           },
    //         ),
    //       ],
    //     );
  }

  firstWidget() {
    return BlocProvider(
            create: (context) => UserBloc(
              UserRepository(),
            ),/* ..add(LoadUserEvent() ),*/
            child: BlocBuilder<UserBloc, APIState>(
              builder: (context, state) {
                if (state is APILoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                 if (state is APIErrorState) {
                  return const Center(child:  Text("Error"));
                }
                if (state is APILoadedState) {
                  List userList = state.users;
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: userList.length,
                      itemBuilder: (_, index) {
                        var itemData = userList[index];
                        debugPrint("userList :: $itemData");
                        
                        return Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          child: Card(
                              color: Theme.of(context).primaryColor,
                              child: ListTile(
                                  title: Text(
                                    '${itemData['first_name']}  ${itemData['last_name']}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
          
                                  subtitle: Text(
                                    '${itemData["email"]}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        itemData['avatar'].toString()),
                                  ))),
                        );
                      });
                }
                // if (state is APILoaded1State) {
                //   List userGetList = state.users1;
                //    return ListView.builder(
                //       itemCount: userGetList.length,
                //       itemBuilder: (_, index) {
                //         var itemData = userGetList[index];
                //         debugPrint("userList1 :: $itemData");
                        
                //         return Padding(
                //           padding:
                //               const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                //           child: Card(
                //               color: Theme.of(context).primaryColor,
                //               child: ListTile(
                //                   title: Text(
                //                     '${itemData['first_name']}  ${itemData['last_name']}',
                //                     style: const TextStyle(color: Colors.white),
                //                   ),
          
                //                   subtitle: Text(
                //                     '${itemData["email"]}',
                //                     style: const TextStyle(color: Colors.white),
                //                   ),
                                  
                //                   leading: CircleAvatar(
                //                     backgroundImage: NetworkImage(
                //                         itemData['avatar'].toString()),
                //                   ))),
                //         );
                //       });
                // } 
          
                return Container();
              },
            ),
          );
        
  }

  secondWidget() {
    return BlocProvider(
                create: (context) => UserBloc(UserRepository())..add(LoadUser1Event()),
                child: BlocBuilder<UserBloc, APIState>(
                  builder: (context, state) {
                    if (state is APILoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                     if (state is APIErrorState) {
                      return const Center(child:  Text("Error"));
                    }
                    
                    if (state is APILoaded1State) {
                      List userGetList = state.users1;
                       return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          itemCount: userGetList.length,
                          itemBuilder: (_, index) {
                            var itemData = userGetList[index];
                            debugPrint("userList1 :: $itemData");
                            
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              child: Card(
                                  color: Theme.of(context).primaryColorDark,
                                  child: ListTile(
                                      title: Text(
                                        '${itemData['first_name']}  ${itemData['last_name']}',
                                        style: const TextStyle(color: Colors.white),
                                      ),
            
                                      subtitle: Text(
                                        '${itemData["email"]}',
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            itemData['avatar'].toString()),
                                      ))),
                            );
                          });
                    } 
            
                    return Container();
                  },
                ),
              );
  }
}