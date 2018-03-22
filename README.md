# SSH Tunnel For SystemD

This systemd unit maintains an SSH tunnel to a computer of your choice. No root required.

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

When you don't want this anymore, run uninstall.sh . After uninstalling, if you don't delete the lines you added to your ssh config, you may still runn ssh [your tunnel name] to access the tunnels manually.


# References
This project is based off drmalex07's systemd ssh tunneler at https://gist.github.com/drmalex07/c0f9304deea566842490. However, my version does not require root priviledges, and I provide install/uninstall scripts. Because this project uses ssh\_config, it also supports revers tunnels and all kinds of ssh magic.
