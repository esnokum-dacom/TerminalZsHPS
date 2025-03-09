PROMPT=$'┏%F{#ffffff}%f%K{#ffffff}%F{#101010} %~ %f%k%F{#ffffff}\ue0b4 %f \n┗%F{#ffffff}%f%K{#ffffff}%F{#101010} \ue732 %n°%m ୨୧  %f%k%F{#ffffff}\ue0b0 %f'
RPROMPT=$'%F{#ffffff}\ue0b6%f%F{#101010}%K{#ffffff} %D{%H:%M} %f%k%F{#ffffff}\ue0b4%f'

function set_rprompt() {

    if git rev-parse --is-inside-work-tree &>/dev/null; then
        RPROMPT=$'%F{#ffffff}\ue0b6%f%F{#101010}%K{#ffffff} ⎚⩊⎚ -✧ Git %f%k%F{#ffffff}\ue0b4%f'
    fi

    if [[ -f "package.json" ]]; then
        RPROMPT=$'%F{#ffffff}\ue0b6%f%F{#101010}%K{#ffffff} ˗ˏˋ ★ ˎˊ˗ Node npm %f%k%F{#ffffff}\ue0b4%f'
    fi
}

precmd_functions+=(set_rprompt)
