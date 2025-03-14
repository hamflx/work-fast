$env.config = ($env.config | merge {
	hooks: {
		env_change: {
			PWD: [{
				if ([.nvmrc .node-version] | path exists | any { |it| $it }) {
					fnm use --silent-if-unchanged
				} else {
					fnm --log-level=quiet use default
				}
			}]
		}
	}
})
