CLASS zcl_fabap_jul2025_exer16_jpa DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_fabap_jul2025_exer16_jpa IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT carrier_id, connection_id FROM /dmo/flight INTO TABLE @DATA(lt_flights).

    SELECT carrier_id, connection_id, flight_date
      FROM /dmo/booking
      FOR ALL ENTRIES IN @lt_flights
      WHERE carrier_id    = @lt_flights-carrier_id
        AND connection_id = @lt_flights-connection_id
      INTO TABLE @DATA(lt_bookings).

    SORT lt_flights  BY carrier_id
                        connection_id.
    SORT lt_bookings BY carrier_id
                        connection_id.

    LOOP AT lt_flights INTO DATA(ls_flight).
      READ TABLE lt_bookings WITH KEY carrier_id    = ls_flight-carrier_id
                                      connection_id = ls_flight-connection_id
           TRANSPORTING NO FIELDS
           BINARY SEARCH.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.
      DATA(lv_tabix) = sy-tabix.
      LOOP AT lt_bookings FROM lv_tabix INTO DATA(ls_booking).
        IF    ls_booking-carrier_id    <> ls_flight-carrier_id
           OR ls_booking-connection_id <> ls_flight-connection_id.
          EXIT.
        ENDIF.
        out->write( |Voo { ls_booking-carrier_id } { ls_booking-connection_id }: { ls_booking-flight_date }| ).
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
