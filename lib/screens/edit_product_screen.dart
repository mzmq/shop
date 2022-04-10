import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../providers/product_provider.dart';

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
      if (_imageUrlController.text.isEmpty ||
          !_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https') ||
          !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpeg')) {
        return;
      }

      setState(() {});
    }
  }

  void _saveForm() {
    _form.currentState!.save();
    print(_EditedProduct.title);
    print(_EditedProduct.price);
    print(_EditedProduct.description);
    print(_EditedProduct.imageUrl);
    Provider.of<ProductProvider>(context , listen: false).addProduct(_EditedProduct);
    Navigator.of(context).pop();
    var isVal = _form.currentState!.validate();
    if (!isVal) {
      return;
    } else {
      _form.currentState!.save();

      print(_EditedProduct.title);
      print(_EditedProduct.price);
      print(_EditedProduct.description);
      print(_EditedProduct.imageUrl);
    }
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title is required';
                  }
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Price is required';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter valid number.';
                  }
                  if (double.parse(value) <= 0) {}
                  return 'Please enter greater zero';
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter description.';
                  }
                  if (value.length < 10) {
                    return 'description at lest 10 character  ';
                  }
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter URL.';
                          }
                          if (!value.startsWith('http') &&
                              !value.startsWith('https')) {
                            return 'Please enter valid URL.';
                          }
                          if (!value.endsWith('.jpg') &&
                              !value.endsWith('.png') &&
                              !value.endsWith('.jpeg')) {
                            return 'Please enter valid image URL.';
                          }
                        },
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
