import 'package:http/src/client.dart';
import 'package:task/helpers/constants.dart';
import 'package:task/models/repos_model.dart';
import 'package:task/network/api_client.dart';

class ReposService implements ReposRepositoty {
  //https://api.github.com/orgs/collectiveidea/repos
  @override
  Future<List<ReposModel>> getAllRepos(context, String login, Client client) async {
    return await getCallService(
        Constants(context).baseUrl+"orgs/$login/repos",
        RequestType.Repos);
  }
}
