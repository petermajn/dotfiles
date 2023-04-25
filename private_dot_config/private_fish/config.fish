if status is-interactive
    # Commands to run in interactive sessions can go here
    pyenv init - | source
    pyenv virtualenv-init - | source
end

fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/share/dotnet/



starship init fish | source
