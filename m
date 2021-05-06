Content-Type: multipart/mixed; boundary="===============5052100616602692442=="
MIME-Version: 1.0
From: Rui Miguel Silva <rui.silva@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [usb:usb-testing 7/9] drivers/usb/isp1760/isp1760-regs.h:286:21: warning: initializer overrides prior initialization of this subobject
Date: Thu, 06 May 2021 16:56:01 +0100
Message-ID: <CB6AA86KSN8C.2UEPEE2H5WFKY@arch-thunder>
In-Reply-To: <202105062318.xxK3ju2U-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5052100616602692442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Greg,
I have this all fixed in my v2 branch. So, I think  it is better to
drop the first 3 from your branch, sorry about that.

Cheers,
    Rui

On Thu May 6, 2021 at 4:43 PM WEST, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git us=
b-testing
> head:   83a9d2a05296bf5a5fee13206dc4499a40978908
> commit: 54dacbcc6b8921a211bd736d2f208d3c78594241 [7/9] usb: isp1760: move=
 to regmap for register access
> config: riscv-randconfig-r006-20210506 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5a=
2a5836cc8e4c1def2bdeb022e7b496623439)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/=
commit/?id=3D54dacbcc6b8921a211bd736d2f208d3c78594241
>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/gi=
t/gregkh/usb.git
>         git fetch --no-tags usb usb-testing
>         git checkout 54dacbcc6b8921a211bd736d2f208d3c78594241
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Driscv =

>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>                   ^~~~~~~~~
>    arch/riscv/include/asm/io.h:56:76: note: expanded from macro 'inw'
>    #define inw(c)          ({ u16 __v; __io_pbr(); __v =3D readw_cpu((voi=
d*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
>                                                                          =
  ~~~~~~~~~~ ^
>    arch/riscv/include/asm/mmio.h:88:76: note: expanded from macro 'readw_=
cpu'
>    #define readw_cpu(c)            ({ u16 __r =3D le16_to_cpu((__force __=
le16)__raw_readw(c)); __r; })
>                                                                          =
               ^
>    include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded fro=
m macro '__le16_to_cpu'
>    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>                                                      ^
>    In file included from drivers/usb/isp1760/isp1760-if.c:13:
>    In file included from include/linux/usb.h:16:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:572:9: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return inl(addr);
>                   ^~~~~~~~~
>    arch/riscv/include/asm/io.h:57:76: note: expanded from macro 'inl'
>    #define inl(c)          ({ u32 __v; __io_pbr(); __v =3D readl_cpu((voi=
d*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
>                                                                          =
  ~~~~~~~~~~ ^
>    arch/riscv/include/asm/mmio.h:89:76: note: expanded from macro 'readl_=
cpu'
>    #define readl_cpu(c)            ({ u32 __r =3D le32_to_cpu((__force __=
le32)__raw_readl(c)); __r; })
>                                                                          =
               ^
>    include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded fro=
m macro '__le32_to_cpu'
>    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>                                                      ^
>    In file included from drivers/usb/isp1760/isp1760-if.c:13:
>    In file included from include/linux/usb.h:16:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:580:2: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            outb(value, addr);
>            ^~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:59:68: note: expanded from macro 'outb'
>    #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBA=
SE + (c))); __io_paw(); })
>                                                                  ~~~~~~~~=
~~ ^
>    arch/riscv/include/asm/mmio.h:91:52: note: expanded from macro 'writeb=
_cpu'
>    #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
>                                                              ^
>    In file included from drivers/usb/isp1760/isp1760-if.c:13:
>    In file included from include/linux/usb.h:16:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:588:2: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            outw(value, addr);
>            ^~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:60:68: note: expanded from macro 'outw'
>    #define outw(v,c)       ({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBA=
SE + (c))); __io_paw(); })
>                                                                  ~~~~~~~~=
~~ ^
>    arch/riscv/include/asm/mmio.h:92:76: note: expanded from macro 'writew=
_cpu'
>    #define writew_cpu(v, c)        ((void)__raw_writew((__force u16)cpu_t=
o_le16(v), (c)))
>                                                                          =
            ^
>    In file included from drivers/usb/isp1760/isp1760-if.c:13:
>    In file included from include/linux/usb.h:16:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:596:2: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            outl(value, addr);
>            ^~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:61:68: note: expanded from macro 'outl'
>    #define outl(v,c)       ({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBA=
SE + (c))); __io_paw(); })
>                                                                  ~~~~~~~~=
~~ ^
>    arch/riscv/include/asm/mmio.h:93:76: note: expanded from macro 'writel=
_cpu'
>    #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_t=
o_le32(v), (c)))
>                                                                          =
            ^
