import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/EditProductScreen';

  EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imgFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();

  var _EditedProduct =
      Product(id: null, title: '', description: '', price: 0, imageUrl: '');

  @override
  void initState() {
    _imgFocusNode.addListener(_updateImageUrl);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _imgFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imgFocusNode.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  void _updateImageUrl() {
    if (_imgFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    _form.currentState!.save();
    print(_EditedProduct.title );
    print(_EditedProduct.price );
    print(_EditedProduct.description );
    print(_EditedProduct.imageUrl );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [IconButton(onPressed: _saveForm, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(label: Text('Title')),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  _EditedProduct = Product(
                    title: value,
                    description: _EditedProduct.description,
                    price: _EditedProduct.price,
                    imageUrl: _EditedProduct.imageUrl,
                  );
                },
              ),
              TextFormField(
                focusNode: _priceFocusNode,
                decoration: InputDecoration(label: Text('Price')),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) {
                  _EditedProduct = Product(
                    title: _EditedProduct.title,
                    description: _EditedProduct.description,
                    price: double.parse(value!),
                    imageUrl: _EditedProduct.imageUrl,
                  );
                },
              ),
              TextFormField(
                maxLines: 3,
                focusNode: _descriptionFocusNode,
                decoration: const InputDecoration(label: Text('Description')),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_imgFocusNode);
                },
                onSaved: (value) {
                  _EditedProduct = Product(
                    title: _EditedProduct.title,
                    description: value,
                    price: _EditedProduct.price,
                    imageUrl: _EditedProduct.imageUrl,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Center(child: Text('Add URL image'))
                        : Image.network(_imageUrlController.text,
                            fit: BoxFit.cover),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _imageUrlController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.url,
                        focusNode: _imgFocusNode,
                        decoration: InputDecoration(label: Text('Image URL')),
                        onFieldSubmitted: (_) => _saveForm,
                        onSaved: (value) {
                          _EditedProduct = Product(
                            title: _EditedProduct.title,
                            description: _EditedProduct.description,
                            price: _EditedProduct.price,
                            imageUrl: value,

                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
