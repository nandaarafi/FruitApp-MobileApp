import 'dio_config.dart';
import 'package:fruit_app/features/home/model/data_model.dart';

abstract class RemoteProductDataSource {
  const RemoteProductDataSource();

  Future<List<ProductDataModel>> productData(
    // required String title,
    // required String subtitle,
    // required String image,
  );
}

class RemoteProductDataSourceImpl implements RemoteProductDataSource {
  const RemoteProductDataSourceImpl();

  @override
  Future<List<ProductDataModel>> productData() async {
    try {
      final response = await dio.get(
        '/productdata',
      );

      if (response.statusCode == 200) {
        final List<dynamic> list = response.data;
        return list.map((e) => ProductDataModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}