>    In file included from drivers/usb/isp1760/isp1760-if.c:13:
>    In file included from include/linux/usb.h:16:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:1024:55: warning: performing pointer arithmet=
ic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>                                                      ~~~~~~~~~~ ^
>    In file included from drivers/usb/isp1760/isp1760-if.c:22:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
> >> drivers/usb/isp1760/isp1760-regs.h:286:21: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_OTG_DISABLE]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 10, 10),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:279:21: note: previous initializati=
on is here
>            [HW_OTG_DISABLE]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 10, 10),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    In file included from drivers/usb/isp1760/isp1760-if.c:22:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>    drivers/usb/isp1760/isp1760-regs.h:287:22: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_SW_SEL_HC_DC]       =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 7, 7),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:280:22: note: previous initializati=
on is here
>            [HW_SW_SEL_HC_DC]       =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 7, 7),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    In file included from drivers/usb/isp1760/isp1760-if.c:22:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>    drivers/usb/isp1760/isp1760-regs.h:288:19: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_VBUS_DRV]           =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 4, 4),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:281:19: note: previous initializati=
on is here
>            [HW_VBUS_DRV]           =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 4, 4),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    In file included from drivers/usb/isp1760/isp1760-if.c:22:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>    drivers/usb/isp1760/isp1760-regs.h:289:21: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_SEL_CP_EXT]         =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 3, 3),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:282:21: note: previous initializati=
on is here
>            [HW_SEL_CP_EXT]         =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 3, 3),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    In file included from drivers/usb/isp1760/isp1760-if.c:22:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>    drivers/usb/isp1760/isp1760-regs.h:290:21: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_DM_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 2, 2),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:283:21: note: previous initializati=
on is here
>            [HW_DM_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 2, 2),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    In file included from drivers/usb/isp1760/isp1760-if.c:22:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>    drivers/usb/isp1760/isp1760-regs.h:291:21: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_DP_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 1, 1),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:284:21: note: previous initializati=
on is here
>            [HW_DP_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 1, 1),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    In file included from drivers/usb/isp1760/isp1760-if.c:22:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>    drivers/usb/isp1760/isp1760-regs.h:292:20: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_DP_PULLUP]          =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 0, 0),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:285:20: note: previous initializati=
on is here
>            [HW_DP_PULLUP]          =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 0, 0),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
> --
>    In file included from drivers/usb/isp1760/isp1760-core.c:15:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:556:9: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return inb(addr);
>                   ^~~~~~~~~
>    arch/riscv/include/asm/io.h:55:76: note: expanded from macro 'inb'
>    #define inb(c)          ({ u8  __v; __io_pbr(); __v =3D readb_cpu((voi=
d*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
>                                                                          =
  ~~~~~~~~~~ ^
>    arch/riscv/include/asm/mmio.h:87:48: note: expanded from macro 'readb_=
cpu'
>    #define readb_cpu(c)            ({ u8  __r =3D __raw_readb(c); __r; })
>                                                             ^
>    In file included from drivers/usb/isp1760/isp1760-core.c:15:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:564:9: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return inw(addr);
>                   ^~~~~~~~~
>    arch/riscv/include/asm/io.h:56:76: note: expanded from macro 'inw'
>    #define inw(c)          ({ u16 __v; __io_pbr(); __v =3D readw_cpu((voi=
d*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
>                                                                          =
  ~~~~~~~~~~ ^
>    arch/riscv/include/asm/mmio.h:88:76: note: expanded from macro 'readw_=
cpu'
>    #define readw_cpu(c)            ({ u16 __r =3D le16_to_cpu((__force __=
le16)__raw_readw(c)); __r; })
>                                                                          =
               ^
>    include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded fro=
m macro '__le16_to_cpu'
>    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>                                                      ^
>    In file included from drivers/usb/isp1760/isp1760-core.c:15:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:572:9: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return inl(addr);
>                   ^~~~~~~~~
>    arch/riscv/include/asm/io.h:57:76: note: expanded from macro 'inl'
>    #define inl(c)          ({ u32 __v; __io_pbr(); __v =3D readl_cpu((voi=
d*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
>                                                                          =
  ~~~~~~~~~~ ^
>    arch/riscv/include/asm/mmio.h:89:76: note: expanded from macro 'readl_=
cpu'
>    #define readl_cpu(c)            ({ u32 __r =3D le32_to_cpu((__force __=
le32)__raw_readl(c)); __r; })
>                                                                          =
               ^
