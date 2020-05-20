Content-Type: multipart/mixed; boundary="===============8452849815429017617=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 10679/10701] arch/x86/mm/pgtable.c:427:2: warning: variable length array 'u_pmds' is used
Date: Wed, 20 May 2020 16:50:58 -0700
Message-ID: <87db3e54-5d09-d09a-fb30-51feea8d7821@infradead.org>
In-Reply-To: <20200520161101.46deeeaac1cff608573ccec3@linux-foundation.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8452849815429017617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/20/20 4:11 PM, Andrew Morton wrote:
> On Thu, 21 May 2020 03:56:53 +0800 kbuild test robot <lkp@intel.com> wr=
ote:
> =

>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git master
>> head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
>> commit: 0e19fc1c40bd7516d5a30a459db4f49d48910847 [10679/10701] mm: conso=
lidate pgd_index() and pgd_offset{_k}() definitions
>> config: i386-randconfig-a005-20200520 (attached as .config)
>> compiler: gcc-4.9 (Ubuntu 4.9.3-13ubuntu2) 4.9.3
>> reproduce:
>>         git checkout 0e19fc1c40bd7516d5a30a459db4f49d48910847
>>         # save the attached .config to linux build tree
>>         make ARCH=3Di386 =

>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>>
>> arch/x86/mm/pgtable.c: In function 'pgd_alloc':
>>>> arch/x86/mm/pgtable.c:427:2: warning: variable length array 'u_pmds' i=
s used [-Wvla]
>> pmd_t *u_pmds[MAX_PREALLOCATED_USER_PMDS];
>> ^
>>>> arch/x86/mm/pgtable.c:428:2: warning: variable length array 'pmds' is =
used [-Wvla]
>> pmd_t *pmds[MAX_PREALLOCATED_PMDS];
>> ^
> =

> Thanks.  This works for me - perhaps Mike can come up with something smar=
ter.

Works for me too. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

> --- a/include/linux/pgtable.h~mm-consolidate-pgd_index-and-pgd_offset_k-d=
efinitions-fix
> +++ a/include/linux/pgtable.h
> @@ -62,11 +62,8 @@ static inline unsigned long pud_index(un
>  #endif
>  =

>  #ifndef pgd_index
> -static inline unsigned long pgd_index(unsigned long address)
> -{
> -	return ((address >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1));
> -}
> -#define pgd_index pgd_index
> +/* Must be a compile-time constant, so implement it as a macro */
> +#define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
>  #endif
>  =

>  #ifndef pte_offset_kernel
> _
> =

> =



-- =

~Randy
--===============8452849815429017617==--

