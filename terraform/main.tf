terraform {
  required_version = ">=1.3.9"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  owner = "mmuth" # use an organization here!
  app_auth {}
}

resource "github_branch_protection_v3" "main" {
  repository     = "sample-repo-with-statuschecks"
  branch         = "main"
  enforce_admins = true

  required_pull_request_reviews {
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }

  required_status_checks {
    strict = false
    checks = ["test-server:MY_APP_ID", "test-react:MY_APP_ID", "test-libraries:MY_APP_ID"]
  }

  lifecycle {
    ignore_changes = [ required_status_checks.0.contexts ]
  }
}
