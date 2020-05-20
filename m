Content-Type: multipart/mixed; boundary="===============3996914563344287796=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 10679/10701] arch/x86/mm/pgtable.c:427:2: warning: variable length array 'u_pmds' is used
Date: Wed, 20 May 2020 13:58:02 -0700
Message-ID: <c66f84f9-606a-058d-7d02-312a79aba217@infradead.org>
In-Reply-To: <202005210343.GBNjOjOX%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3996914563344287796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/20/20 12:56 PM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
> commit: 0e19fc1c40bd7516d5a30a459db4f49d48910847 [10679/10701] mm: consol=
idate pgd_index() and pgd_offset{_k}() definitions
> config: i386-randconfig-a005-20200520 (attached as .config)
> compiler: gcc-4.9 (Ubuntu 4.9.3-13ubuntu2) 4.9.3
> reproduce:
>         git checkout 0e19fc1c40bd7516d5a30a459db4f49d48910847
>         # save the attached .config to linux build tree
>         make ARCH=3Di386 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> arch/x86/mm/pgtable.c: In function 'pgd_alloc':
>>> arch/x86/mm/pgtable.c:427:2: warning: variable length array 'u_pmds' is=
 used [-Wvla]
> pmd_t *u_pmds[MAX_PREALLOCATED_USER_PMDS];
> ^
>>> arch/x86/mm/pgtable.c:428:2: warning: variable length array 'pmds' is u=
sed [-Wvla]
> pmd_t *pmds[MAX_PREALLOCATED_PMDS];
> ^
> =


Yes, I also reported this on linux-next of 20200518 (but I didn't copy Mike=
 on it).


> vim +/u_pmds +427 arch/x86/mm/pgtable.c
> =

> 1db491f77b6ed0 Fenghua Yu          2015-01-15  423  =

> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  424  pgd_t *pgd_alloc(stru=
ct mm_struct *mm)
> 1ec1fe73dfb711 Ingo Molnar         2008-03-19  425  {
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  426  	pgd_t *pgd;
> 184d47f0fd3651 Kees Cook           2018-10-08 @427  	pmd_t *u_pmds[MAX_PR=
EALLOCATED_USER_PMDS];
> 184d47f0fd3651 Kees Cook           2018-10-08 @428  	pmd_t *pmds[MAX_PREA=
LLOCATED_PMDS];
> 1ec1fe73dfb711 Ingo Molnar         2008-03-19  429  =

> 1db491f77b6ed0 Fenghua Yu          2015-01-15  430  	pgd =3D _pgd_alloc();
> 1ec1fe73dfb711 Ingo Molnar         2008-03-19  431  =

> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  432  	if (pgd =3D=3D NULL)
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  433  		goto out;
> 4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  434  =

> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  435  	mm->pgd =3D pgd;
> 4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  436  =

> f59dbe9ca6707e Joerg Roedel        2018-07-18  437  	if (preallocate_pmds=
(mm, pmds, PREALLOCATED_PMDS) !=3D 0)
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  438  		goto out_free_pgd;
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  439  =

> f59dbe9ca6707e Joerg Roedel        2018-07-18  440  	if (preallocate_pmds=
(mm, u_pmds, PREALLOCATED_USER_PMDS) !=3D 0)
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  441  		goto out_free_pmds;
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  442  =

> f59dbe9ca6707e Joerg Roedel        2018-07-18  443  	if (paravirt_pgd_all=
oc(mm) !=3D 0)
> f59dbe9ca6707e Joerg Roedel        2018-07-18  444  		goto out_free_user_=
pmds;
> f59dbe9ca6707e Joerg Roedel        2018-07-18  445  =

> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  446  	/*
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  447  	 * Make sure that pr=
e-populating the pmds is atomic with
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  448  	 * respect to anythi=
ng walking the pgd_list, so that they
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  449  	 * never see a parti=
ally populated pgd.
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  450  	 */
> a79e53d85683c6 Andrea Arcangeli    2011-02-16  451  	spin_lock(&pgd_lock);
> 4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  452  =

> 617d34d9e5d832 Jeremy Fitzhardinge 2010-09-21  453  	pgd_ctor(mm, pgd);
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  454  	pgd_prepopulate_pmd(=
mm, pgd, pmds);
> f59dbe9ca6707e Joerg Roedel        2018-07-18  455  	pgd_prepopulate_user=
_pmd(mm, pgd, u_pmds);
> 4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  456  =

> a79e53d85683c6 Andrea Arcangeli    2011-02-16  457  	spin_unlock(&pgd_loc=
k);
> 4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  458  =

> 4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  459  	return pgd;
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  460  =

> f59dbe9ca6707e Joerg Roedel        2018-07-18  461  out_free_user_pmds:
> f59dbe9ca6707e Joerg Roedel        2018-07-18  462  	free_pmds(mm, u_pmds=
, PREALLOCATED_USER_PMDS);
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  463  out_free_pmds:
> f59dbe9ca6707e Joerg Roedel        2018-07-18  464  	free_pmds(mm, pmds, =
PREALLOCATED_PMDS);
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  465  out_free_pgd:
> 1db491f77b6ed0 Fenghua Yu          2015-01-15  466  	_pgd_free(pgd);
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  467  out:
> d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  468  	return NULL;
> 4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  469  }
> 4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  470  =

> =

> :::::: The code at line 427 was first introduced by commit
> :::::: 184d47f0fd365108bd06ab26cdb3450b716269fd x86/mm: Avoid VLA in pgd_=
alloc()
> =

> :::::: TO: Kees Cook <keescook@chromium.org>
> :::::: CC: Ingo Molnar <mingo@kernel.org>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =



-- =

~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
--===============3996914563344287796==--

