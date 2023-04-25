# Github Terraform provider Repro

Using this repository to minimally reproduce a bug in a terraform provider.
The problem is, that the terraform state is always inconsistent with every
retry, even after applying successfully.

The repo to be configured with the terraform-provider-github is
https://github.com/mmuth/sample-repo-with-statuschecks (this is just for completeness,
the terraform is only effectively executable within a GitHub organization!)
