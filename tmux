#
# ~/.tmux.conf
#

set -g default-terminal "screen-256color"

# default statusbar colors
set-option -g status-bg colour235 #base02
set-option -g status-fg colour130 #yellow
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg colour33 #base0
set-window-option -g window-status-bg default
#set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg colour196 #orange
set-window-option -g window-status-current-bg default
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour235 #base02
set-option -g pane-active-border-fg colour46 #base01

# message text
set-option -g message-bg colour235 #base02
set-option -g message-fg colour196 #orange

# pane number display
set-option -g display-panes-active-colour colour20 #blue
set-option -g display-panes-colour colour196 #orange

# clock
set-window-option -g clock-mode-colour colour40 #green
