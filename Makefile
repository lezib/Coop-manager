.PHONY: update
update :
	home-manager switch --flake .#xavier.login

.PHONY: clean
clean: # To remove cache (because nix produce a lot of cache)
	nix-collect-garbage -d

.PHONY: debug
debug :
	home-manager switch --flake .#xavier.login --show-trace
