Content-Type: multipart/mixed; boundary="===============4506825424589568200=="
MIME-Version: 1.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 3/5] mm/vma: Replace all remaining open encodings with is_vm_hugetlb_page()
Date: Mon, 24 Feb 2020 07:51:30 +0530
Message-ID: <7e76e88c-e828-654b-bf2a-4573f388e7cc@arm.com>
In-Reply-To: <202002190954.rWlsTEwn%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4506825424589568200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 02/19/2020 06:44 AM, kbuild test robot wrote:
> Hi Anshuman,
> =

> Thank you for the patch! Yet something to improve:
> =

> [auto build test ERROR on mmotm/master]
> [also build test ERROR on tip/perf/core m68k/for-next powerpc/next tip/sc=
hed/core char-misc/char-misc-testing linux/master linus/master tip/x86/mm a=
sm-generic/master v5.6-rc2 next-20200218]
> [cannot apply to kvm-ppc/kvm-ppc-next]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
> =

> url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/mm-vma=
-Use-available-wrappers-when-possible/20200219-065223
> base:   git://git.cmpxchg.org/linux-mmotm.git master
> config: nds32-allnoconfig (attached as .config)
> compiler: nds32le-linux-gcc (GCC) 9.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D9.2.0 make.cross ARCH=3Dnds32 =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    In file included from arch/nds32/include/asm/tlb.h:7,
>                     from arch/nds32/mm/init.c:18:
>    include/asm-generic/tlb.h: In function 'tlb_update_vma_flags':
>>> include/asm-generic/tlb.h:382:18: error: implicit declaration of functi=
on 'is_vm_hugetlb_page' [-Werror=3Dimplicit-function-declaration]
>      382 |  tlb->vma_huge =3D is_vm_hugetlb_page(vma);
>          |                  ^~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

Though I am unable to reproduce this build failure [1], it seems like
explicitly adding <linux/hugetlb.h> or <linux/hugetlb_inline.h> header
will be sufficient.

[1] nds32 build failure (error while loading shared libraries)

/usr/lib/x86_64-linux-gnu/libfl.so.2: invalid ELF header
--===============4506825424589568200==--

