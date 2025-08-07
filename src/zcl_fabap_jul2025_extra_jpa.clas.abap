CLASS zcl_fabap_jul2025_extra_jpa DEFINITION
                                  PUBLIC
                                  FINAL
                                  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES  if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXTRA_JPA IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.

      " Exercicio 1
       out->write( '******************************* EXERCICIO 1 **********************************' ).
      SELECT * FROM zi_fabap_exer01_jpa
      INTO TABLE @DATA(lt_connect).

       out->write( lt_connect ).

      " Exercicio 2
      out->write( '******************************* EXERCICIO 2 **********************************' ).
      SELECT * FROM zi_fabap_exer02_jpa
      INTO TABLE @DATA(lt_connect2).

       out->write( lt_connect2 ).
      out->write( '******************************* EXERCICIO 3 **********************************' ).
      "Exercicio 3
      SELECT * FROM zi_fabap_exer03_jpa
      INTO TABLE @DATA(lt_connect3).

       out->write( lt_connect3 ).

    ENDMETHOD.
ENDCLASS.
