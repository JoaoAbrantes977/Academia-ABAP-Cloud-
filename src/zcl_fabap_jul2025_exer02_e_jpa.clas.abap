CLASS zcl_fabap_jul2025_exer02_e_jpa DEFINITION
                                     PUBLIC
                                     FINAL
                                     CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_E_JPA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_funcionarios TYPE TABLE OF REF TO zcl_fabap_jul2025_exer02_jpa.

    DATA(lo_integral) = NEW zcl_fabap_jul2025_exer02_2_jpa(
      i_nome = 'João'
      i_id = '01'
      i_salario_base = '1500.00'
      i_bonus = '1000.00' ).

    DATA(lo_horista) = NEW zcl_fabap_jul2025_exer02_3_jpa(
      i_nome = 'Maria'
      i_id = '02'
      i_salario_base = '50.00'
      i_horas = 160 ).

    APPEND lo_integral TO lt_funcionarios.
    APPEND lo_horista TO lt_funcionarios.

    LOOP AT lt_funcionarios INTO DATA(lo_funcionario).
      out->write( lo_funcionario->exibir_dados( ) ).
      out->write( |Salário calculado: { lo_funcionario->calcular_salario( ) }| ).
      out->write( '-----------------------------' ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
