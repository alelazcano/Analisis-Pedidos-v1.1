#!/usr/bin/env bash
chmod +x /home/MTTO-TIENDA/Analisis-Pedidos/inicializa_sistema.sh
chmod +x /home/MTTO-TIENDA/Analisis-Pedidos/recupera_pedidos.sh

bash /home/MTTO-TIENDA/Analisis-Pedidos/docker/montadocker.sh
bash /home/MTTO-TIENDA/Analisis-Pedidos/inicializa_sistema.sh
bash /home/MTTO-TIENDA/Analisis-Pedidos/recupera_pedidos.sh

