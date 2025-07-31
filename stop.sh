#!/bin/bash
for file in *.yml *.yaml; do
    [ -f "$file" ] || continue
    name="${file%.*}"
    docker compose -f "$file" -p "$name" down
done
