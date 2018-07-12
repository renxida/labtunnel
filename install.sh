USER_SYSTEMD_DIR=$HOME/.config/systemd/user/
mkdir -p $USER_SYSTEMD_DIR # create systemd user dir
cp ./labtunnel@.service $USER_SYSTEMD_DIR
systemctl --user daemon-reload
echo "Successfully installed systemd template labtunnel@.service in ~/.config/systemd/user."
echo "Questions? Raise an issue at github.com/renxida/labtunnel"