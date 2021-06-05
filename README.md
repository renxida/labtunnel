# SSH Tunnel For SystemD

This systemd unit maintains an SSH tunnel of your choice. No root required.


# Install

A systemd unit template file needs to be installed in order to run tunnels.

Running `install.sh` copies labtunnel@.service to your `~/.config/systemd/user` . *Do not use sudo.*

Read `man systemd.unit` for more information on templates.

# Defining Tunnels

To define a tunnel, add the following lines to your ~/.ssh/config:

```
Host [Your tunnel name]
    HostName [ip or url to remote computer]
    Port     [ssh port, usually 22]
    User     xren
    IdentityFile ~/.ssh/zlab.key
    LocalForward [local port to access your tunnel] localhost:[remote port you want to connect to]
```

Read `man ssh_config` for more info.

# Running Tunnels

To start your tunnel, substitute the tunnel name you defined into the following command:
```systemctl --user start labtunnel@[your tunnel name]```

To set-up autostart, use the same command but replace `start` with `enable`:
```systemctl --user start labtunnel@[your tunnel name]```

See more at `man systemctl`

# Uninstalling

Run `uninstall.sh` from the project directory. The script disable/removes autostart tunnels and the installed systemd template file.

After uninstalling, if you don't delete the lines you added to your ssh config, you may still run ssh [your tunnel name] to access the tunnels manually.

# Source
This project is based off drmalex07's systemd ssh tunneler at https://gist.github.com/drmalex07/c0f9304deea566842490.

My improvements include:
- No priviledges required: everything is installed in ~/.config/systemd/user (your user's personal systemd-related files)
- Install/uninstall scripts
- Usses ssh_config: can define all sorts of ssh connections, not just local tunnels
