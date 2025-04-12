#!/usr/bin/env bash

AUR_BRAVE="https://aur.archlinux.org/brave-bin.git"
AUR_YAY_GIT_CLONE="https://aur.archlinux.org/yay.git"
DOWNLOADS="$HOME/Downloads/"
AUR="$HOME/AUR/"
GREEN="\e[0;32m"
N="\e[0m"
#Sendo igual á nulo#
YELLOW="\e[0;33m"
RED="\e[0;31m"
PROGRAMAS_PACMAN=(
  git
  neofetch
)
PROGRAMAS_YAY=(
  hyprland
  brave-bin
  discord
)

  if ping -c 1 8.8.8.8 &> /dev/null;then 
echo -e "$GREEN [INFO] $N-$YELLOW Conexão Estabelecida..."
  else 
echo -e "$GREEN [ERROR] $N-$YELLOW Conexão não encontrada :<"
exit 1
  fi
#Atenção script simples em desenvolvimento, para resolver algumas instalações.

#Código logo abaixo.>
atualizar_o_sistema () {
  echo -e "$GREEN [INFO] $N-$YELLOW Atualizando sistema..."
    sudo pacman -Syyu --noconfirm &> /dev/null
}

instalando_com_pacman () {
for programa in ${PROGRAMAS_PACMAN[@]}; do
  if sudo pacman -Q $programa &>/dev/null;then
    echo -e "$GREEN [INFO] $N-$RED $programa já está instalado$N" 
  else
    echo -e "$GREEN [INFO] $N-$YELLOW Instalando $programa...$N"
    sudo pacman -S $programa --noconfirm &> /dev/null 
 fi
done 
}

#Esse código acima faz com que apenas se o diretorio não existir, será rodado o comando mkdir.
instalar_yay (){
   if  ! pacman -Q yay &> /dev/null || [[ ! -d "$AUR" ]]; 
   then
   echo -e "$GREEN [INFO] $N-$YELLOW Instalando yay... $N"
    cd $HOME && mkdir "$AUR" 
     cd $HOME/AUR/ && git clone "$AUR_YAY_GIT_CLONE" &> /dev/null
    cd yay && makepkg -si --noconfirm --needed &> /dev/null
    else echo -e "$GREEN [INFO] $N-$RED Esse diretório já existe e yay já está instalado.$N"
  fi
}

instalando_com_yay () {
 for programa in ${PROGRAMAS_YAY[@]}; do
  if ! yay -Q $programa &> /dev/null; then 
    echo -e "$GREEN [INFO] $N-$YELLOW Vou instalar $programa"
    yay  -S $programa --noconfirm &> /dev/null
  else echo -e "$GREEN [INFO] $N-$RED $programa já está instalado...$N"
  fi
 done
}

Mensagem_final(){
echo -e "$GREEN [INFO] $N-$YELLOW OBRIGADO POR NOS APOIAR$N"
}

#Chamando as funções
atualizar_o_sistema
instalando_com_pacman
instalar_yay
instalando_com_yay 
Mensagem_final