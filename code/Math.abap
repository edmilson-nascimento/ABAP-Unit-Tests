CLASS zcl_math_operations DEFINITION PUBLIC.
    PUBLIC SECTION.
        METHODS: add_two
            IMPORTING iv_number TYPE i
            RETURNING VALUE(rv_result) TYPE i,
        multiply_by_two
            IMPORTING iv_number TYPE i
            RETURNING VALUE(rv_result) TYPE i.
ENDCLASS.

CLASS zcl_math_operations IMPLEMENTATION.
    METHOD add_two.
        rv_result = iv_number + 2.
    ENDMETHOD.

    METHOD multiply_by_two.
        rv_result = iv_number * 2.
    ENDMETHOD.
ENDCLASS.

CLASS ltcl_test_math_operations DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.
    PRIVATE SECTION.
        DATA: sut TYPE REF TO zcl_math_operations.
        METHODS: setup,
                         test_add_two FOR TESTING,
                         test_multiply_by_two FOR TESTING.
ENDCLASS.

CLASS ltcl_test_math_operations IMPLEMENTATION.
    METHOD setup.
        CREATE OBJECT sut.
    ENDMETHOD.

    METHOD test_add_two.
        DATA(lv_result) = sut->add_two( iv_number = 3 ).
        cl_abap_unit_assert=>assert_equals( act = lv_result exp = 5 msg = 'Add two failed' ).
    ENDMETHOD.

    METHOD test_multiply_by_two.
        DATA(lv_result) = sut->multiply_by_two( iv_number = 4 ).
        cl_abap_unit_assert=>assert_equals( act = lv_result exp = 8 msg = 'Multiply by two failed' ).
    ENDMETHOD.
ENDCLASS.