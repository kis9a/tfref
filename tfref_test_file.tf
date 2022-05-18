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
