resource "aws_instance" "test" {
  ami                    = var.test_instance_image
  instance_type          = var.test_instance_type
  key_name               = "${var.name}-test"
  vpc_security_group_ids = [aws_security_group.test_ec2.id]

  tags = {
    Name = "${var.name}-${var.env}"
    Env  = "${var.env}"
  }
}

data "aws_ecs_task_definition" "api" {
  task_definition = aws_ecs_task_definition.api.family
}

resource "datadog_monitor" "api_alb_api_5xx_count" {
}

data "datadog_api_key" "service" {
  name = "service"
}

data "onepassword_vault" "tfref" {
  name = "tfref"
}

resource "onepassword_item" "login" {
  vault    = data.onepassword_vault.tfref.uuid
  title    = "tfref"
  category = "login"
  password = "password"
}

resource "github_membership" "membership_for_some_user" {
  username = "SomeUser"
  role     = "member"
}

data "github_collaborators" "test" {
  owner      = "example_owner"
  repository = "example_repository"
}

data "azurerm_aadb2c_directory" "example" {
  resource_group_name = "example-rg"
  domain_name         = "exampleb2ctenant.onmicrosoft.com"
}

resource "azurerm_aadb2c_directory" "example" {
  country_code            = "US"
  data_residency_location = "United States"
  display_name            = "example-b2c-tenant"
  domain_name             = "exampleb2ctenant.onmicrosoft.com"
  resource_group_name     = "example-rg"
  sku_name                = "PremiumP1"
}

resource "kubernetes_pod" "test" {
  metadata {
    name = "terraform-example"
  }

  spec {
    container {
    }
  }
}

data "kubernetes_all_namespaces" "allns" {}

resource "google_api_gateway_api" "api" {
  provider = google-beta
  api_id = "api"
}

data "google_cloud_run_service" "run-service" {
  name = "my-service"
  location = "us-central1"
}
