import 'dart:ui';
import 'package:api_and_bloc_flutter/blocs/poset_Bloc.dart';
import 'package:api_and_bloc_flutter/reposetory/Post_rep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/poset_State.dart';
import 'blocs/post_Event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => Poset_Bloc(PostInitial(), Post_rep()),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Poset_Bloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of(context);
    bloc.add(PostFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
            flexibleSpace: ClipRRect(
                  
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX:100.0, sigmaY:100.0),
                      child: Container(
                        
                        decoration: BoxDecoration(
                          color: const Color(0x00ffffff),
                        ),),))
        ),
        body: Center(
          child: BlocBuilder<Poset_Bloc, PostState>(
            builder: (context, state) {
              if (state is PostInitial) {
                return CircularProgressIndicator();
              } else if (state is PostLodeing) {
                return CircularProgressIndicator();
              } else if (state is PostSuccess) {

                return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return cardList(userId:'${state.posts[index].id}',id:'${state.posts[index].id}');
                  },
                );


              } else if (state is PostFailure) {
                return Text('${state.masseg}');
              }
            },
          ),
        ));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}






















//this is the carde item 


Center cardList({String userId,String id}) {
  return Center(
    child: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          height: 51.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.0),
            color: const Color(0xffc2b3a7),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19.0),
              color: const Color(0xffa58971),
            ),
            child: Stack(
              fit: StackFit.expand,
              overflow: Overflow.clip,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(19.0),
                    child: Image.network(
                      'https://i.pinimg.com/236x/a5/f6/b9/a5f6b9fae576077fa1a3d29c38af8e86.jpg',
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(19.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 90.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                          ),
                          color: const Color(0x00ffffff),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Alaa',
                                    style: TextStyle(color: Colors.white)),
                                Text(
                                  'new Alaa',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.save,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                print('object');
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
