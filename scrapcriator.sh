#! /bin/bash

#autor: Fabrício
#Telegram: @fabriciocybershell
#Gmail: fabricio45726245@protonmail.ch
#dependências:
#html-xml-untils, lynx, wget
#OBS: para instalar as dependências, basta digitar o nome do algoritmo, seguido e qualquer coisa, ele fará a instação.

[ ! $1 ] || sudo apt install html-xml-untils lynx wget ; clear

logo="
        _              _   _                                     
       | |            | | | |                                    
  ___  | |__     ___  | | | |  ___    ___   _ __    __ _   _ __  
 / __| | '_ \   / _ \ | | | | / __|  / __| | '__|  / _' | | '_ \ 
 \__ \ | | | | |  __/ | | | | \__ \ | (__  | |    | (_| | | |_) |
 |___/ |_| |_|  \___| |_| |_| |___/  \___| |_|     \__,_| | .__/ 
                                                          | |    
                                                          |_| "


echo -e "\033[33;1m $logo \033[00m"

read -p "digite o nome do algoritmo .sh: " algoritmo

arquivo='#! /bin/bash \n'

read -p "digite o endereço do site: " site

arquivo+=$(echo 'tratar=$(echo ')
arquivo+="$site  | wget -O- -i- | hxnormalize -x)"

echo -e "$arquivo" > $algoritmo

echo -e "digite os seletores css do html e cole aqui seguido da tag, EX: \n div title-post \n quando terminar, digite FINALIZAR."

while :
do
read -p "> " seletor
if [ "$seletor" = "FINALIZAR" ];then
echo 'echo "RESULTADO:"' >> $algoritmo
echo 'echo "$tratado"' >> $algoritmo
chmod +x $algoritmo
echo "testando agoritmo ..."
./$algoritmo
echo -e "\n TESTE FINALIZADO."
exit
fi
tratandoSeletor=$(echo ${seletor/ /.})
arquivo='\ntratado+=$(echo "$tratar"'
arquivo+=" | hxselect -i '$tratandoSeletor' | lynx -stdin -dump)"
echo -e "$arquivo" >> $algoritmo 
echo "seletor adicionado."
done
