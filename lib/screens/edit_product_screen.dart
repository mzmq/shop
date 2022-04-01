import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/EditProductScreen' ;
   EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();

  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController() ;

  @override
  void dispose() {
    _priceFocusNode.dispose() ;
    _descriptionFocusNode.dispose() ;

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    label: Text('Title')
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_priceFocusNode) ;
                },
              ) ,
              TextFormField(
                focusNode: _priceFocusNode,
                decoration: InputDecoration(
                    label: Text('Price')
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
              ),
              TextFormField(
                maxLines: 3,
                focusNode: _descriptionFocusNode,
                decoration: const InputDecoration(
                    label: Text('Description')
                ),
                keyboardType: TextInputType.multiline,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                controller: _imageUrlController,
                onEditingComplete: () {
                  setState(() {});
                },
              ),
               ],
          ),
        ),
      ),
    );

  }
}
