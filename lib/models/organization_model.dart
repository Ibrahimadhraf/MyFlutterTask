import 'dart:convert';
import 'package:http/http.dart' as http;
List<OrganizationsModel> organizationsModelFromJson(String str) => List<OrganizationsModel>.from(json.decode(str).map((x) => OrganizationsModel.fromJson(x)));



class OrganizationsModel {
  OrganizationsModel({
    this.login,
    this.id,
    this.nodeId,
    this.url,
    this.reposUrl,
    this.eventsUrl,
    this.hooksUrl,
    this.issuesUrl,
    this.membersUrl,
    this.publicMembersUrl,
    this.avatarUrl,
    this.description,
  });

  String login;
  int id;
  String nodeId;
  String url;
  String reposUrl;
  String eventsUrl;
  String hooksUrl;
  String issuesUrl;
  String membersUrl;
  String publicMembersUrl;
  String avatarUrl;
  String description;

  factory OrganizationsModel.fromJson(Map<String, dynamic> json) => OrganizationsModel(
    login: json["login"],
    id: json["id"],
    nodeId: json["node_id"],
    url: json["url"],
    reposUrl: json["repos_url"],
    eventsUrl: json["events_url"],
    hooksUrl: json["hooks_url"],
    issuesUrl: json["issues_url"],
    membersUrl: json["members_url"],
    publicMembersUrl: json["public_members_url"],
    avatarUrl: json["avatar_url"],
    description: json["description"] == null ? null : json["description"],
  );



}
List<OrganizationsModel>successResponseAllOrganizationModel(String data){
  return organizationsModelFromJson(data);
}
abstract class OrganizationsRepo{
  Future<List<OrganizationsModel>> getAllOrganizations(
      context, http.Client client);
}
