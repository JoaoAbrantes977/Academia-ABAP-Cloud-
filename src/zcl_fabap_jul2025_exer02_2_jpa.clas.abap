CLASS zcl_fabap_jul2025_exer02_2_jpa DEFINITION
                                     PUBLIC
                                     INHERITING FROM zcl_fabap_jul2025_exer02_jpa    " Herança da SuperClasse Funcionario
                                     FINAL
                                     CREATE PUBLIC .

"Funcionario Integral

  PUBLIC SECTION.

    METHODS constructor
    IMPORTING
    i_nome TYPE string
    i_id TYPE string
    i_salario_base TYPE decfloat16
    i_bonus TYPE decfloat16.

    METHODS calcular_salario REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.

  DATA v_bonus TYPE decfloat16.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_2_JPA IMPLEMENTATION.


  METHOD calcular_salario.

    r_salario = v_salario_base + v_bonus.

  ENDMETHOD.


  METHOD constructor.

    super->constructor( i_nome = i_nome i_id = i_id i_salario_base = i_salario_base ).
    v_bonus = i_bonus.

  ENDMETHOD.
ENDCLASS.
