Content-Type: multipart/mixed; boundary="===============2269968805607512748=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/accessibility/speakup/speakup_keypc.c:268:14: warning: performing pointer arithmetic on a null pointer has undefined behavior
Date: Tue, 05 Jan 2021 07:59:06 +0800
Message-ID: <202101050759.y8UYaJS2-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2269968805607512748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
commit: 2067fd92d75b6d9085a43caf050bca5d88c491b8 staging/speakup: Move out =
of staging
date:   5 months ago
config: riscv-randconfig-r034-20210105 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 98cd1c=
33e3c2c3cfee36fb0fea3285fda06224d3)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2067fd92d75b6d9085a43caf050bca5d88c491b8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2067fd92d75b6d9085a43caf050bca5d88c491b8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/accessibility/speakup/speakup_keypc.c:17:
   In file included from drivers/accessibility/speakup/spk_priv.h:16:
   In file included from drivers/accessibility/speakup/spk_types.h:17:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:556:9: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return inb(addr);
                  ^~~~~~~~~
   arch/riscv/include/asm/io.h:54:76: note: expanded from macro 'inb'
   #define inb(c)          ({ u8  __v; __io_pbr(); __v =3D readb_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:93:48: note: expanded from macro 'readb_cp=
u'
   #define readb_cpu(c)            ({ u8  __r =3D __raw_readb(c); __r; })
                                                            ^
   In file included from drivers/accessibility/speakup/speakup_keypc.c:17:
   In file included from drivers/accessibility/speakup/spk_priv.h:16:
   In file included from drivers/accessibility/speakup/spk_types.h:17:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:564:9: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return inw(addr);
                  ^~~~~~~~~
   arch/riscv/include/asm/io.h:55:76: note: expanded from macro 'inw'
   #define inw(c)          ({ u16 __v; __io_pbr(); __v =3D readw_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:94:76: note: expanded from macro 'readw_cp=
u'
   #define readw_cpu(c)            ({ u16 __r =3D le16_to_cpu((__force __le=
16)__raw_readw(c)); __r; })
                                                                           =
             ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from =
macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/accessibility/speakup/speakup_keypc.c:17:
   In file included from drivers/accessibility/speakup/spk_priv.h:16:
   In file included from drivers/accessibility/speakup/spk_types.h:17:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:572:9: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return inl(addr);
                  ^~~~~~~~~
   arch/riscv/include/asm/io.h:56:76: note: expanded from macro 'inl'
   #define inl(c)          ({ u32 __v; __io_pbr(); __v =3D readl_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:95:76: note: expanded from macro 'readl_cp=
u'
   #define readl_cpu(c)            ({ u32 __r =3D le32_to_cpu((__force __le=
