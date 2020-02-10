Content-Type: multipart/mixed; boundary="===============2982906597449286274=="
MIME-Version: 1.0
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH V13] mm/debug: Add tests validating architecture page table helpers
Date: Mon, 10 Feb 2020 11:06:39 +0000
Message-ID: <20200210110639.GC25745@shell.armlinux.org.uk>
In-Reply-To: <7cb3a5bb-eaea-a01c-4047-e3c000b7ad1d@c-s.fr>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2982906597449286274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 11:46:23AM +0100, Christophe Leroy wrote:
> =

> =

> Le 10/02/2020 =C3=A0 11:02, Russell King - ARM Linux admin a =C3=A9crit=
=C2=A0:
> > On Mon, Feb 10, 2020 at 07:38:38AM +0100, Christophe Leroy wrote:
> > > =

> > > =

> > > Le 10/02/2020 =C3=A0 06:35, Anshuman Khandual a =C3=A9crit=C2=A0:
> > > > =

> > > > =

> > > > On 02/10/2020 10:22 AM, Andrew Morton wrote:
> > > > > On Thu, 6 Feb 2020 13:49:35 +0530 Anshuman Khandual <anshuman.kha=
ndual@arm.com> wrote:
> > > > > =

> > > > > > =

> > > > > > On 02/06/2020 04:40 AM, kbuild test robot wrote:
> > > > > > > Hi Anshuman,
> > > > > > > =

> > > > > > > Thank you for the patch! Yet something to improve:
> > > > > > > =

> > > > > > > [auto build test ERROR on powerpc/next]
> > > > > > > [also build test ERROR on s390/features linus/master arc/for-=
next v5.5]
> > > > > > > [cannot apply to mmotm/master tip/x86/core arm64/for-next/cor=
e next-20200205]
> > > > > > > [if your patch is applied to the wrong git tree, please drop =
us a note to help
> > > > > > > improve the system. BTW, we also suggest to use '--base' opti=
on to specify the
> > > > > > > base tree in git format-patch, please see https://stackoverfl=
ow.com/a/37406982]
> > > > > > > =

> > > > > > > url:    https://github.com/0day-ci/linux/commits/Anshuman-Kha=
ndual/mm-debug-Add-tests-validating-architecture-page-table-helpers/2020020=
5-215507
> > > > > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/power=
pc/linux.git next
> > > > > > > config: ia64-allmodconfig (attached as .config)
> > > > > > > compiler: ia64-linux-gcc (GCC) 7.5.0
> > > > > > > reproduce:
> > > > > > >           wget https://raw.githubusercontent.com/intel/lkp-te=
sts/master/sbin/make.cross -O ~/bin/make.cross
> > > > > > >           chmod +x ~/bin/make.cross
> > > > > > >           # save the attached .config to linux build tree
> > > > > > >           GCC_VERSION=3D7.5.0 make.cross ARCH=3Dia64
> > > > > > > =

> > > > > > > If you fix the issue, kindly add following tag
> > > > > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > > > > > =

> > > > > > > All error/warnings (new ones prefixed by >>):
> > > > > > > =

> > > > > > >      In file included from include/asm-generic/pgtable-nopud.=
h:8:0,
> > > > > > >                       from arch/ia64/include/asm/pgtable.h:58=
6,
> > > > > > >                       from include/linux/mm.h:99,
> > > > > > >                       from include/linux/highmem.h:8,
> > > > > > >                       from mm/debug_vm_pgtable.c:14:
> > > > > > >      mm/debug_vm_pgtable.c: In function 'pud_clear_tests':
> > > > > > > > > include/asm-generic/pgtable-nop4d-hack.h:47:32: error: im=
plicit declaration of function '__pgd'; did you mean '__p4d'? [-Werror=3Dim=
plicit-function-declaration]
> > > > > > >       #define __pud(x)    ((pud_t) { __pgd(x) })
> > > > > > >                                      ^
> > > > > > > > > mm/debug_vm_pgtable.c:141:8: note: in expansion of macro =
'__pud'
> > > > > > >        pud =3D __pud(pud_val(pud) | RANDOM_ORVALUE);
> > > > > > >              ^~~~~
> > > > > > > > > include/asm-generic/pgtable-nop4d-hack.h:47:22: warning: =
missing braces around initializer [-Wmissing-braces]
> > > > > > >       #define __pud(x)    ((pud_t) { __pgd(x) })
> > > > > > >                            ^
> > > > > > > > > mm/debug_vm_pgtable.c:141:8: note: in expansion of macro =
'__pud'
> > > > > > >        pud =3D __pud(pud_val(pud) | RANDOM_ORVALUE);
> > > > > > >              ^~~~~
> > > > > > >      cc1: some warnings being treated as errors
> > > > > > =

> > > > > > This build failure is expected now given that we have allowed D=
EBUG_VM_PGTABLE
> > > > > > with EXPERT without platform requiring ARCH_HAS_DEBUG_VM_PGTABL=
E. This problem
> > > > > > i.e build failure caused without a platform __pgd(), is known t=
o exist both on
> > > > > > ia64 and arm (32bit) platforms. Please refer https://lkml.org/l=
kml/2019/9/24/314
> > > > > > for details where this was discussed earlier.
> > > > > > =

> > > > > =

> > > > > I'd prefer not to merge a patch which is known to cause build
> > > > > regressions.  Is there some temporary thing we can do to prevent =
these
> > > > > errors until arch maintainers(?) get around to implementing the
> > > > > long-term fixes?
> > > > =

> > > > We could explicitly disable CONFIG_DEBUG_VM_PGTABLE on ia64 and arm=
 platforms
> > > > which will ensure that others can still use the EXPERT path.
> > > > =

> > > > config DEBUG_VM_PGTABLE
> > > > 	bool "Debug arch page table for semantics compliance"
> > > > 	depends on MMU
> > > > 	depends on !(IA64 || ARM)
> > > > 	depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
> > > > 	default n if !ARCH_HAS_DEBUG_VM_PGTABLE
> > > > 	default y if DEBUG_VM
> > > > =

> > > =

> > > On both ia32 and arm, the fix is trivial.
> > > =

> > > Can we include the fix within this patch, just the same way as the
> > > mm_p4d_folded() fix for x86 ?
> > =

> > Why should arm include a macro for something that nothing (apart from
> > this checker) requires?  If the checker requires it but the rest of
> > the kernel does not, it suggests that the checker isn't actually
> > correct, and the results can't be relied upon.
> > =

> =

> As far as I can see, the problem is that arm opencodes part of the API
> instead of including asm-generic/pgtable-nopmd.h
> =

> Here, the ARM has 2 levels, ie only PGD and PTE. But instead of defining
> __pgd and __pte and getting everything else from asm-generic, it defines a
> __pmd then redefines the folded levels like the pud, etc ...
> =

> That's exactly what the checker aims at detecting: architectures than do =
not
> properly use the standard linux page table structures.

There are good reasons for the way ARM does stuff.  The generic crap was
written without regard for the circumstances that ARM has, and thus is
entirely unsuitable for 32-bit ARM.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps =
up
According to speedtest.net: 11.9Mbps down 500kbps up
--===============2982906597449286274==--

