Content-Type: multipart/mixed; boundary="===============4981776007924014818=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/spi/spi-s3c64xx.c:1461:34: warning: unused variable 's3c64xx_spi_dt_match'
Date: Mon, 31 May 2021 15:48:12 +0800
Message-ID: <202105311505.Fqv06bZZ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4981776007924014818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8124c8a6b35386f73523d27eacb71b5364a68c4c
commit: ea29b20a828511de3348334e529a3d046a180416 init/Kconfig: make COMPILE=
_TEST depend on HAS_IOMEM
date:   3 months ago
config: s390-randconfig-r014-20210531 (attached as .config)
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

   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
                     ^
   In file included from drivers/spi/spi-s3c64xx.c:11:
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
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from drivers/spi/spi-s3c64xx.c:11:
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
   In file included from drivers/spi/spi-s3c64xx.c:11:
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
   In file included from drivers/spi/spi-s3c64xx.c:11:
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
   In file included from drivers/spi/spi-s3c64xx.c:11:
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
>> drivers/spi/spi-s3c64xx.c:1461:34: warning: unused variable 's3c64xx_spi=
_dt_match' [-Wunused-const-variable]
   static const struct of_device_id s3c64xx_spi_dt_match[] =3D {
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
   In file included from drivers/gpu/drm/rockchip/rockchip_vop_reg.c:19:
   In file included from drivers/gpu/drm/rockchip/rockchip_drm_drv.h:12:
   In file included from include/drm/drm_fb_helper.h:35:
   In file included from include/drm/drm_client.h:6:
   In file included from include/linux/dma-buf-map.h:9:
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
   In file included from drivers/gpu/drm/rockchip/rockchip_vop_reg.c:19:
   In file included from drivers/gpu/drm/rockchip/rockchip_drm_drv.h:12:
   In file included from include/drm/drm_fb_helper.h:35:
   In file included from include/drm/drm_client.h:6:
   In file included from include/linux/dma-buf-map.h:9:
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
   In file included from drivers/gpu/drm/rockchip/rockchip_vop_reg.c:19:
   In file included from drivers/gpu/drm/rockchip/rockchip_drm_drv.h:12:
   In file included from include/drm/drm_fb_helper.h:35:
   In file included from include/drm/drm_client.h:6:
   In file included from include/linux/dma-buf-map.h:9:
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
   In file included from drivers/gpu/drm/rockchip/rockchip_vop_reg.c:19:
   In file included from drivers/gpu/drm/rockchip/rockchip_drm_drv.h:12:
   In file included from include/drm/drm_fb_helper.h:35:
   In file included from include/drm/drm_client.h:6:
   In file included from include/linux/dma-buf-map.h:9:
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
>> drivers/gpu/drm/rockchip/rockchip_vop_reg.c:1038:34: warning: unused var=
iable 'vop_driver_dt_match' [-Wunused-const-variable]
   static const struct of_device_id vop_driver_dt_match[] =3D {
                                    ^
   21 warnings generated.
--
   include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
                     ^
   In file included from drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:15:
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
   In file included from drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:15:
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
   In file included from drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:15:
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
   In file included from drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:15:
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
   In file included from drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:15:
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
>> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:457:34: warning: unused =
variable 'rockchip_dp_dt_ids' [-Wunused-const-variable]
   static const struct of_device_id rockchip_dp_dt_ids[] =3D {
                                    ^
   21 warnings generated.
..


vim +/s3c64xx_spi_dt_match +1461 drivers/spi/spi-s3c64xx.c

a5238e360b715e Thomas Abraham   2012-07-13  1460  =

2b90807549e5d1 Thomas Abraham   2012-07-13 @1461  static const struct of_de=
vice_id s3c64xx_spi_dt_match[] =3D {
a3b924df8fa908 Mateusz Krawczuk 2013-09-23  1462  	{ .compatible =3D "samsu=
ng,s3c2443-spi",
a3b924df8fa908 Mateusz Krawczuk 2013-09-23  1463  			.data =3D (void *)&s3c=
2443_spi_port_config,
a3b924df8fa908 Mateusz Krawczuk 2013-09-23  1464  	},
a3b924df8fa908 Mateusz Krawczuk 2013-09-23  1465  	{ .compatible =3D "samsu=
ng,s3c6410-spi",
a3b924df8fa908 Mateusz Krawczuk 2013-09-23  1466  			.data =3D (void *)&s3c=
6410_spi_port_config,
a3b924df8fa908 Mateusz Krawczuk 2013-09-23  1467  	},
a3b924df8fa908 Mateusz Krawczuk 2013-09-23  1468  	{ .compatible =3D "samsu=
ng,s5pv210-spi",
a3b924df8fa908 Mateusz Krawczuk 2013-09-23  1469  			.data =3D (void *)&s5p=
v210_spi_port_config,
a3b924df8fa908 Mateusz Krawczuk 2013-09-23  1470  	},
2b90807549e5d1 Thomas Abraham   2012-07-13  1471  	{ .compatible =3D "samsu=
ng,exynos4210-spi",
2b90807549e5d1 Thomas Abraham   2012-07-13  1472  			.data =3D (void *)&exy=
nos4_spi_port_config,
2b90807549e5d1 Thomas Abraham   2012-07-13  1473  	},
bf77cba95f8c06 Padmavathi Venna 2014-11-06  1474  	{ .compatible =3D "samsu=
ng,exynos7-spi",
bf77cba95f8c06 Padmavathi Venna 2014-11-06  1475  			.data =3D (void *)&exy=
nos7_spi_port_config,
bf77cba95f8c06 Padmavathi Venna 2014-11-06  1476  	},
7990b00819e765 Andi Shyti       2016-07-12  1477  	{ .compatible =3D "samsu=
ng,exynos5433-spi",
7990b00819e765 Andi Shyti       2016-07-12  1478  			.data =3D (void *)&exy=
nos5433_spi_port_config,
7990b00819e765 Andi Shyti       2016-07-12  1479  	},
2b90807549e5d1 Thomas Abraham   2012-07-13  1480  	{ },
2b90807549e5d1 Thomas Abraham   2012-07-13  1481  };
2b90807549e5d1 Thomas Abraham   2012-07-13  1482  MODULE_DEVICE_TABLE(of, s=
3c64xx_spi_dt_match);
2b90807549e5d1 Thomas Abraham   2012-07-13  1483  =


:::::: The code at line 1461 was first introduced by commit
:::::: 2b90807549e5d1f700e523ddd098651ecfc18e65 spi: s3c64xx: add device tr=
ee support

:::::: TO: Thomas Abraham <thomas.abraham@linaro.org>
:::::: CC: Kukjin Kim <kgene.kim@samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4981776007924014818==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
k+3QY2ibTGw3rAre522TO/Iv/QXsbEK88aQBAA==
--===============4981776007924014818==--

