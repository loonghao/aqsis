SET(AQSIS_BOOST_FOUND 0)

SET(AQSIS_BOOST_LIBRARIES_DIR "" CACHE PATH "Location to look for boost libraries.")

SET(AQSIS_BOOST_INCLUDE_SEARCHPATH)

IF(WIN32)
        IF(MSVC)
		SET(AQSIS_BOOST_THREAD_LIBRARY_NAME boost_thread-vc80-mt CACHE STRING "The name of the boost_thread library (undecorated, i.e. the string passed to the compiler)")
        ELSE(MSVC)
		SET(AQSIS_BOOST_THREAD_LIBRARY_NAME libboost_thread-mgw34-1_34 CACHE STRING "The name of the boost_thread library (undecorated, i.e. the string passed to the compiler)")
        ENDIF(MSVC)
ELSE(WIN32)
	SET(AQSIS_BOOST_THREAD_LIBRARY_NAME boost_thread CACHE STRING "The name of the boost_thread library (undecorated, i.e. the string passed to the compiler)")
ENDIF(WIN32)
MARK_AS_ADVANCED(AQSIS_BOOST_THREAD_LIBRARY_NAME)

FIND_PATH(AQSIS_BOOST_INCLUDE_DIR
			boost
			PATHS ${AQSIS_BOOST_INCLUDE_SEARCHPATH}
			DOC "Location of the boost headers folder"
			)

FIND_LIBRARY(AQSIS_BOOST_THREAD_LIBRARY
			NAMES ${AQSIS_BOOST_THREAD_LIBRARY_NAME}	
			PATHS ${AQSIS_BOOST_LIBRARIES_DIR}
			DOC "Location of the boost thread library"
			)
MARK_AS_ADVANCED(AQSIS_BOOST_THREAD_LIBRARY)

STRING(COMPARE EQUAL "${AQSIS_BOOST_INCLUDE_DIR}" "AQSIS_BOOST_INCLUDE_DIR-NOTFOUND" AQSIS_BOOST_INCLUDE_NOTFOUND)
STRING(COMPARE EQUAL "${AQSIS_BOOST_THREAD_LIBRARY}" "AQSIS_BOOST_THREAD_LIBRARY-NOTFOUND" AQSIS_BOOST_THREAD_LIBRARY_NOTFOUND)

IF(NOT AQSIS_BOOST_THREAD_LIBRARY_NOTFOUND AND NOT AQSIS_BOOST_INCLUDE_DIR_NOTFOUND)
	SET(AQSIS_BOOST_FOUND 1)
ENDIF(NOT AQSIS_BOOST_THREAD_LIBRARY_NOTFOUND AND NOT AQSIS_BOOST_INCLUDE_DIR_NOTFOUND)

