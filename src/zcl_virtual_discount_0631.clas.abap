
CLASS zcl_virtual_discount_0631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_virtual_discount_0631 IMPLEMENTATION.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

    CASE iv_entity.

      WHEN 'ZCDS_VIRTUAL_DISCOUNT_0631'.

        LOOP AT it_requested_calc_elements INTO DATA(ls_req_cal_elem).
          IF ls_req_cal_elem = 'REALPRICE'.
            APPEND 'PRICE' TO et_requested_orig_elements.
          ENDIF.
        ENDLOOP.
    ENDCASE.

  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA lt_original_data TYPE STANDARD TABLE OF zcds_virtual_discount_0631 WITH DEFAULT KEY.

    lt_original_data = CORRESPONDING #( it_original_data ).

    LOOP AT lt_original_data ASSIGNING FIELD-SYMBOL(<fs_original_data>).
      IF <fs_original_data>-CurrencyCode = 'EUR'.
        <fs_original_data>-RealPrice = <fs_original_data>-Price * '0.9'.
      ELSE.
        <fs_original_data>-RealPrice = <fs_original_data>-Price * '0.95'.
      ENDIF.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_original_data ).


  ENDMETHOD.

ENDCLASS.
