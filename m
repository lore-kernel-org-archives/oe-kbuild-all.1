Content-Type: multipart/mixed; boundary="===============2890947661910654111=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: kbuild-all@lists.01.org
Subject: Re: arch/sparc/mm/srmmu.c:300:9: error: variable 'pud' set but not used
Date: Wed, 20 May 2020 16:46:28 -0700
Message-ID: <20200520164628.fda1af0c681bbae498dd7ba7@linux-foundation.org>
In-Reply-To: <20200520132005.GM1059226@linux.ibm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2890947661910654111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 20 May 2020 16:20:05 +0300 Mike Rapoport <rppt@linux.ibm.com> wro=
te:

> The kbuild test robot reported the following warning:
> =

> arch/sparc/mm/srmmu.c: In function 'srmmu_nocache_init':
> >> arch/sparc/mm/srmmu.c:300:9: error: variable 'pud' set but not used
> >> [-Werror=3Dunused-but-set-variable]
> 300 |  pud_t *pud;
> =

> This warning is caused by misprint in the page table traversal in
> srmmu_nocache_init() function which accessed a PMD entry using PGD rather
> than PUD.
> Since sparc32 has only 3 page table levels, the PGD and PUD are essential=
ly
> the same and usage of __nocache_fix() removed the type checking.
> =

> Use PUD for the consistency and to silence the compiler warning.
> =

> ...
>
> --- a/arch/sparc/mm/srmmu.c
> +++ b/arch/sparc/mm/srmmu.c
> @@ -304,7 +304,7 @@ static void __init srmmu_nocache_init(void)
>  		pgd =3D pgd_offset_k(vaddr);
>  		p4d =3D p4d_offset(__nocache_fix(pgd), vaddr);
>  		pud =3D pud_offset(__nocache_fix(p4d), vaddr);
> -		pmd =3D pmd_offset(__nocache_fix(pgd), vaddr);
> +		pmd =3D pmd_offset(__nocache_fix(pud), vaddr);
>  		pte =3D pte_offset_kernel(__nocache_fix(pmd), vaddr);
>  =

>  		pteval =3D ((paddr >> 4) | SRMMU_ET_PTE | SRMMU_PRIV);

I added

Fixes: 7235db268a2777bc38 ("sparc32: use pgtable-nopud instead of 4level-fi=
xup")

and, after a bit of thought,

Cc: <stable@vger.kernel.org>

Because that's a fairly scary-looking warning.
--===============2890947661910654111==--

