import 'package:api_imtegration_demo/model/factResponse.dart';
import 'package:api_imtegration_demo/services/dataServices.dart';
import 'package:flutter/material.dart';
class homepage extends StatefulWidget {
  const homepage({Key key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  DataServices dataServices=DataServices();
  FactResponse factResponse=FactResponse();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Integration demo"),
      ),
      body: Container(
        child: FutureBuilder(
          future:dataServices.getData() ,
          builder: (context,snapshot){
            if(snapshot.hasData){
              factResponse=snapshot.data; //connect to model class
              return ListView.builder(
                  itemCount:factResponse.facts.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          children: [
                            Text(factResponse.facts[index].title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            Text(factResponse.facts[index].description),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 120,
                                  width: 120,
                                  child: Image.network(factResponse.facts[index].imageUrl,fit: BoxFit.cover,)),
                            ),

                          ],
                        ),

                      ),
                    );

                  }
              );
                //Text(factResponse.category);
            }
            else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
