Content-Type: multipart/mixed; boundary="===============4170776494897174599=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/power/supply/cpcap-battery.c:982:42: warning: unused variable 'cpcap_battery_default_data'
Date: Mon, 31 May 2021 05:46:36 +0800
Message-ID: <202105310533.koKxj4CD-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4170776494897174599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b90e90f40b4ff23c753126008bf4713a42353af6
commit: ea29b20a828511de3348334e529a3d046a180416 init/Kconfig: make COMPILE=
_TEST depend on HAS_IOMEM
date:   3 months ago
config: s390-randconfig-r021-20210531 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project bc6799=
f2f79f0ae87e9f1ebf9d25ba799fbd25a9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dea29b20a828511de3348334e529a3d046a180416
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ea29b20a828511de3348334e529a3d046a180416
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
                     ^
   In file included from drivers/power/supply/cpcap-battery.c:30:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
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
   In file included from drivers/power/supply/cpcap-battery.c:30:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
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
   In file included from drivers/power/supply/cpcap-battery.c:30:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
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
   In file included from drivers/power/supply/cpcap-battery.c:30:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
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
   In file included from drivers/power/supply/cpcap-battery.c:30:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
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
>> drivers/power/supply/cpcap-battery.c:982:42: warning: unused variable 'c=
pcap_battery_default_data' [-Wunused-const-variable]
   static const struct cpcap_battery_config cpcap_battery_default_data =3D {
                                            ^
   21 warnings generated.
--
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
   In file included from drivers/net/ethernet/amd/xgbe/xgbe-platform.c:121:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
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
   In file included from drivers/net/ethernet/amd/xgbe/xgbe-platform.c:121:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
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
   In file included from drivers/net/ethernet/amd/xgbe/xgbe-platform.c:121:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
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
   In file included from drivers/net/ethernet/amd/xgbe/xgbe-platform.c:121:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
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
>> drivers/net/ethernet/amd/xgbe/xgbe-platform.c:575:39: warning: unused va=
riable 'xgbe_v1' [-Wunused-const-variable]
   static const struct xgbe_version_data xgbe_v1 =3D {
                                         ^
   21 warnings generated.
--
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
   In file included from drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:12:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
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
   In file included from drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:12:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
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
   In file included from drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:12:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
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
   In file included from drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:12:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
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
>> drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:683:41: warning: implici=
t conversion from 'unsigned long' to 'int' changes value from 1844674407370=
9551584 to -32 [-Wconstant-conversion]
           mvpp2_pools[MVPP2_BM_SHORT].pkt_size =3D MVPP2_BM_SHORT_PKT_SIZE;
                                                ~ ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2.h:948:33: note: expanded from m=
acro 'MVPP2_BM_SHORT_PKT_SIZE'
   #define MVPP2_BM_SHORT_PKT_SIZE MVPP2_RX_MAX_PKT_SIZE(MVPP2_BM_SHORT_FRA=
ME_SIZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2.h:844:37: note: expanded from m=
acro 'MVPP2_RX_MAX_PKT_SIZE'
           ((total_size) - MVPP2_SKB_HEADROOM - MVPP2_SKB_SHINFO_SIZE)
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   21 warnings generated.


vim +/cpcap_battery_default_data +982 drivers/power/supply/cpcap-battery.c

0cb90f071f736b5 Tony Lindgren 2019-10-09  971  =

874b2adbed1253a Tony Lindgren 2017-05-31  972  /*
874b2adbed1253a Tony Lindgren 2017-05-31  973   * Based on the values from =
Motorola mapphone Linux kernel. In the
874b2adbed1253a Tony Lindgren 2017-05-31  974   * the Motorola mapphone Lin=
ux kernel tree the value for pm_cd_factor
874b2adbed1253a Tony Lindgren 2017-05-31  975   * is passed to the kernel v=
ia device tree. If it turns out to be
874b2adbed1253a Tony Lindgren 2017-05-31  976   * something device specific=
 we can consider that too later.
874b2adbed1253a Tony Lindgren 2017-05-31  977   *
874b2adbed1253a Tony Lindgren 2017-05-31  978   * And looking at the batter=
y full and shutdown values for the stock
874b2adbed1253a Tony Lindgren 2017-05-31  979   * kernel on droid 4, full i=
s 4351000 and software initiates shutdown
874b2adbed1253a Tony Lindgren 2017-05-31  980   * at 3078000. The device wi=
ll die around 2743000.
874b2adbed1253a Tony Lindgren 2017-05-31  981   */
874b2adbed1253a Tony Lindgren 2017-05-31 @982  static const struct cpcap_ba=
ttery_config cpcap_battery_default_data =3D {
874b2adbed1253a Tony Lindgren 2017-05-31  983  	.cd_factor =3D 0x3cc,
874b2adbed1253a Tony Lindgren 2017-05-31  984  	.info.technology =3D POWER_=
SUPPLY_TECHNOLOGY_LION,
874b2adbed1253a Tony Lindgren 2017-05-31  985  	.info.voltage_max_design =
=3D 4351000,
874b2adbed1253a Tony Lindgren 2017-05-31  986  	.info.voltage_min_design =
=3D 3100000,
874b2adbed1253a Tony Lindgren 2017-05-31  987  	.info.charge_full_design =
=3D 1740000,
8b0134cc14b9d4d Tony Lindgren 2019-10-16  988  	.bat.constant_charge_voltag=
e_max_uv =3D 4200000,
874b2adbed1253a Tony Lindgren 2017-05-31  989  };
874b2adbed1253a Tony Lindgren 2017-05-31  990  =


:::::: The code at line 982 was first introduced by commit
:::::: 874b2adbed1253a11549cb9b7b912ab65fea9cf2 power: supply: cpcap-batter=
y: Add a battery driver

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Sebastian Reichel <sre@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4170776494897174599==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICDwFtGAAAy5jb25maWcAjDzZciO3ru/5ClXykvNwMl5mie+teaC62RKj3qbJlmS/sDQeeaJ7
vJUsJ5nz9RcgewHZbMmpVOIGwA0EQAAE9ctPv0zY6+HpYXPY3W7u739Mvm8ft/vNYfttcre73/7v
JC4meaEmPBbqNyBOd4+v/7x7ubw6m3z47fzit7N/728vJovt/nF7P4meHu9231+h+e7p8adffoqK
PBEzHUV6ySspilwrvlaff7693zx+n/y13b8A3eT88rez384mv37fHf7n3Tv478Nuv3/av7u//+tB
P++f/m97e5h8vf346erq7uLu09Xd2Wb7+6ft1d359uvd1beLD183iPoKf22u/vVzO+qsH/bzGZmK
kDpKWT77/KMD4mdHe355Bv+0uDTGBtMk7skB1NJeXH44u+jgBEEHnDOpmcz0rFAFGdRF6KJWZa2C
eJGnIucEVeRSVXWkikr2UFF90auiWvSQaS3SWImMa8WmKdeyqMgAal5xBqvLkwL+AyQSm8Ku/TKZ
GRm4n7xsD6/P/T6KXCjN86VmFaxWZEJ9vrzoJ5WVAgZRXJJB0iJiacuUn392ZqYlSxUBztmS6wWv
cp7q2Y0o+14oZgqYizAqvclYGLO+GWtRjCHehxF1jgutuJSciIQ7618mLthMebJ7mTw+HZCnAwKc
+DH8+uZ46+I4+v0xNF0QpWuoYp6wOlVm78leteB5IVXOMv75518fnx63vfbJFXNYIa/lUpRRcCZl
IcVaZ19qXvPAFFZMRXNtsEQHqkJKnfGsqK41U4pFczpcLXkqpoHOWA2GzNtaVkH/BgGzBHlNe7wH
NdoBijZ5ef368uPlsH3otWPGc16JyOhhNKfii5C4yJjIXZgUWYhIzwWvcE7XLjZhUvFC9GiYfR6n
nBqBdhKZFNhmFDGYjyxZJXnTpmMjXVPMp/Uske4Obh+/TZ7uPJb4YxoTtBzwtkVHYCQWfMlzJVsW
q90DHA4hLisRLXSRczkvyDbmhZ7foAnKipzOH4AljFHEIgrIgm0lgIVeT04XYjbXoB5mFVV4+YPp
tr2BXvGsVNCrsd+9xDfwZZHWuWLVdVgvLBXFGe5EZf1ObV7+MznAuJMNzOHlsDm8TDa3t0+vj4fd
4/eeX0tRKQ0NNIuiAsYS9OALIHXOlFgShkxlDBMpIjAQSKbGMXp5SdeIB4pUTMnw2qQIsvINa+s7
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
V9BqY91umaGvRddO3ZznjPoXN6UXyKFaAgA=
--===============4170776494897174599==--

