#!/usr/bin/env zsh

gruv_is_hg(){
  echo -ne "$(plib_is_hg)"
}

gruv_hg_branch() {
  echo -n " ${GRUV_HG_SYM}: ${GRUV_BRANCH_SYM} $(plib_hg_branch)"
}
