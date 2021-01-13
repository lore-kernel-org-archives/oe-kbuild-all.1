Content-Type: multipart/mixed; boundary="===============8919858959253490729=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: fs/f2fs/gc.c:622:12: warning: stack frame size of 3056 bytes in function 'get_victim_by_default'
Date: Wed, 13 Jan 2021 14:03:10 +0800
Message-ID: <57b6a9a7-f69b-67b9-681c-5f236878fbf6@intel.com>
In-Reply-To: <c59ab262-4b64-794c-3dd9-fa571848562a@huawei.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8919858959253490729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/11/21 4:23 PM, Chao Yu wrote:
> Hello,
>
> Thanks for the report.
>
> I replied for your previous report [1], could you please check that?
>
> [1] =

> https://lore.kernel.org/lkml/8a8ef6b8-84c2-abfe-e758-2fa52a989c72(a)huawe=
i.com/
>
> That says, in my environment, get_victim_by_default()'s frame size is =

> less than
> 512 bytes, and also after going through related code, I don't see any =

> obvious
> large stack size usage.
>
> Is that issue a powerpc specified issue?

Hi Chao,

The issue can be found on arch mips too:

fs/f2fs/gc.c:622:12: warning: stack frame size of 1672 bytes in function 'g=
et_victim_by_default' [-Wframe-larger-than=3D]

    static int get_victim_by_default(struct f2fs_sb_info *sbi,
               ^
    1 warning generated.



>
> Could you help to verify powerpc compiling with =

> -Wframe-larger-than=3D512 after
> reverting that atgc patch? I mean whether get_victim_by_default() =

> already have
> large frame size before applying atgc patch (commit 093749e296e2)?

After reverting commit 093749e29 and set -Wframe-larger-than=3D512, the =

warning is

fs/f2fs/gc.c:325:12: warning: stack frame size of 912 bytes in function =

'get_victim_by_default' [-Wframe-larger-than=3D]
static int get_victim_by_default(struct f2fs_sb_info *sbi,

Best Regards,
Rong Chen

>
> On 2021/1/9 21:18, kernel test robot wrote:
>> Hi Chao,
>>
>> FYI, the error/warning still remains.
>>
>> tree: =

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =

>> master
>> head:=C2=A0=C2=A0 996e435fd401de35df62ac943ab9402cfe85c430
>> commit: 093749e296e29a4b0162eb925a6701a01e8c9a98 f2fs: support age =

>> threshold based garbage collection
>> date:=C2=A0=C2=A0 4 months ago
>> config: powerpc-randconfig-r033-20210109 (attached as .config)
>> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project =

>> bc556e5685c0f97e79fb7b3c6f15cc5062db8e36)
>> reproduce (this is a W=3D1 build):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wget =

>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross =

>> -O ~/bin/make.cross
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chmod +x ~/bin/make.cro=
ss
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # install powerpc cross=
 compiling tool for clang build
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # apt-get install binut=
ils-powerpc-linux-gnu
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D093749e296e29a4b0162eb925a6701a01e8c9a98
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git remote add linus =

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git fetch --no-tags lin=
us master
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout 093749e296=
e29a4b0162eb925a6701a01e8c9a98
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the attached .co=
nfig to linux build tree
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER_INSTALL_PATH=
=3D$HOME/0day COMPILER=3Dclang make.cross =

>> ARCH=3Dpowerpc
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io-defs.h:45:1: warning: per=
forming =

>> pointer arithmetic on a null pointer has undefined behavior =

>> [-Wnull-pointer-arithmetic]
>> =C2=A0=C2=A0=C2=A0 DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, uns=
igned long c),
>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io.h:601:3: note: expanded f=
rom macro =

>> 'DEF_PCI_AC_NORET'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __do_##name al;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~
>> =C2=A0=C2=A0=C2=A0 <scratch space>:182:1: note: expanded from here
>> =C2=A0=C2=A0=C2=A0 __do_insw
>> =C2=A0=C2=A0=C2=A0 ^
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io.h:542:56: note: expanded =
from macro =

>> '__do_insw'
>> =C2=A0=C2=A0=C2=A0 #define __do_insw(p, b, n) readsw((PCI_IO_ADDR)_IO_BA=
SE+(p), (b), =

