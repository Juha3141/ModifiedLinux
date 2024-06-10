qemu-system-x86_64 \
	-m 2G \
	-smp 2 \
	-kernel ./arch/x86/boot/bzImage \
	-append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
	-drive file=image/bullseye.img,format=raw \
	-drive file=fat:rw:disk \
	-net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
	-net nic,model=e1000 \
	-enable-kvm \
	-pidfile vm.pid \
	-nographic
	2>&1 | tee vm.log