32)__raw_readl(c)); __r; })
                                                                           =
             ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/accessibility/speakup/speakup_keypc.c:17:
   In file included from drivers/accessibility/speakup/spk_priv.h:16:
   In file included from drivers/accessibility/speakup/spk_types.h:17:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:580:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outb(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:58:68: note: expanded from macro 'outb'
   #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:97:52: note: expanded from macro 'writeb_c=
pu'
   #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
                                                             ^
   In file included from drivers/accessibility/speakup/speakup_keypc.c:17:
   In file included from drivers/accessibility/speakup/spk_priv.h:16:
   In file included from drivers/accessibility/speakup/spk_types.h:17:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:588:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outw(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:59:68: note: expanded from macro 'outw'
   #define outw(v,c)       ({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:98:76: note: expanded from macro 'writew_c=
pu'
   #define writew_cpu(v, c)        ((void)__raw_writew((__force u16)cpu_to_=
le16(v), (c)))
                                                                           =
          ^
   In file included from drivers/accessibility/speakup/speakup_keypc.c:17:
   In file included from drivers/accessibility/speakup/spk_priv.h:16:
   In file included from drivers/accessibility/speakup/spk_types.h:17:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:596:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outl(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:60:68: note: expanded from macro 'outl'
   #define outl(v,c)       ({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:99:76: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
                                                                           =
          ^
   In file included from drivers/accessibility/speakup/speakup_keypc.c:17:
   In file included from drivers/accessibility/speakup/spk_priv.h:16:
   In file included from drivers/accessibility/speakup/spk_types.h:17:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1017:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/accessibility/speakup/speakup_keypc.c:268:14: warning: performin=
g pointer arithmetic on a null pointer has undefined behavior [-Wnull-point=
er-arithmetic]
                   port_val =3D inb(synth_port);
                              ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:54:76: note: expanded from macro 'inb'
   #define inb(c)          ({ u8  __v; __io_pbr(); __v =3D readb_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:93:48: note: expanded from macro 'readb_cp=
u'
   #define readb_cpu(c)            ({ u8  __r =3D __raw_readb(c); __r; })
                                                            ^
   drivers/accessibility/speakup/speakup_keypc.c:278:15: warning: performin=
g pointer arithmetic on a null pointer has undefined behavior [-Wnull-point=
er-arithmetic]
                           port_val =3D inb(synth_portlist[i]);
                                      ^~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:54:76: note: expanded from macro 'inb'
   #define inb(c)          ({ u8  __v; __io_pbr(); __v =3D readb_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:93:48: note: expanded from macro 'readb_cp=
u'
   #define readb_cpu(c)            ({ u8  __r =3D __raw_readb(c); __r; })
                                                            ^
   9 warnings generated.
   /tmp/speakup_keypc-d80cd4.s: Assembler messages:
   /tmp/speakup_keypc-d80cd4.s:109: Error: unrecognized opcode `zext.b a2,a=
1'
   /tmp/speakup_keypc-d80cd4.s:233: Error: unrecognized opcode `zext.b a0,a=
0'
   /tmp/speakup_keypc-d80cd4.s:392: Error: unrecognized opcode `zext.b a3,a=
1'
   /tmp/speakup_keypc-d80cd4.s:879: Error: unrecognized opcode `zext.b a2,s=
1'
   /tmp/speakup_keypc-d80cd4.s:906: Error: unrecognized opcode `zext.b s1,a=
0'
   /tmp/speakup_keypc-d80cd4.s:1292: Error: unrecognized opcode `zext.b a1,=
a1'
   /tmp/speakup_keypc-d80cd4.s:1293: Error: unrecognized opcode `zext.b a2,=
a2'
   /tmp/speakup_keypc-d80cd4.s:1294: Error: unrecognized opcode `zext.b a3,=
a3'
   /tmp/speakup_keypc-d80cd4.s:1295: Error: unrecognized opcode `zext.b a4,=
a0'
   clang-12: error: assembler command failed with exit code 1 (use -v to se=
e invocation)
--
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:564:9: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return inw(addr);
                  ^~~~~~~~~
   arch/riscv/include/asm/io.h:55:76: note: expanded from macro 'inw'
   #define inw(c)          ({ u16 __v; __io_pbr(); __v =3D readw_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:94:76: note: expanded from macro 'readw_cp=
u'
   #define readw_cpu(c)            ({ u16 __r =3D le16_to_cpu((__force __le=
16)__raw_readw(c)); __r; })
                                                                           =
             ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from =
macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/accessibility/speakup/serialio.c:2:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:572:9: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return inl(addr);
                  ^~~~~~~~~
   arch/riscv/include/asm/io.h:56:76: note: expanded from macro 'inl'
   #define inl(c)          ({ u32 __v; __io_pbr(); __v =3D readl_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:95:76: note: expanded from macro 'readl_cp=
u'
   #define readl_cpu(c)            ({ u32 __r =3D le32_to_cpu((__force __le=
32)__raw_readl(c)); __r; })
                                                                           =
             ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/accessibility/speakup/serialio.c:2:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:580:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outb(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:58:68: note: expanded from macro 'outb'
   #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:97:52: note: expanded from macro 'writeb_c=
pu'
   #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
                                                             ^
   In file included from drivers/accessibility/speakup/serialio.c:2:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:588:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outw(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:59:68: note: expanded from macro 'outw'
   #define outw(v,c)       ({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:98:76: note: expanded from macro 'writew_c=
pu'
   #define writew_cpu(v, c)        ((void)__raw_writew((__force u16)cpu_to_=
le16(v), (c)))
                                                                           =
          ^
   In file included from drivers/accessibility/speakup/serialio.c:2:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:596:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outl(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:60:68: note: expanded from macro 'outl'
   #define outl(v,c)       ({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:99:76: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
                                                                           =
          ^
   In file included from drivers/accessibility/speakup/serialio.c:2:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1017:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/accessibility/speakup/serialio.c:87:2: warning: performing point=
er arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arit=
hmetic]
           outb(cval | UART_LCR_DLAB, ser->port + UART_LCR);       /* set D=
LAB */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:58:68: note: expanded from macro 'outb'
   #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:97:52: note: expanded from macro 'writeb_c=
pu'
   #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
                                                             ^
   drivers/accessibility/speakup/serialio.c:88:2: warning: performing point=
er arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arit=
hmetic]
           outb(quot & 0xff, ser->port + UART_DLL);        /* LS of divisor=
 */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:58:68: note: expanded from macro 'outb'
   #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:97:52: note: expanded from macro 'writeb_c=
pu'
   #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
                                                             ^
   drivers/accessibility/speakup/serialio.c:89:2: warning: performing point=
er arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arit=
hmetic]
           outb(quot >> 8, ser->port + UART_DLM);          /* MS of divisor=
 */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:58:68: note: expanded from macro 'outb'
   #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:97:52: note: expanded from macro 'writeb_c=
pu'
   #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
                                                             ^
   drivers/accessibility/speakup/serialio.c:90:2: warning: performing point=
er arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arit=
hmetic]
           outb(cval, ser->port + UART_LCR);               /* reset DLAB */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:58:68: note: expanded from macro 'outb'
   #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:97:52: note: expanded from macro 'writeb_c=
pu'
   #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
                                                             ^
   drivers/accessibility/speakup/serialio.c:93:2: warning: performing point=
er arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arit=
hmetic]
           outb(0, ser->port + UART_IER);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:58:68: note: expanded from macro 'outb'
   #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:97:52: note: expanded from macro 'writeb_c=
pu'
   #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
                                                             ^
   drivers/accessibility/speakup/serialio.c:94:2: warning: performing point=
er arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arit=
hmetic]
           outb(UART_MCR_DTR | UART_MCR_RTS, ser->port + UART_MCR);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:58:68: note: expanded from macro 'outb'
   #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:97:52: note: expanded from macro 'writeb_c=
pu'
   #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
                                                             ^
   drivers/accessibility/speakup/serialio.c:97:6: warning: performing point=
er arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arit=
hmetic]
           if (inb(ser->port + UART_LSR) =3D=3D 0xff) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:54:76: note: expanded from macro 'inb'
   #define inb(c)          ({ u8  __v; __io_pbr(); __v =3D readb_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:93:48: note: expanded from macro 'readb_cp=
u'
   #define readb_cpu(c)            ({ u8  __r =3D __raw_readb(c); __r; })
                                                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/accessibility/speakup/serialio.c:97:6: warning: performing point=
er arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arit=
hmetic]
           if (inb(ser->port + UART_LSR) =3D=3D 0xff) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:54:76: note: expanded from macro 'inb'
   #define inb(c)          ({ u8  __v; __io_pbr(); __v =3D readb_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:93:48: note: expanded from macro 'readb_cp=
u'
   #define readb_cpu(c)            ({ u8  __r =3D __raw_readb(c); __r; })
                                                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                               ^~~~
   drivers/accessibility/speakup/serialio.c:97:6: warning: performing point=
er arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arit=
hmetic]
           if (inb(ser->port + UART_LSR) =3D=3D 0xff) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:54:76: note: expanded from macro 'inb'
   #define inb(c)          ({ u8  __v; __io_pbr(); __v =3D readb_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:93:48: note: expanded from macro 'readb_cp=
u'
   #define readb_cpu(c)            ({ u8  __r =3D __raw_readb(c); __r; })
                                                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
..


vim +268 drivers/accessibility/speakup/speakup_keypc.c

c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  253  =

c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  254  static int synth_probe(struct spk_synth *synth)
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  255  {
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  256  	unsigned int port_val =3D 0;
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  257  	int i =3D 0;
8e69a8110686572 drivers/staging/speakup/speakup_keypc.c Domagoj Trsan      =
 2014-09-09  258  =

c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  259  	pr_info("Probing for %s.\n", synth->long_name);
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  260  	if (port_forced) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  261  		synth_port =3D port_forced;
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  262  		pr_info("probe forced to %x by kernel command line\n",
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  263  			synth_port);
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  264  		if (synth_request_region(synth_port - 1, SYNTH_IO_EXTEN=
T)) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  265  			pr_warn("sorry, port already reserved\n");
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  266  			return -EBUSY;
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  267  		}
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07 @268  		port_val =3D inb(synth_port);
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  269  	} else {
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  270  		for (i =3D 0; synth_portlist[i]; i++) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  271  			if (synth_request_region(synth_portlist[i],
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  272  						 SYNTH_IO_EXTENT)) {
75d6282d8b2d58b drivers/staging/speakup/speakup_keypc.c Christopher Brannon=
 2010-10-14  273  				pr_warn
75d6282d8b2d58b drivers/staging/speakup/speakup_keypc.c Christopher Brannon=
 2010-10-14  274  				    ("request_region: failed with 0x%x, %d\n",
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  275  				     synth_portlist[i], SYNTH_IO_EXTENT);
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  276  				continue;
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  277  			}
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  278  			port_val =3D inb(synth_portlist[i]);
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  279  			if (port_val =3D=3D 0x80) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  280  				synth_port =3D synth_portlist[i];
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  281  				break;
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  282  			}
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  283  		}
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  284  	}
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  285  	if (port_val !=3D 0x80) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  286  		pr_info("%s: not found\n", synth->long_name);
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  287  		synth_release_region(synth_port, SYNTH_IO_EXTENT);
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  288  		synth_port =3D 0;
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  289  		return -ENODEV;
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  290  	}
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  291  	pr_info("%s: %03x-%03x, driver version %s,\n", synth->lo=
ng_name,
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  292  		synth_port, synth_port + SYNTH_IO_EXTENT - 1,
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  293  		synth->version);
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  294  	synth->alive =3D 1;
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  295  	return 0;
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  296  }
c6e3fd22cd53836 drivers/staging/speakup/speakup_keypc.c William Hubbs      =
 2010-10-07  297  =


:::::: The code at line 268 was first introduced by commit
:::::: c6e3fd22cd538365bfeb82997d5b89562e077d42 Staging: add speakup to the=
 staging directory

:::::: TO: William Hubbs <w.d.hubbs@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2269968805607512748==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
8zTp48kBAA==
--===============2269968805607512748==--

