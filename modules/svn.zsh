#!/usr/bin/env zsh

gruv_is_svn(){
  echo -n "$(plib_is_svn)"
}

gruv_svn_branch() {
  echo -n " ${GRUV_SVN_SYM}: @$(plib_svn_rev) ";
}
