# File: Disk images containers manager entry (src/containers/disk-image/index.sh)
# License: MIT, see LICENSE file for more information.
# Authors:
#   * Miguel Angel Rivera Notararigo <ntrrgx@gmail.com>

ntenvs_containers_disk_image() {
  if [ $# -eq 0 ]; then
    ntenvs_containers_disk_image_help
    return
  fi

  NTENVS_CONTAINERS_DISK_IMAGE_SUBCMD="$1" && shift

  case "${NTENVS_CONTAINERS_DISK_IMAGE_SUBCMD}" in
    --description)
      echo "Manages containers as disk images. (Under construction..)"
      ;;

    -h | --help)
      ntenvs_containers_disk_image_help
      ;;

    * )
      echo "Invalid option given (${NTENVS_CONTAINERS_DISK_IMAGE_SUBCMD})" >&2
      exit 1
      ;;
  esac
}

ntenvs_containers_disk_image_help() {
  cat <<EOF
$(ntenvs_version)

$(ntenvs_containers_disk_image --description)

Usage: ntenvs containers disk-image [<options...>]
Usage: ntenvs containers disk-image <subcommand> [<options...>]

Options:

  --description
    Shows a small description text and exit.

  -h, --help
    Shows this help text and exit.

Subcommands:

  clone, cl
    $(ntenvs_containers_disk_image_clone --description)

  create, c
    $(ntenvs_containers_disk_image_create --description)

  delete, del, d
    $(ntenvs_containers_disk_image_delete --description)

  export, exp, e
    $(ntenvs_containers_disk_image_export --description)

  import, imp, i
    $(ntenvs_containers_disk_image_import --description)

  list, ls, l
    $(ntenvs_containers_disk_image_list --description)
EOF
}
