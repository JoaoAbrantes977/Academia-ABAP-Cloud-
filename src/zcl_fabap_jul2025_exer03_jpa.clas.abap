CLASS zcl_fabap_jul2025_exer03_jpa DEFINITION
                                   PUBLIC
                                   FINAL
                                   CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER03_JPA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Tabelas

* Estruturas

* Variáveis
    DATA o_produto TYPE REF TO lcl_produto.

**********************************************************************

    o_produto = lcl_produto=>create_produto( i_codigo = '001'
                               i_nome = 'Produto 1'
                               i_preco = '100' ).

    out->write( 'Código: ' && |{ o_produto->get_codigo( ) }|  ).
    out->write( 'Nome: '   && |{ o_produto->get_nome( )  }| ).
    out->write( 'Preço: '  && |{ o_produto->get_preco( ) }| ).

  ENDMETHOD.
ENDCLASS.
