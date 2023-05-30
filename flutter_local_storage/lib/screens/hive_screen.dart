import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveScreen extends StatefulWidget{
  const HiveScreen({Key? key}) : super(key: key);

  @override
  State<HiveScreen> createState() => HiveScreenState();
}

class HiveScreenState extends State<HiveScreen> {

  TextEditingController productName = TextEditingController();
  TextEditingController productQuantity = TextEditingController();

  List<Map<String, dynamic>> items = [];
  final productList = Hive.box("products");

  @override
  void initState() {
    super.initState();
    refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive - Products list", style: TextStyle(fontSize: 20, color: Colors.black45, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.amber.shade300,
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () => showForm(context, null),
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, index){
            final currentItem = items[index];
            return Card(
              color: Colors.black12,
              margin: const EdgeInsets.all(10),
              elevation: 0,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 30,
                  child: Icon(Icons.shopping_basket,color: Colors.white,size: 34,),
                ),
                title: Text(currentItem["name"], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                subtitle: Text('In stock: ${currentItem["quantity"]}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          showForm(context, currentItem['key']);
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          deleteProduct(currentItem['key']);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('An item has been deleted!!'))
                          );
                        },
                        icon: const Icon(Icons.delete_forever)),
                  ],
                ),
              ),
            );
        })
    );
  }

  // Methods //

  //update item
  Future<void> updateProduct(int itemKey, Map<String, dynamic> item) async {
    await productList.put(itemKey, item);
    refreshItems();
  }
  //delete
  Future<void> deleteProduct(int itemKey) async {
    await productList.delete(itemKey);
    refreshItems();
  }

  void refreshItems(){
    final data = productList.keys.map((key) {
      final item = productList.get(key);
      return {"key": key, "name": item["name"], "quantity": item["quantity"]};
    }).toList();
    setState(() {
      items = data.reversed.toList();
    });
  }

//Create new product
  Future<void> createProduct(Map<String, dynamic> product) async {
    await productList.add(product);
    print("Amount data is ${productList.length}");
    refreshItems();
  }

  void showForm(BuildContext context, int? itemKey) async {

    if(itemKey != null){
      final existingItem = items.firstWhere((element) => element['key'] == itemKey);
      productName.text = existingItem['name'];
      productQuantity.text = existingItem['quantity'];
    }

    showModalBottomSheet(context: context, isScrollControlled: true, builder: (_) {
      return FractionallySizedBox(
        heightFactor: 0.9,
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 15,
            left: 15,
            right: 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(itemKey == null ? 'Create new product' : 'Update selected product', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26, ),),
              const SizedBox(height: 20,),
              TextField(
                controller: productName,
                decoration: const InputDecoration(
                    hintText: "Enter a product name",
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.amber))),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: productQuantity,
                decoration: const InputDecoration(
                    hintText: "Enter a Quantity",
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.amber))),
              ),
              const SizedBox(height: 20,),
              TextButton(
                onPressed: () async {
                  //create new
                  if(itemKey == null) {
                    createProduct({"name": productName.text, "quantity": productQuantity.text});
                  }
                  //update
                  if(itemKey != null){
                    updateProduct(itemKey, {"name": productName.text.trim(), "quantity": productQuantity.text.trim()});
                  }
                  //clear textBoxes
                  productName.text = "";
                  productQuantity.text = "";
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(backgroundColor: Colors.amber, fixedSize: const Size.fromWidth(400)),
                child: Text(itemKey == null ? 'Create new' : 'Update', style: const TextStyle(color: Colors.white, fontSize: 18),),),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      );
    });

  }








}