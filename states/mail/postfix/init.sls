postfix-main-config:
    file.managed:
        - name: /etc/postfix/main.cf
        - source: salt://mail/postfix/files/main.cf
        - template: jinja

postfix-master-config:
    file.managed:
        - name: /etc/postfix/master.cf
        - source: salt://mail/postfix/files/master.cf

virtual-alias-maps:
    file.managed:
        - name: /etc/postfix/virtual_alias_maps
        - source: salt://mail/postfix/files/virtual_alias_maps_tmpl.jinja
        - template: jinja

virtual-alias-maps-db:
    cmd.run:
        - name: postmap /etc/postfix/virtual_alias_maps
        - require:
            - virtual-alias-maps

virtual-mailbox-maps:
    file.managed:
        - name: /etc/postfix/virtual_mailbox_maps
        - source: salt://mail/postfix/files/virtual_mailbox_maps_tmpl.jinja
        - template: jinja


virtual-mailbox-maps-db:
    cmd.run:
        - name: postmap /etc/postfix/virtual_mailbox_maps
        - require:
            - virtual-mailbox-maps
