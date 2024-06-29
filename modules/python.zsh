#!/usr/bin/env zsh

gruv_venv(){
  __venv="$(plib_venv)"
  if [[ ${__venv} != "" ]]; then
    echo -ne "${__venv}"
  fi
  unset __venv
}
