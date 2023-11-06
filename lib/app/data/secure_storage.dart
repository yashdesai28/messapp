import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class securestorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  writesecurestorage(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  readsecurestorage(String key) async {
    String value = await storage.read(key: key) ?? 'No Data';
    print('read data from secure storage :$value');

    return value;
  }

  deletesecurestorage(String key) async {
    await storage.delete(key: key);
  }


  storemeaddata(String key,String value)async{
    print(value);
    await storage.write(key:key,value:value);
  }

  readmealsdata(String key)async {
    String value = await storage.read(key: key) ?? 'No Data';
    print('read data from secure storage :$value');

    return value;
  }

  deletemealsdata(String key)async{
      await storage.delete(key: key);
  }


  
  gstoremeaddata(String key,String value)async{
    print(value);
    await storage.write(key:key,value:value);
  }

  greadmealsdata(String key)async {
    String value = await storage.read(key: key) ?? 'No Data';
    print('read data from secure storage :$value');

    return value;
  }

  gdeletemealsdata(String key)async{
      await storage.delete(key: key);
  }

  
}
