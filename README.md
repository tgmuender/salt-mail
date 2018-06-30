# salt-mail

Collection of salt states to manage a very simple postfix/dovecot setup.

### Sample pillar items

A sample pillar file for the mail states could look like this:

```
mailbox:
    storage_dir: /var/virtualmail
    user: virtualmail
    group: virtualmail
    uid: 5000
    gid: 5000

pki:
    cert: /etc/letsencrypt/live/your_domain/fullchain.pem
    key: /etc/letsencrypt/live/your_domain/privkey.pem

mailboxes:
    - name: user1
      pw: "pw1"
    - name: user2
      pw: "pw2"


user: virtualmail
domain_name: your_domain
host_name: mail.your_domain
allowed_networks: 127.0.0.0/8 

```

### Add new user

The passwd file is also managed by salt, to add a new user, follow these steps:

1) Add user.name to pillar item 'mailboxes'
2) Add user.pw to pillar items 'mailboxes'. You can generate a password as follows with the doveadm utility:
    ```
    user@host:~$ pw=$(doveadm pw -p "thePassword" -s SHA512-CRYPT)
    ```
3) Run salt
