(deffacts rules
    (pedido num_naranjas 3 num_manzanas 4 num_uvas 4 num_caquis 1)
    (uvas stock 10 pos 1)
    (manzanas stock 10 po 2)
    (naranjas stock 10 pos 3)
    (caquis stock 10 pos 4)
    (linePedido posicion 0)
    (max_cantidad 3)
    (robot position 0 num_naranjas 0 num_manzanas 0 num_uvas 0 num_caquis 0 con_pedido 0)
)

(defrule cogerPedido
    (declare (salience 4))
    (robot ?position ?n_naranjas ?n_manzanas ?n_uvas ?n_caquis ?con_pedido)
    (test (= ?con_pedido 0))
    =>
    (assert (robot position 0 ?n_naranjas ?n_manzanas ?n_uvas ?n_caquis con_pedido 1))
    (printout t"Pedido cogido" crlf)
)

(defrule pedidoCompleto
    (robot ?position ?n_naranjas ?n_manzanas ?n_uvas ?n_caquis ?con_pedido)
    (pedido ?num_naranjas ?num_manzanas ?num_uvas ?num_caquis)
    (test (= ?n_naranjas ?num_naranjas))
    (test (= ?n_manzanas ?num_manzanas))
    (test (= ?n_uvas ?num_uvas))
    (test (= ?n_caquis ?num_caquis))
    =>
    (assert (robot position 0 n_naranjas 0 n_manzanas 0 n_uvas 0 n_caquis 0 con_pedido 0))
    (printout t"Pedido completado" crlf)
)

(defrule cogerPaquete
    (robot ?position ?n_naranjas ?n_manzanas ?n_uvas ?n_caquis ?con_pedido)
    (test (= ?posicion ?pos))
    =>
    (assert (robot with_package ?wp position ?p1 (+ ?p2 1) first_position ?fp1 ?fp2 numMove (+ ?move 1))) ;; Añade el resultado a la base de hechos
)