>    include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded fro=
m macro '__le32_to_cpu'
>    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>                                                      ^
>    In file included from drivers/usb/isp1760/isp1760-core.c:15:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:580:2: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            outb(value, addr);
>            ^~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:59:68: note: expanded from macro 'outb'
>    #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBA=
SE + (c))); __io_paw(); })
>                                                                  ~~~~~~~~=
~~ ^
>    arch/riscv/include/asm/mmio.h:91:52: note: expanded from macro 'writeb=
_cpu'
>    #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
>                                                              ^
>    In file included from drivers/usb/isp1760/isp1760-core.c:15:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:588:2: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            outw(value, addr);
>            ^~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:60:68: note: expanded from macro 'outw'
>    #define outw(v,c)       ({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBA=
SE + (c))); __io_paw(); })
>                                                                  ~~~~~~~~=
~~ ^
>    arch/riscv/include/asm/mmio.h:92:76: note: expanded from macro 'writew=
_cpu'
>    #define writew_cpu(v, c)        ((void)__raw_writew((__force u16)cpu_t=
o_le16(v), (c)))
>                                                                          =
            ^
>    In file included from drivers/usb/isp1760/isp1760-core.c:15:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:596:2: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            outl(value, addr);
>            ^~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:61:68: note: expanded from macro 'outl'
>    #define outl(v,c)       ({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBA=
SE + (c))); __io_paw(); })
>                                                                  ~~~~~~~~=
~~ ^
>    arch/riscv/include/asm/mmio.h:93:76: note: expanded from macro 'writel=
_cpu'
>    #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_t=
o_le32(v), (c)))
>                                                                          =
            ^
>    In file included from drivers/usb/isp1760/isp1760-core.c:15:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:1024:55: warning: performing pointer arithmet=
ic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>                                                      ~~~~~~~~~~ ^
>    In file included from drivers/usb/isp1760/isp1760-core.c:21:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
> >> drivers/usb/isp1760/isp1760-regs.h:286:21: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_OTG_DISABLE]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 10, 10),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:279:21: note: previous initializati=
on is here
>            [HW_OTG_DISABLE]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 10, 10),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    In file included from drivers/usb/isp1760/isp1760-core.c:21:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>    drivers/usb/isp1760/isp1760-regs.h:287:22: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_SW_SEL_HC_DC]       =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 7, 7),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:280:22: note: previous initializati=
on is here
>            [HW_SW_SEL_HC_DC]       =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 7, 7),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    In file included from drivers/usb/isp1760/isp1760-core.c:21:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>    drivers/usb/isp1760/isp1760-regs.h:288:19: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_VBUS_DRV]           =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 4, 4),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:281:19: note: previous initializati=
on is here
>            [HW_VBUS_DRV]           =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 4, 4),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    In file included from drivers/usb/isp1760/isp1760-core.c:21:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>    drivers/usb/isp1760/isp1760-regs.h:289:21: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_SEL_CP_EXT]         =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 3, 3),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:282:21: note: previous initializati=
on is here
>            [HW_SEL_CP_EXT]         =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 3, 3),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    In file included from drivers/usb/isp1760/isp1760-core.c:21:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>    drivers/usb/isp1760/isp1760-regs.h:290:21: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_DM_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 2, 2),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:283:21: note: previous initializati=
on is here
>            [HW_DM_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 2, 2),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    In file included from drivers/usb/isp1760/isp1760-core.c:21:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>    drivers/usb/isp1760/isp1760-regs.h:291:21: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_DP_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 1, 1),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:284:21: note: previous initializati=
on is here
>            [HW_DP_PULLDOWN]        =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 1, 1),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    In file included from drivers/usb/isp1760/isp1760-core.c:21:
>    In file included from drivers/usb/isp1760/isp1760-core.h:19:
>    In file included from drivers/usb/isp1760/isp1760-hcd.h:8:
>    drivers/usb/isp1760/isp1760-regs.h:292:20: warning: initializer overri=
des prior initialization of this subobject [-Winitializer-overrides]
>            [HW_DP_PULLUP]          =3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEA=
R, 0, 0),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-regs.h:285:20: note: previous initializati=
on is here
>            [HW_DP_PULLUP]          =3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET,=
 0, 0),
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    include/linux/regmap.h:1210:37: note: expanded from macro 'REG_FIELD'
>    #define REG_FIELD(_reg, _lsb, _msb) {           \
>                                        ^~~~~~~~~~~~~
> >> drivers/usb/isp1760/isp1760-core.c:163:41: warning: variable 'base' is=
 uninitialized when used here [-Wuninitialized]
