Content-Type: multipart/mixed; boundary="===============6182532987906772831=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [riscv:next-misc 3/5] drivers/pci/pci-sysfs.c:1098:4: warning: performing pointer arithmetic on a null pointer has undefined behavior
Date: Mon, 24 May 2021 13:37:04 +0800
Message-ID: <202105241355.SEpDY9ij-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6182532987906772831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git nex=
t-misc
head:   a9672966c48014a7b3e03896b919e9e67b7de414
commit: b40f6bcb0448d69e0c842375fccdb91d60d61ab9 [3/5] riscv: enable generi=
c PCI resource mapping
config: riscv-randconfig-r022-20210524 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 93d1e5=
822ed64abd777eb94ea9899e96c4c39fbe)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/c=
ommit/?id=3Db40f6bcb0448d69e0c842375fccdb91d60d61ab9
        git remote add riscv https://git.kernel.org/pub/scm/linux/kernel/gi=
t/riscv/linux.git
        git fetch --no-tags riscv next-misc
        git checkout b40f6bcb0448d69e0c842375fccdb91d60d61ab9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/pci/pci-sysfs.c:18:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:149:
   include/asm-generic/io.h:572:9: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return inl(addr);
                  ^~~~~~~~~
   arch/riscv/include/asm/io.h:57:76: note: expanded from macro 'inl'
   #define inl(c)          ({ u32 __v; __io_pbr(); __v =3D readl_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:89:76: note: expanded from macro 'readl_cp=
u'
   #define readl_cpu(c)            ({ u32 __r =3D le32_to_cpu((__force __le=
32)__raw_readl(c)); __r; })
                                                                           =
             ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/pci/pci-sysfs.c:18:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:149:
   include/asm-generic/io.h:580:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outb(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:59:68: note: expanded from macro 'outb'
   #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:91:52: note: expanded from macro 'writeb_c=
pu'
   #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
                                                             ^
   In file included from drivers/pci/pci-sysfs.c:18:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:149:
   include/asm-generic/io.h:588:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outw(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:60:68: note: expanded from macro 'outw'
   #define outw(v,c)       ({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:92:76: note: expanded from macro 'writew_c=
pu'
   #define writew_cpu(v, c)        ((void)__raw_writew((__force u16)cpu_to_=
le16(v), (c)))
                                                                           =
          ^
   In file included from drivers/pci/pci-sysfs.c:18:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:149:
   include/asm-generic/io.h:596:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outl(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:61:68: note: expanded from macro 'outl'
   #define outl(v,c)       ({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:93:76: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
                                                                           =
          ^
   In file included from drivers/pci/pci-sysfs.c:18:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:149:
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
   In file included from drivers/pci/pci-sysfs.c:27:
   In file included from include/linux/vgaarb.h:34:
   include/video/vga.h:215:2: warning: performing pointer arithmetic on a n=
ull pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outw(VGA_OUT16VAL (val, reg), port);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:60:68: note: expanded from macro 'outw'
   #define outw(v,c)       ({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:92:76: note: expanded from macro 'writew_c=
pu'
   #define writew_cpu(v, c)        ((void)__raw_writew((__force u16)cpu_to_=
le16(v), (c)))
                                                                           =
          ^
>> drivers/pci/pci-sysfs.c:1098:4: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                           outb(*(u8 *)buf, port);
                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:59:68: note: expanded from macro 'outb'
   #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:91:52: note: expanded from macro 'writeb_c=
pu'
   #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
                                                             ^
   drivers/pci/pci-sysfs.c:1100:17: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                           *(u8 *)buf =3D inb(port);
                                        ^~~~~~~~~
   arch/riscv/include/asm/io.h:55:76: note: expanded from macro 'inb'
   #define inb(c)          ({ u8  __v; __io_pbr(); __v =3D readb_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:87:48: note: expanded from macro 'readb_cp=
u'
   #define readb_cpu(c)            ({ u8  __r =3D __raw_readb(c); __r; })
                                                            ^
   drivers/pci/pci-sysfs.c:1104:4: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                           outw(*(u16 *)buf, port);
                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:60:68: note: expanded from macro 'outw'
   #define outw(v,c)       ({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:92:76: note: expanded from macro 'writew_c=
pu'
   #define writew_cpu(v, c)        ((void)__raw_writew((__force u16)cpu_to_=
le16(v), (c)))
                                                                           =
          ^
   drivers/pci/pci-sysfs.c:1106:18: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                           *(u16 *)buf =3D inw(port);
                                         ^~~~~~~~~
   arch/riscv/include/asm/io.h:56:76: note: expanded from macro 'inw'
   #define inw(c)          ({ u16 __v; __io_pbr(); __v =3D readw_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:88:76: note: expanded from macro 'readw_cp=
u'
   #define readw_cpu(c)            ({ u16 __r =3D le16_to_cpu((__force __le=
16)__raw_readw(c)); __r; })
                                                                           =
             ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from =
macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   drivers/pci/pci-sysfs.c:1110:4: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                           outl(*(u32 *)buf, port);
                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:61:68: note: expanded from macro 'outl'
   #define outl(v,c)       ({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:93:76: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
                                                                           =
          ^
   drivers/pci/pci-sysfs.c:1112:18: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                           *(u32 *)buf =3D inl(port);
                                         ^~~~~~~~~
   arch/riscv/include/asm/io.h:57:76: note: expanded from macro 'inl'
   #define inl(c)          ({ u32 __v; __io_pbr(); __v =3D readl_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:89:76: note: expanded from macro 'readl_cp=
u'
   #define readl_cpu(c)            ({ u32 __r =3D le32_to_cpu((__force __le=
32)__raw_readl(c)); __r; })
                                                                           =
             ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   14 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && (FRAME_POINTER || M=
IPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by
   - PROVE_LOCKING && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
   - DEBUG_LOCK_ALLOC && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT


vim +1098 drivers/pci/pci-sysfs.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1078  =

3c78bc61f5ef3b Ryan Desfosses  2014-04-18  1079  static ssize_t pci_resourc=
e_io(struct file *filp, struct kobject *kobj,
8633328be24267 Alex Williamson 2010-07-19  1080  			       struct bin_attri=
bute *attr, char *buf,
8633328be24267 Alex Williamson 2010-07-19  1081  			       loff_t off, size=
_t count, bool write)
8633328be24267 Alex Williamson 2010-07-19  1082  {
554a60379aaa50 Geliang Tang    2015-12-23  1083  	struct pci_dev *pdev =3D =
to_pci_dev(kobj_to_dev(kobj));
dca40b186b757c David Woodhouse 2017-04-12  1084  	int bar =3D (unsigned lon=
g)attr->private;
8633328be24267 Alex Williamson 2010-07-19  1085  	unsigned long port =3D of=
f;
8633328be24267 Alex Williamson 2010-07-19  1086  =

dca40b186b757c David Woodhouse 2017-04-12  1087  	port +=3D pci_resource_st=
art(pdev, bar);
8633328be24267 Alex Williamson 2010-07-19  1088  =

dca40b186b757c David Woodhouse 2017-04-12  1089  	if (port > pci_resource_e=
nd(pdev, bar))
8633328be24267 Alex Williamson 2010-07-19  1090  		return 0;
8633328be24267 Alex Williamson 2010-07-19  1091  =

dca40b186b757c David Woodhouse 2017-04-12  1092  	if (port + count - 1 > pc=
i_resource_end(pdev, bar))
8633328be24267 Alex Williamson 2010-07-19  1093  		return -EINVAL;
8633328be24267 Alex Williamson 2010-07-19  1094  =

8633328be24267 Alex Williamson 2010-07-19  1095  	switch (count) {
8633328be24267 Alex Williamson 2010-07-19  1096  	case 1:
8633328be24267 Alex Williamson 2010-07-19  1097  		if (write)
8633328be24267 Alex Williamson 2010-07-19 @1098  			outb(*(u8 *)buf, port);
8633328be24267 Alex Williamson 2010-07-19  1099  		else
8633328be24267 Alex Williamson 2010-07-19  1100  			*(u8 *)buf =3D inb(port=
);
8633328be24267 Alex Williamson 2010-07-19  1101  		return 1;
8633328be24267 Alex Williamson 2010-07-19  1102  	case 2:
8633328be24267 Alex Williamson 2010-07-19  1103  		if (write)
8633328be24267 Alex Williamson 2010-07-19  1104  			outw(*(u16 *)buf, port);
8633328be24267 Alex Williamson 2010-07-19  1105  		else
8633328be24267 Alex Williamson 2010-07-19  1106  			*(u16 *)buf =3D inw(por=
t);
8633328be24267 Alex Williamson 2010-07-19  1107  		return 2;
8633328be24267 Alex Williamson 2010-07-19  1108  	case 4:
8633328be24267 Alex Williamson 2010-07-19  1109  		if (write)
8633328be24267 Alex Williamson 2010-07-19  1110  			outl(*(u32 *)buf, port);
8633328be24267 Alex Williamson 2010-07-19  1111  		else
8633328be24267 Alex Williamson 2010-07-19  1112  			*(u32 *)buf =3D inl(por=
t);
8633328be24267 Alex Williamson 2010-07-19  1113  		return 4;
8633328be24267 Alex Williamson 2010-07-19  1114  	}
8633328be24267 Alex Williamson 2010-07-19  1115  	return -EINVAL;
8633328be24267 Alex Williamson 2010-07-19  1116  }
8633328be24267 Alex Williamson 2010-07-19  1117  =


:::::: The code at line 1098 was first introduced by commit
:::::: 8633328be242677fdedc42052838dd0608e7f342 PCI: Allow read/write acces=
s to sysfs I/O port resources

:::::: TO: Alex Williamson <alex.williamson@redhat.com>
:::::: CC: Jesse Barnes <jbarnes@virtuousgeek.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6182532987906772831==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6182532987906772831==--

