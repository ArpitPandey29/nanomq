include(CheckFunctionExists)
include(CheckSymbolExists)
include(CheckStructHasMember)
include(CheckLibraryExists)
include(CheckCSourceCompiles)

function(nanomq_test NAME)
    if (NANOMQ_TESTS)
        add_executable(${NAME} ${NAME}.c ${ARGN})
        target_link_libraries(${NAME} nanomq)
        target_include_directories(${NAME} PRIVATE
                ${PROJECT_SOURCE_DIR}/include)
        add_test(NAME nanomq.${NAME} COMMAND ${NAME} -t -v)
        set_tests_properties(nanomq.${NAME} PROPERTIES TIMEOUT 180)
    endif ()
endfunction()