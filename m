Content-Type: multipart/mixed; boundary="===============2372261152412794661=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [nvdimm:libnvdimm-pending 297/299] arch/powerpc/include/asm/uaccess.h:331:1: error: conflicting types for 'copy_mc_to_kernel'
Date: Fri, 15 May 2020 11:53:58 +0800
Message-ID: <202005151156.zc1TUCma%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2372261152412794661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djbw/nvdimm.git lib=
nvdimm-pending
head:   bb12557751a16ec04d801b01492257f720e4718e
commit: b00239d425d5c3c3d20f62bb1180905c0d133ab3 [297/299] x86, powerpc: Re=
name memcpy_mcsafe() to copy_mc_to_{user,kernel}()
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout b00239d425d5c3c3d20f62bb1180905c0d133ab3
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

In file included from include/linux/uaccess.h:11,
from include/linux/crypto.h:21,
from include/crypto/hash.h:11,
from include/linux/uio.h:10,
from include/linux/socket.h:8,
from include/linux/compat.h:15,
from arch/powerpc/kernel/asm-offsets.c:14:
>> arch/powerpc/include/asm/uaccess.h:331:1: error: conflicting types for '=
copy_mc_to_kernel'
331 | copy_mc_to_kernel(void *to, const void *from, unsigned long size)
| ^~~~~~~~~~~~~~~~~
In file included from include/linux/bitmap.h:9,
from include/linux/cpumask.h:12,
from include/linux/workqueue.h:15,
from include/linux/rhashtable-types.h:15,
from include/linux/ipc.h:7,
from include/uapi/linux/sem.h:5,
from include/linux/sem.h:5,
from include/linux/compat.h:14,
from arch/powerpc/kernel/asm-offsets.c:14:
include/linux/string.h:176:15: note: previous definition of 'copy_mc_to_ker=
nel' was here
176 | unsigned long copy_mc_to_kernel(void *dst, const void *src, size_t cn=
t)
|               ^~~~~~~~~~~~~~~~~
In file included from include/linux/uaccess.h:11,
from include/linux/crypto.h:21,
from include/crypto/hash.h:11,
from include/linux/uio.h:10,
from include/linux/socket.h:8,
from include/linux/compat.h:15,
from arch/powerpc/kernel/asm-offsets.c:14:
arch/powerpc/include/asm/uaccess.h: In function 'copy_mc_to_kernel':
arch/powerpc/include/asm/uaccess.h:333:9: error: implicit declaration of fu=
nction 'copy_mc_generic' [-Werror=3Dimplicit-function-declaration]
333 |  return copy_mc_generic(to, from, size);
|         ^~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [scripts/Makefile.build:100: arch/powerpc/kernel/asm-offsets.s=
] Error 1
make[2]: Target '__build' not remade because of errors.
make[1]: *** [Makefile:1142: prepare0] Error 2
make[1]: Target 'prepare' not remade because of errors.
make: *** [Makefile:180: sub-make] Error 2

vim +/copy_mc_to_kernel +331 arch/powerpc/include/asm/uaccess.h

   326	=

   327	extern unsigned long __copy_tofrom_user(void __user *to,
   328			const void __user *from, unsigned long size);
   329	=

   330	static inline unsigned long
 > 331	copy_mc_to_kernel(void *to, const void *from, unsigned long size)
   332	{
   333		return copy_mc_generic(to, from, size);
   334	}
   335	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2372261152412794661==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2372261152412794661==--

