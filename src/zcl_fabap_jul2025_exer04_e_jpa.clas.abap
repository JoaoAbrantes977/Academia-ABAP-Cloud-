CLASS zcl_fabap_jul2025_exer04_e_jpa DEFINITION
                                     PUBLIC
                                     FINAL
                                     CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER04_E_JPA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    zcl_fabap_jul2025_exer04_jpa=>get_data( IMPORTING et_data = DATA(t_data) ).

    out->write( t_data ).

  ENDMETHOD.
ENDCLASS.
