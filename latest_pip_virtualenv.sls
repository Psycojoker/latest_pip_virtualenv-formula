latest_pip_virtualenv_dependancies:
  pkg.installed:
    - name: python-setuptools

easy_install pip:
  cmd.run:
    - unless: ls /usr/local/bin/pip || ls /usr/local/bin/pip2
    - watch_in:
      - cmd: install_pip

install_pip:
  cmd.wait:
    - name: |
      pip install -U pip
      pip2 install --no-use-wheel -U setuptools
      ln -s /usr/bin/pip2 /usr/bin/pip
      pip install -U virtualenv
