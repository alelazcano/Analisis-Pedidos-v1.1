select
   concat(
   ' insert into RN_AnalisisPedidos.RAW_Pedidos values (',
   '''',
    pedidos.date_upd,''',',
        pedidos.id_order,',''',
    pedidos.reference,''',',
    pedidos.total_paid,',''',
    pedidos.payment,''',''',
    clientes.firstname,''',''',
    clientes.lastname,''',''',
    direccion.phone,''',''',
    provincia.name,''',',
   coalesce(detalle.id_order_detail,'0'),',''',
   coalesce(detalle.product_reference,'-'),''',''',
    coalesce(detalle.product_name,'-'),''',',
    coalesce(detalle.unit_price_tax_incl,'0'),',',
    coalesce(detalle.product_quantity,'0'),',',
    coalesce(detalle.total_price_tax_incl,'0'),',',
    pedidos.current_state,
	');') as ''
from regalonatural.ps_orders pedidos
left outer join regalonatural.ps_customer clientes
on pedidos.id_customer=clientes.id_customer
inner join (
    select id_customer as min_id_customer, min(id_address) as min_direc
    from regalonatural.ps_address
    group by min_id_customer) as minima_direc
on clientes.id_customer=minima_direc.min_id_customer
inner join regalonatural.ps_address direccion
on minima_direc.min_id_customer=direccion.id_customer
and minima_direc.min_direc=direccion.id_address
inner join regalonatural.ps_state provincia
on direccion.id_state=provincia.id_state
left outer join regalonatural.ps_order_detail detalle
on pedidos.id_order=detalle.id_order
where direccion.deleted=0
order by pedidos.id_order DESC

