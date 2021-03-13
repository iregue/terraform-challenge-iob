### Variables a modificar
Para ejecutar el código es necesario modificar las siguientes variables.

* **remote_state**: Se ha utilizado un state remote en un s3 privado, por lo que esta referencia tiene que cambiarse en todos los ficheros que aparezca. El bucket utilizado para la demo ha sido "**iregueiro-terraform**". Remplazar este valor.
* **010-nginx/vars.tf**: Se añade una clave pública para el acceso via ssh. En caso de querer acceder, modificar este campo.
* **020-alb/vars.tf**: Se han introducido los ids de la VPC y subnets por defecto, por lo que es necesario sustituitlos por unos válidos de la cuanta en la que se vaya a desplegar. Estas variables son: vpc_id, subnet1, subnet2.

### A tener en cuenta

* **config**: Se ha añadido el fichero de configuración de nginx que se encuentra en un s3 privado, añadiendolo a un bucket y cambiando la referencia en el fichero **010-nginx/locals.tf** se automatiza la configuración.

* **Ejecución**: Para lanzar el código se debe ejecutar un terraform apply siguiendo la enumeración de las carpetas, el orden sería:
1. 005-sgs
2. 010-nginx
3. 020-lb 

## Versiones

* Terraform v0.13.5
* AWS Provider 3.32.0