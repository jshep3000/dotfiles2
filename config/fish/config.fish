set fish_greeting
fish_vi_key_bindings

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set -x RDK_DEV 10.20.248.17
set -x OPENSTACK 96.118.156.142

source ~/.config/fish/functions/fish_aliases.fish

#function fish_right_prompt -d "Write out the right prompt"
#    # Do nothing if not in vi mode
#    if test "$fish_key_bindings" = "fish_vi_key_bindings"
#        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
#        switch $fish_bind_mode
#            case default
#                set_color --bold --background red white
#                echo '[N]'
#            case insert
#                set_color normal
#                echo '[I]'
#            case replace_one
#                set_color --bold --background green white
#                echo '[R]'
#            case visual
#                set_color --bold --background magenta white
#                echo '[V]'
#        end
#        set_color normal
#        echo -n ' '
#    end
#end
