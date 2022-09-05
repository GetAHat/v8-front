#!/bin/bash

set -e

export docs_folder=$(xdg-user-dir DOCUMENTS)

mkdir -p $docs_folder/v8_shared
xhost + local:
docker compose up