>            hcd->regs =3D devm_regmap_init_mmio(dev, base, &isp1760_hc_reg=
map_conf);
>                                                   ^~~~
>    include/linux/regmap.h:988:39: note: expanded from macro 'devm_regmap_=
init_mmio'
>            devm_regmap_init_mmio_clk(dev, NULL, regs, config)
>                                                 ^~~~
>    include/linux/regmap.h:974:18: note: expanded from macro 'devm_regmap_=
init_mmio_clk'
>                                    dev, clk_id, regs, config)
>                                                 ^~~~
>    include/linux/regmap.h:666:52: note: expanded from macro '__regmap_loc=
kdep_wrapper'
>    #define __regmap_lockdep_wrapper(fn, name, ...) fn(__VA_ARGS__, NULL, =
NULL)
>                                                       ^~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-core.c:129:20: note: initialize the variab=
le 'base' to silence this warning
>            void __iomem *base;
>                              ^
>                               =3D NULL
>    15 warnings generated.
>
>
> vim +286 drivers/usb/isp1760/isp1760-regs.h
>
>    240	=

>    241	static const struct reg_field isp1761_dc_reg_fields[] =3D {
>    242		[DC_DEVEN]		=3D REG_FIELD(ISP176x_DC_ADDRESS, 7, 7),
>    243		[DC_DEVADDR]		=3D REG_FIELD(ISP176x_DC_ADDRESS, 0, 6),
>    244		[DC_VBUSSTAT]		=3D REG_FIELD(ISP176x_DC_MODE, 8, 8),
>    245		[DC_SFRESET]		=3D REG_FIELD(ISP176x_DC_MODE, 4, 4),
>    246		[DC_GLINTENA]		=3D REG_FIELD(ISP176x_DC_MODE, 3, 3),
>    247		[DC_CDBGMOD_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 6, 6),
>    248		[DC_DDBGMODIN_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 4, 4),
>    249		[DC_DDBGMODOUT_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 2, 2),
>    250		[DC_INTPOL]		=3D REG_FIELD(ISP176x_DC_INTCONF, 0, 0),
>    251		[DC_IEPRXTX_7]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 25, 25),
>    252		[DC_IEPRXTX_6]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 23, 23),
>    253		[DC_IEPRXTX_5]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 21, 21),
>    254		[DC_IEPRXTX_4]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 19, 19),
>    255		[DC_IEPRXTX_3]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 17, 17),
>    256		[DC_IEPRXTX_2]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 15, 15),
>    257		[DC_IEPRXTX_1]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 13, 13),
>    258		[DC_IEPRXTX_0]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 11, 11),
>    259		[DC_IEP0SETUP]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 8, 8),
>    260		[DC_IEVBUS]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 7, 7),
>    261		[DC_IEHS_STA]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 5, 5),
>    262		[DC_IERESM]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 4, 4),
>    263		[DC_IESUSP]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 3, 3),
>    264		[DC_IEBRST]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 0, 0),
>    265		[DC_EP0SETUP]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 5, 5),
>    266		[DC_ENDPIDX]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 1, 4),
>    267		[DC_EPDIR]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 0, 0),
>    268		[DC_CLBUF]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 4, 4),
>    269		[DC_VENDP]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 3, 3),
>    270		[DC_DSEN]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 2, 2),
>    271		[DC_STATUS]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 1, 1),
>    272		[DC_STALL]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 0, 0),
>    273		[DC_BUFLEN]		=3D REG_FIELD(ISP176x_DC_BUFLEN, 0, 15),
>    274		[DC_FFOSZ]		=3D REG_FIELD(ISP176x_DC_EPMAXPKTSZ, 0, 10),
>    275		[DC_EPENABLE]		=3D REG_FIELD(ISP176x_DC_EPTYPE, 3, 3),
>    276		[DC_ENDPTYP]		=3D REG_FIELD(ISP176x_DC_EPTYPE, 0, 1),
>    277		[DC_UFRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 11, 13),
>    278		[DC_FRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 0, 10),
>    279		[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 10, 10),
>    280		[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 7, 7),
>    281		[HW_VBUS_DRV]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 4, 4),
>    282		[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 3, 3),
>    283		[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 2, 2),
>    284		[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1, 1),
>    285		[HW_DP_PULLUP]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 0, 0),
>  > 286		[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10),
>    287		[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7),
>    288		[HW_VBUS_DRV]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
>    289		[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
>    290		[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
>    291		[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
>    292		[HW_DP_PULLUP]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
>    293	};
>    294	=

>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



--===============5052100616602692442==--

