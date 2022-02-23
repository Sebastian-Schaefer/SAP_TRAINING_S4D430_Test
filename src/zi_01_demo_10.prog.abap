*&---------------------------------------------------------------------*
*& Report zi_01_demo_10
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zi_01_demo_10.

PARAMETERS p_carrid TYPE s_carr_id.
PARAMETERS p_connid TYPE s_conn_id.

DATA flights TYPE TABLE OF zi_01_demo10.

SELECT FROM zi_01_demo10( p_carrierid = @p_carrid,
                          p_connectionid = @p_connid )
 FIELDS *
* WHERE carrid = @p_carrid AND connid = @p_connid
 INTO TABLE @flights.
IF sy-subrc <> 0.
ENDIF.

cl_demo_output=>display( flights ).
