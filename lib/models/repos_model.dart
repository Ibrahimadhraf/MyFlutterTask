import 'dart:convert';
import 'package:http/http.dart' as http;
List<ReposModel> reposModelFromJson(String str) => List<ReposModel>.from(json.decode(str).map((x) => ReposModel.fromJson(x)));

class ReposModel {
  ReposModel({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.permissions,
  });

  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;
  Owner owner;
  String htmlUrl;
  String description;
  bool fork;
  String url;
  String forksUrl;
  String keysUrl;
  String collaboratorsUrl;
  String teamsUrl;
  String hooksUrl;
  String issueEventsUrl;
  String eventsUrl;
  String assigneesUrl;
  String branchesUrl;
  String tagsUrl;
  String blobsUrl;
  String gitTagsUrl;
  String gitRefsUrl;
  String treesUrl;
  String statusesUrl;
  String languagesUrl;
  String stargazersUrl;
  String contributorsUrl;
  String subscribersUrl;
  String subscriptionUrl;
  String commitsUrl;
  String gitCommitsUrl;
  String commentsUrl;
  String issueCommentUrl;
  String contentsUrl;
  String compareUrl;
  String mergesUrl;
  String archiveUrl;
  String downloadsUrl;
  String issuesUrl;
  String pullsUrl;
  String milestonesUrl;
  String notificationsUrl;
  String labelsUrl;
  String releasesUrl;
  String deploymentsUrl;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime pushedAt;
  String gitUrl;
  String sshUrl;
  String cloneUrl;
  String svnUrl;
  String homepage;
  int size;
  int stargazersCount;
  int watchersCount;
  Language language;
  bool hasIssues;
  bool hasProjects;
  bool hasDownloads;
  bool hasWiki;
  bool hasPages;
  int forksCount;
  dynamic mirrorUrl;
  bool archived;
  bool disabled;
  int openIssuesCount;
  License license;
  int forks;
  int openIssues;
  int watchers;
  DefaultBranch defaultBranch;
  Permissions permissions;

