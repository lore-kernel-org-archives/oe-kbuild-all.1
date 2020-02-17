Content-Type: multipart/mixed; boundary="===============8221581375490624266=="
MIME-Version: 1.0
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: kbuild-all@lists.01.org
Subject: Re: [kvms390:pv_worktree 5/40] arch/s390/kernel/setup.c:563:6: error: 'prot_virt_host' undeclared; did you mean 'is_prot_virt_host'?
Date: Mon, 17 Feb 2020 08:55:46 +0100
Message-ID: <85febaae-c9ac-5060-5458-64287ec43774@de.ibm.com>
In-Reply-To: <202002151214.QFguG3zT%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8221581375490624266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

my bad due to a late change to fold in some last minute review. =

Will fix. =


On 15.02.20 05:33, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git=
 pv_worktree
> head:   6a8cbdf8a1bdd3a4dff307780f9c00eeb2300adb
> commit: 76f352baed9166481516cfaf88968883635b931c [5/40] s390/protvirt: ad=
d ultravisor initialization
> config: s390-zfcpdump_defconfig (attached as .config)
> compiler: s390-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 76f352baed9166481516cfaf88968883635b931c
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Ds390 =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    arch/s390/kernel/setup.c: In function 'setup_memory_end':
>>> arch/s390/kernel/setup.c:563:6: error: 'prot_virt_host' undeclared (fir=
st use in this function); did you mean 'is_prot_virt_host'?
>      if (prot_virt_host)
>          ^~~~~~~~~~~~~~
>          is_prot_virt_host
>    arch/s390/kernel/setup.c:563:6: note: each undeclared identifier is re=
ported only once for each function it appears in
>    arch/s390/kernel/setup.c: In function 'setup_arch':
>    arch/s390/kernel/setup.c:1140:6: error: 'prot_virt_host' undeclared (f=
irst use in this function); did you mean 'is_prot_virt_host'?
>      if (prot_virt_host)
>          ^~~~~~~~~~~~~~
>          is_prot_virt_host
> =

> vim +563 arch/s390/kernel/setup.c
> =

>    544	=

>    545	static void __init setup_memory_end(void)
>    546	{
>    547		unsigned long vmax, tmp;
>    548	=

>    549		/* Choose kernel address space layout: 3 or 4 levels. */
>    550		if (IS_ENABLED(CONFIG_KASAN)) {
>    551			vmax =3D IS_ENABLED(CONFIG_KASAN_S390_4_LEVEL_PAGING)
>    552				   ? _REGION1_SIZE
>    553				   : _REGION2_SIZE;
>    554		} else {
>    555			tmp =3D (memory_end ?: max_physmem_end) / PAGE_SIZE;
>    556			tmp =3D tmp * (sizeof(struct page) + PAGE_SIZE);
>    557			if (tmp + vmalloc_size + MODULES_LEN <=3D _REGION2_SIZE)
>    558				vmax =3D _REGION2_SIZE; /* 3-level kernel page table */
>    559			else
>    560				vmax =3D _REGION1_SIZE; /* 4-level kernel page table */
>    561		}
>    562	=

>  > 563		if (prot_virt_host)
>    564			adjust_to_uv_max(&vmax);
>    565	=

>    566		/* module area is at the end of the kernel address space. */
>    567		MODULES_END =3D vmax;
>    568		MODULES_VADDR =3D MODULES_END - MODULES_LEN;
>    569		VMALLOC_END =3D MODULES_VADDR;
>    570		VMALLOC_START =3D VMALLOC_END - vmalloc_size;
>    571	=

>    572		/* Split remaining virtual space between 1:1 mapping & vmemmap ar=
ray */
>    573		tmp =3D VMALLOC_START / (PAGE_SIZE + sizeof(struct page));
>    574		/* vmemmap contains a multiple of PAGES_PER_SECTION struct pages =
*/
>    575		tmp =3D SECTION_ALIGN_UP(tmp);
>    576		tmp =3D VMALLOC_START - tmp * sizeof(struct page);
>    577		tmp &=3D ~((vmax >> 11) - 1);	/* align to page table level */
>    578		tmp =3D min(tmp, 1UL << MAX_PHYSMEM_BITS);
>    579		vmemmap =3D (struct page *) tmp;
>    580	=

>    581		/* Take care that memory_end is set and <=3D vmemmap */
>    582		memory_end =3D min(memory_end ?: max_physmem_end, (unsigned long)=
vmemmap);
>    583	#ifdef CONFIG_KASAN
>    584		/* fit in kasan shadow memory region between 1:1 and vmemmap */
>    585		memory_end =3D min(memory_end, KASAN_SHADOW_START);
>    586		vmemmap =3D max(vmemmap, (struct page *)KASAN_SHADOW_END);
>    587	#endif
>    588		max_pfn =3D max_low_pfn =3D PFN_DOWN(memory_end);
>    589		memblock_remove(memory_end, ULONG_MAX);
>    590	=

>    591		pr_notice("The maximum memory size is %luMB\n", memory_end >> 20);
>    592	}
>    593	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20

--===============8221581375490624266==--

