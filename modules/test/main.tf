data "curl" "getTodos" {
  http_method = "GET"
  uri = "https://api.wordpress.org/secret-key/1.1/salt/"
}
resource "local_file" "test" {
  filename = "./test"
  content = "${data.curl.getTodos.response}"
}