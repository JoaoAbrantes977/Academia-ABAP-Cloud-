CLASS zcl_fabap_jul2025_exer15_jpa DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabap_jul2025_exer15_jpa IMPLEMENTATION.

      METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_flight_data,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             price         TYPE /dmo/flight_price,
             distance      TYPE /dmo/flight_distance,
           END OF ty_flight_data.

    DATA lt_flight_data TYPE SORTED TABLE OF ty_flight_data
     WITH NON-UNIQUE KEY carrier_id connection_id.

      SELECT a~carrier_id, b~connection_id FROM /dmo/flight AS a
             INNER JOIN /dmo/connection AS b ON
             a~carrier_id = b~carrier_id AND
             a~connection_id = b~connection_id
              WHERE b~distance > 1000
              AND a~carrier_id = 'UA'
             INTO TABLE @lt_flight_data .

    LOOP AT lt_flight_data ASSIGNING FIELD-SYMBOL(<fs_flight>).
      <fs_flight>-price *= '1.10'.
      out->write( |Preço atualizado para voo { <fs_flight>-carrier_id }-{ <fs_flight>-connection_id }| ).
    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
