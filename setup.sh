if ! [ -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

ln -s "$PWD/.vimrc" "$HOME/.vimrc" 
ln -s "$PWD/.bashrc" "$HOME/.bashrc" 
ln -s "$PWD/nvim" "$HOME/.config/nvim" 
ln -s "$PWD/fish" "$HOME/.config/fish" 
ln -s "$PWD/carla" "$HOME/.config/carla" 
ln -s "$PWD/carla" "$HOME/.config/carla" 
ln -s "$PWD/systemd" "$HOME/.config/systemd" 
ln -s "$PWD/pipewire" "$HOME/.config/pipewire" 
