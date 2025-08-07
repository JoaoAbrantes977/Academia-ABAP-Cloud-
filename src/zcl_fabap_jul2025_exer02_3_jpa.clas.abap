CLASS zcl_fabap_jul2025_exer02_3_jpa DEFINITION
                                     PUBLIC
                                     INHERITING FROM zcl_fabap_jul2025_exer02_jpa    " Herança da SuperClasse Funcionario
                                     FINAL
                                     CREATE PUBLIC .

"Funcionario Horista

  PUBLIC SECTION.

    METHODS constructor
    IMPORTING
    i_nome TYPE string
    i_id TYPE string
    i_salario_base TYPE decfloat16
    i_horas TYPE i.

    METHODS calcular_salario REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
  DATA: v_horas TYPE i.

  DATA v_bonus TYPE decfloat16.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_3_JPA IMPLEMENTATION.


  METHOD calcular_salario.

    r_salario = v_salario_base * v_horas.

  ENDMETHOD.


  METHOD constructor.

    super->constructor( i_nome = i_nome i_id = v_id i_salario_base = i_salario_base ).
    v_horas = i_horas.

  ENDMETHOD.
ENDCLASS.
