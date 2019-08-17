import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';

class ProductsModel extends Model {
  List<Product> _products = [];
  int _selectedProductIndex;
  bool _showFavorites = false;

  List<Product> get products => List.from(_products);

  List<Product> get displayedProducts => _showFavorites
      ? _products.where((product) => product.isFavorite).toList()
      : List.from(_products);

  int get selectedProductIndex => _selectedProductIndex;

  bool get displayFavoritesOnly => _showFavorites;

  Product get selectedProduct =>
      _selectedProductIndex != null ? products[_selectedProductIndex] : null;

  void addProduct(Product product) {
    _products.add(product);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void toggleProductFavoriteStatus() {
    final Product updatedProduct = Product(
        description: selectedProduct.description,
        image: selectedProduct.image,
        price: selectedProduct.price,
        title: selectedProduct.title,
        isFavorite: !selectedProduct.isFavorite);
    updateProduct(updatedProduct);
  }

  void selectProduct(int index) {
    _selectedProductIndex = index;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}
