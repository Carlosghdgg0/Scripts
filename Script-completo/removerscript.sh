#!/usr/bin/bash

GREEN="\e[0;32m"

N="\e[0m"
#Sendo igual á nulo#
YELLOW="\e[0;33m"
#Script de remoção, cuidado ao utiliza-lo, se não pretende removê-lo
RED='\e[0;31m'
PROGRAMAS_PACMAN=(
  yay
  git
  neofetch
)
DIRETORIOS=(
  $HOME/Downloads/
  $HOME/AUR/
)
PROGRAMAS_YAY=(
  hyprland
  brave-bin
  discord
)
#codigo>
desinstalando_programas_yay () {
 for programa in ${PROGRAMAS_YAY[@]}; do
  if yay -Q $programa &>/dev/null; then 
  echo -e "${GREEN} [INFO] - Desinstalando $programa${N}"
  sudo yay -Rns $programa --noconfirm &> /dev/null
  else 
  echo -e "${RED} [INFO] - O $programa não está instalado.${N}"
  fi 
  done
}

desinstalando_programas_pacman (){
for programa in ${PROGRAMAS_PACMAN[@]}; do 
if pacman -Q $programa &>/dev/null; then
echo -e "${GREEN} [INFO] - Removendo $programa${N}"
sudo pacman -Rns $programa --noconfirm &> /dev/null
else 
echo -e "$RED [INFO] - O $programa não está instalado.$N"
fi
done
}

removendo-diretorios (){
  for diretorio in ${DIRETORIOS[@]}; do 
  if [[ -d $diretorio ]];then
  echo -e "$GREEN [INFO] - Removendo $diretorio. $N"
  rm -rf $diretorio
  else 
  echo -e "$RED [INFO] - Diretório $diretorio não precisa ser apagado.$N"
  fi
  done
}

mensagem-final (){
    echo -e "$GREEN [INFO] - Tudo ocorreu bem:D!$N"
}
desinstalando_programas_yay
removendo-diretorios
desinstalando_programas_pacman
mensagem-final