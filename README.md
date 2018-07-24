Ansible Role: Mongo db
=========

Installs mongo database on Ubuntu Trusty server.

Requirements
------------

None.

Role Variables
--------------

mongo_port - TCP port on which mongo instance will listen for connections.
mongo_bind_ip - IP address of interface on which mongo instance will listen for

Dependencies
------------

None.

Example Playbook
----------------
```
---
- name: Configure MongoDB
  hosts: tag_reddit-db
  become: true
  roles:
    - renderqwerty.ansible_role_mongo
  vars:
    - mongo_port: 27017
    - mongo_bind_ip: 0.0.0.0
```

License
-------

MIT
