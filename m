Content-Type: multipart/mixed; boundary="===============4502183633292647239=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [usb:usb-testing 7/9] drivers/usb/isp1760/isp1760-regs.h:286:21: warning: initializer overrides prior initialization of this subobject
Date: Thu, 06 May 2021 23:43:25 +0800
Message-ID: <202105062318.xxK3ju2U-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4502183633292647239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
head:   83a9d2a05296bf5a5fee13206dc4499a40978908
commit: 54dacbcc6b8921a211bd736d2f208d3c78594241 [7/9] usb: isp1760: move t=
o regmap for register access
config: riscv-randconfig-r006-20210506 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5a2a=
5836cc8e4c1def2bdeb022e7b496623439)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/co=
mmit/?id=3D54dacbcc6b8921a211bd736d2f208d3c78594241
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/=
gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 54dacbcc6b8921a211bd736d2f208d3c78594241
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

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
   In file included from drivers/usb/isp1760/isp1760-if.c:13:
   In file included from include/linux/usb.h:16:
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
   In file included from drivers/usb/isp1760/isp1760-if.c:13:
   In file included from include/linux/usb.h:16:
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
   In file included from drivers/usb/isp1760/isp1760-if.c:13:
   In file included from include/linux/usb.h:16:
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
   In file included from drivers/usb/isp1760/isp1760-if.c:13:
   In file included from include/linux/usb.h:16:
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
   In file included from drivers/usb/isp1760/isp1760-if.c:13:
   In file included from include/linux/usb.h:16:
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
   In file included from drivers/usb/isp1760/isp1760-if.c:22:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>> drivers/usb/isp1760/isp1760-regs.h:286:21: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_OTG_DISABLE]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 10, 10),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:279:21: note: previous initialization=
 is here
           [HW_OTG_DISABLE]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1=
0, 10),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-if.c:22:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
   drivers/usb/isp1760/isp1760-regs.h:287:22: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_SW_SEL_HC_DC]       =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 7, 7),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:280:22: note: previous initialization=
 is here
           [HW_SW_SEL_HC_DC]       =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 7=
, 7),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-if.c:22:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
   drivers/usb/isp1760/isp1760-regs.h:288:19: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_VBUS_DRV]           =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 4, 4),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:281:19: note: previous initialization=
 is here
           [HW_VBUS_DRV]           =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 4=
, 4),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-if.c:22:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
   drivers/usb/isp1760/isp1760-regs.h:289:21: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_SEL_CP_EXT]         =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 3, 3),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:282:21: note: previous initialization=
 is here
           [HW_SEL_CP_EXT]         =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 3=
, 3),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-if.c:22:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
   drivers/usb/isp1760/isp1760-regs.h:290:21: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_DM_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 2, 2),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:283:21: note: previous initialization=
 is here
           [HW_DM_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 2=
, 2),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-if.c:22:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
   drivers/usb/isp1760/isp1760-regs.h:291:21: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_DP_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 1, 1),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:284:21: note: previous initialization=
 is here
           [HW_DP_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1=
, 1),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-if.c:22:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
   drivers/usb/isp1760/isp1760-regs.h:292:20: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_DP_PULLUP]          =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 0, 0),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:285:20: note: previous initialization=
 is here
           [HW_DP_PULLUP]          =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 0=
, 0),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
--
   In file included from drivers/usb/isp1760/isp1760-core.c:15:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:149:
   include/asm-generic/io.h:556:9: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return inb(addr);
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
   In file included from drivers/usb/isp1760/isp1760-core.c:15:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:149:
   include/asm-generic/io.h:564:9: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return inw(addr);
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
   In file included from drivers/usb/isp1760/isp1760-core.c:15:
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
   In file included from drivers/usb/isp1760/isp1760-core.c:15:
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
   In file included from drivers/usb/isp1760/isp1760-core.c:15:
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
   In file included from drivers/usb/isp1760/isp1760-core.c:15:
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
   In file included from drivers/usb/isp1760/isp1760-core.c:15:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:149:
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
   In file included from drivers/usb/isp1760/isp1760-core.c:21:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>> drivers/usb/isp1760/isp1760-regs.h:286:21: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_OTG_DISABLE]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 10, 10),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:279:21: note: previous initialization=
 is here
           [HW_OTG_DISABLE]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1=
0, 10),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-core.c:21:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
   drivers/usb/isp1760/isp1760-regs.h:287:22: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_SW_SEL_HC_DC]       =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 7, 7),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:280:22: note: previous initialization=
 is here
           [HW_SW_SEL_HC_DC]       =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 7=
, 7),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-core.c:21:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
   drivers/usb/isp1760/isp1760-regs.h:288:19: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_VBUS_DRV]           =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 4, 4),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:281:19: note: previous initialization=
 is here
           [HW_VBUS_DRV]           =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 4=
, 4),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-core.c:21:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
   drivers/usb/isp1760/isp1760-regs.h:289:21: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_SEL_CP_EXT]         =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 3, 3),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:282:21: note: previous initialization=
 is here
           [HW_SEL_CP_EXT]         =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 3=
