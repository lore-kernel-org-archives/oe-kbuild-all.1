Content-Type: multipart/mixed; boundary="===============4214597435622527108=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 11/14] s390/mm: Add gmap shadowing for large pmds
Date: Wed, 20 Jan 2021 06:18:36 +0800
Message-ID: <202101200637.8dGR1M4Y-lkp@intel.com>
In-Reply-To: <20210113094113.133668-12-frankja@linux.ibm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4214597435622527108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Janosch,

I love your patch! Perhaps something to improve:

[auto build test WARNING on kvms390/next]
[also build test WARNING on s390/features kvm/linux-next v5.11-rc4 next-202=
10119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Janosch-Frank/KVM-s390-Add=
-huge-page-VSIE-support/20210113-174708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git n=
ext
config: s390-randconfig-r003-20210120 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 22b684=
40e1647e16b5ee24b924986207173c02d1)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/b3a8ab3492fef4fa7bf29a812=
61fd1f593cd50d0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Janosch-Frank/KVM-s390-Add-huge-pa=
ge-VSIE-support/20210113-174708
        git checkout b3a8ab3492fef4fa7bf29a81261fd1f593cd50d0
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
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from arch/s390/mm/gmap.c:13:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
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
   In file included from arch/s390/mm/gmap.c:13:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
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
   In file included from arch/s390/mm/gmap.c:13:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
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
   In file included from arch/s390/mm/gmap.c:13:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
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
>> arch/s390/mm/gmap.c:2183:6: warning: no previous prototype for function =
'gmap_shadow_pgt_lookup' [-Wmissing-prototypes]
   void gmap_shadow_pgt_lookup(struct gmap *sg, unsigned long *sge,
        ^
   arch/s390/mm/gmap.c:2183:1: note: declare 'static' if the function is no=
t intended to be used outside of this translation unit
   void gmap_shadow_pgt_lookup(struct gmap *sg, unsigned long *sge,
   ^
   static =

   21 warnings generated.


vim +/gmap_shadow_pgt_lookup +2183 arch/s390/mm/gmap.c

  2169	=

  2170	/**
  2171	 * gmap_shadow_lookup_pgtable - find a shadow page table
  2172	 * @sg: pointer to the shadow guest address space structure
  2173	 * @saddr: the address in the shadow guest address space
  2174	 * @pgt: parent gmap address of the page table to get shadowed
  2175	 * @dat_protection: if the pgtable is marked as protected by dat
  2176	 * @fake: pgt references contiguous guest memory block, not a pgtable
  2177	 *
  2178	 * Returns 0 if the shadow page table was found and -EAGAIN if the p=
age
  2179	 * table was not found.
  2180	 *
  2181	 * Called with sg->mm->mmap_lock in read.
  2182	 */
> 2183	void gmap_shadow_pgt_lookup(struct gmap *sg, unsigned long *sge,
  2184				    unsigned long saddr, unsigned long *pgt,
  2185				    int *dat_protection, int *fake)
  2186	{
  2187		struct page *page;
  2188	=

  2189		/* Shadow page tables are full pages (pte+pgste) */
  2190		page =3D pfn_to_page(*sge >> PAGE_SHIFT);
  2191		*pgt =3D page->index & ~GMAP_SHADOW_FAKE_TABLE;
  2192		*dat_protection =3D !!(*sge & _SEGMENT_ENTRY_PROTECT);
  2193		*fake =3D !!(page->index & GMAP_SHADOW_FAKE_TABLE);
  2194	}
  2195	EXPORT_SYMBOL_GPL(gmap_shadow_pgt_lookup);
  2196	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4214597435622527108==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
rdgs1UYvI8wl2T/ydFUSFdYAAA==
--===============4214597435622527108==--