>> (n))
>> ~~~~~~~~~~~~~~~~~~~~~^
>> =C2=A0=C2=A0=C2=A0 In file included from fs/f2fs/gc.c:10:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/backing-dev.h:15:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/blkdev.h:13:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/pagemap.h:11:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/highmem.h:10:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/hardirq.h:10:
>> =C2=A0=C2=A0=C2=A0 In file included from arch/powerpc/include/asm/hardir=
q.h:6:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/irq.h:20:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/io.h:13:
>> =C2=A0=C2=A0=C2=A0 In file included from arch/powerpc/include/asm/io.h:6=
04:
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io-defs.h:47:1: warning: per=
forming =

>> pointer arithmetic on a null pointer has undefined behavior =

>> [-Wnull-pointer-arithmetic]
>> =C2=A0=C2=A0=C2=A0 DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, uns=
igned long c),
>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io.h:601:3: note: expanded f=
rom macro =

>> 'DEF_PCI_AC_NORET'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __do_##name al;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~
>> =C2=A0=C2=A0=C2=A0 <scratch space>:184:1: note: expanded from here
>> =C2=A0=C2=A0=C2=A0 __do_insl
>> =C2=A0=C2=A0=C2=A0 ^
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io.h:543:56: note: expanded =
from macro =

>> '__do_insl'
>> =C2=A0=C2=A0=C2=A0 #define __do_insl(p, b, n) readsl((PCI_IO_ADDR)_IO_BA=
SE+(p), (b), =

>> (n))
>> ~~~~~~~~~~~~~~~~~~~~~^
>> =C2=A0=C2=A0=C2=A0 In file included from fs/f2fs/gc.c:10:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/backing-dev.h:15:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/blkdev.h:13:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/pagemap.h:11:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/highmem.h:10:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/hardirq.h:10:
>> =C2=A0=C2=A0=C2=A0 In file included from arch/powerpc/include/asm/hardir=
q.h:6:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/irq.h:20:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/io.h:13:
>> =C2=A0=C2=A0=C2=A0 In file included from arch/powerpc/include/asm/io.h:6=
04:
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io-defs.h:49:1: warning: per=
forming =

>> pointer arithmetic on a null pointer has undefined behavior =

