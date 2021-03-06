# File: Main CLI entry (src/index.sh)
# License: MIT, see LICENSE file for more information.
# Authors:
#   * Miguel Angel Rivera Notararigo <ntrrgx@gmail.com>

ntenvs() {
  if [ $# -eq 0 ]; then
    ntenvs_help
    return
  fi

  NTENVS_SUBCMD="$1" && shift

  case "${NTENVS_SUBCMD}" in
    -V | --version)
      ntenvs_version
      ;;

    -h | --help | help)
      if [ -z "$2" ]; then
        ntenvs_help
      else
        "ntenvs_$2_help"
      fi
      ;;

    containers | cont | c )
      ntenvs_containers "$@"
      ;;

    languages | lang | l )
      ntenvs_languages "$@"
      ;;

    projects | prj | p )
      ntenvs_projects "$@"
      ;;

    templates | t )
      ntenvs_templates "$@"
      ;;

    * )
      echo "Invalid option given (${NTENVS_SUBCMD})" >&2
      return 1
      ;;
  esac
}

ntenvs_help() {
  cat <<EOF
$(ntenvs_version)

A development environments (noob) manager.

Usage: ntenvs [<options...>]
Usage: ntenvs help [<subcommand>]
Usage: ntenvs <subcommand> [<options...>]

Options:

  -h, --help
    Shows this help text and exit.

  -V, --version
    Shows the version number and exit.

Subcommands:

  help [<subcommand>]
    Shows help text from this command or a subcommand and exit.

  containers, cont, c
    $(ntenvs_containers --description)

  languages, langs, l
    $(ntenvs_languages --description)

  projects, p
    $(ntenvs_projects --description)

  templates, tmpl, t
    $(ntenvs_templates --description)
EOF
}
