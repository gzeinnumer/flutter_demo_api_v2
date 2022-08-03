class AuthRepo{
  Future<List<String>> login(String username, String password) async {
    // print('attempting login');
    await Future.delayed(const Duration(seconds: 3));

    return ["Zein"];
    // //hit service api
    //
    // if(username=="admin" && password=="admin"){
    //   //success
    // } else{
    //   //fail
    // }
    // print('logged in');
    // throw Exception('failed log in');
  }
}