#!/bin/bash
#----------------------------------------------------------------
#
# logging.sh: This file contains functions required for logging.
# It is sourced by asgs_main.sh and any other shell script that 
# requires logging capabilities. 
#
# --------------------------------------------------------------------------
# Copyright(C) 2018 Florida Institute of Technology
# Copyright(C) 2018 Peyman Taeb & Robert J Weaver
#
# This program is prepared as a part of the Multi-stage tool.
# The Multi-stage tool is an open-source software available to run, study,
# change, distribute under the terms and conditions of the latest version
# of the GNU General Public License (GPLv3) as published in 2007.
#
# Although the Multi-stage tool is developed with careful considerations
# with the aim of usefulness and helpfulness, we do not make any warranty
# express or implied, do not assume any responsibility for the accuracy,
# completeness, or usefulness of any components and outcomes.
#
# The terms and conditions of the GPL are available to anybody receiving
# a copy of the Multi-stage tool. It can be also found in
# <http://www.gnu.org/licenses/gpl.html>.
#
# --------------------------------------------------------------------------#
# Log file will be in the directory where the asgs was executed
logMessage()
{ DATETIME=`date +'%Y-%h-%d-T%H:%M:%S'`
  MSG="[${DATETIME}] INFO: $@"
  echo ${MSG} >> ${SYSLOG}
}
#
# send a message to the console (i.e., window where the script was started)
# (these should be rare)
consoleMessage()
{ DATETIME=`date +'%Y-%h-%d-T%H:%M:%S'`
  MSG="[${DATETIME}] INFO: $@"
  echo ${MSG}
}
#
# send a message to console as well as to the log file
allMessage()
{
   consoleMessage $@
   logMessage $@
}
#
# log a warning message, execution continues
warn()
{ DATETIME=`date +'%Y-%h-%d-T%H:%M:%S'`
  MSG="[${DATETIME}] WARNING: $@"
  echo ${MSG} >> ${SYSLOG}
  echo ${MSG}  # send to console
}
#
# log an error message, notify Operator 
error()
{ DATETIME=`date +'%Y-%h-%d-T%H:%M:%S'`
  MSG="[${DATETIME}] ERROR: $@"
  echo ${MSG} >> ${SYSLOG}
  echo ${MSG}  # send to console
  # email the operator
  if [[ ${notify_list} = yes || ${notify_list} = YES ]]; then
     echo $MSG | mail -s "[Multistage] Attn: Error for $INSTANCENAME" "${ASGSADMIN}"
  fi 
}
#
# log an error message, execution halts
fatal()
{ DATETIME=`date +'%Y-%h-%d-T%H:%M:%S'`
  MSG="[${DATETIME}] FATAL ERROR: $@"
  echo ${MSG} >> ${SYSLOG}
  if [[ ${notify_list} = yes || ${notify_list} = YES ]]; then
     cat ${SYSLOG} | mail -s "[Multistage] Fatal Error for PROCID ($$)" "${ASGSADMIN}"
  fi
  echo ${MSG} # send to console
  exit ${EXIT_NOT_OK}
}
#
# log a debug message
debugMessage()
{ DATETIME=`date +'%Y-%h-%d-T%H:%M:%S'`
  MSG="[${DATETIME}] DEBUG: $@"
  echo ${MSG} >> ${SYSLOG}
}

