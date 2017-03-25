#!/bin/bash 
echo "Iniciando cadastro de usuarios"

for USUARIO in $(cat $1)
	do
	senha=$(shuf -i1-999999 -n1)
	useradd $USUARIO
	echo "$USUARIO:$senha" | chpasswd
	echo "Nome usuario: $USUARIO, Senha: $senha"
	sleep 1
	sed -i 's/'$USUARIO'/'$USUARIO'\t'$senha'/g' $1 
	echo "Usuario cadastrado com sucesso!"
	
	if [ $? -ne 0 ] 
	then 
		echo "Erro!"
		exit
	fi	

done


