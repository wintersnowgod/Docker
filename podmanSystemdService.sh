#!/usr/bin/env bash
BASE="$HOME/Projects/git/Personal/Docker"
SYSTEMD="$HOME/.config/systemd/user"

mkdir -p "$SYSTEMD"

declare -A stacks=(
  [searxng]="searxng/searxng.yml"
  [vaultwarden]="vaultwarden/vaultwarden.yml"
  [syncyomi]="syncyomi/syncyomi.yml"
  [syncthing]="syncthing/syncthing.yml"
  [pihole]="pihole/pihole.yml"
  [suwayomi]="suwayomi/suwayomi.yml"
  [diun]="diun/diun.yml"
  [docktail]="docktail/docktail.yml"
  [filebrowserquantum]="filebrowserquantum/filebrowserquantum.yml"
  [immich]="immich/immich.yml"
)

for name in "${!stacks[@]}"; do
  compose_file="${stacks[$name]}"
  project="$(basename "$compose_file" .yml)"

  cat >"$SYSTEMD/$name.service" <<EOF
[Unit]
Description=Podman Compose - $project
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=$BASE
ExecStart=/usr/bin/podman compose -f $compose_file -p $project up -d
ExecStop=/usr/bin/podman compose -f $compose_file -p $project down
TimeoutStartSec=0
TimeoutStopSec=120

[Install]
WantedBy=default.target
EOF
done
