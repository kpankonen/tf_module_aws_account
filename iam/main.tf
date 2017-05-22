module "app_engineers" {
  source        = "./app_engineers"
  app_engineers = ["${var.app_engineers}"]
}

module "platform_engineers" {
  source             = "./platform_engineers"
  platform_engineers = ["${var.platform_engineers}"]
}

module "operators" {
  source    = "./operators"
  operators = ["${var.operators}"]
}
