Content-Type: multipart/mixed; boundary="===============4042783711639145333=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [intel-tdx:guest 40/44] drivers/virtio/virtio_ring.c:258:6: error: implicit declaration of function 'is_tdx_guest'
Date: Tue, 13 Oct 2020 10:55:58 +0800
Message-ID: <202010131057.T3gB53jf-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4042783711639145333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel/tdx.git guest
head:   422a2465ebe67c0db36e855df7f9d7018f878c28
commit: 0cb8b5708223bba7e3ccd67754376d91305a1085 [40/44] x86/tdx: Make Virt=
IO use DMA API in TDX guest
config: s390-randconfig-r032-20201012 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project a324d8=
f964bf421fa7d8b882b0f64ead28c4149c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel/tdx/commit/0cb8b5708223bba7e3ccd67754376=
d91305a1085
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest
        git checkout 0cb8b5708223bba7e3ccd67754376d91305a1085
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
                     ^
   In file included from drivers/virtio/virtio_ring.c:6:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/virtio/virtio_ring.c:6:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/virtio/virtio_ring.c:6:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/virtio/virtio_ring.c:6:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/virtio/virtio_ring.c:6:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
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
>> drivers/virtio/virtio_ring.c:258:6: error: implicit declaration of funct=
ion 'is_tdx_guest' [-Werror,-Wimplicit-function-declaration]
           if (is_tdx_guest())
               ^
   20 warnings and 1 error generated.

vim +/is_tdx_guest +258 drivers/virtio/virtio_ring.c

   214	=

   215	/*
   216	 * Modern virtio devices have feature bits to specify whether they n=
eed a
   217	 * quirk and bypass the IOMMU. If not there, just use the DMA API.
   218	 *
   219	 * If there, the interaction between virtio and DMA API is messy.
   220	 *
   221	 * On most systems with virtio, physical addresses match bus address=
es,
   222	 * and it doesn't particularly matter whether we use the DMA API.
   223	 *
   224	 * On some systems, including Xen and any system with a physical dev=
ice
   225	 * that speaks virtio behind a physical IOMMU, we must use the DMA A=
PI
   226	 * for virtio DMA to work at all.
   227	 *
   228	 * On other systems, including SPARC and PPC64, virtio-pci devices a=
re
   229	 * enumerated as though they are behind an IOMMU, but the virtio host
   230	 * ignores the IOMMU, so we must either pretend that the IOMMU isn't
   231	 * there or somehow map everything as the identity.
   232	 *
   233	 * For the time being, we preserve historic behavior and bypass the =
DMA
   234	 * API.
   235	 *
   236	 * TODO: install a per-device DMA ops structure that does the right =
thing
   237	 * taking into account all the above quirks, and use the DMA API
   238	 * unconditionally on data path.
   239	 */
   240	=

   241	static bool vring_use_dma_api(struct virtio_device *vdev)
   242	{
   243		if (!virtio_has_dma_quirk(vdev))
   244			return true;
   245	=

   246		/* Otherwise, we are left to guess. */
   247		/*
   248		 * In theory, it's possible to have a buggy QEMU-supposed
   249		 * emulated Q35 IOMMU and Xen enabled at the same time.  On
   250		 * such a configuration, virtio has never worked and will
   251		 * not work without an even larger kludge.  Instead, enable
   252		 * the DMA API if we're a Xen guest, which at least allows
   253		 * all of the sensible Xen configurations to work correctly.
   254		 */
   255		if (xen_domain())
   256			return true;
   257	=

 > 258		if (is_tdx_guest())
   259			return true;
   260	=

   261		return false;
   262	}
   263	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4042783711639145333==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4042783711639145333==--

