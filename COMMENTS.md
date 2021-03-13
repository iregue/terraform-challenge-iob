Problemas:
- No se ha podido poner como source del modulo tf la URL por HTTP/S solo se ha podido por SSH.
- Ha costado (leyendo documentación un rato) la parte de Outputs del modulo y luego invocar al remote state de los security groups para asociarlo con la instancia.
- La parte de sustitución del domain name en el index.html no se ha ocurrido como hacerla. Se han generado 2 index.html
- No he generado el dichero .tfvars con todas las variables, en contra posición en el README comento que variables se tiene que modificar para ejecutar el tf.

Otros comentarios:
- Principalmente se ha dedicado gran parte del tiempo leyendo documentación tanto de tf como nginx.
- No he creado una VPC para este caso. Se ha utilizado la por defecto.