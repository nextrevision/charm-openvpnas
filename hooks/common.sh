SCRIPT_DIR=/usr/local/openvpn_as/scripts
SETTINGS_FILE=`pwd`/.settings

if [ -f $SETTINGS_FILE ]; then
  . $SETTINGS_FILE
fi

function write_settings {
  echo "PRIOR_PORT=${port}" > $SETTINGS_FILE
  echo "PRIOR_LICENSE=${license}" >> $SETTINGS_FILE
}

function update_config {
  key=$1
  value=$2
  $SCRIPT_DIR/confdba -m -k $key -v "${value}"
}
