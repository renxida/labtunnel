USER_SYSTEMD_DIR=$HOME/.config/systemd/user/
#mkdir -p $USER_SYSTEMD_DIR # create systemd user dir
systemctl --user disable labtunnel*
rm $USER_SYSTEMD_DIR/labtunnel@.service
echo "Done uninstalling."

