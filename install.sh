USER_SYSTEMD_DIR=$HOME/.config/systemd/user/
mkdir -p $USER_SYSTEMD_DIR # create systemd user dir
cp ./labtunnel@.service $USER_SYSTEMD_DIR
echo "Successfully installed systemd template labtunnel@.service in ~/.config/systemd/user"
