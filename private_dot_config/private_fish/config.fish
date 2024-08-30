if status is-interactive
    # Commands to run in interactive sessions can go here
    pyenv init - | source
    pyenv virtualenv-init - | source
    fish_vi_key_bindings
end


######################
#Environment Variables
######################
set -x ARM_USE_AZUREAD true
set -x PYENV_ROOT $HOME/.pyenv
set -x EDITOR nvim

######################
#Path
######################
fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/share/dotnet/
fish_add_path ~/.cargo/bin
fish_add_path $PYENV_ROOT/bin

##############
#Abbreviations
##############
abbr -a -- vim nvim

abbr -a -- cm chezmoi
abbr -a -- cme chezmoi edit
abbr -a -- cma chezmoi apply
abbr -a -- cmd chezmoi diff

abbr -a -- k kubectl
abbr -a -- kd kubectl delete
abbr -a -- kaf kubectl apply -f
abbr -a -- kg kubectl get
abbr -a -- kga kubectl get all

starship init fish | source
