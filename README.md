# SSH Tunnel For SystemD

This systemd unit maintains an SSH tunnel to a computer of your choice. 

Running install.sh copies labtunnel@.service to your ~/.config/systemd/user . *Do not use sudo.*

To define a tunnel, add the following lines to your ~/.ssh/config and run `systemctl --user enable labtunnel@[your tunnel name]`

```
Host [Your tunnel name]
    HostName [ip or url to remote computer]
    Port     [ssh port, usually 22]
    User     xren
    IdentityFile ~/.ssh/zlab.key
    LocalForward [local port to access your tunnel] localhost:[remote port you want to connect to]
```

To start a tunnel, use `systemctl --user start labtunnel@[your tunnel name`.

Other available commands include stop and disable. Also, see `man systemd`, `man systemd.units`, and `man ssh_config`
