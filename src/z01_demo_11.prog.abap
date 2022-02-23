*&---------------------------------------------------------------------*
*& Report z01_demo_11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_demo_11.

PARAMETERS p_carrid TYPE s_carr_id.
PARAMETERS p_connid TYPE s_conn_id.

DATA flights TYPE TABLE OF zi_01_demo11.

SELECT FROM zi_01_demo11( p_carrierid = @p_carrid,
                          p_connectionid = @p_connid )
 FIELDS *
 INTO TABLE @flights.
IF sy-subrc <> 0.
ENDIF.

cl_demo_output=>display( flights ).
