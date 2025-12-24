.PHONY: build test check release clean fmt nix-build nix-zon2lock

build:
	zig build

test:
	zig build test

check:
	zig build check

release:
	zig build release

clean:
	rm -rf zig-out zig-cache .zig-cache

fmt:
	zig fmt .

nix-build:
	nix build .#zmx

nix-zon2lock:
	nix run github:Cloudef/zig2nix -- zon2lock build.zig.zon
