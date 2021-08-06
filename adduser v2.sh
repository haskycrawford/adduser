#!/bin/bash 
#
# @date: March 25, 2017
# @version:1.01
# @license: GPL v3 <http://www.gnu.org/licenses>
#
# @autor: Kleiton Freitas
# @e-mail: kleiton.freitas@live.com
# @faculdade dos guararapes / 4NA
# @prof. Bosco, João
# Based in Red HAT
#
#

XCAT=$(cat $1 2> /dev/null)
if [ -e $1 ]
then
	echo " Iniciando cadastro de usuarios..."

	for USUARIO in $XCAT
		do
		SENHA=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c6)
		useradd $USUARIO
		echo "$USUARIO:$SENHA" | chpasswd
		echo " Nome usuario: $USUARIO, Senha: $SENHA"
		sleep 1
		sed -i 's/'$USUARIO'/'$USUARIO'\t'$SENHA'/g' $1 
		echo " Usuario cadastrado com sucesso!"
		
		if [ $? -ne 0 ] 
		then 
			echo " Erro!"
			exit
		fi	

	done

else
	echo " !!! Arquivo não encontrado ou inexistente !!!"
	exit
fi
