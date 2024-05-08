test:
	nvim --headless -c 'PlenaryBustedDirectory tests/'
lint:
	luacheck lua/ -ignore vim
prettier:
	stylua lua/html-entities.lua
