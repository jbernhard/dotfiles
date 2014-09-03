#
# ~/.tmux.conf
#

set-option -g default-terminal "screen-256color"

unbind-key C-b
set-option -g prefix C-Space
bind-key C-Space send-prefix

# quick toggle
bind-key C-space last-window

# vim keybindings
set-window-option -g mode-keys vi
bind-key - split-window -v
bind-key | split-window -h
bind-key h select-pane -L
bind-key t select-pane -D
bind-key n select-pane -U
bind-key s select-pane -R
bind-key C-h select-pane -L
bind-key C-t select-pane -D
bind-key C-n select-pane -U
bind-key C-s select-pane -R
bind-key < resize-pane -L 1
bind-key > resize-pane -R 1
bind-key Up resize-pane -D 1
bind-key Down resize-pane -U 1
bind-key : command-prompt

# reload config
bind-key r source-file ~/.tmux.conf

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
