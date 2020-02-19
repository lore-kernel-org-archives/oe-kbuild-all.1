Content-Type: multipart/mixed; boundary="===============7188368796933380717=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 3/5] mm/vma: Replace all remaining open encodings with is_vm_hugetlb_page()
Date: Wed, 19 Feb 2020 09:14:48 +0800
Message-ID: <202002190954.rWlsTEwn%lkp@intel.com>
In-Reply-To: <1581915833-21984-4-git-send-email-anshuman.khandual@arm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7188368796933380717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Anshuman,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on mmotm/master]
[also build test ERROR on tip/perf/core m68k/for-next powerpc/next tip/sche=
d/core char-misc/char-misc-testing linux/master linus/master tip/x86/mm asm=
-generic/master v5.6-rc2 next-20200218]
[cannot apply to kvm-ppc/kvm-ppc-next]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/mm-vma-U=
se-available-wrappers-when-possible/20200219-065223
base:   git://git.cmpxchg.org/linux-mmotm.git master
config: nds32-allnoconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Dnds32 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/nds32/include/asm/tlb.h:7,
                    from arch/nds32/mm/init.c:18:
   include/asm-generic/tlb.h: In function 'tlb_update_vma_flags':
>> include/asm-generic/tlb.h:382:18: error: implicit declaration of functio=
n 'is_vm_hugetlb_page' [-Werror=3Dimplicit-function-declaration]
     382 |  tlb->vma_huge =3D is_vm_hugetlb_page(vma);
         |                  ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/is_vm_hugetlb_page +382 include/asm-generic/tlb.h

   367	=

   368	static inline void
   369	tlb_update_vma_flags(struct mmu_gather *tlb, struct vm_area_struct *=
vma)
   370	{
   371		/*
   372		 * flush_tlb_range() implementations that look at VM_HUGETLB (tile,
   373		 * mips-4k) flush only large pages.
   374		 *
   375		 * flush_tlb_range() implementations that flush I-TLB also flush D-=
TLB
   376		 * (tile, xtensa, arm), so it's ok to just add VM_EXEC to an existi=
ng
   377		 * range.
   378		 *
   379		 * We rely on tlb_end_vma() to issue a flush, such that when we res=
et
   380		 * these values the batch is empty.
   381		 */
 > 382		tlb->vma_huge =3D is_vm_hugetlb_page(vma);
   383		tlb->vma_exec =3D !!(vma->vm_flags & VM_EXEC);
   384	}
   385	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7188368796933380717==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AX4TBBSb9YFK6k+LpB+RN8N0uvwfgwNPPb5JAAA=
--===============7188368796933380717==--

