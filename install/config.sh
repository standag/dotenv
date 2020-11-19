DIR=`echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" | sed s/install/config/`

# check brew zsh
if [[ $SHELL != "/usr/local/bin/zsh" ]]; then 
	if [[ ! a`sudo cat /etc/shells | grep /usr/local/bin/zsh` ]]; then 
		sudo sh -c "echo $(which zsh) >> /etc/shells"
	fi
	chsh -s $(which zsh)
fi

CONFIGS=(
	"zsh/.zshrc"
	".tmux.conf.local"
	"vim/.vimrc"
	"tmux/.tmux.conf"
	"git/.gitignore"
	".iterm2"	
)

for config in ${CONFIGS[*]}; do 
	FILENAME=`basename $config`
	echo "Installing $FILENAME ..."
	if [[ -L ~/$FILENAME ]]; then
		echo "	Removing old link."
		rm ~/$FILENAME
	elif [[ -f ~/$FILENAME ]] || [[ -d ~/$FILENAME ]]; then
		echo "	Backup old configuration ..."
		mv ~/$FILENAME ~/${FILENAME}.old
	fi
	ln -s $DIR/$config ~/$FILENAME 
	echo "	$FILENAME installed." 
done

# VSCODE config
if [[ ! -L ~/Library/Application\ Support/Code/User/settings.json ]]; then
    mv ~/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/settings_original.json
    ln -s $DIR/vs_code_settings.json ~/Library/Application\ Support/Code/User/settings.json
fi

# more plugins https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#keychain
