Content-Type: multipart/mixed; boundary="===============0367494374880490670=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [char-misc:char-misc-testing 33/62] drivers/misc/bcm-vk/bcm_vk_msg.c:56:35: warning: operator has lower precedence than '|'; '|' will be evaluated first
Date: Thu, 28 Jan 2021 13:42:55 +0800
Message-ID: <202101281343.HHBfhVkw-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0367494374880490670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t char-misc-testing
head:   296c6264d4b19554dc8367e3f409bd248f504c2d
commit: 111d746bb4767ad476f80fe49067e3df3d9a9375 [33/62] misc: bcm-vk: add =
VK messaging support
config: s390-randconfig-r035-20210128 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 48bdd6=
76a1d1338c10541460bf5beb69ac17e451)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.=
git/commit/?id=3D111d746bb4767ad476f80fe49067e3df3d9a9375
        git remote add char-misc https://git.kernel.org/pub/scm/linux/kerne=
l/git/gregkh/char-misc.git
        git fetch --no-tags char-misc char-misc-testing
        git checkout 111d746bb4767ad476f80fe49067e3df3d9a9375
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
   In file included from drivers/misc/bcm-vk/bcm_vk_msg.c:17:
   In file included from drivers/misc/bcm-vk/bcm_vk.h:14:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/misc/bcm-vk/bcm_vk_msg.c:17:
   In file included from drivers/misc/bcm-vk/bcm_vk.h:14:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/misc/bcm-vk/bcm_vk_msg.c:17:
   In file included from drivers/misc/bcm-vk/bcm_vk.h:14:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/misc/bcm-vk/bcm_vk_msg.c:17:
   In file included from drivers/misc/bcm-vk/bcm_vk.h:14:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/misc/bcm-vk/bcm_vk_msg.c:17:
   In file included from drivers/misc/bcm-vk/bcm_vk.h:14:
   In file included from include/linux/pci.h:39:
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
>> drivers/misc/bcm-vk/bcm_vk_msg.c:56:35: warning: operator '?:' has lower=
 precedence than '|'; '|' will be evaluated first [-Wbitwise-conditional-pa=
rentheses]
                   (q_num >=3D VK_MSGQ_PER_CHAN_MAX) ? VK_MSGQ_NUM_DEFAULT =
: q_num;
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/misc/bcm-vk/bcm_vk_msg.c:56:35: note: place parentheses around t=
he '|' expression to silence this warning
                   (q_num >=3D VK_MSGQ_PER_CHAN_MAX) ? VK_MSGQ_NUM_DEFAULT =
: q_num;
                                                   ^
                                                  )
   drivers/misc/bcm-vk/bcm_vk_msg.c:56:35: note: place parentheses around t=
he '?:' expression to evaluate it first
                   (q_num >=3D VK_MSGQ_PER_CHAN_MAX) ? VK_MSGQ_NUM_DEFAULT =
: q_num;
                                                   ^
                   (                                                       =
     )
   21 warnings generated.


vim +56 drivers/misc/bcm-vk/bcm_vk_msg.c

    52	=

    53	static void set_q_num(struct vk_msg_blk *msg, u32 q_num)
    54	{
    55		msg->trans_id =3D (msg->trans_id & ~BCM_VK_MSG_Q_MASK) |
  > 56			(q_num >=3D VK_MSGQ_PER_CHAN_MAX) ? VK_MSGQ_NUM_DEFAULT : q_num;
    57	}
    58	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0367494374880490670==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0367494374880490670==--

