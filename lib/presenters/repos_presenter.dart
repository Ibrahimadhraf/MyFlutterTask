import 'package:flutter/cupertino.dart';
import 'package:task/dependency_injection.dart';
import 'package:task/models/repos_model.dart';
import 'package:http/http.dart' as http;
abstract class ReposContract{
  void onLoadReposSuccess(List<ReposModel> c);
  void onLoadReposFailed(onError);
}
class ReposPresenter{
  ReposContract reposContract;
  ReposRepositoty repositoty;
  ReposPresenter(this.reposContract){
    repositoty =new Injector().reposRepositoty;
  }
  void loadRepos( BuildContext context ,String login){
      repositoty
      .getAllRepos(context, login, http.Client())
      .then((value) => reposContract.onLoadReposSuccess(value))
          .catchError((error)=>reposContract.onLoadReposFailed(error));
  }
}