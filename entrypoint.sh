#!/bin/bash
set -e

bundle install


# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# bundle install --jobs 20 --retry 5


# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"


