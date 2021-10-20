import 'package:get/get.dart';
import 'package:mero/models/products.dart';
import 'package:mero/services/services.dart';

class ProductController extends GetxController {


  RxList<Product> productData = <Product>[].obs;
  Map productDetails = {}.obs;
  var loading = false.obs;
  static final imageBaseUrl= "https://merooffer.com/upsize_images/";
  static final imageBaseUrlWithWaterMark = "https://merooffer.com/watermark/";
  int? city_id;
  int? category_id;
  int? min_price;
  int? max_price;

  @override
  void onReady() {
    super.onReady();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final List<Product> loadedProduct = <Product>[];
    try {
      loading(true);
      final response = await ApiServices().getRequest('/product?min_price=${min_price??''}&max_price=${max_price??''}&city_id=${city_id??''}&category_id=${category_id??''}');
        response['data']['data'].forEach(
          (productData) {
            loadedProduct.add(Product(
              id: productData['id'],
              sold: productData['sold'],
              order: productData['order'],
              featured: productData['featured'],
              views: productData['views'],
              status: productData['status'],
              bid: productData['bid'],
              slug: productData['slug'],
              quantity: productData['quantity'],
              weight: productData['weight'],
              address: productData['address'],
              latitude: productData['latitude'],
              longitude: productData['longitude'],
              cell: productData['cell'],
              url: productData['url'],
              name: productData['name'],
              price: productData['price'],
              rgrPrice: productData['rgrPrice'],
              desc: productData['desc'],
              expiredAt: productData['expiredAt'],
              conditionId: productData['conditionId'],
              pricelabelId: productData['pricelabelId'],
              assuredId: productData['assuredId'],
              pricetypeId: productData['pricetypeId'],
              dayId: productData['dayId'],
              adtypeId: productData['adtypeId'],
              cityId: productData['cityId'],
              userId: productData['userId'],
              createdAt: productData['createdAt'],
              updatedAt: productData['updatedAt'],
              image: productData['images'].isNotEmpty? imageBaseUrl+productData['images'][0]['full']:'https://source.unsplash.com/random'
            ));
          },
        );
        productData.assignAll(loadedProduct);
        update();

    } catch (error) {
      print("ERROR11 $error");
    } finally {
      loading(false);
    }
  }

  void setAttribute({int? city_id, int? category_id, int? min_price, int? max_price}){
    this.category_id = category_id;
    this.city_id = city_id;
    this.min_price =min_price;
    this.max_price = max_price;
    fetchProducts();
  }
}
