import 'package:ex_mobile/data_dummy.dart';
import 'package:ex_mobile/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;
  var dataProduct = getData;

  HomePage({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: _listView(),
      ),
    );
  }

  Widget _gridView(){
    return GridView.builder(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) => FlutterLogo(),
      itemCount: 12,
    );
  }

  Widget _listView() {
    return ListView.separated(
          itemBuilder: (context, index) {
            return _createCard(dataProduct[index], context);
          },
          itemCount: dataProduct.length,
          separatorBuilder: (BuildContext context, int index) {
            return _separator();
          },
        );
  }

  Widget _createCard(Product product, BuildContext context){
    return Card(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailPage(product: product);
            }));
          },
          child: Container(
            padding: EdgeInsets.all(15),
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Image.network(product.image, width: 100,),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      product.brand,
                      style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      '${product.price}',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return DetailPage(product: product);
                      }));
                    }, child: Text("Details >>")),
                  ],
                )
              ),

            ]),
          ),
        ),
    );
  }

  Widget _separator() {
    return Container(
      color: Colors.greenAccent,
      child: Text(
        'Separator',
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}
