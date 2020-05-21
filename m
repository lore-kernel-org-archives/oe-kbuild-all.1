Content-Type: multipart/mixed; boundary="===============3187429499498416194=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 10668/10701] include/linux/pgtable.h:203:2: note: in expansion of macro 'pte_clear'
Date: Thu, 21 May 2020 11:10:13 -0700
Message-ID: <20200521111013.4002031df75532cca1f27d46@linux-foundation.org>
In-Reply-To: <202005211742.H2jPhSbF%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3187429499498416194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 21 May 2020 17:30:52 +0800 kbuild test robot <lkp@intel.com> wrot=
e:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
> commit: ef03574dee21524cbdbbf2af29fe06a62610570d [10668/10701] mm: introd=
uce include/linux/pgtable.h
> config: parisc-randconfig-r011-20200521 (attached as .config)
> compiler: hppa-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout ef03574dee21524cbdbbf2af29fe06a62610570d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dparisc =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> In file included from include/linux/pgtable.h:6,
> from include/linux/mm.h:95,
> from include/linux/pid_namespace.h:7,
> from include/linux/ptrace.h:10,
> from arch/parisc/kernel/asm-offsets.c:20:
> include/linux/pgtable.h: In function 'pte_clear_not_present_full':
> arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set b=
ut not used [-Wunused-but-set-variable]
> 96 |   pte_t old_pte;              |         ^~~~~~~
> arch/parisc/include/asm/pgtable.h:322:34: note: in expansion of macro 'se=
t_pte_at'
> 322 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
> |                                  ^~~~~~~~~~
> >> include/linux/pgtable.h:203:2: note: in expansion of macro 'pte_clear'
> 203 |  pte_clear(mm, address, ptep);
> |  ^~~~~~~~~
> include/linux/pgtable.h: In function '__ptep_modify_prot_commit':
> arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set b=
ut not used [-Wunused-but-set-variable]

I can't reproduce this.  And I can't see anything in -mm whcih would
have triggered this warning.

arch/parisc/include/asm/pgtable.h has

#define set_pte_at(mm, addr, ptep, pteval)			\
	do {							\
		pte_t old_pte;					\
		unsigned long flags;				\
		spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);\
		old_pte =3D *ptep;				\
		set_pte(ptep, pteval);				\
		purge_tlb_entries(mm, addr);			\
		spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);\
	} while (0)

and old_pte has been set-but-not-used for a long time.

Obviously we can fix it, but I'm worried that parisc's set_pte_at() was
previously unused and we've now done something to cause it to be used,
so we're now running previously untested code.


--===============3187429499498416194==--

