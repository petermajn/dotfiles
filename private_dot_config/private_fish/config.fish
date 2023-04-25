if status is-interactive
    # Commands to run in interactive sessions can go here
    pyenv init - | source
    pyenv virtualenv-init - | source
end


fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/share/dotnet/

##############
#Abbreviations
##############
abbr -a -- vim nvim

abbr -a -- cm chezmoi
abbr -a -- cme chezmoi edit
abbr -a -- cma chezmoi apply
abbr -a -- cmd chezmoi diff


starship init fish | source
