#!/usr/bin/env zsh

# shellcheck disable=SC2034

function gruv_left_prompt_update_completed(){
#  exec &>/dev/tty
  PROMPT=$(echo "${3}" | tr -s ' ')
  zle && zle reset-prompt
}

function gruv_left_prompt_update() {
  builtin cd "${1}" || return
  VIRTUAL_ENV=$2
  SSH_CLIENT=$3
  echo -n "$(gruv_prompt_render_left 'async')"
}

gruv_async_left_prompt(){
  async_init
  async_stop_worker left_prompt
  async_start_worker left_prompt -n
  async_register_callback left_prompt gruv_left_prompt_update_completed
  async_job left_prompt gruv_left_prompt_update "$(pwd)" "${VIRTUAL_ENV}" "${SSH_CLIENT}"
}

function gruv_right_prompt_update_completed(){
#  exec &>/dev/tty
  RPROMPT=$(echo "${3}" | tr -s ' ')
  zle && zle reset-prompt
}

function gruv_right_prompt_update() {
  builtin cd "${1}" || return
  VIRTUAL_ENV=$2
  SSH_CLIENT=$3
  echo -n "$(gruv_prompt_render_right 'async')"
}

gruv_async_right_prompt(){
  async_init
  async_stop_worker right_prompt
  async_start_worker right_prompt -n
  async_register_callback right_prompt gruv_right_prompt_update_completed
  async_job right_prompt gruv_right_prompt_update "$(pwd)" "${VIRTUAL_ENV}" "${SSH_CLIENT}"
}
