Content-Type: multipart/mixed; boundary="===============5796996556633592318=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 1/2] extcon: add driver for TI TUSB320
Date: Tue, 13 Oct 2020 09:44:19 +0800
Message-ID: <202010130952.lph7AvpG-lkp@intel.com>
In-Reply-To: <20201012144754.738830-1-michael.auchter@ni.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5796996556633592318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on chanwoo-extcon/extcon-next]
[also build test WARNING on v5.9 next-20201012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Auchter/extcon-add=
-driver-for-TI-TUSB320/20201012-232733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git =
extcon-next
config: s390-randconfig-r022-20201013 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project a324d8=
f964bf421fa7d8b882b0f64ead28c4149c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/5065d684df89cf11f57743f3c=
1440e6bd09054ea
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Auchter/extcon-add-driver-=
for-TI-TUSB320/20201012-232733
        git checkout 5065d684df89cf11f57743f3c1440e6bd09054ea
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
                     ^
   In file included from drivers/extcon/extcon-usbc-tusb320.c:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from drivers/extcon/extcon-usbc-tusb320.c:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
                     ^
   In file included from drivers/extcon/extcon-usbc-tusb320.c:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
                     ^
   In file included from drivers/extcon/extcon-usbc-tusb320.c:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
                     ^
   In file included from drivers/extcon/extcon-usbc-tusb320.c:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/extcon/extcon-usbc-tusb320.c:163:35: warning: unused variable 't=
usb320_i2c_id' [-Wunused-const-variable]
   static const struct i2c_device_id tusb320_i2c_id[] =3D {
                                     ^
   21 warnings generated.

vim +/tusb320_i2c_id +163 drivers/extcon/extcon-usbc-tusb320.c

   162	=

 > 163	static const struct i2c_device_id tusb320_i2c_id[] =3D {
   164		{ "tusb320", 0 },
   165		{ }
   166	};
   167	MODULE_DEVICE_TABLE(i2c, tusb320_i2c_id);
   168	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5796996556633592318==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5796996556633592318==--

