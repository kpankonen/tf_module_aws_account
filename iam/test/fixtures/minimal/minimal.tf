// instantiate the cloudtrail module only supplying required parameters with the intent of really exercising the defaults

module "it_minimal" {
  source = "../../../" //minimal integration test

  app_engineers      = ["appengineer1", "appengineer2"]
  platform_engineers = ["plateng1", "plateng2"]
  operators          = ["operator1", "operator2"]
}
