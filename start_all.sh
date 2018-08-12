#!/usr/bin/env bash

echo ">> starting dbus"
/etc/init.d/dbus start
if [ $? -ne 0 ]; then
  echo "Failed to start DBUS: $?"
  exit $?
fi

echo ">> starting netatalk"
/etc/init.d/netatalk start
if [ $? -ne 0 ]; then
  echo "Failed to start NETATALK: $?"
  exit $?
fi

echo ">> starting avahi"
/etc/init.d/avahi-daemon start
if [ $? -ne 0 ]; then
  echo "Failed to start AVAHI: $?"
  exit $?
fi

echo ">> all started"

check_process(){
  ps aux | grep $1 |grep -q -v grep
  if [ $? -ne 0 ]; then
    echo ">> process $1 is not running (returned: $?)"
#    exit 1
  fi
}



# ensure the user can write
chown share_user -R /shared


# checking if all process still running, otherwise terminate (another will start because the restart conf)
while sleep 60; do
  echo ">> checking all processes statuses"

# netatalk process
  check_process "/usr/sbin/cnid_metad"

# netatalk process
  check_process "/usr/sbin/afpd"

# dbus process
  check_process "/usr/bin/dbus-daemon"

# avahi process
  check_process "avahi-daemon"

  echo ">> all processes running"
done

#troubleshoot ahavi at
#avahi-daemon --debug