>> [-Wnull-pointer-arithmetic]
>> =C2=A0=C2=A0=C2=A0 DEF_PCI_AC_NORET(outsb, (unsigned long p, const void =
*b, unsigned =

>> long c),
>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io.h:601:3: note: expanded f=
rom macro =

>> 'DEF_PCI_AC_NORET'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __do_##name al;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~
>> =C2=A0=C2=A0=C2=A0 <scratch space>:186:1: note: expanded from here
>> =C2=A0=C2=A0=C2=A0 __do_outsb
>> =C2=A0=C2=A0=C2=A0 ^
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io.h:544:58: note: expanded =
from macro =

>> '__do_outsb'
>> =C2=A0=C2=A0=C2=A0 #define __do_outsb(p, b, n) =

>> writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
>> ~~~~~~~~~~~~~~~~~~~~~^
>> =C2=A0=C2=A0=C2=A0 In file included from fs/f2fs/gc.c:10:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/backing-dev.h:15:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/blkdev.h:13:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/pagemap.h:11:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/highmem.h:10:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/hardirq.h:10:
>> =C2=A0=C2=A0=C2=A0 In file included from arch/powerpc/include/asm/hardir=
q.h:6:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/irq.h:20:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/io.h:13:
>> =C2=A0=C2=A0=C2=A0 In file included from arch/powerpc/include/asm/io.h:6=
04:
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io-defs.h:51:1: warning: per=
forming =

>> pointer arithmetic on a null pointer has undefined behavior =

>> [-Wnull-pointer-arithmetic]
>> =C2=A0=C2=A0=C2=A0 DEF_PCI_AC_NORET(outsw, (unsigned long p, const void =
*b, unsigned =

>> long c),
>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io.h:601:3: note: expanded f=
rom macro =

>> 'DEF_PCI_AC_NORET'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __do_##name al;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~
>> =C2=A0=C2=A0=C2=A0 <scratch space>:188:1: note: expanded from here
>> =C2=A0=C2=A0=C2=A0 __do_outsw
>> =C2=A0=C2=A0=C2=A0 ^
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io.h:545:58: note: expanded =
from macro =

>> '__do_outsw'
>> =C2=A0=C2=A0=C2=A0 #define __do_outsw(p, b, n) =

>> writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
>> ~~~~~~~~~~~~~~~~~~~~~^
>> =C2=A0=C2=A0=C2=A0 In file included from fs/f2fs/gc.c:10:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/backing-dev.h:15:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/blkdev.h:13:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/pagemap.h:11:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/highmem.h:10:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/hardirq.h:10:
>> =C2=A0=C2=A0=C2=A0 In file included from arch/powerpc/include/asm/hardir=
q.h:6:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/irq.h:20:
>> =C2=A0=C2=A0=C2=A0 In file included from include/linux/io.h:13:
>> =C2=A0=C2=A0=C2=A0 In file included from arch/powerpc/include/asm/io.h:6=
04:
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io-defs.h:53:1: warning: per=
forming =

>> pointer arithmetic on a null pointer has undefined behavior =

>> [-Wnull-pointer-arithmetic]
>> =C2=A0=C2=A0=C2=A0 DEF_PCI_AC_NORET(outsl, (unsigned long p, const void =
*b, unsigned =

>> long c),
>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io.h:601:3: note: expanded f=
rom macro =

>> 'DEF_PCI_AC_NORET'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __do_##name al;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~
>> =C2=A0=C2=A0=C2=A0 <scratch space>:190:1: note: expanded from here
>> =C2=A0=C2=A0=C2=A0 __do_outsl
>> =C2=A0=C2=A0=C2=A0 ^
>> =C2=A0=C2=A0=C2=A0 arch/powerpc/include/asm/io.h:546:58: note: expanded =
from macro =

>> '__do_outsl'
>> =C2=A0=C2=A0=C2=A0 #define __do_outsl(p, b, n) =

>> writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
>> ~~~~~~~~~~~~~~~~~~~~~^
>>>> fs/f2fs/gc.c:622:12: warning: stack frame size of 3056 bytes in =

>>>> function 'get_victim_by_default' [-Wframe-larger-than=3D]
>> =C2=A0=C2=A0=C2=A0 static int get_victim_by_default(struct f2fs_sb_info =
*sbi,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^
>> =C2=A0=C2=A0=C2=A0 13 warnings generated.
>>
>>
>> vim +/get_victim_by_default +622 fs/f2fs/gc.c
>>
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 613
>> 0a8165d7c2cf139 Jaegeuk Kim=C2=A0=C2=A0 2012-11-29=C2=A0 614=C2=A0 /*
>> 111d2495a8a8fbd Masanari Iida 2013-03-19=C2=A0 615=C2=A0=C2=A0 * This fu=
nction is =

>> called from two paths.
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 616=C2=A0=C2=A0=
 * One is garbage =

>> collection and the other is SSR segment selection.
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 617=C2=A0=C2=A0=
 * When it is called =

>> during GC, it just gets a victim segment
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 618=C2=A0=C2=A0=
 * and it does not =

>> remove it from dirty seglist.
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 619=C2=A0=C2=A0=
 * When it is called =

>> from SSR segment selection, it finds a segment
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 620=C2=A0=C2=A0=
 * which has minimum =

>> valid blocks and removes it from dirty seglist.
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 621=C2=A0=C2=A0=
 */
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02 @622=C2=A0 static int =

>> get_victim_by_default(struct f2fs_sb_info *sbi,
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 623 unsigned int *result, =

>> int gc_type, int type,
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 624=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 char =

>> alloc_mode, unsigned long long age)
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 625=C2=A0 {
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 626=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct =

>> dirty_seglist_info *dirty_i =3D DIRTY_I(sbi);
>> e066b83c9b40f3a Jaegeuk Kim=C2=A0=C2=A0 2017-04-13=C2=A0 627=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct sit_info =

>> *sm =3D SIT_I(sbi);
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 628=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct =

>> victim_sel_policy p;
>> 3fa565039e3338f Sheng Yong=C2=A0=C2=A0=C2=A0 2016-09-29=C2=A0 629=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int =

>> secno, last_victim;
>> 04f0b2eaa3b3ee2 Qiuyang Sun=C2=A0=C2=A0 2019-06-05=C2=A0 630=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned int =

>> last_segment;
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 631=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int =

>> nsearched;
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 632=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool is_atgc;
>> 97767500781fae9 Qilong Zhang=C2=A0 2020-06-28=C2=A0 633=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 int ret =3D 0;
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 634
>> 210f41bc048263d Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2014-09-15=
=C2=A0 635 =

>> mutex_lock(&dirty_i->seglist_lock);
>> 04f0b2eaa3b3ee2 Qiuyang Sun=C2=A0=C2=A0 2019-06-05=C2=A0 636=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 last_segment =3D =

>> MAIN_SECS(sbi) * sbi->segs_per_sec;
>> 210f41bc048263d Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2014-09-15=
=C2=A0 637
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 638=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 p.alloc_mode =3D =

>> alloc_mode;
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 639=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p.age =3D age;
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 640 p.age_threshold =3D =

>> sbi->am.age_threshold;
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 641
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 642=C2=A0 retry:
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 643 select_policy(sbi, =

>> gc_type, type, &p);
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 644=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 p.min_segno =3D =

>> NULL_SEGNO;
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 645=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p.oldest_age =3D 0;
>> 3fa565039e3338f Sheng Yong=C2=A0=C2=A0=C2=A0 2016-09-29=C2=A0 646=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 p.min_cost =3D =

>> get_max_cost(sbi, &p);
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 647
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 648=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is_atgc =3D =

>> (p.gc_mode =3D=3D GC_AT || p.alloc_mode =3D=3D AT_SSR);
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 649=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nsearched =3D 0;
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 650
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 651=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (is_atgc)
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 652 =

>> SIT_I(sbi)->dirty_min_mtime =3D ULLONG_MAX;
>> 093749e296e29a4 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-08-04=
=C2=A0 653
>> e066b83c9b40f3a Jaegeuk Kim=C2=A0=C2=A0 2017-04-13=C2=A0 654=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (*result !=3D =

>> NULL_SEGNO) {
>> 97767500781fae9 Qilong Zhang=C2=A0 2020-06-28=C2=A0 655=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =

>> (!get_valid_blocks(sbi, *result, false)) {
>> 97767500781fae9 Qilong Zhang=C2=A0 2020-06-28=C2=A0 656=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D =

>> -ENODATA;
>> 97767500781fae9 Qilong Zhang=C2=A0 2020-06-28=C2=A0 657=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> 97767500781fae9 Qilong Zhang=C2=A0 2020-06-28=C2=A0 658=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> 97767500781fae9 Qilong Zhang=C2=A0 2020-06-28=C2=A0 659
>> 97767500781fae9 Qilong Zhang=C2=A0 2020-06-28=C2=A0 660=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =

>> (sec_usage_check(sbi, GET_SEC_FROM_SEG(sbi, *result)))
>> 97767500781fae9 Qilong Zhang=C2=A0 2020-06-28=C2=A0 661=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EB=
USY;
>> 97767500781fae9 Qilong Zhang=C2=A0 2020-06-28=C2=A0 662=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> e066b83c9b40f3a Jaegeuk Kim=C2=A0=C2=A0 2017-04-13=C2=A0 663 p.min_segno=
 =3D *result;
>> e066b83c9b40f3a Jaegeuk Kim=C2=A0=C2=A0 2017-04-13=C2=A0 664=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> e066b83c9b40f3a Jaegeuk Kim=C2=A0=C2=A0 2017-04-13=C2=A0 665=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
>> e066b83c9b40f3a Jaegeuk Kim=C2=A0=C2=A0 2017-04-13=C2=A0 666
>> 97767500781fae9 Qilong Zhang=C2=A0 2020-06-28=C2=A0 667=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ret =3D -ENODATA;
>> 3342bb303bf48dd Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2015-10-05=
=C2=A0 668=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p.max_search =

>> =3D=3D 0)
>> 3342bb303bf48dd Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2015-10-05=
=C2=A0 669=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> 3342bb303bf48dd Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2015-10-05=
=C2=A0 670
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 671=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =

>> (__is_large_section(sbi) && p.alloc_mode =3D=3D LFS) {
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 672=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =

>> (sbi->next_victim_seg[BG_GC] !=3D NULL_SEGNO) {
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 673 p.min_segno =3D =

>> sbi->next_victim_seg[BG_GC];
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 674 *result =3D p.min_segno;
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 675 =

>> sbi->next_victim_seg[BG_GC] =3D NULL_SEGNO;
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 676=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 goto =

>> got_result;
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 677=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 678=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (gc_typ=
e =3D=3D =

>> FG_GC &&
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 679 =

>> sbi->next_victim_seg[FG_GC] !=3D NULL_SEGNO) {
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 680 p.min_segno =3D =

>> sbi->next_victim_seg[FG_GC];
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 681 *result =3D p.min_segno;
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 682 =

>> sbi->next_victim_seg[FG_GC] =3D NULL_SEGNO;
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 683=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 goto =

>> got_result;
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 684=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 685=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> e3080b0120a15e6 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018-10-24=
=C2=A0 686
>> e066b83c9b40f3a Jaegeuk Kim=C2=A0=C2=A0 2017-04-13=C2=A0 687=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 last_victim =3D =

>> sm->last_victim[p.gc_mode];
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 688=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (p.alloc_mode =

>> =3D=3D LFS && gc_type =3D=3D FG_GC) {
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 689 p.min_segno=
 =3D =

>> check_bg_victims(sbi);
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 690=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =

>> (p.min_segno !=3D NULL_SEGNO)
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 691=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto got=
_it;
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 692=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 693
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 694=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 while (1) {
>> da52f8ade40b032 Jack Qiu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-06-18=C2=A0 =
695=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long =

>> cost, *dirty_bitmap;
>> da52f8ade40b032 Jack Qiu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-06-18=C2=A0 =
696=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int =

>> unit_no, segno;
>> da52f8ade40b032 Jack Qiu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-06-18=C2=A0 =
697
>> da52f8ade40b032 Jack Qiu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-06-18=C2=A0 =
698 dirty_bitmap =3D =

>> p.dirty_bitmap;
>> da52f8ade40b032 Jack Qiu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-06-18=C2=A0 =
699=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unit_no =3D =

>> find_next_bit(dirty_bitmap,
>> da52f8ade40b032 Jack Qiu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-06-18=C2=A0 =
700 last_segment / p.ofs_unit,
>> da52f8ade40b032 Jack Qiu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-06-18=C2=A0 =
701 p.offset / p.ofs_unit);
>> da52f8ade40b032 Jack Qiu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2020-06-18=C2=A0 =
702=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 segno =3D =

>> unit_no * p.ofs_unit;
>> a43f7ec327b0d86 Chao Yu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2015-10-05=
=C2=A0 703=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (segno =
>=3D =

>> last_segment) {
>> e066b83c9b40f3a Jaegeuk Kim=C2=A0=C2=A0 2017-04-13=C2=A0 704=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =

>> (sm->last_victim[p.gc_mode]) {
>> e066b83c9b40f3a Jaegeuk Kim=C2=A0=C2=A0 2017-04-13=C2=A0 705 last_segmen=
t =3D
>> e066b83c9b40f3a Jaegeuk Kim=C2=A0=C2=A0 2017-04-13 706=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

>> sm->last_victim[p.gc_mode];
>> e066b83c9b40f3a Jaegeuk Kim=C2=A0=C2=A0 2017-04-13=C2=A0 707 =

>> sm->last_victim[p.gc_mode] =3D 0;
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 708 p.offset =
=3D 0;
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 709 continue;
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 710=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 711 break;
>> 7bc0900347e069a Jaegeuk Kim=C2=A0=C2=A0 2012-11-02=C2=A0 712=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> a57e564d14d9d12 Jin Xu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2013-09=
-13=C2=A0 713
>> a57e564d14d9d12 Jin Xu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2013-09=
-13=C2=A0 714=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p.offse=
t =3D =

>> segno + p.ofs_unit;
>> 688159b6db47a9e Fan Li=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2016-02=
-03=C2=A0 715 nsearched++;
>> 688159b6db47a9e Fan Li=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2016-02=
-03=C2=A0 716
>>
>> :::::: The code at line 622 was first introduced by commit
>> :::::: 7bc0900347e069a1676d28ad6f98cafaf8cfd6e9 f2fs: add garbage =

>> collection functions
>>
>> :::::: TO: Jaegeuk Kim <jaegeuk.kim@samsung.com>
>> :::::: CC: Jaegeuk Kim <jaegeuk.kim@samsung.com>
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>>
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org

--===============8919858959253490729==--

