// instantiate the cloudtrail module only supplying required parameters with the intent of really exercising the defaults

module "policy_template" {
  source = "../../../" //minimal integration test

  policy_name        = "minimal-test"
  policy_description = "a policy for testing"
}