  factory ReposModel.fromJson(Map<String, dynamic> json) => ReposModel(
    id: json["id"],
    nodeId: json["node_id"],
    name: json["name"],
    fullName: json["full_name"],
    private: json["private"],
    owner: Owner.fromJson(json["owner"]),
    htmlUrl: json["html_url"],
    description: json["description"] == null ? null : json["description"],
    fork: json["fork"],
    url: json["url"],
    forksUrl: json["forks_url"],
    keysUrl: json["keys_url"],
    collaboratorsUrl: json["collaborators_url"],
    teamsUrl: json["teams_url"],
    hooksUrl: json["hooks_url"],
    issueEventsUrl: json["issue_events_url"],
    eventsUrl: json["events_url"],
    assigneesUrl: json["assignees_url"],
    branchesUrl: json["branches_url"],
    tagsUrl: json["tags_url"],
    blobsUrl: json["blobs_url"],
    gitTagsUrl: json["git_tags_url"],
    gitRefsUrl: json["git_refs_url"],
    treesUrl: json["trees_url"],
    statusesUrl: json["statuses_url"],
    languagesUrl: json["languages_url"],
    stargazersUrl: json["stargazers_url"],
    contributorsUrl: json["contributors_url"],
    subscribersUrl: json["subscribers_url"],
    subscriptionUrl: json["subscription_url"],
    commitsUrl: json["commits_url"],
    gitCommitsUrl: json["git_commits_url"],
    commentsUrl: json["comments_url"],
    issueCommentUrl: json["issue_comment_url"],
    contentsUrl: json["contents_url"],
    compareUrl: json["compare_url"],
    mergesUrl: json["merges_url"],
    archiveUrl: json["archive_url"],
    downloadsUrl: json["downloads_url"],
    issuesUrl: json["issues_url"],
    pullsUrl: json["pulls_url"],
    milestonesUrl: json["milestones_url"],
    notificationsUrl: json["notifications_url"],
    labelsUrl: json["labels_url"],
    releasesUrl: json["releases_url"],
    deploymentsUrl: json["deployments_url"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pushedAt: DateTime.parse(json["pushed_at"]),
    gitUrl: json["git_url"],
    sshUrl: json["ssh_url"],
    cloneUrl: json["clone_url"],
    svnUrl: json["svn_url"],
    homepage: json["homepage"],
    size: json["size"],
    stargazersCount: json["stargazers_count"],
    watchersCount: json["watchers_count"],
    language: languageValues.map[json["language"]],
    hasIssues: json["has_issues"],
    hasProjects: json["has_projects"],
    hasDownloads: json["has_downloads"],
    hasWiki: json["has_wiki"],
    hasPages: json["has_pages"],
    forksCount: json["forks_count"],
    mirrorUrl: json["mirror_url"],
    archived: json["archived"],
    disabled: json["disabled"],
    openIssuesCount: json["open_issues_count"],
    license: json["license"] == null ? null : License.fromJson(json["license"]),
    forks: json["forks"],
    openIssues: json["open_issues"],
    watchers: json["watchers"],
    defaultBranch: defaultBranchValues.map[json["default_branch"]],
    permissions: Permissions.fromJson(json["permissions"]),
  );


}

enum DefaultBranch { MASTER, RAILS_32 }

final defaultBranchValues = EnumValues({
  "master": DefaultBranch.MASTER,
  "rails-3.2": DefaultBranch.RAILS_32
});

enum Language { RUBY, JAVA_SCRIPT }

final languageValues = EnumValues({
  "JavaScript": Language.JAVA_SCRIPT,
  "Ruby": Language.RUBY
});

class License {
  License({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  Key key;
  Name name;
  SpdxId spdxId;
  String url;
  LicenseNodeId nodeId;

  factory License.fromJson(Map<String, dynamic> json) => License(
    key: keyValues.map[json["key"]],
    name: nameValues.map[json["name"]],
    spdxId: spdxIdValues.map[json["spdx_id"]],
    url: json["url"] == null ? null : json["url"],
    nodeId: licenseNodeIdValues.map[json["node_id"]],
  );


}

enum Key { MIT, OTHER }

final keyValues = EnumValues({
  "mit": Key.MIT,
  "other": Key.OTHER
});

enum Name { MIT_LICENSE, OTHER }

final nameValues = EnumValues({
  "MIT License": Name.MIT_LICENSE,
  "Other": Name.OTHER
});

enum LicenseNodeId { M_DC6_T_GLJ_ZW5_Z_ZT_EZ, M_DC6_T_GLJ_ZW5_Z_ZTA }

final licenseNodeIdValues = EnumValues({
  "MDc6TGljZW5zZTA=": LicenseNodeId.M_DC6_T_GLJ_ZW5_Z_ZTA,
  "MDc6TGljZW5zZTEz": LicenseNodeId.M_DC6_T_GLJ_ZW5_Z_ZT_EZ
});

enum SpdxId { MIT, NOASSERTION }

final spdxIdValues = EnumValues({
  "MIT": SpdxId.MIT,
  "NOASSERTION": SpdxId.NOASSERTION
});

class Owner {
  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  Login login;
  int id;
  OwnerNodeId nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  GistsUrl gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  EventsUrl eventsUrl;
  String receivedEventsUrl;
  Type type;
  bool siteAdmin;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    login: loginValues.map[json["login"]],
    id: json["id"],
    nodeId: ownerNodeIdValues.map[json["node_id"]],
    avatarUrl: json["avatar_url"],
    gravatarId: json["gravatar_id"],
    url: json["url"],
    htmlUrl: json["html_url"],
    followersUrl: json["followers_url"],
    followingUrl: json["following_url"],
    gistsUrl: gistsUrlValues.map[json["gists_url"]],
    starredUrl: json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"],
    organizationsUrl: json["organizations_url"],
    reposUrl: json["repos_url"],
    eventsUrl: eventsUrlValues.map[json["events_url"]],
    receivedEventsUrl: json["received_events_url"],
    type: typeValues.map[json["type"]],
    siteAdmin: json["site_admin"],
  );

  Map<String, dynamic> toJson() => {
    "login": loginValues.reverse[login],
    "id": id,
    "node_id": ownerNodeIdValues.reverse[nodeId],
    "avatar_url": avatarUrl,
    "gravatar_id": gravatarId,
    "url": url,
    "html_url": htmlUrl,
    "followers_url": followersUrl,
    "following_url": followingUrl,
    "gists_url": gistsUrlValues.reverse[gistsUrl],
    "starred_url": starredUrl,
    "subscriptions_url": subscriptionsUrl,
    "organizations_url": organizationsUrl,
    "repos_url": reposUrl,
    "events_url": eventsUrlValues.reverse[eventsUrl],
    "received_events_url": receivedEventsUrl,
    "type": typeValues.reverse[type],
    "site_admin": siteAdmin,
  };
}

enum EventsUrl { HTTPS_API_GITHUB_COM_USERS_COLLECTIVEIDEA_EVENTS_PRIVACY }

final eventsUrlValues = EnumValues({
  "https://api.github.com/users/collectiveidea/events{/privacy}": EventsUrl.HTTPS_API_GITHUB_COM_USERS_COLLECTIVEIDEA_EVENTS_PRIVACY
});

enum GistsUrl { HTTPS_API_GITHUB_COM_USERS_COLLECTIVEIDEA_GISTS_GIST_ID }

final gistsUrlValues = EnumValues({
  "https://api.github.com/users/collectiveidea/gists{/gist_id}": GistsUrl.HTTPS_API_GITHUB_COM_USERS_COLLECTIVEIDEA_GISTS_GIST_ID
});

enum Login { COLLECTIVEIDEA }

final loginValues = EnumValues({
  "collectiveidea": Login.COLLECTIVEIDEA
});

enum OwnerNodeId { MD_EY_OK9_Y_Z2_FUA_XPHD_GLVBJ_EY_OA }

final ownerNodeIdValues = EnumValues({
  "MDEyOk9yZ2FuaXphdGlvbjEyOA==": OwnerNodeId.MD_EY_OK9_Y_Z2_FUA_XPHD_GLVBJ_EY_OA
});

enum Type { ORGANIZATION }

final typeValues = EnumValues({
  "Organization": Type.ORGANIZATION
});

class Permissions {
  Permissions({
    this.admin,
    this.push,
    this.pull,
  });

  bool admin;
  bool push;
  bool pull;

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
    admin: json["admin"],
    push: json["push"],
    pull: json["pull"],
  );


}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
List<ReposModel>successResponseAllReposModel(String data){
  return reposModelFromJson(data);
}
abstract class ReposRepositoty{
  Future<List<ReposModel>> getAllRepos(context ,String login ,http.Client client);
}