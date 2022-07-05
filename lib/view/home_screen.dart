import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controller/cubit/api_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  RefreshController controller = RefreshController();

  @override
  void initState() {
     context.read<ApiCubit>().getData();

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Pagination'),
      ),
      body: SafeArea(
        child: BlocBuilder<ApiCubit, ApiState>(
          builder: (context, state) {

            if(state is ApiLoading){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is ApiLoaded){

              print(state.model.data[0].name);
              return SmartRefresher(
                controller: controller,


                 enablePullDown: false,
                enablePullUp: true,
                onLoading: ()async{


                  var myCubit = await context.read<ApiCubit>().getData(fromInit: false);

                  print('=========> my Cubit $myCubit');


                  controller.isLoading;
                  if(state.isToLoadMore == true){
                    controller.loadComplete();

                  }else{

                    controller.loadFailed();
                  }


                },
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    itemCount: state.model.data.length,
                    itemBuilder: (context, index){

                     var data =  state.model.data[index];


                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [

                            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 4)
                          ]
                        ),

                        child: ListTile(
                          leading: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Colors.cyanAccent,
                                shape: BoxShape.circle
                              ),
                              child: Text("${index + 1}")),
                          title: Text(data.name == null ? '' : data.name),
                          subtitle: Container(
                              
                            height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Plane: ' + data.airline[0].name.toString()))),
                                  Expanded(child: Text('To: ' + data.airline[0].country.toString())),
                                ],
                              )),
                        ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                },),
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
