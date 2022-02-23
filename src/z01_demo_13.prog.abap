*&---------------------------------------------------------------------*
*& Report z01_demo_13
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_demo_13.

SELECT FROM zi_01_demo12
 FIELDS carrid, connid, cityfrom, cityto, \_carrier-carrname
 INTO TABLE @DATA(connections).
IF sy-subrc <> 0.
ENDIF.

cl_demo_output=>display( connections ).
