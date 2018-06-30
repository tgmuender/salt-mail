main-config:
 file.managed:
  - name: /etc/dovecot/dovecot.conf
  - source: salt://mail/dovecot/files/dovecot.conf
  - template: jinja

passwd-config:
 file.managed:
  - name: /etc/dovecot/passwd
  - source: salt://mail/dovecot/files/passwd.jinja
  - template: jinja
