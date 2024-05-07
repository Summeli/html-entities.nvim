test:
	nvim --headless -c 'PlenaryBustedDirectory tests/'
lint:
	luacheck lua/
prettier:
	stylua lua/html-entities.lua
