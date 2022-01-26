class ApiEndPoints {

  // Main UI
  final String getMainLists = "app-ui";

  String getProducts(String id){return "products/$id";}
  String getBrands(String id){return "brands?_limit$id";}
  String getProductsByCategory(String id){return "products?_category.id_eq=$id";}
}