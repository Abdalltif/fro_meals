class ApiEndPoints {

  // Main UI
  final String getMainLists = "app-ui";
  // Home
  String getLimitedBrands(String limit){return "brands?_limit$limit";}
  String getLimitedCategories(String limit){return "products/$limit";}
  // Scan
  String getProduct(String id){return "products/$id";}
  // Browse
  String getAllCategories(){return "products";}
  String getProductsByCategory(String id){return "products?_category.id_eq=$id";}
  String getAllBrands(){return "brands";}
  String getProductsByBrands(String id){return "products?_brand.id_eq=$id";}
  // Search
  String searchProduct(String name){return "products/$name";}
}