config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

config etc/rc.d/rc.zram.new

if ! grep /etc/rc.d/rc.zram etc/rc.d/rc.local 1> /dev/null 2> /dev/null ; then
  echo "# Start zram swap space" >> /etc/rc.d/rc.local
  echo "if [ -x /etc/rc.d/rc.zram ]; then" >> /etc/rc.d/rc.local
  echo "  /etc/rc.d/rc.zram start" >> /etc/rc.d/rc.local
  echo "fi" >> /etc/rc.d/rc.local
fi

/sbin/depmod -a

