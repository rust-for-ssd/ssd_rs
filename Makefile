debug_target := target/riscv64gc-unknown-none-elf/debug/ssd_rs

run:
	cargo clean
	cargo run

build:
	cargo clean
	cargo build

object:
	cargo clean
	cargo rustc -- --emit=obj

release:
	cargo clean
	cargo build --release

gdb_server:
	qemu-system-riscv64 -machine virt -s -S -serial 'mon:stdio' -nographic -bios $(debug_target)

gdb_client:
	rust-gdb $(debug_target) -ex "target remote :1234" -ex "set print pretty on"
