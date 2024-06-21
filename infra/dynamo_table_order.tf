resource "aws_dynamodb_table" "order-dynamodb-table" {
  name           = "Order"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"
  range_key      = "clientId"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "clientId"
    type = "S"
  }

  attribute {
    name = "totalValue"
    type = "N"
  }

  attribute {
    name = "createdAt"
    type = "S"
  }

  attribute {
    name = "updatedAt"
    type = "S"
  }

  attribute {
    name = "paymentStatus"
    type = "S"
  }


  ttl {
    attribute_name = "leaveDate"
    enabled        = false
  }

  global_secondary_index {
    name               = "OrderIndex"
    hash_key           = "clientId"
    range_key          = "createdAt"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  tags = {
    Name        = "product-dynamodb-table"
    Environment = "fiap-pos-tech"
  }
}