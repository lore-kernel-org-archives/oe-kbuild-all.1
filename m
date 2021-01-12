Content-Type: multipart/mixed; boundary="===============5573182125879622237=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [tobetter-linux:odroid-5.11.y 51/84] drivers/char/exynos-gpiomem.c:121:20: error: assigning to 'pgprot_t' from incompatible type 'int'
Date: Tue, 12 Jan 2021 14:50:15 +0800
Message-ID: <202101121410.yS4MHxSB-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5573182125879622237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/tobetter/linux odroid-5.11.y
head:   674407f50bbff11698a0f2cf5825d3e039e25b6c
commit: 0ef2ae8e0676a634333e64cf23e4ecab49efa1ca [51/84] ODROID-XU4: char: =
exynos: add /dev/gpiomem device for rootless user GPIO access
config: s390-randconfig-r015-20210111 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 32bcfc=
da4e28375e5a85268d2acfabcfcc011abf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/tobetter/linux/commit/0ef2ae8e0676a634333e64cf=
23e4ecab49efa1ca
        git remote add tobetter-linux https://github.com/tobetter/linux
        git fetch --no-tags tobetter-linux odroid-5.11.y
        git checkout 0ef2ae8e0676a634333e64cf23e4ecab49efa1ca
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
                     ^
   In file included from drivers/char/exynos-gpiomem.c:55:
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
   In file included from drivers/char/exynos-gpiomem.c:55:
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
   In file included from drivers/char/exynos-gpiomem.c:55:
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
   In file included from drivers/char/exynos-gpiomem.c:55:
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
   In file included from drivers/char/exynos-gpiomem.c:55:
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
   drivers/char/exynos-gpiomem.c:121:22: error: implicit declaration of fun=
ction 'phys_mem_access_prot' [-Werror,-Wimplicit-function-declaration]
           vma->vm_page_prot =3D phys_mem_access_prot(file, vma->vm_pgoff,
                               ^
>> drivers/char/exynos-gpiomem.c:121:20: error: assigning to 'pgprot_t' fro=
m incompatible type 'int'
           vma->vm_page_prot =3D phys_mem_access_prot(file, vma->vm_pgoff,
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   20 warnings and 2 errors generated.


vim +121 drivers/char/exynos-gpiomem.c

   106	=

   107	static int exynos_gpiomem_mmap(struct file *file, struct vm_area_str=
uct *vma)
   108	{
   109		int gpio_area =3D 0;
   110	=

   111		while (gpio_area < inst->gpio_area_count) {
   112			if ((inst->gpio_regs_phys[gpio_area] >> PAGE_SHIFT) =3D=3D vma->vm=
_pgoff)
   113				goto found;
   114	=

   115			gpio_area++;
   116		}
   117	=

   118		return -EACCES;
   119	=

   120	found:
 > 121		vma->vm_page_prot =3D phys_mem_access_prot(file, vma->vm_pgoff,
   122				PAGE_SIZE,
   123				vma->vm_page_prot);
   124	=

   125		vma->vm_ops =3D &exynos_gpiomem_vm_ops;
   126	=

   127		if (remap_pfn_range(vma, vma->vm_start,
   128					vma->vm_pgoff,
   129					PAGE_SIZE,
   130					vma->vm_page_prot)) {
   131			return -EAGAIN;
   132		}
   133	=

   134		return 0;
   135	}
   136	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5573182125879622237==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5573182125879622237==--

