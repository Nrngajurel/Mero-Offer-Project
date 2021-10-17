import 'package:get/get.dart';
import 'package:mero/controllers/product-controller.dart';
import 'package:mero/models/category.dart';
import 'package:mero/services/services.dart';

class CategoryController extends GetxController{
  
  RxList<Category> category = <Category>[].obs;
  RxString cat = "Category".obs;

  @override
  void onReady() {
    super.onReady();
    fetchCategory();
  }
  
  Future<void> fetchCategory() async{
    final List<Category> loadCategory = <Category>[];

    try{

      final response = await ApiServices().getRequest("/parentCategory");


      response['data'].forEach((json){
        loadCategory.add(Category(
          id: json["id"],
          name: json["name"],
          status: json["status"],
          color: json["color"],
          order: json["order"],
          desc: json["desc"],
          featured: json["featured"],
          menu: json["menu"],
          image: json["image"],
          parentId: json["parent_id"],
          slug: json["slug"],
          createdAt: DateTime.parse(json["created_at"]),
          updatedAt: DateTime.parse(json["updated_at"]),
        ));
      });

      category.assignAll(loadCategory);
      update();
    }catch(error){
      print("ERROR11 $error");
    }finally{

    }


    
  }

  void setCat({required int id,required name}){
    final ProductController productController = Get.find();
    this.cat.value = name;
    productController.setAttribute(category_id: id);
  }

}