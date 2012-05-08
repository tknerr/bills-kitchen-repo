name "webserver"
description "Systems that serve HTTP and HTTPS"
run_list(
  "recipe[apache2]",
  "recipe[apache2::mod_ssl]"
)
default_attributes(
  "apache2" => {
	"listen_ports" => ["80", "443"]
  }
)