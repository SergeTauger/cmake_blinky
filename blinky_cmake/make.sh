#!/bin/bash

help()
{
  echo -e "Usage: `basename $0` [-x] [-s] [-a] [-d] [-t] [-p _projects_home_] [-l _helpers_home_] [-k _extras_home_] [-h]"
  echo -e "  -x - build x86"
  echo -e "  -s - build stm32"
  echo -e "  -a - build avr"
  echo -e "  -d - pull dependencies"
  echo -e "  -t - enable unit tests"
  echo -e "  -p - absolute path to projects home"
  echo -e "  -l - absolute path to external projects base dir"
  echo -e "  -k - absolute path to cmake-helpers dir"
  echo -e "  -h - this help"
}

# Clone repository in github or pull any changes.
function clone_or_pull {
  echo "Checking $(basename $1)"
  echo -e "  Source: $2"
  echo -e "  Target: $1"

  if [ -d ${1} ]; then
    (cd ${1} && git pull)
  else
    git clone $2 ${1}
  fi
}

X86=0
STM32=0
AVR=0
DEPS=0
TESTS=""

while getopts "xsadtp:l:k:h" Option
do
  case $Option in
    x) X86=1;;
    s) STM32=1;;
    a) AVR=1;;
    d) DEPS=1;;
    t) TESTS="-DENABLE_TESTS=ON";;
    p) PROJECTS_HOME=${OPTARG};;
    l) XTRA_HOME=${OPTARG};;
    k) CMAKEHELPERS_HOME=${OPTARG};;
    h) help; exit 0;;
    \?) help; exit 22;;
  esac
done

shift $(($OPTIND - 1))

################################################################################
# Dependency paths

echo "Project home is $PROJECTS_HOME"
echo "Extra home is $XTRA_HOME"
echo "Cmake-helpers home is $CMAKEHELPERS_HOME"

if [ -z ${PROJECTS_HOME} ]; then
  # Assume the script is invoked from within its project.
  export PROJECTS_HOME="${PWD}/../.."
else
  export PROJECTS_HOME
fi
if [ -z ${XTRA_HOME} ]; then
  export XTRA_HOME=${PROJECTS_HOME}/other
else
  export XTRA_HOME
fi

# Bolt Robotics projects

if [ -z ${CMAKEHELPERS_HOME} ]; then
  export CMAKEHELPERS_HOME=${PROJECTS_HOME}/cmake-helpers
else
  export CMAKEHELPERS_HOME
fi

# Third-party projects

if [ -z ${STATEMACHINE_HOME} ]; then
  export STATEMACHINE_HOME=${XTRA_HOME}/stateMachine-master
else
  export STATEMACHINE_HOME
fi
if [ -z ${CTPP2_HOME} ]; then
  export CTPP2_HOME=${XTRA_HOME}/ctpp
else
  export CTPP2_HOME
fi
if [ -z ${GTEST_HOME} ]; then
  export GTEST_HOME=${XTRA_HOME}/gtest
else
  export GTEST_HOME
fi
if [ -z ${SPDLOG_HOME} ]; then
  export SPDLOG_HOME=${XTRA_HOME}/spdlog
else
  export SPDLOG_HOME
fi
if [ -z ${FREERTOS_HOME} ]; then
  export FREERTOS_HOME=${XTRA_HOME}/FreeRTOSv10.1.1
else
  export FREERTOS_HOME
fi
if [ -z ${LIBOPENCM3_HOME} ]; then
  export LIBOPENCM3_HOME=${XTRA_HOME}/libopencm3
else
  export LIBOPENCM3_HOME
fi

################################################################################

if [ "${DEPS}" -eq 1 ]; then
  clone_or_pull "${GTEST_HOME}" "https://github.com/google/googletest.git"
  clone_or_pull "${LIBOPENCM3_HOME}" "https://github.com/libopencm3/libopencm3.git"
fi

if [ ${X86} -eq 1 ]; then
  (cd ${PROJECTS_HOME} \
    && mkdir -p "build-x86" \
    && cd "build-x86" \
    && cmake -DBTR_X86=1 ${TESTS} "$@" .. \
    && make)
fi

if [ ${STM32} -eq 1 ]; then
  (cd ${PROJECTS_HOME} \
    && mkdir -p "build-stm32" \
    && cd "build-stm32" \
    && cmake -DBTR_STM32=1 "$@" .. \
    && make)
fi

if [ ${AVR} -eq 1 ]; then
  (cd ${PROJECTS_HOME} \
    && mkdir -p "build-avr" \
    && cd "build-avr" \
    && cmake -DBTR_AVR=1 "$@" .. \
    && make)
fi
