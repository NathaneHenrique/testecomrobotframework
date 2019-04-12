INSTALAÇÃO Robot no Ubuntu 18.08 LTS

PRÉ-REQUISITOS

Java

1.1 Python

No terminal:
$ sudo apt-get update
$ sudo apt-get install python2

Para verificar a instalação:
$ python --version

1.2 Robot

1. No terminal:
$ pip install robotframework

2. Para verificar a instalação:
$ robot --version

1.3 Biblioteca Selenium

1. No terminal:
$ pip install --upgrade robotframework-selenium2library

2. Para verificar a instalação e as bibliotecas instaladas:
$ pip freeze

1.4 Baixar e configurar Chrome Driver e Gecko Driver

1. Acessar o link:

https://www.seleniumhq.org/download/

2. No terminal extrair os arquivos na pasta Downloads:
$ unzip chromedriver_linux64.zip
$ tar -xvzf geckodriver*

3. Tornar os arquivos executáveis:
$ chmod +x chromedriver
$ chmod +x geckodriver

4. Mover os arquivos para o diretório /usr/local/share:
$ sudo mv -f chromedriver /usr/local/share/chromedriver
$ sudo mv -f geckodriver /usr/local/share/geckodriver


5. Criar os links simbólico:

     Chrome Driver
$ sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
$ sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

    Gecko Driver

$ sudo ln -s /usr/local/share/geckodriver /usr/local/bin/geckodriver
$ sudo ln -s /usr/local/share/geckodriver /usr/bin/geckodriver
