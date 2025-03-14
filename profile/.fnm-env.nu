fnm env --json | from json | load-env

use std "path add"

$env.FNM_BIN = $"($env.FNM_DIR)/bin"
path add $env.FNM_BIN

# $env.FNM_MULTISHELL_PATH = $"($env.FNM_DIR)/nodejs"
path add $env.FNM_MULTISHELL_PATH
