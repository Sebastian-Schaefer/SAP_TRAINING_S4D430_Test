*&---------------------------------------------------------------------*
*& Report z01_abapcds_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_abapcds_01.

PARAMETERS p_cntry TYPE s_country. "Eingabeparameter

DATA agncynam TYPE TABLE OF ZI_ABAP_AgencyWithRevenue. "Zugriff auf CDS View

" select from <Datenbank> fields * ...
" Datenobjekte (=Variable) mit @ Präfiz versehen
SELECT FROM ZI_ABAP_AgencyWithRevenue
    FIELDS *
    WHERE CountryCode = @p_cntry
    ORDER BY PRIMARY KEY
    INTO TABLE @agncynam
    UP TO 10 ROWS.

IF sy-subrc <> 0.
ENDIF.

cl_demo_output=>display( agncynam ).
