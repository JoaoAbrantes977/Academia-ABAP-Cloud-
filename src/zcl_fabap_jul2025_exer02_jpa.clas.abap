CLASS zcl_fabap_jul2025_exer02_jpa DEFINITION
                                   PUBLIC
                                   CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

        METHODS constructor
        IMPORTING
        i_nome TYPE string
        i_id TYPE string
        i_salario_base TYPE decfloat16.

    METHODS calcular_salario
        RETURNING VALUE(r_salario) TYPE decfloat16.

    METHODS exibir_dados
        RETURNING VALUE(r_dados) TYPE string.

      PROTECTED SECTION.

        DATA v_nome TYPE string.
        DATA v_id TYPE string.
        DATA v_salario_base TYPE decfloat16.


  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_JPA IMPLEMENTATION.


    METHOD calcular_salario.
        r_salario = v_salario_base.
    ENDMETHOD.


    METHOD constructor.
    v_nome = i_nome.
    v_id = i_id.
    v_salario_base = i_salario_base.
  ENDMETHOD.


   METHOD exibir_dados.
    r_dados = |Nome: { v_nome }, Id: { v_id }, Salário Base: { v_salario_base }|.
  ENDMETHOD.


    METHOD if_oo_adt_classrun~main.

    ENDMETHOD.
ENDCLASS.
