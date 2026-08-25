test:
	nvim --headless -c "PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal_init.lua'}"
lint:
	luacheck lua/ -ignore vim
prettier:
	stylua lua/html-entities.lua
