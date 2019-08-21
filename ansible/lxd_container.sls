centos7:
  lxd_container.present:
    - name: centos7
    - running: true
    - source:
        {"type": "image",
         "alias": "debian10"
        }
    #        "properties": {
    #           "os": "centos",
    #           "release": "7",
    #           "architecture": "amd64"
    #           }
    #    }
    #- profiles: ['lxc-download']
    #    - type: image
    #    - properties:
    #        - os: centos
    #        - release: 7
    #        - architecture: x86_64
    #- profiles: ['default']
    #- remote_addr: https//uk.images.linuxcontainers.org
