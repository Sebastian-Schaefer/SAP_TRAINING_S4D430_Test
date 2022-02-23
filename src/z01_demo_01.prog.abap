*&---------------------------------------------------------------------*
*& Report z01_demo_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_demo_01.

PARAMETERS p_cuco TYPE s_currcode.

DATA carriers TYPE TABLE OF zi_01_demo01. "Zugriff auf CDS View

" select from <Datenbank> fields *
" * weil ja bereits die felder in der CDS View definiert sind und wir alle haben wollen
" Datenobjekte (=Variable) mit @ Präfiz versehen
SELECT FROM zi_01_demo01
    FIELDS *
    WHERE currencycode = @p_cuco
    ORDER BY PRIMARY KEY
    INTO TABLE @carriers
    UP TO 10 ROWS.

"Fehlerbehandlung nach SELECT --> tritt fehler auf ändert sich subrc
IF sy-subrc <> 0.
ENDIF.

cl_demo_output=>display( carriers ).
