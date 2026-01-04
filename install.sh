red="\033[1;31m"
green="\033[1;32m" 

function arch1(){ 

	echo -e "navegadores para o archlinux  "
	echo -e "[ 1 ] firefox "
	echo -e "[ 2 ] chromium " 
	echo -e "[ 3 ] opera "
	echo -e "[ 4 ] microsoft-edge"
	echo -e "[ 5 ] vivaldi"
	echo -e "[ 00 ] exit " 

	read -p "-->> " nv1

       if [ "$nv1" == "1" ];then 
	     sudo pacman -S firefox
       elif [ "$nv1" == "2" ];then 
	       sudo pacman -S chromium
       elif [ "$nv1" == "3" ];then 
	       sudo yay -S opera 
       elif [ "$nv1" == "4" ];then 
	       sudo pacman -S microsoft-edge
       elif [ "$nv1" == "5" ];then 
	       sudo pacman -S vivaldi
       elif [ "$nv1" == "00" ];then 
	       echo -e "saindo....."
	       sleep 2
	       echo -e "voltando para menu do proxychains"
       else 
	       echo -e "falha de de excuçao "
	       sleep 2
	       exit
       fi	       
} 

function arch(){

	echo -e $green "deseja instalar as ferrementas y/n"
	read -p "--> " inst 
	if [ "$inst" == "y" ];then
		sudo pacman -S tor && sudo pacman -S proxychains && sudo vim /etc/proxychains.conf

	elif [ "$inst" == "n" ];then 
		echo -e $red "saindo.."
		sleep 2 
		exit 
	else 
		echo -e "erro comando invalido"
		
	fi 
}


function linux2(){

	echo -e "navegadores para proxychains"
	echo -e "[ 1 ] firefox "
	echo -e "[ 2 ] chromium "
	echo -e "[ 3 ] opera "
	echo -e "[ 4 ] microsoft-edge"
	echo -e "[ 5 ] vivaldi"
	echo -e "[ 00 ] exit "

	read -p "--->> " nv2 

	if [ "$nv2" == "1" ];then 
		apt install  firefox
	elif [ "$nv2" == "2" ];then 
		apt install chromium
	elif [ "$nv2" == "3" ];then 
		apt install opera 
	elif [ "$nv2" == "4" ];then 
		apt install microsoft-edge
	elif [ "$nv2" == "5" ];then 
		apt install vivaldi
	elif [ "$nv2" == "00" ];then 
		echo -e "saindo..." 
		sleep 2 
		echo -e "voltando para o menu"
	else 
		echo -e "erro de execuçao"
		sleep 2
		exit
	fi	
}

function linux(){
	echo -e $green "deseja instalar a s ferramentas y/n "
	read -p "--> " lnux
	if [ "$lnux" == "y" ];then 
		sudo apt install tor && sudo apt install proxychains && sudo vim /etc/proxychains.conf

	elif [ "$lnux" == "n" ];then 
		echo -e $red "saindo..." 
		sleep 2
		exit 
	else 
		echo -e $red" erro de comando invalido" 
	fi
}

echo -e $green """
# #    #  ####  #####   ##   #      #
# ##   # #        #    #  #  #      #
# # #  #  ####    #   #    # #      #
# #  # #      #   #   ###### #      #
# #   ## #    #   #   #    # #      #
# #    #  ####    #   #    # ###### ######"""
	
echo -e $red "[ -a ] install arch"
echo -e $red "[ -b ] install linux "
getopts ab machine
case $machine in 
	"a") 
		read -p "deseja instalar um navegador para o proxychains y/n ---->>> " arch_nave

		if [ "$arch_nave" == "y" ];then 
			arch1
		elif [ "$arch_nave" == "n" ];then 
			sleep 2 
			echo -e "certo "
			echo -e "!aviso caso nao tenha uma coxeçao com seu navegador pode nao funcionar "
		else 
			echo -e "erro de comando"
			exit 
		fi
		arch
		;;

	"b")
		read -p "deseja instalar um  navegador para o proxychains y/n ---->>> " linux_nave

		if [ "$linux_nave" == "y" ];then 
			linux2
		elif  [ "$linux_nave" == "n" ];then 
			sleep 2 
			echo -e "certo "
			echo -e "!aviso caso nao tenha uma conexao com seu navegador pode nao funcionar "
		else 
			echo -e "erro de comando"
			exit 
		fi
		linux
		;;
	*)
		echo -e $red "digite um desses parametros"
		;;
esac
