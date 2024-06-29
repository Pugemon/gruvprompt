#!/usr/bin/env zsh

# shellcheck disable=SC2116

gruv_python_version(){
  echo -ne "%F{$GRUV_PYTHON_COLOR}${GRUV_PY_SYM}$(plib_python_version)%f"
}

gruv_python_short_version(){
  echo -ne "%F{$GRUV_PYTHON_COLOR}${GRUV_PY_SYM}$(plib_python_major_minor_version)%f"
}

gruv_ruby_version(){
  echo -ne "%F{$GRUV_RUBY_COLOR}${GRUV_RB_SYM}$(plib_ruby_version)%f"
}

gruv_ruby_short_version(){
  echo -ne "%F{$GRUV_RUBY_COLOR}${GRUV_RB_SYM}$(plib_ruby_major_minor_version)%f"
}

gruv_java_version(){
  echo -ne "%F{$GRUV_JAVA_COLOR}${GRUV_JAVA_SYM}$(plib_java_version)%f"
}

gruv_java_short_version(){
  echo -ne "%F{$GRUV_JAVA_COLOR}${GRUV_JAVA_SYM}$(plib_java_major_version)%f"
}

gruv_go_version(){
  echo -ne "%F{$GRUV_GO_COLOR}${GRUV_GO_SYM}$(plib_go_version)%f"
}

gruv_go_short_version(){
  echo -ne "%F{$GRUV_GO_COLOR}${GRUV_GO_SYM}$(plib_go_major_minor_version)%f"
}

gruv_elixir_version(){
  echo -ne "%F{$GRUV_ELIXIR_COLOR}${GRUV_ELIXIR_SYM}$(plib_elixir_version)%f"
}

gruv_elixir_short_version(){
  echo -ne "%F{$GRUV_ELIXIR_COLOR}${GRUV_ELIXIR_SYM}$(plib_elixir_major_minor_version)%f"
}

gruv_crystal_version(){
  echo -ne "%F{$GRUV_CRYSTAL_COLOR}${GRUV_CRYSTAL_SYM}$(plib_crystal_version)%f"
}

gruv_crystal_short_version(){
  echo -ne "%F{$GRUV_CRYSTAL_COLOR}${GRUV_CRYSTAL_SYM}$(plib_crystal_major_minor_version)%f"
}

gruv_node_version(){
  echo -ne "%F{$GRUV_NODE_COLOR}${GRUV_NODE_SYM}$(plib_node_version)%f"
}

gruv_node_short_version(){
  echo -ne "%F{$GRUV_NODE_COLOR}${GRUV_NODE_SYM}$(plib_node_major_minor_version)%f"
}

gruv_php_version(){
  echo -ne "%F{$GRUV_PHP_COLOR}${GRUV_PHP_SYM}$(plib_php_version)%f"
}

gruv_php_short_version(){
  echo -ne "%F{$GRUV_PHP_COLOR}${GRUV_PHP_SYM}$(plib_php_major_minor_version)%f"
}

gruv_version_prompt(){
  if [[ -n ${GRUV_VERSIONS_PROMPT} ]]; then
    LOOP_INDEX=0
    for _v in $(echo "${GRUV_VERSIONS_PROMPT}"); do
      [[ ${LOOP_INDEX} != "0" ]] && version_prompt_val+="%F{$GRUV_FADE_COLOR}${GRUV_VERSION_PROMPT_SEP}%f"
      [[ ${LOOP_INDEX} == "0" ]] && LOOP_INDEX=$((LOOP_INDEX + 1))

      [[ ${_v} == "PYTHON" ]]    && version_prompt_val+="$(gruv_python_version)"
      [[ ${_v} == "PYTHON_S" ]]  && version_prompt_val+="$(gruv_python_short_version)"
      [[ ${_v} == "RUBY" ]]      && version_prompt_val+="$(gruv_ruby_version)"
      [[ ${_v} == "RUBY_S" ]]    && version_prompt_val+="$(gruv_ruby_short_version)"
      [[ ${_v} == "JAVA" ]]      && version_prompt_val+="$(gruv_java_version)"
      [[ ${_v} == "JAVA_S" ]]    && version_prompt_val+="$(gruv_java_short_version)"
      [[ ${_v} == "GO" ]]        && version_prompt_val+="$(gruv_go_version)"
      [[ ${_v} == "GO_S" ]]      && version_prompt_val+="$(gruv_go_short_version)"
      [[ ${_v} == "ELIXIR" ]]    && version_prompt_val+="$(gruv_elixir_version)"
      [[ ${_v} == "ELIXIR_S" ]]  && version_prompt_val+="$(gruv_elixir_short_version)"
      [[ ${_v} == "CRYSTAL" ]]   && version_prompt_val+="$(gruv_crystal_version)"
      [[ ${_v} == "CRYSTAL_S" ]] && version_prompt_val+="$(gruv_crystal_short_version)"
      [[ ${_v} == "NODE" ]]      && version_prompt_val+="$(gruv_node_version)"
      [[ ${_v} == "NODE_S" ]]    && version_prompt_val+="$(gruv_node_short_version)"
      [[ ${_v} == "PHP" ]]       && version_prompt_val+="$(gruv_php_version)"
      [[ ${_v} == "PHP_S" ]]     && version_prompt_val+="$(gruv_php_short_version)"
    done

    [[ "$LOOP_INDEX" != "0" ]] && version_prompt_val+=" "
  fi
  echo -n "${version_prompt_val}"
}
