ui = true

storage "mysql" {
  address  = "mysql:3306"
  username = "root"
  password = "TYPE_MYSQL_PASSWORD_HERE"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}
