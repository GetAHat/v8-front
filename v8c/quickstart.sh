#!/bin/bash

set -e

export docs_folder=$(xdg-user-dir DOCUMENTS)/v8_shared

mkdir -p $docs_folder
xhost + local:
docker compose up