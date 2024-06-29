#!/usr/bin/env zsh

[[ -z $GRUV_SECTIONS_LEFT ]] && GRUV_SECTIONS_LEFT=(
  exit
  time
  battery
  user
  path
  vcs_branch:async
  vcs_status:async
  vcs_dirty:async
  versions:async
  newline
  ssh
  venv
  prompt
)

[[ -z $GRUV_SECTIONS_RIGHT ]] && GRUV_SECTIONS_RIGHT=()

[[ -z "${GRUV_SECTIONS_LEFT_SEP_SYM}" ]] && GRUV_SECTIONS_LEFT_SEP_SYM=''
[[ -z "${GRUV_SECTIONS_RIGHT_SEP_SYM}" ]] && GRUV_SECTIONS_RIGHT_SEP_SYM=''

[[ -z "${GRUV_PROMPT_SYM}" ]] && GRUV_PROMPT_SYM='❱'
[[ -z "${GRUV_GIT_STASH_SYM}" ]] && GRUV_GIT_STASH_SYM='@'

[[ -z "${GRUV_VERSION_PROMPT_SEP}" ]] && GRUV_VERSION_PROMPT_SEP=' '

if [[ ${GRUV_USE_NERD_FONT} = 1 ]]; then
  [[ -z "${GRUV_GIT_SYM}" ]]      && GRUV_GIT_SYM=''
  [[ -z "${GRUV_HG_SYM}" ]]       && GRUV_HG_SYM=''
  [[ -z "${GRUV_SSH_SYM}" ]]      && GRUV_SSH_SYM=''
  [[ -z "${GRUV_JAVA_SYM}" ]]     && GRUV_JAVA_SYM=' '
  [[ -z "${GRUV_PY_SYM}" ]]       && GRUV_PY_SYM=' '
  [[ -z "${GRUV_RB_SYM}" ]]       && GRUV_RB_SYM=' '
  [[ -z "${GRUV_GO_SYM}" ]]       && GRUV_GO_SYM='豈'
  [[ -z "${GRUV_NODE_SYM}" ]]     && GRUV_NODE_SYM=' '
  [[ -z "${GRUV_ELIXIR_SYM}" ]]   && GRUV_ELIXIR_SYM=' '
  [[ -z "${GRUV_CRYSTAL_SYM}" ]]  && GRUV_CRYSTAL_SYM='ﲹ '
  [[ -z "${GRUV_GIT_SYM}" ]]      && GRUV_GIT_SYM=''
  [[ -z "${GRUV_GIT_ADD_SYM}" ]]  && GRUV_GIT_ADD_SYM=''
  [[ -z "${GRUV_GIT_DEL_SYM}" ]]  && GRUV_GIT_DEL_SYM=''
  [[ -z "${GRUV_GIT_MOD_SYM}" ]]  && GRUV_GIT_MOD_SYM=''
  [[ -z "${GRUV_GIT_NEW_SYM}" ]]  && GRUV_GIT_NEW_SYM=''
  [[ -z "${GRUV_HG_SYM}" ]]       && GRUV_HG_SYM=''
  [[ -z "${GRUV_SVN_SYM}" ]]      && GRUV_SVN_SYM='S'
  [[ -z "${GRUV_BRANCH_SYM}" ]]   && GRUV_BRANCH_SYM=''
  [[ -z "${GRUV_GIT_PUSH_SYM}" ]] && GRUV_GIT_PUSH_SYM=''
  [[ -z "${GRUV_GIT_PULL_SYM}" ]] && GRUV_GIT_PULL_SYM=''
else
  [[ -z "${GRUV_JAVA_SYM}" ]]     && GRUV_JAVA_SYM='JAVA:'
  [[ -z "${GRUV_PY_SYM}" ]]       && GRUV_PY_SYM='PY:'
  [[ -z "${GRUV_RB_SYM}" ]]       && GRUV_RB_SYM='RB:'
  [[ -z "${GRUV_GO_SYM}" ]]       && GRUV_GO_SYM='GO:'
  [[ -z "${GRUV_ELIXIR_SYM}" ]]   && GRUV_ELIXIR_SYM='EX:'
  [[ -z "${GRUV_CRYSTAL_SYM}" ]]  && GRUV_CRYSTAL_SYM='CR:'
  [[ -z "${GRUV_NODE_SYM}" ]]     && GRUV_NODE_SYM='⬡ '
  [[ -z "${GRUV_PHP_SYM}" ]]      && GRUV_PHP_SYM='PHP:'
  [[ -z "${GRUV_GIT_SYM}" ]]      && GRUV_GIT_SYM=G
  [[ -z "${GRUV_GIT_ADD_SYM}" ]]  && GRUV_GIT_ADD_SYM='+'
  [[ -z "${GRUV_GIT_DEL_SYM}" ]]  && GRUV_GIT_DEL_SYM='-'
  [[ -z "${GRUV_GIT_MOD_SYM}" ]]  && GRUV_GIT_MOD_SYM='⭑'
  [[ -z "${GRUV_GIT_NEW_SYM}" ]]  && GRUV_GIT_NEW_SYM='?'
  [[ -z "${GRUV_HG_SYM}" ]]       && GRUV_HG_SYM=H
  [[ -z "${GRUV_SVN_SYM}" ]]      && GRUV_SVN_SYM=S
  [[ -z "${GRUV_BRANCH_SYM}" ]]   && GRUV_BRANCH_SYM=''
  [[ -z "${GRUV_GIT_PUSH_SYM}" ]] && GRUV_GIT_PUSH_SYM='↑'
  [[ -z "${GRUV_GIT_PULL_SYM}" ]] && GRUV_GIT_PULL_SYM='↓'
fi
