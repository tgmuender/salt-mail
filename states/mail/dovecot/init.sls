main-config:
 file.managed:
  - name: /etc/dovecot/dovecot.conf
  - source: salt://mail/dovecot/files/dovecot.conf
  - template: jinja
