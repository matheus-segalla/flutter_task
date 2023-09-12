import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class ProductListScreen extends StatelessWidget {
  final List<Product> productList = [
    Product(
      name: 'Leite',
      price: 19.99,
      imageUrl: 'https://via.placeholder.com/150?text=Leite',
    ),
    Product(
      name: 'Pao',
      price: 29.99,
      imageUrl: 'https://via.placeholder.com/150?text=P%C3%A3o',
    ),
    Product(
      name: 'Macarrao',
      price: 19.99,
      imageUrl: 'https://via.placeholder.com/150?text=Macarr%C3%A3o',
    ),
    Product(
      name: 'Arroz',
      price: 29.99,
      imageUrl: 'https://via.placeholder.com/150?text=Arroz',
    ),
    Product(
      name: 'Frutas',
      price: 19.99,
      imageUrl: 'https://via.placeholder.com/150?text=Frutas',
    ),
    Product(
      name: 'Legumes',
      price: 29.99,
      imageUrl: 'https://via.placeholder.com/150?text=Legumes',
    ),
    Product(
      name: 'Arroz',
      price: 29.99,
      imageUrl: 'https://via.placeholder.com/150?text=Arroz',
    ),
    Product(
      name: 'Frutas',
      price: 19.99,
      imageUrl: 'https://via.placeholder.com/150?text=Frutas',
    ),
    Product(
      name: 'Legumes',
      price: 29.99,
      imageUrl: 'https://via.placeholder.com/150?text=Legumes',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (ctx, index) {
          final product = productList[index];
          return InkWell(
            onTap: () {
              // Quando um item da lista for clicado, navegue para a tela de detalhes do produto
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return ProductDetailScreen(
                      name: product.name,
                      price: product.price,
                      imageUrl: product.imageUrl,
                      productList: productList, // Passe a lista de produtos
                    );
                  },
                  transitionsBuilder: (context, animation, secondaryAnimation,
                      child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    var tween = Tween(begin: begin, end: end).chain(
                        CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: ListTile(
              leading: Image.network(product.imageUrl),
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;
  final List<Product> productList; // Adicione a lista de produtos

  ProductDetailScreen({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.productList, // Receba a lista de produtos
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl),
            SizedBox(height: 16.0),
            Text('Nome: $name'),
            Text('Preço: \$${price.toStringAsFixed(2)}'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Fecha a tela de detalhes do produto e volta para a lista
                Navigator.of(context).pop();
              },
              child: Text('Voltar para a Lista'),
            ),
          ],
        ),
      ),
    );
  }
}
