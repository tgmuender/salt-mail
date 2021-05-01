fail2ban:
  pkg.installed

postfix-failed-auth:
  file.managed:
    - name: /etc/fail2ban/filter.d/postfix-failedauth.conf
    - source: salt://mail/fail2ban/files/postfix-failedauth.conf

postfix-failed-auth-jail:
  file.managed:
    - name: /etc/fail2ban/jail.d/postfix-failedauth-jail.conf
    - source: salt://mail/fail2ban/files/postfix-failedauth-jail.conf 
