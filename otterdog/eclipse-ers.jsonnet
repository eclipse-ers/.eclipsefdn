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
  _repositories+:: [
    orgs.newRepo('website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Readability Studio website",
      web_commit_signoff_required: false,
    },
   orgs.newRepo('website-source') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Readability Studio website source",
      web_commit_signoff_required: false,
    },
   orgs.newRepo('ReadabilityStudio') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Readability Studio project",
      web_commit_signoff_required: false,
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
