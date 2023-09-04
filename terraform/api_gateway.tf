# Create API Gateway
resource "aws_api_gateway_rest_api" "my-api-gateway" {
  name        = "my-api-gateway"
  description = "This is my API for demonstration purposes"
}

# Create GET Method under root resource
resource "aws_api_gateway_method" "my-method" {
  rest_api_id   = aws_api_gateway_rest_api.my-api-gateway.id
  resource_id   = aws_api_gateway_rest_api.my-api-gateway.root_resource_id
  http_method   = "GET"
  authorization = "NONE"
}

# Create HTTP PROXY route
resource "aws_api_gateway_integration" "my-integration" {
  rest_api_id          = aws_api_gateway_rest_api.my-api-gateway.id
  resource_id          = aws_api_gateway_rest_api.my-api-gateway.root_resource_id
  http_method          = aws_api_gateway_method.my-method.http_method
  type                 = "HTTP_PROXY"
  uri = "http://54.89.111.178:8080/"
  integration_http_method = "GET"
  
}