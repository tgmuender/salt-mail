# salt-mail

Collection of salt states to manage a very simple postfix/dovecot setup.

### Add new user

The passwd file is currently not managed by salt, hence the passwords have to be entered manually

1) Add user to pillar item 'mailbox-users'
2) Generate password for user, e.g.
    ```
    user@host:~$ pw=$(doveadm pw -p "thePassword" -s SHA512-CRYPT)
    user@host:~$ echo "newuser@yourdomain:$pw" >> /etc/dovecot/passwd
    ```
3) Run salt
