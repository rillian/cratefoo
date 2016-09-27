# Build the two wrapper crates independently and link them into a staticlib.

all: libcratefoo.a

check:
	cargo test

clean:
	-rm libcratefoo.a
	cd wrap_a && cargo clean
	cd wrap_b && cargo clean
	cargo clean

.PHONEY: all check clean

libcratefoo.a: src/lib.rs wrap_a/target/debug/libwrap_a.rlib wrap_b/target/debug/libwrap_b.rlib
	rustc $< -o $@ --crate-type=staticlib \
	  --extern wrap_a=wrap_a/target/debug/libwrap_a.rlib \
	  -L wrap_a/target/debug/deps \
	  --extern wrap_b=wrap_a/target/debug/libwrap_a.rlib \
	  -L wrap_b/target/debug/deps

wrap_a/target/debug/libwrap_a.rlib: wrap_a/src/lib.rs wrap_a/Cargo.toml
	cd wrap_a && cargo build && cargo test

wrap_b/target/debug/libwrap_b.rlib: wrap_b/src/lib.rs wrap_b/Cargo.toml
	cd wrap_b && cargo build && cargo test
