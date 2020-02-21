Content-Type: multipart/mixed; boundary="===============2949654537438574388=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [alibaba-cloud:ck-4.19.91 10413/10894] arch/m68k/include/asm/mcf_pgtable.h:340:43: error: 'init_mm' undeclared; did you mean 'exit_shm'?
Date: Fri, 21 Feb 2020 05:06:19 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E66249523CF531@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <202002211201.EVoFQg2v%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2949654537438574388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: [kbuild-all] [alibaba-cloud:ck-4.19.91 10413/10894]
> arch/m68k/include/asm/mcf_pgtable.h:340:43: error: 'init_mm' undeclared; =
did you
> mean 'exit_shm'?
> =

> Hi Dan,
> =

> FYI, the error/warning still remains.
Hi all, kindly ignore this, it should not send to individual author, we wil=
l double check what went wrong to fix.

> =

> tree:   https://github.com/alibaba/cloud-kernel.git ck-4.19.91
> head:   d2eea4b70a577d466d17b1f1d1b5dd549584b5cf
> commit: 7a6bd9433d146a30036717ae982b9ee85d05ec56 [10413/10894] device-
> dax: Move resource pinning+mapping into the common driver
> config: m68k-randconfig-a001-20200219 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-
> tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 7a6bd9433d146a30036717ae982b9ee85d05ec56
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Dm68k
> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All error/warnings (new ones prefixed by >>):
> =

>    In file included from arch/m68k/include/asm/pgtable_mm.h:146:0,
>                     from arch/m68k/include/asm/pgtable.h:5,
>                     from include/linux/memremap.h:7,
>                     from drivers/dax/bus.c:3:
>    arch/m68k/include/asm/mcf_pgtable.h: In function 'nocache_page':
> >> arch/m68k/include/asm/mcf_pgtable.h:340:43: error: 'init_mm' undeclare=
d (first
> use in this function); did you mean 'exit_shm'?
>     #define pgd_offset_k(address) pgd_offset(&init_mm, address)
>                                               ^
>    arch/m68k/include/asm/mcf_pgtable.h:335:35: note: in definition of mac=
ro
> 'pgd_offset'
>     #define pgd_offset(mm, address) ((mm)->pgd + pgd_index(address))
>                                       ^~
> >> arch/m68k/include/asm/mcf_pgtable.h:367:8: note: in expansion of macro
> 'pgd_offset_k'
>      dir =3D pgd_offset_k(addr);
>            ^~~~~~~~~~~~
>    arch/m68k/include/asm/mcf_pgtable.h:340:43: note: each undeclared iden=
tifier is
> reported only once for each function it appears in
>     #define pgd_offset_k(address) pgd_offset(&init_mm, address)
>                                               ^
>    arch/m68k/include/asm/mcf_pgtable.h:335:35: note: in definition of mac=
ro
> 'pgd_offset'
>     #define pgd_offset(mm, address) ((mm)->pgd + pgd_index(address))
>                                       ^~
> >> arch/m68k/include/asm/mcf_pgtable.h:367:8: note: in expansion of macro
> 'pgd_offset_k'
>      dir =3D pgd_offset_k(addr);
>            ^~~~~~~~~~~~
>    arch/m68k/include/asm/mcf_pgtable.h: In function 'cache_page':
> >> arch/m68k/include/asm/mcf_pgtable.h:340:43: error: 'init_mm' undeclare=
d (first
> use in this function); did you mean 'exit_shm'?
>     #define pgd_offset_k(address) pgd_offset(&init_mm, address)
>                                               ^
>    arch/m68k/include/asm/mcf_pgtable.h:335:35: note: in definition of mac=
ro
> 'pgd_offset'
>     #define pgd_offset(mm, address) ((mm)->pgd + pgd_index(address))
>                                       ^~
>    arch/m68k/include/asm/mcf_pgtable.h:383:8: note: in expansion of macro
> 'pgd_offset_k'
>      dir =3D pgd_offset_k(addr);
>            ^~~~~~~~~~~~
> =

> vim +340 arch/m68k/include/asm/mcf_pgtable.h
> =

> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  336
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  337  /*
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  338   * Find an entry in a kernel
> pagetable directory.
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  339   */
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14 @340  #define pgd_offset_k(address)
> 	pgd_offset(&init_mm, address)
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  341
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  342  /*
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  343   * Find an entry in the seco=
nd-
> level pagetable.
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  344   */
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  345  static inline pmd_t
> *pmd_offset(pgd_t *pgd, unsigned long address)
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  346  {
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  347  	return (pmd_t *) pgd;
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  348  }
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  349
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  350  /*
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  351   * Find an entry in the thir=
d-level
> pagetable.
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  352   */
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  353  #define __pte_offset(address)
> 	((address >> PAGE_SHIFT) & (PTRS_PER_PTE - 1))
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  354  #define pte_offset_kernel(di=
r,
> address) \
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  355  	((pte_t *)
> __pmd_page(*(dir)) + __pte_offset(address))
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  356
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  357  /*
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  358   * Disable caching for page =
at
> given kernel virtual address.
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  359   */
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  360  static inline void
> nocache_page(void *vaddr)
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  361  {
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  362  	pgd_t *dir;
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  363  	pmd_t *pmdp;
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  364  	pte_t *ptep;
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  365  	unsigned long addr =3D
> (unsigned long) vaddr;
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  366
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14 @367  	dir =3D pgd_offset_k(addr);
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  368  	pmdp =3D pmd_offset(dir,
> addr);
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  369  	ptep =3D
> pte_offset_kernel(pmdp, addr);
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  370  	*ptep =3D
> pte_mknocache(*ptep);
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  371  }
> 91521c2ea6e3d5 Greg Ungerer 2011-10-14  372
> =

> :::::: The code at line 340 was first introduced by commit
> :::::: 91521c2ea6e3d5a790df40988101ad099ddbf7c8 m68k: page table support
> definitions and code for ColdFire MMU
> =

> :::::: TO: Greg Ungerer <gerg@uclinux.org>
> :::::: CC: Greg Ungerer <gerg@uclinux.org>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2949654537438574388==--

