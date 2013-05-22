# Set global variables
SCRIPT_DIR=/usr/local/openvpn_as/scripts
SETTINGS_FILE=`pwd`/.settings

# Load persistence file if it exists
if [ -f $SETTINGS_FILE ]; then
  . $SETTINGS_FILE
fi

# Writes the persistence file
function write_settings {
  echo "PRIOR_PORT=${port}" > $SETTINGS_FILE
  echo "PRIOR_LICENSE=${license}" >> $SETTINGS_FILE
}

# Update OpenVPN-AS configuration database
function update_config {
  key=$1
  value=$2
  $SCRIPT_DIR/confdba -m -k $key -v "${value}"
}
