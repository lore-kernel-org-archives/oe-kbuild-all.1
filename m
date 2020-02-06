Content-Type: multipart/mixed; boundary="===============4371603159653858319=="
MIME-Version: 1.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH V13] mm/debug: Add tests validating architecture page table helpers
Date: Thu, 06 Feb 2020 13:49:35 +0530
Message-ID: <78d3ce6b-e100-2561-6b09-124c29731d1a@arm.com>
In-Reply-To: <202002060619.wEOdAZU1%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4371603159653858319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 02/06/2020 04:40 AM, kbuild test robot wrote:
> Hi Anshuman,
> =

> Thank you for the patch! Yet something to improve:
> =

> [auto build test ERROR on powerpc/next]
> [also build test ERROR on s390/features linus/master arc/for-next v5.5]
> [cannot apply to mmotm/master tip/x86/core arm64/for-next/core next-20200=
205]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
> =

> url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/mm-deb=
ug-Add-tests-validating-architecture-page-table-helpers/20200205-215507
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git=
 next
> config: ia64-allmodconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Dia64 =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All error/warnings (new ones prefixed by >>):
> =

>    In file included from include/asm-generic/pgtable-nopud.h:8:0,
>                     from arch/ia64/include/asm/pgtable.h:586,
>                     from include/linux/mm.h:99,
>                     from include/linux/highmem.h:8,
>                     from mm/debug_vm_pgtable.c:14:
>    mm/debug_vm_pgtable.c: In function 'pud_clear_tests':
>>> include/asm-generic/pgtable-nop4d-hack.h:47:32: error: implicit declara=
tion of function '__pgd'; did you mean '__p4d'? [-Werror=3Dimplicit-functio=
n-declaration]
>     #define __pud(x)    ((pud_t) { __pgd(x) })
>                                    ^
>>> mm/debug_vm_pgtable.c:141:8: note: in expansion of macro '__pud'
>      pud =3D __pud(pud_val(pud) | RANDOM_ORVALUE);
>            ^~~~~
>>> include/asm-generic/pgtable-nop4d-hack.h:47:22: warning: missing braces=
 around initializer [-Wmissing-braces]
>     #define __pud(x)    ((pud_t) { __pgd(x) })
>                          ^
>>> mm/debug_vm_pgtable.c:141:8: note: in expansion of macro '__pud'
>      pud =3D __pud(pud_val(pud) | RANDOM_ORVALUE);
>            ^~~~~
>    cc1: some warnings being treated as errors

This build failure is expected now given that we have allowed DEBUG_VM_PGTA=
BLE
with EXPERT without platform requiring ARCH_HAS_DEBUG_VM_PGTABLE. This prob=
lem
i.e build failure caused without a platform __pgd(), is known to exist both=
 on
ia64 and arm (32bit) platforms. Please refer https://lkml.org/lkml/2019/9/2=
4/314
for details where this was discussed earlier.

- Anshuman
--===============4371603159653858319==--

