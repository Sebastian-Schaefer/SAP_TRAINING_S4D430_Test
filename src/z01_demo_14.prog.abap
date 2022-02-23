*&---------------------------------------------------------------------*
*& Report z01_demo_14
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_demo_14.

SELECT FROM scarr
 FIELDS *
 INTO TABLE @DATA(carriers).
IF sy-subrc <> 0.
ENDIF.

LOOP AT carriers INTO DATA(carrier).
  AUTHORITY-CHECK OBJECT 'S_CARRID'
      ID 'CARRID' FIELD carrier-carrid
      ID 'ACTVT' FIELD '03'.
  IF sy-subrc <> 0.
    DELETE carriers INDEX sy-tabix.
  ENDIF.
ENDLOOP.

cl_demo_output=>display( carriers ).