, 3),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-core.c:21:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
   drivers/usb/isp1760/isp1760-regs.h:290:21: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_DM_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 2, 2),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:283:21: note: previous initialization=
 is here
           [HW_DM_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 2=
, 2),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-core.c:21:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
   drivers/usb/isp1760/isp1760-regs.h:291:21: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_DP_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 1, 1),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:284:21: note: previous initialization=
 is here
           [HW_DP_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1=
, 1),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-core.c:21:
   In file included from drivers/usb/isp1760/isp1760-core.h:19:
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
   drivers/usb/isp1760/isp1760-regs.h:292:20: warning: initializer override=
s prior initialization of this subobject [-Winitializer-overrides]
           [HW_DP_PULLUP]          =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR,=
 0, 0),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:285:20: note: previous initialization=
 is here
           [HW_DP_PULLUP]          =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 0=
, 0),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
   #define REG_FIELD(_reg, _lsb, _msb) {           \
                                       ^~~~~~~~~~~~~
>> drivers/usb/isp1760/isp1760-core.c:163:41: warning: variable 'base' is u=
ninitialized when used here [-Wuninitialized]
           hcd->regs =3D devm_regmap_init_mmio(dev, base, &isp1760_hc_regma=
p_conf);
                                                  ^~~~
   include/linux/regmap.h:988:39: note: expanded from macro 'devm_regmap_in=
it_mmio'
           devm_regmap_init_mmio_clk(dev, NULL, regs, config)
                                                ^~~~
   include/linux/regmap.h:974:18: note: expanded from macro 'devm_regmap_in=
it_mmio_clk'
                                   dev, clk_id, regs, config)
                                                ^~~~
   include/linux/regmap.h:666:52: note: expanded from macro '__regmap_lockd=
ep_wrapper'
   #define __regmap_lockdep_wrapper(fn, name, ...) fn(__VA_ARGS__, NULL, NU=
LL)
                                                      ^~~~~~~~~~~
   drivers/usb/isp1760/isp1760-core.c:129:20: note: initialize the variable=
 'base' to silence this warning
           void __iomem *base;
                             ^
                              =3D NULL
   15 warnings generated.


vim +286 drivers/usb/isp1760/isp1760-regs.h

   240	=

   241	static const struct reg_field isp1761_dc_reg_fields[] =3D {
   242		[DC_DEVEN]		=3D REG_FIELD(ISP176x_DC_ADDRESS, 7, 7),
   243		[DC_DEVADDR]		=3D REG_FIELD(ISP176x_DC_ADDRESS, 0, 6),
   244		[DC_VBUSSTAT]		=3D REG_FIELD(ISP176x_DC_MODE, 8, 8),
   245		[DC_SFRESET]		=3D REG_FIELD(ISP176x_DC_MODE, 4, 4),
   246		[DC_GLINTENA]		=3D REG_FIELD(ISP176x_DC_MODE, 3, 3),
   247		[DC_CDBGMOD_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 6, 6),
   248		[DC_DDBGMODIN_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 4, 4),
   249		[DC_DDBGMODOUT_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 2, 2),
   250		[DC_INTPOL]		=3D REG_FIELD(ISP176x_DC_INTCONF, 0, 0),
   251		[DC_IEPRXTX_7]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 25, 25),
   252		[DC_IEPRXTX_6]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 23, 23),
   253		[DC_IEPRXTX_5]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 21, 21),
   254		[DC_IEPRXTX_4]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 19, 19),
   255		[DC_IEPRXTX_3]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 17, 17),
   256		[DC_IEPRXTX_2]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 15, 15),
   257		[DC_IEPRXTX_1]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 13, 13),
   258		[DC_IEPRXTX_0]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 11, 11),
   259		[DC_IEP0SETUP]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 8, 8),
   260		[DC_IEVBUS]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 7, 7),
   261		[DC_IEHS_STA]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 5, 5),
   262		[DC_IERESM]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 4, 4),
   263		[DC_IESUSP]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 3, 3),
   264		[DC_IEBRST]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 0, 0),
   265		[DC_EP0SETUP]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 5, 5),
   266		[DC_ENDPIDX]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 1, 4),
   267		[DC_EPDIR]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 0, 0),
   268		[DC_CLBUF]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 4, 4),
   269		[DC_VENDP]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 3, 3),
   270		[DC_DSEN]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 2, 2),
   271		[DC_STATUS]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 1, 1),
   272		[DC_STALL]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 0, 0),
   273		[DC_BUFLEN]		=3D REG_FIELD(ISP176x_DC_BUFLEN, 0, 15),
   274		[DC_FFOSZ]		=3D REG_FIELD(ISP176x_DC_EPMAXPKTSZ, 0, 10),
   275		[DC_EPENABLE]		=3D REG_FIELD(ISP176x_DC_EPTYPE, 3, 3),
   276		[DC_ENDPTYP]		=3D REG_FIELD(ISP176x_DC_EPTYPE, 0, 1),
   277		[DC_UFRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 11, 13),
   278		[DC_FRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 0, 10),
   279		[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 10, 10),
   280		[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 7, 7),
   281		[HW_VBUS_DRV]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 4, 4),
   282		[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 3, 3),
   283		[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 2, 2),
   284		[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1, 1),
   285		[HW_DP_PULLUP]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 0, 0),
 > 286		[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10),
   287		[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7),
   288		[HW_VBUS_DRV]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
   289		[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
   290		[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
   291		[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
   292		[HW_DP_PULLUP]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
   293	};
   294	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4502183633292647239==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4502183633292647239==--

