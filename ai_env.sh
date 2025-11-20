#!/usr/bin/env bash

PROJECT_DIR="$PWD"
cols=$(tput cols)
lines=$(tput lines)

tmux new-session -d -s ai -x "$cols" -y "$lines" -c "$PROJECT_DIR" "nvim"
tmux split-window -h -t ai:1 -c "$PROJECT_DIR" "copilot"
tmux split-window -v -t ai:1.2 -c "$PROJECT_DIR" "lazygit"

left_width=$((cols*60/100))
right_top_height=$((lines*65/100))
tmux resize-pane -t ai:1.1 -x "$left_width"
tmux resize-pane -t ai:1.2 -y "$right_top_height"

tmux new-window -t ai -c "$PROJECT_DIR" "btop"
tmux split-window -h -t ai:2 -c "$PROJECT_DIR"
tmux split-window -v -t ai:2.2 -c "$PROJECT_DIR" "wandb beta leet"

left_width2=$((cols*50/100))
right_top_height2=$((lines*65/100))
tmux resize-pane -t ai:2.1 -x "$left_width2"
tmux resize-pane -t ai:2.2 -y "$right_top_height2"

tmux select-window -t ai:1
tmux attach -t ai
