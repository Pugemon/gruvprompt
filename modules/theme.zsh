#!/usr/bin/env zsh

THEME_DIR="${0:A:h}/themes"

gruv_load_theme(){
  if [[ -z "${GRUV_CUSTOM_THEME_PATH}" ]]; then
    if [[ -z "${GRUV_THEME}" ]]; then
      source "${THEME_DIR}/gruvbox-dark.zsh"
    else
      source "${THEME_DIR}/${GRUV_THEME}.zsh"
    fi
  else
    if [[ -f "${GRUV_CUSTOM_THEME_PATH}" ]]; then
      source "${GRUV_CUSTOM_THEME_PATH}"
    else
      printf "\n  --> (WARN) theme %s not found. Loading default ..." "${GRUV_CUSTOM_THEME_PATH}"
      source "${THEME_DIR}/gruvbox-dark.zsh"
    fi
  fi
  gruv_theme
}
