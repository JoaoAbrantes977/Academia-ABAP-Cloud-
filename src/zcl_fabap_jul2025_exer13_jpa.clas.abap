CLASS zcl_fabap_jul2025_exer13_jpa DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabap_jul2025_exer13_jpa IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " ----------------------------------------------------------------------
    " Tópico: Inline Declarations
    " Descrição: Declaração de variáveis antes do ABAP 7.40.
    " ----------------------------------------------------------------------
    DATA(lv_carrid) =  'AA'.

    out->write( |New Version - Carrier ID: { lv_carrid }| ).

    TYPES: BEGIN OF ty_flight_new,
             carrid      TYPE /dmo/carrier_id,
             connid      TYPE /dmo/connection_id,
             flight_date TYPE /dmo/flight_date,
           END OF ty_flight_new.

    DATA lt_flights_new TYPE STANDARD TABLE OF ty_flight_new WITH EMPTY KEY.

    lt_flights_new = VALUE #( ( carrid = 'LH'
                                connid = '0400'
                                flight_date = '20250725' ) ).

    LOOP AT lt_flights_new INTO DATA(ls_flight_new).
      out->write( |New Version - Flight: { ls_flight_new-carrid }-{ ls_flight_new-connid }| ).
    ENDLOOP.

    SELECT * FROM /dmo/flight INTO TABLE @DATA(lt_flights_select_new) UP TO 2 ROWS.  "#EC CI_NOWHERE
    out->write( |New Version - Flights found (SELECT): { lines( lt_flights_select_new ) }| ).

   " ----------------------------------------------------------------------
    " Tópico: Table Expressions
    " Descrição: Acesso a linhas de tabelas internas antes do ABAP 7.40.
    " ----------------------------------------------------------------------

    lt_flights_new = VALUE #( ( carrid = 'LH' connid = '0400' ) ).

    TRY.
        DATA(ls_flights_expr) = lt_flights_new[ 1 ].
        out->write( |New Version - First Flight: { ls_flights_expr-carrid }-{ ls_flights_expr-connid }| ).
      CATCH cx_sy_itab_line_not_found.
        out->write( |New Version - No first flight found.| ).
    ENDTRY.

    "Table Expression with Key
    TRY.
        DATA(ls_carrier_key_new) = lt_flights_new[ carrid = 'LH' ].
        out->write( |New Version - Flight LH-0400: { ls_flights_expr-carrid }-{ ls_flights_expr-connid }| ).
      CATCH cx_sy_itab_line_not_found.
        out->write( |New Version - Flight LH not found.| ).
    ENDTRY.

    " ----------------------------------------------------------------------
    " Tópico: Conversion Operator CONV
    " Descrição: Conversão de tipos de dados antes do ABAP 7.40.
    " ----------------------------------------------------------------------

    "Nova Versão
    DATA(lv_char_new) = '12345'.
    DATA(lv_int_new) = CONV i( lv_char_new ).
    out->write( |New Version - Converted to INT: { lv_int_new }| ).

    " ----------------------------------------------------------------------
    " Tópico: Value Operator VALUE
    " Descrição: Inicialização de estruturas e tabelas internas antes do ABAP 7.40.
    " ----------------------------------------------------------------------

    "Nova versão

     DATA(ls_connection_value) = VALUE /dmo/connection( airport_from_id = 'FRA'
                                                        airport_to_id   = 'JFK' ).

     out->write( |New Version - Connection: { ls_connection_value-airport_from_id }-{ ls_connection_value-airport_to_id }| ).

      TYPES: BEGIN OF ty_flight_new_s,
             carrid TYPE /dmo/carrier_id,
             connid TYPE /dmo/connection_id,
             END OF ty_flight_new_s.

    TYPES ty_flight_new_tt TYPE STANDARD TABLE OF ty_flight_new_s WITH EMPTY KEY.

    DATA(lt_flights_value_new) = VALUE ty_flight_new_tt( ( carrid = 'UA' connid = '0001' )
                                                         ( carrid = 'DL' connid = '0002' ) ).

    out->write( |New Version - Flights count (VALUE): { lines( lt_flights_value_new ) }| ).

    " ----------------------------------------------------------------------
    " Tópico: LOOP X FOR operator
    " Descrição: Criação de tabelas internas com loops explícitos antes do ABAP 7.50.
    " ----------------------------------------------------------------------

    " Nova Versão
    DATA(lt_flights_for_new) =
      VALUE ty_flight_new_tt( FOR ls_flight_new2 IN lt_flights_value_new WHERE ( carrid = 'UA' )

                              ( carrid = ls_flight_new2-carrid connid = ls_flight_new2-connid ) ).

    out->write( |New Version - Flights for UA (FOR): { lines( lt_flights_for_new ) }| ).

    " ----------------------------------------------------------------------
    " Tópico: Reduction operator REDUCE
    " Descrição: Redução de tabelas internas com loops explícitos antes do ABAP 7.50.
    " ----------------------------------------------------------------------

    " Nova Versão
    TYPES ty_number TYPE STANDARD TABLE OF i WITH EMPTY KEY.

    DATA(lt_numbers_reduce) = VALUE ty_number( ( 1 ) ( 2 ) ( 3 ) ).
    DATA(lv_sum_new) = REDUCE i( INIT s = 0 FOR n IN lt_numbers_reduce NEXT s = s + n ).
    out->write( |New Version - Sum: { lv_sum_new }| ).

    " ----------------------------------------------------------------------
    " Tópico: Conditional operators COND and SWITCH
    " Descrição: Expressões condicionais com IF/ELSEIF/ELSE e CASE antes do ABAP 7.40.
    " ----------------------------------------------------------------------

    " Nova Versão - COND
    DATA(lv_code_cond) = 1.
    DATA(lv_status_cond) = COND string(
      WHEN lv_code_cond = 1 THEN 'Success'
      WHEN lv_code_cond = 2 THEN 'Warning'
      ELSE                       'Error' ).

    out->write( |New Version - Status (COND): { lv_status_cond }| ).

    " Nova Versão - SWITCH
    DATA(lv_code_switch) = 2.
    DATA(lv_status_switch) = SWITCH string( lv_code_switch
                                            WHEN 1 THEN 'Success'
                                            WHEN 2 THEN 'Warning'
                                            ELSE        'Error' ).

    out->write( |New Version - Status (SWITCH): { lv_status_switch }| ).

  " ----------------------------------------------------------------------
    " Tópico: Strings
    " Descrição: Manipulação de strings antes do ABAP 7.40.
    " ----------------------------------------------------------------------
    DATA(lv_var1_str_new) = 'ABAP'.
    DATA(lv_var2_str_new) = '7.40'.
    out->write( |New Version - String Template (Strings): Welcome to { lv_var1_str_new } { lv_var2_str_new }!| ).

    DATA(lv_string_sub_new) = '0080003371'.
    out->write( |New Version - Embedded Expression (ALPHA) (Strings): { lv_string_sub_new ALPHA = OUT }| ).


    " ----------------------------------------------------------------------
    " Tópico: Loop at Group By
    " Descrição: Agrupamento de dados em loops de tabelas internas antes do ABAP 7.50.
    " ----------------------------------------------------------------------

        TYPES: BEGIN OF ty_flight_group_new,
             carrid TYPE /dmo/carrier_id,
             connid TYPE /dmo/connection_id,
             price  TYPE /dmo/flight_price,
           END OF ty_flight_group_new.

    TYPES ty_flights_group TYPE STANDARD TABLE OF ty_flight_group_new WITH EMPTY KEY.

    DATA(lt_flights_group) = VALUE ty_flights_group( ( carrid = 'LH' connid = '0400' price = '100' )
                                                     ( carrid = 'LH' connid = '0401' price = '150' )
                                                     ( carrid = 'UA' connid = '0001' price = '200' ) ).


    LOOP AT lt_flights_group INTO DATA(ls_flight_group)
         GROUP BY ls_flight_group-carrid.
      DATA(lv_total_price_group)
       = REDUCE /dmo/flight_price( INIT s = 0 FOR member IN GROUP ls_flight_group NEXT s = s + member-price ).
      out->write( |New Version - Carrier { ls_flight_group-carrid } Total Price: { lv_total_price_group }| ).
    ENDLOOP.


* ----------------------------------------------------------------------
* Tópico: Filter
* Descrição: Filtragem de tabelas internas com loops explícitos antes do ABAP 7.40.
* ----------------------------------------------------------------------

* New Version (ABAP 7.40+)
    DATA lt_flights_new2 TYPE SORTED TABLE OF ty_flight_new WITH UNIQUE KEY carrid connid.

    DATA(lt_flights_filter_new) = FILTER #( lt_flights_new2 WHERE carrid = CONV #( 'AA' ) ).

    out->write( |New Version - Filtered flights (LH): { lines( lt_flights_filter_new ) }| ).

  ENDMETHOD.

ENDCLASS.
