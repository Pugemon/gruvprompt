#!/usr/bin/env zsh

# shellcheck disable=SC2206
# shellcheck disable=SC2034

gruv_prompt_section_versions() {
  __section=(
    content " $(gruv_version_prompt)"
    foreground $GRUV_PROMPT_FG
    background $GRUV_SECTION_VERSION_BG
    separator 1
  )
}

gruv_prompt_section_exit() {
  __section=(
    content "%(?.. %? )"
    foreground $GRUV_SECTION_EXIT_FG
    background "%(?.$GRUV_SECTION_EXIT_BG.$GRUV_SECTION_EXIT_BG_ERROR)"
    separator 1
  )
}

gruv_prompt_section_time() {
  __section=(
    content " $(gruv_time_info) "
    foreground $GRUV_SECTION_TIME_FG
    background $GRUV_SECTION_TIME_BG
    separator 1
  )
}

gruv_prompt_section_battery() {
  __section=(
    content " $(gruv_battery_stat) "
    foreground $GRUV_SECTION_BATTERY_FG
    background $GRUV_SECTION_BATTERY_BG
    separator 1
  )
}

gruv_prompt_section_user() {
  __section=(
    content " $(gruv_user_info) "
    foreground $GRUV_SECTION_USER_FG
    background $GRUV_SECTION_USER_BG
    separator 1
  )
}

gruv_prompt_section_path() {
  local __path_info=
  if [[ -z $GRUV_SECTION_PATH_COMPONENTS ]]; then
    __path_info="%~"
  else
    __path_info="%${GRUV_SECTION_PATH_COMPONENTS}~"
  fi
  __section=(
    content " ${__path_info} "
    foreground $GRUV_SECTION_PATH_FG
    background $GRUV_SECTION_PATH_BG
    separator 1
  )
}

gruv_prompt_section_vcs_branch() {
  local __branch_info=
  if [[ $(gruv_is_git) == 1 ]]; then
    __branch_info=$(gruv_git_branch)
  elif [[ $(gruv_is_hg) == 1 ]]; then
    __branch_info=$(gruv_hg_branch)
  elif [[ $(gruv_is_svn) == 1 ]]; then
    __branch_info=$(gruv_svn_branch)
  else
    return 1
  fi
  __section=(
    content " ${__branch_info} "
    foreground $GRUV_SECTION_VCS_BRANCH_FG
    background $GRUV_SECTION_VCS_BRANCH_BG
    separator 1
  )
}

gruv_prompt_section_vcs_status() {
  local __stash_info=
  local __lr_info=
  if [[ $(gruv_is_git) == 1 ]]; then
    __stash_info=$(gruv_git_stash)
    __lr_info=$(gruv_git_lr)
  else
    return 1
  fi
  __section=(
    content "${__stash_info}${__lr_info}"
    foreground $GRUV_SECTION_VCS_STATUS_FG
    background $GRUV_SECTION_VCS_STATUS_BG
    separator 1
  )
}

gruv_prompt_section_vcs_dirty() {
  local __dirty_info=
  if [[ $(gruv_is_git) == 1 ]]; then
    __dirty_info=$(gruv_git_dirty)
  else
    return 1
  fi
  __section=(
    content "${__dirty_info}"
    foreground $GRUV_SECTION_VCS_DIRTY_FG
    background $GRUV_SECTION_VCS_DIRTY_BG
    separator 1
  )
}

gruv_prompt_section_newline() {
  __section=(
    content $'\n'
  )
}

gruv_prompt_section_ssh() {
  local __ssh_info
  __ssh_info=$(gruv_ssh_client)
  [[ -n $__ssh_info ]] || return 1
  __section=(
    content "${__ssh_info}"
    foreground $GRUV_SECTION_SSH_FG
  )
}

gruv_prompt_section_venv() {
  local __venv_info
  __venv_info=$(gruv_venv)
  [[ -n $__venv_info ]] || return 1
  __section=(
    content "${__venv_info} "
    foreground $GRUV_SECTION_VENV_FG
  )
}

gruv_prompt_section_prompt() {
  __section=(
    content "%B${GRUV_PROMPT_SYM}%b "
    foreground $GRUV_PROMPT_FG
  )
}
