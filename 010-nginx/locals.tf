locals {
  instance-userdata = <<EOF
#!/bin/bash
sudo yum update
amazon-linux-extras install nginx1.12
mkdir -p /var/www/iregueiro
echo '<html><head></head><body>Hello there!! You are accesing domain test.iregueiro.io.builders</body></html>' > /var/www/iregueiro/test.iregueiro.io.builders.html
echo '<html><head></head><body>Hello there!! You are accesing domain mytest.iregueiro.io.builders</body></html>' > /var/www/iregueiro/mytest.iregueiro.io.builders.html
aws s3 cp s3://iregueiro-terraform/nginx.conf /etc/nginx/nginx.conf
sudo systemctl start nginx
EOF
}