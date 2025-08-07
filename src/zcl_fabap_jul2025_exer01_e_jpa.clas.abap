CLASS zcl_fabap_jul2025_exer01_e_jpa DEFINITION
                                   PUBLIC
                                   FINAL
                                   CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER01_E_JPA IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.

    " Criação de um objeto produto
    DATA(lo_produto) = NEW zcl_fabap_jul2025_exer01_jpa( i_codigo = 'P001'
                                                         i_nome   = 'Notebook'
                                                         i_preco  = '3500.00' ).

    " Adicionar Stock
    lo_produto->adicionar_stock( 10 ).

    " Exibir informações do produto
    out->write( |Produto:        { lo_produto->get_nome( ) }| ).
    out->write( |Código:         { lo_produto->get_codigo( ) }| ).
    out->write( |Preço:          { lo_produto->get_preco( ) }| ).
    out->write( |Stock:          { lo_produto->get_stock( ) }| ).

    "Remover stock
    DATA(lv_sucesso) = lo_produto->remover_stock( 3 ).

    " Remover stock com sucesso
    IF lv_sucesso = abap_true.
      out->write( |Stock removido com sucesso!| ).
      out->write( |Novo stock: { lo_produto->get_stock( ) }| ).
    ELSE.
      out->write( |Stock insuficiente!| ).
    ENDIF.

    " Tentar remover mais do que existe no stock
    lv_sucesso = lo_produto->remover_stock( 10 ).

    IF lv_sucesso = abap_true.
      out->write( |Stock removido com sucesso!| ).
      out->write( |Novo Stock: { lo_produto->get_stock( ) }| ).
    ELSE.
      out->write( |Stock Insuficiente!| ).
    ENDIF.

    " Calcular e exibir o valor total do stock
    DATA(lv_valor_total) = lo_produto->valor_total( ).
    out->write( |Valor total em stock: { lv_valor_total }| ).

    ENDMETHOD.
ENDCLASS.
