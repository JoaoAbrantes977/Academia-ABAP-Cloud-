CLASS zcl_fabap_jul2025_exer01_jpa DEFINITION
                                   PUBLIC
                                   FINAL
                                   CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    " Construtor: inicializa um novo produto com código, nome e preço
    " O stock inicial é sempre zero
    METHODS constructor
    IMPORTING
        i_codigo TYPE string
        i_nome TYPE string
        i_preco TYPE decfloat16.

    " Adiciona uma quantidade ao stock do produto
    METHODS adicionar_stock
        IMPORTING i_stock TYPE i.

    " Remove uma quantidade do stock, se disponível
    " Retorna TRUE se a operação foi bem-sucedida, FALSE caso contrário
    METHODS remover_stock
        IMPORTING i_stock TYPE i
        RETURNING VALUE(r_sucesso) TYPE abap_bool.

    " Calcula o valor total do stock (preço * quantidade)
    METHODS valor_total
        RETURNING VALUE(r_valor_total) TYPE decfloat16.

    METHODS get_nome RETURNING VALUE(r_nome) TYPE string.
    METHODS get_codigo RETURNING VALUE(r_codigo) TYPE string.
    METHODS get_preco  RETURNING VALUE(r_preco) TYPE decfloat16.
    METHODS get_stock RETURNING VALUE(r_stock) TYPE i.


  PROTECTED SECTION.

  PRIVATE SECTION.

  " Atributos privados da classe
  DATA gv_codigo TYPE string.           " Código único do produto
  DATA gv_nome TYPE string.             " Nome descritivo do produto
  DATA gv_preco TYPE decfloat16.        " Preço unitário do produto
  DATA gv_stock TYPE i.                 " Quantidade em stock

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER01_JPA IMPLEMENTATION.


    METHOD adicionar_stock.
    " Adiciona a quantidade informada ao stock
        gv_stock = gv_stock + i_stock.

    ENDMETHOD.


    METHOD constructor.
        " Inicializa os atributos com os valores recebidos
        gv_codigo = i_codigo.
        gv_nome = i_codigo.
        gv_preco = i_preco.
        gv_stock = 0.

    ENDMETHOD.


    METHOD get_codigo.
        r_codigo = gv_codigo.
      ENDMETHOD.


      METHOD get_nome.
        r_nome = gv_nome.
      ENDMETHOD.


      METHOD get_preco.
        r_preco = gv_preco.
      ENDMETHOD.


      METHOD get_stock.
        r_stock = gv_stock.
      ENDMETHOD.


    METHOD if_oo_adt_classrun~main.
    ENDMETHOD.


     METHOD remover_stock.
    " Verifica se há stock suficiente antes de remover
    IF i_stock <= gv_stock.

    " Stock suficiente, pode remover
      gv_stock = gv_stock - i_stock.
      r_sucesso = abap_true.

    ELSE.
      " Stock insuficiente, operação falha
      r_sucesso = abap_false.
    ENDIF.

    ENDMETHOD.


    METHOD valor_total.
    " Calcula o valor total multiplicando o preço pela quantidade em stock
    r_valor_total = gv_preco * gv_stock.
    ENDMETHOD.
ENDCLASS.
