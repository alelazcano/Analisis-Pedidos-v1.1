SELECT
estado_pedido,
fecha,
id_pedido,
referencia,
metodo_pago,
nombre_cliente,
precio_total_pedido,
provincia_cliente,
telefono_cliente
from Cabeceras_Pedidos a 
inner join (select id_pedido as b_id_pedido, max(fecha) as b_fecha from Cabeceras_Pedidos group by id_pedido) as b 
on a.id_pedido=b.b_id_pedido
and a.fecha=b.b_fecha
order by id_pedido DESC

