import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageFlutter{
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  writeData(String key, String value) async{
    await storage.write(key: key, value: value);
    print('Successfully saved: $value');
  }

  readData(String key) async{
    String value =  await storage.read(key: key) ?? 'No data';
    print('Data from storage: $value');
  }

  deleteData(String key) async{
    await storage.delete(key: key);
    print('Successfully deleted');
  }

}