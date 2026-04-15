local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.ers', 'eclipse-ers') {
  settings+: {
    description: "",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: false,
    members_can_create_teams: false,
    members_can_delete_repositories: false,
    name: "Eclipse Readability Studio",
    packages_containers_internal: false,
    packages_containers_public: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  secrets+: [
    orgs.newOrgSecret('GPG_KEY_ID') {
      value: "pass:bots/technology.ers/gpg/key_id",
    },
    orgs.newOrgSecret('GPG_PASSPHRASE') {
      value: "pass:bots/technology.ers/gpg/passphrase",
    },
    orgs.newOrgSecret('GPG_PRIVATE_KEY') {
      value: "pass:bots/technology.ers/gpg/secret-subkeys.asc",
    },
  ],
  _repositories+:: [
    orgs.newRepo('website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse Readability Studio website",
      web_commit_signoff_required: false,
    },
   orgs.newRepo('website-source') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse Readability Studio website source",
      web_commit_signoff_required: false,
    },
   orgs.newRepo('ReadabilityStudio') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      code_scanning_default_languages: ["actions", "c-cpp"],
      delete_branch_on_merge: false,
      description: "Eclipse Readability Studio",
      web_commit_signoff_required: false,
      secrets+: [
        orgs.newRepoSecret('SIGNPATH_API_TOKEN') {
          value: "pass:bots/technology.ers/signpath.io/api-token",
        },
      ],
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
