set-option -g @tpm_plugins '  \
  tmux-plugins/tpm            \
  tmux-plugins/tmux-resurrect \
  tmux-plugins/tmux-sensible  \
  tmux-plugins/tmux-continuum \
  '
run-shell '~/.tmux/plugins/tpm/tpm'

# Tmux-resurrect plugin
set -g @resurrect-dir '~/.byobu-sessions'
# set -g @resurrect-save-bash-history 'on'
# set -g @resurrect-processes 'false'
# set -g @resurrect-processes ':all:'
set -g @resurrect-processes 'nano,vim,nvim'
set -g @overwrite-option '@resurrect-overwrite'
set -g @overwrite_option '@resurrect-overwrite'

set -g @continuum-restore 'on'
