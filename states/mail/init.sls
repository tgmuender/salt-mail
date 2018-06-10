include:
 - mail.postfix
 - mail.dovecot

postfix:
    pkg.installed

dovecot:
    pkg.installed:
        - name: dovecot-imapd

virtual-user-group:
    group.present:
        - name: {{ salt['pillar.get']('mailbox:group') }}
        - gid: {{ salt['pillar.get']('mailbox:gid') }}

virtual-user:
    user.present:
        - name: {{ salt['pillar.get']('mailbox:user') }}
        - uid: {{ salt['pillar.get']('mailbox:uid') }}
        - gid: {{ salt['pillar.get']('mailbox:gid') }}
        - system: true
        - home: {{ salt['pillar.get']('mailbox:storage_dir') }}
        - shell: /usr/sbin/nologin