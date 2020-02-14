Content-Type: multipart/mixed; boundary="===============1998566913481643198=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: mm/hugetlb.c:3454:14: error: implicit declaration of function 'pte_page'; did you mean 'put_page'?
Date: Fri, 14 Feb 2020 14:16:00 +0800
Message-ID: <202002141441.B8hFHHms%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1998566913481643198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b19e8c68470385dd2c5440876591fddb02c8c402
commit: 6bd33e1ece528f67646db33bf97406b747dafda0 riscv: add nommu support
date:   3 months ago
config: riscv-randconfig-a001-20200214 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 6bd33e1ece528f67646db33bf97406b747dafda0
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Driscv =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/hugetlb.h:5:0,
                    from include/linux/hugetlb.h:444,
                    from mm/hugetlb.c:36:
   include/asm-generic/hugetlb.h: In function 'mk_huge_pte':
   include/asm-generic/hugetlb.h:7:9: error: implicit declaration of functi=
on 'mk_pte'; did you mean '__pte'? [-Werror=3Dimplicit-function-declaration]
     return mk_pte(page, pgprot);
            ^~~~~~
            __pte
   include/asm-generic/hugetlb.h:7:9: error: incompatible types when return=
ing type 'int' but 'pte_t {aka struct <anonymous>}' was expected
     return mk_pte(page, pgprot);
            ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/hugetlb.h: In function 'huge_pte_write':
   include/asm-generic/hugetlb.h:12:9: error: implicit declaration of funct=
ion 'pte_write'; did you mean 'pgd_write'? [-Werror=3Dimplicit-function-dec=
laration]
     return pte_write(pte);
            ^~~~~~~~~
            pgd_write
   include/asm-generic/hugetlb.h: In function 'huge_pte_dirty':
   include/asm-generic/hugetlb.h:17:9: error: implicit declaration of funct=
ion 'pte_dirty'; did you mean 'info_dirty'? [-Werror=3Dimplicit-function-de=
claration]
     return pte_dirty(pte);
            ^~~~~~~~~
            info_dirty
   include/asm-generic/hugetlb.h: In function 'huge_pte_mkwrite':
   include/asm-generic/hugetlb.h:22:9: error: implicit declaration of funct=
ion 'pte_mkwrite'; did you mean 'pgd_write'? [-Werror=3Dimplicit-function-d=
eclaration]
     return pte_mkwrite(pte);
            ^~~~~~~~~~~
            pgd_write
   include/asm-generic/hugetlb.h:22:9: error: incompatible types when retur=
ning type 'int' but 'pte_t {aka struct <anonymous>}' was expected
     return pte_mkwrite(pte);
            ^~~~~~~~~~~~~~~~
   include/asm-generic/hugetlb.h: In function 'huge_pte_mkdirty':
   include/asm-generic/hugetlb.h:27:9: error: implicit declaration of funct=
ion 'pte_mkdirty'; did you mean 'huge_pte_mkdirty'? [-Werror=3Dimplicit-fun=
ction-declaration]
     return pte_mkdirty(pte);
            ^~~~~~~~~~~
            huge_pte_mkdirty
   include/asm-generic/hugetlb.h:27:9: error: incompatible types when retur=
ning type 'int' but 'pte_t {aka struct <anonymous>}' was expected
     return pte_mkdirty(pte);
            ^~~~~~~~~~~~~~~~
   include/asm-generic/hugetlb.h: In function 'huge_pte_modify':
   include/asm-generic/hugetlb.h:32:9: error: implicit declaration of funct=
ion 'pte_modify'; did you mean 'lease_modify'? [-Werror=3Dimplicit-function=
-declaration]
     return pte_modify(pte, newprot);
            ^~~~~~~~~~
            lease_modify
   include/asm-generic/hugetlb.h:32:9: error: incompatible types when retur=
ning type 'int' but 'pte_t {aka struct <anonymous>}' was expected
     return pte_modify(pte, newprot);
            ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/hugetlb.h: In function 'huge_pte_clear':
   include/asm-generic/hugetlb.h:39:2: error: implicit declaration of funct=
ion 'pte_clear'; did you mean 'pud_clear'? [-Werror=3Dimplicit-function-dec=
laration]
     pte_clear(mm, addr, ptep);
     ^~~~~~~~~
     pud_clear
   include/asm-generic/hugetlb.h: In function 'set_huge_pte_at':
   include/asm-generic/hugetlb.h:56:2: error: implicit declaration of funct=
ion 'set_pte_at'; did you mean 'set_huge_pte_at'? [-Werror=3Dimplicit-funct=
ion-declaration]
     set_pte_at(mm, addr, ptep, pte);
     ^~~~~~~~~~
     set_huge_pte_at
   include/asm-generic/hugetlb.h: In function 'huge_ptep_get_and_clear':
   include/asm-generic/hugetlb.h:64:9: error: implicit declaration of funct=
ion 'ptep_get_and_clear'; did you mean 'huge_ptep_get_and_clear'? [-Werror=
=3Dimplicit-function-declaration]
     return ptep_get_and_clear(mm, addr, ptep);
            ^~~~~~~~~~~~~~~~~~
            huge_ptep_get_and_clear
   include/asm-generic/hugetlb.h:64:9: error: incompatible types when retur=
ning type 'int' but 'pte_t {aka struct <anonymous>}' was expected
     return ptep_get_and_clear(mm, addr, ptep);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/hugetlb.h: In function 'huge_ptep_clear_flush':
   include/asm-generic/hugetlb.h:72:2: error: implicit declaration of funct=
ion 'ptep_clear_flush'; did you mean 'huge_ptep_clear_flush'? [-Werror=3Dim=
plicit-function-declaration]
     ptep_clear_flush(vma, addr, ptep);
     ^~~~~~~~~~~~~~~~
     huge_ptep_clear_flush
   include/asm-generic/hugetlb.h: In function 'huge_pte_none':
   include/asm-generic/hugetlb.h:79:9: error: implicit declaration of funct=
ion 'pte_none'; did you mean 'pud_none'? [-Werror=3Dimplicit-function-decla=
ration]
     return pte_none(pte);
            ^~~~~~~~
            pud_none
   include/asm-generic/hugetlb.h: In function 'huge_pte_wrprotect':
   include/asm-generic/hugetlb.h:86:9: error: implicit declaration of funct=
ion 'pte_wrprotect'; did you mean 'huge_pte_wrprotect'? [-Werror=3Dimplicit=
-function-declaration]
     return pte_wrprotect(pte);
            ^~~~~~~~~~~~~
            huge_pte_wrprotect
   include/asm-generic/hugetlb.h:86:9: error: incompatible types when retur=
ning type 'int' but 'pte_t {aka struct <anonymous>}' was expected
     return pte_wrprotect(pte);
            ^~~~~~~~~~~~~~~~~~
   include/asm-generic/hugetlb.h: In function 'huge_ptep_set_wrprotect':
   include/asm-generic/hugetlb.h:109:2: error: implicit declaration of func=
tion 'ptep_set_wrprotect'; did you mean 'huge_ptep_set_wrprotect'? [-Werror=
=3Dimplicit-function-declaration]
     ptep_set_wrprotect(mm, addr, ptep);
     ^~~~~~~~~~~~~~~~~~
     huge_ptep_set_wrprotect
   include/asm-generic/hugetlb.h: In function 'huge_ptep_set_access_flags':
   include/asm-generic/hugetlb.h:118:9: error: implicit declaration of func=
tion 'ptep_set_access_flags'; did you mean 'huge_ptep_set_access_flags'? [-=
Werror=3Dimplicit-function-declaration]
     return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
            ^~~~~~~~~~~~~~~~~~~~~
            huge_ptep_set_access_flags
   mm/hugetlb.c: In function 'make_huge_pte':
>> mm/hugetlb.c:3327:10: error: implicit declaration of function 'pte_mkyou=
ng'; did you mean 'page_mapping'? [-Werror=3Dimplicit-function-declaration]
     entry =3D pte_mkyoung(entry);
             ^~~~~~~~~~~
             page_mapping
>> mm/hugetlb.c:3327:8: error: incompatible types when assigning to type 'p=
te_t {aka struct <anonymous>}' from type 'int'
     entry =3D pte_mkyoung(entry);
           ^
>> mm/hugetlb.c:3328:10: error: implicit declaration of function 'pte_mkhug=
e'; did you mean 'pud_huge'? [-Werror=3Dimplicit-function-declaration]
     entry =3D pte_mkhuge(entry);
             ^~~~~~~~~~
             pud_huge
   mm/hugetlb.c:3328:8: error: incompatible types when assigning to type 'p=
te_t {aka struct <anonymous>}' from type 'int'
     entry =3D pte_mkhuge(entry);
           ^
   mm/hugetlb.c: In function 'set_huge_ptep_writable':
>> mm/hugetlb.c:3341:3: error: implicit declaration of function 'update_mmu=
_cache'; did you mean 'node_add_cache'? [-Werror=3Dimplicit-function-declar=
ation]
      update_mmu_cache(vma, address, ptep);
      ^~~~~~~~~~~~~~~~
      node_add_cache
   mm/hugetlb.c: In function 'is_hugetlb_entry_migration':
>> mm/hugetlb.c:3348:28: error: implicit declaration of function 'pte_prese=
nt'; did you mean 'pud_present'? [-Werror=3Dimplicit-function-declaration]
     if (huge_pte_none(pte) || pte_present(pte))
                               ^~~~~~~~~~~
                               pud_present
   mm/hugetlb.c:3350:8: error: implicit declaration of function 'pte_to_swp=
_entry'; did you mean 'pte_lockptr'? [-Werror=3Dimplicit-function-declarati=
on]
     swp =3D pte_to_swp_entry(pte);
           ^~~~~~~~~~~~~~~~
           pte_lockptr
>> mm/hugetlb.c:3350:6: error: incompatible types when assigning to type 's=
wp_entry_t {aka struct <anonymous>}' from type 'int'
     swp =3D pte_to_swp_entry(pte);
         ^
>> mm/hugetlb.c:3351:6: error: implicit declaration of function 'non_swap_e=
ntry'; did you mean 'init_wait_entry'? [-Werror=3Dimplicit-function-declara=
tion]
     if (non_swap_entry(swp) && is_migration_entry(swp))
         ^~~~~~~~~~~~~~
         init_wait_entry
>> mm/hugetlb.c:3351:29: error: implicit declaration of function 'is_migrat=
ion_entry'; did you mean 'list_first_entry'? [-Werror=3Dimplicit-function-d=
eclaration]
     if (non_swap_entry(swp) && is_migration_entry(swp))
                                ^~~~~~~~~~~~~~~~~~
                                list_first_entry
   mm/hugetlb.c: In function 'is_hugetlb_entry_hwpoisoned':
   mm/hugetlb.c:3363:6: error: incompatible types when assigning to type 's=
wp_entry_t {aka struct <anonymous>}' from type 'int'
     swp =3D pte_to_swp_entry(pte);
         ^
>> mm/hugetlb.c:3364:29: error: implicit declaration of function 'is_hwpois=
on_entry'; did you mean 'hwpoison_filter'? [-Werror=3Dimplicit-function-dec=
laration]
     if (non_swap_entry(swp) && is_hwpoison_entry(swp))
                                ^~~~~~~~~~~~~~~~~
                                hwpoison_filter
   mm/hugetlb.c: In function 'copy_hugetlb_page_range':
>> mm/hugetlb.c:3429:28: error: invalid initializer
       swp_entry_t swp_entry =3D pte_to_swp_entry(entry);
                               ^~~~~~~~~~~~~~~~
>> mm/hugetlb.c:3431:8: error: implicit declaration of function 'is_write_m=
igration_entry'; did you mean 'init_wait_entry'? [-Werror=3Dimplicit-functi=
on-declaration]
       if (is_write_migration_entry(swp_entry) && cow) {
           ^~~~~~~~~~~~~~~~~~~~~~~~
           init_wait_entry
>> mm/hugetlb.c:3436:5: error: implicit declaration of function 'make_migra=
tion_entry_read'; did you mean 'thp_migration_supported'? [-Werror=3Dimplic=
it-function-declaration]
        make_migration_entry_read(&swp_entry);
        ^~~~~~~~~~~~~~~~~~~~~~~~~
        thp_migration_supported
>> mm/hugetlb.c:3437:13: error: implicit declaration of function 'swp_entry=
_to_pte'; did you mean '__d_entry_type'? [-Werror=3Dimplicit-function-decla=
ration]
        entry =3D swp_entry_to_pte(swp_entry);
                ^~~~~~~~~~~~~~~~
                __d_entry_type
   mm/hugetlb.c:3437:11: error: incompatible types when assigning to type '=
pte_t {aka struct <anonymous>}' from type 'int'
        entry =3D swp_entry_to_pte(swp_entry);
              ^
>> mm/hugetlb.c:3454:14: error: implicit declaration of function 'pte_page'=
; did you mean 'put_page'? [-Werror=3Dimplicit-function-declaration]
       ptepage =3D pte_page(entry);
                 ^~~~~~~~
                 put_page
   mm/hugetlb.c:3454:12: warning: assignment makes pointer from integer wit=
hout a cast [-Wint-conversion]
       ptepage =3D pte_page(entry);
               ^
>> mm/hugetlb.c:3456:4: error: implicit declaration of function 'page_dup_r=
map'; did you mean 'page_is_ram'? [-Werror=3Dimplicit-function-declaration]
       page_dup_rmap(ptepage, true);
       ^~~~~~~~~~~~~
       page_is_ram
   mm/hugetlb.c: In function '__unmap_hugepage_range':
>> mm/hugetlb.c:3492:2: error: implicit declaration of function 'tlb_change=
_page_size'; did you mean 'huge_page_size'? [-Werror=3Dimplicit-function-de=
claration]
     tlb_change_page_size(tlb, sz);
     ^~~~~~~~~~~~~~~~~~~~
     huge_page_size
>> mm/hugetlb.c:3493:2: error: implicit declaration of function 'tlb_start_=
vma'; did you mean 'hstate_vma'? [-Werror=3Dimplicit-function-declaration]
     tlb_start_vma(tlb, vma);
     ^~~~~~~~~~~~~
     hstate_vma
   mm/hugetlb.c:3534:8: warning: assignment makes pointer from integer with=
out a cast [-Wint-conversion]
      page =3D pte_page(pte);
           ^
>> mm/hugetlb.c:3554:3: error: implicit declaration of function 'tlb_remove=
_huge_tlb_entry'; did you mean 'move_hugetlb_state'? [-Werror=3Dimplicit-fu=
nction-declaration]
      tlb_remove_huge_tlb_entry(h, tlb, ptep, address);
      ^~~~~~~~~~~~~~~~~~~~~~~~~
      move_hugetlb_state
>> mm/hugetlb.c:3559:3: error: implicit declaration of function 'page_remov=
e_rmap'; did you mean 'page_anon_vma'? [-Werror=3Dimplicit-function-declara=
tion]
      page_remove_rmap(page, true);
      ^~~~~~~~~~~~~~~~
      page_anon_vma
>> mm/hugetlb.c:3562:3: error: implicit declaration of function 'tlb_remove=
_page_size'; did you mean 'vma_mmu_pagesize'? [-Werror=3Dimplicit-function-=
declaration]
      tlb_remove_page_size(tlb, page, huge_page_size(h));
      ^~~~~~~~~~~~~~~~~~~~
      vma_mmu_pagesize
   mm/hugetlb.c:3570:2: error: implicit declaration of function 'tlb_end_vm=
a'; did you mean 'find_vma'? [-Werror=3Dimplicit-function-declaration]
     tlb_end_vma(tlb, vma);
     ^~~~~~~~~~~
     find_vma
   mm/hugetlb.c: In function 'unmap_hugepage_range':
   mm/hugetlb.c:3596:20: error: storage size of 'tlb' isn't known
     struct mmu_gather tlb;
                       ^~~
   mm/hugetlb.c:3596:20: warning: unused variable 'tlb' [-Wunused-variable]
   mm/hugetlb.c: In function 'hugetlb_cow':
   mm/hugetlb.c:3691:11: warning: assignment makes pointer from integer wit=
hout a cast [-Wint-conversion]
     old_page =3D pte_page(pte);
              ^
   mm/hugetlb.c:3697:3: error: implicit declaration of function 'page_move_=
anon_rmap'; did you mean 'page_anon_vma'? [-Werror=3Dimplicit-function-decl=
aration]
      page_move_anon_rmap(old_page, vma);
      ^~~~~~~~~~~~~~~~~~~
      page_anon_vma
   In file included from include/linux/kernel.h:11:0,
                    from include/linux/list.h:9,
                    from mm/hugetlb.c:6:
   mm/hugetlb.c:3740:8: error: implicit declaration of function 'pte_same';=
 did you mean 'pte_val'? [-Werror=3Dimplicit-function-declaration]
           pte_same(huge_ptep_get(ptep), pte)))
           ^
   include/linux/compiler.h:33:34: note: in definition of macro '__branch_c=
heck__'
       ______r =3D __builtin_expect(!!(x), expect); \
                                     ^
   mm/hugetlb.c:3739:8: note: in expansion of macro 'likely'
       if (likely(ptep &&
           ^~~~~~
   mm/hugetlb.c:3785:3: error: implicit declaration of function 'hugepage_a=
dd_new_anon_rmap'; did you mean 'hugepage_new_subpool'? [-Werror=3Dimplicit=
-function-declaration]
      hugepage_add_new_anon_rmap(new_page, vma, haddr);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~
      hugepage_new_subpool
   mm/hugetlb.c: In function 'hugetlb_fault':
   mm/hugetlb.c:4089:4: error: implicit declaration of function 'migration_=
entry_wait_huge' [-Werror=3Dimplicit-function-declaration]
       migration_entry_wait_huge(vma, mm, ptep);
       ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:4161:7: warning: assignment makes pointer from integer with=
out a cast [-Wint-conversion]
     page =3D pte_page(entry);
          ^
   mm/hugetlb.c:4178:8: error: incompatible types when assigning to type 'p=
te_t {aka struct <anonymous>}' from type 'int'
     entry =3D pte_mkyoung(entry);
           ^
   mm/hugetlb.c: In function 'hugetlb_mcopy_atomic_pte':
   mm/hugetlb.c:4311:11: error: incompatible types when assigning to type '=
pte_t {aka struct <anonymous>}' from type 'int'
     _dst_pte =3D pte_mkyoung(_dst_pte);
              ^
   mm/hugetlb.c: In function 'follow_hugetlb_page':
   mm/hugetlb.c:4402:17: error: implicit declaration of function 'is_swap_p=
te'; did you mean 'is_swap_pmd'? [-Werror=3Dimplicit-function-declaration]
      if (absent || is_swap_pte(huge_ptep_get(pte)) ||
                    ^~~~~~~~~~~
                    is_swap_pmd
   mm/hugetlb.c:4448:8: warning: assignment makes pointer from integer with=
out a cast [-Wint-conversion]
      page =3D pte_page(huge_ptep_get(pte));
           ^
   mm/hugetlb.c: In function 'hugetlb_change_protection':
   mm/hugetlb.c:4548:24: error: invalid initializer
       swp_entry_t entry =3D pte_to_swp_entry(pte);
                           ^~~~~~~~~~~~~~~~
   mm/hugetlb.c:4554:12: error: incompatible types when assigning to type '=
pte_t {aka struct <anonymous>}' from type 'int'
        newpte =3D swp_entry_to_pte(entry);
               ^
   mm/hugetlb.c:4566:8: error: incompatible types when assigning to type 'p=
te_t {aka struct <anonymous>}' from type 'int'
       pte =3D pte_mkhuge(huge_pte_modify(old_pte, newprot));
           ^
   mm/hugetlb.c: In function 'huge_pmd_share':
   mm/hugetlb.c:4843:19: error: implicit declaration of function 'pmd_alloc=
'; did you mean '__pmd_alloc'? [-Werror=3Dimplicit-function-declaration]
      return (pte_t *)pmd_alloc(mm, pud, addr);
                      ^~~~~~~~~
                      __pmd_alloc
   mm/hugetlb.c:4843:10: warning: cast to pointer from integer of different=
 size [-Wint-to-pointer-cast]
      return (pte_t *)pmd_alloc(mm, pud, addr);
             ^
   mm/hugetlb.c:4866:3: error: implicit declaration of function 'pud_popula=
te'; did you mean 'pgd_populate'? [-Werror=3Dimplicit-function-declaration]
      pud_populate(mm, pud,
      ^~~~~~~~~~~~
      pgd_populate
   mm/hugetlb.c:4874:8: warning: cast to pointer from integer of different =
size [-Wint-to-pointer-cast]
     pte =3D (pte_t *)pmd_alloc(mm, pud, addr);
           ^
   mm/hugetlb.c: In function 'huge_pmd_unshare':
   mm/hugetlb.c:4893:15: error: implicit declaration of function 'pgd_offse=
t'; did you mean 'pmd_offset'? [-Werror=3Dimplicit-function-declaration]
     pgd_t *pgd =3D pgd_offset(mm, *addr);
                  ^~~~~~~~~~
                  pmd_offset
   mm/hugetlb.c:4893:15: warning: initialization makes pointer from integer=
 without a cast [-Wint-conversion]
   In file included from include/linux/cache.h:5:0,
                    from include/linux/printk.h:9,
                    from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from mm/hugetlb.c:6:
   mm/hugetlb.c:4904:36: error: 'PTRS_PER_PTE' undeclared (first use in thi=
s function); did you mean 'PTRS_PER_P4D'?
     *addr =3D ALIGN(*addr, HPAGE_SIZE * PTRS_PER_PTE) - HPAGE_SIZE;
                                       ^
   include/uapi/linux/kernel.h:11:47: note: in definition of macro '__ALIGN=
_KERNEL_MASK'
    #define __ALIGN_KERNEL_MASK(x, mask) (((x) + (mask)) & ~(mask))
                                                  ^~~~

vim +3454 mm/hugetlb.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  3314  =

1e8f889b10d8d22 David Gibson       2006-01-06  3315  static pte_t make_huge=
_pte(struct vm_area_struct *vma, struct page *page,
1e8f889b10d8d22 David Gibson       2006-01-06  3316  				int writable)
63551ae0feaaa23 David Gibson       2005-06-21  3317  {
63551ae0feaaa23 David Gibson       2005-06-21  3318  	pte_t entry;
63551ae0feaaa23 David Gibson       2005-06-21  3319  =

1e8f889b10d8d22 David Gibson       2006-01-06  3320  	if (writable) {
106c992a5ebef28 Gerald Schaefer    2013-04-29  3321  		entry =3D huge_pte_m=
kwrite(huge_pte_mkdirty(mk_huge_pte(page,
106c992a5ebef28 Gerald Schaefer    2013-04-29  3322  					 vma->vm_page_pro=
t)));
63551ae0feaaa23 David Gibson       2005-06-21  3323  	} else {
106c992a5ebef28 Gerald Schaefer    2013-04-29  3324  		entry =3D huge_pte_w=
rprotect(mk_huge_pte(page,
106c992a5ebef28 Gerald Schaefer    2013-04-29  3325  					   vma->vm_page_p=
rot));
63551ae0feaaa23 David Gibson       2005-06-21  3326  	}
63551ae0feaaa23 David Gibson       2005-06-21 @3327  	entry =3D pte_mkyoung=
(entry);
63551ae0feaaa23 David Gibson       2005-06-21 @3328  	entry =3D pte_mkhuge(=
entry);
d9ed9faac283a3b Chris Metcalf      2012-04-01  3329  	entry =3D arch_make_h=
uge_pte(entry, vma, page, writable);
63551ae0feaaa23 David Gibson       2005-06-21  3330  =

63551ae0feaaa23 David Gibson       2005-06-21  3331  	return entry;
63551ae0feaaa23 David Gibson       2005-06-21  3332  }
63551ae0feaaa23 David Gibson       2005-06-21  3333  =

1e8f889b10d8d22 David Gibson       2006-01-06  3334  static void set_huge_p=
tep_writable(struct vm_area_struct *vma,
1e8f889b10d8d22 David Gibson       2006-01-06  3335  				   unsigned long a=
ddress, pte_t *ptep)
1e8f889b10d8d22 David Gibson       2006-01-06  3336  {
1e8f889b10d8d22 David Gibson       2006-01-06  3337  	pte_t entry;
1e8f889b10d8d22 David Gibson       2006-01-06  3338  =

106c992a5ebef28 Gerald Schaefer    2013-04-29  3339  	entry =3D huge_pte_mk=
write(huge_pte_mkdirty(huge_ptep_get(ptep)));
32f84528fbb5177 Chris Forbes       2011-07-25  3340  	if (huge_ptep_set_acc=
ess_flags(vma, address, ptep, entry, 1))
4b3073e1c53a256 Russell King       2009-12-18 @3341  		update_mmu_cache(vma=
, address, ptep);
1e8f889b10d8d22 David Gibson       2006-01-06  3342  }
1e8f889b10d8d22 David Gibson       2006-01-06  3343  =

d5ed7444dafb94b Aneesh Kumar K.V   2017-07-06  3344  bool is_hugetlb_entry_=
migration(pte_t pte)
4a705fef986231a Naoya Horiguchi    2014-06-23  3345  {
4a705fef986231a Naoya Horiguchi    2014-06-23  3346  	swp_entry_t swp;
4a705fef986231a Naoya Horiguchi    2014-06-23  3347  =

4a705fef986231a Naoya Horiguchi    2014-06-23 @3348  	if (huge_pte_none(pte=
) || pte_present(pte))
d5ed7444dafb94b Aneesh Kumar K.V   2017-07-06  3349  		return false;
4a705fef986231a Naoya Horiguchi    2014-06-23 @3350  	swp =3D pte_to_swp_en=
try(pte);
4a705fef986231a Naoya Horiguchi    2014-06-23 @3351  	if (non_swap_entry(sw=
p) && is_migration_entry(swp))
d5ed7444dafb94b Aneesh Kumar K.V   2017-07-06  3352  		return true;
4a705fef986231a Naoya Horiguchi    2014-06-23  3353  	else
d5ed7444dafb94b Aneesh Kumar K.V   2017-07-06  3354  		return false;
4a705fef986231a Naoya Horiguchi    2014-06-23  3355  }
4a705fef986231a Naoya Horiguchi    2014-06-23  3356  =

4a705fef986231a Naoya Horiguchi    2014-06-23  3357  static int is_hugetlb_=
entry_hwpoisoned(pte_t pte)
4a705fef986231a Naoya Horiguchi    2014-06-23  3358  {
4a705fef986231a Naoya Horiguchi    2014-06-23  3359  	swp_entry_t swp;
4a705fef986231a Naoya Horiguchi    2014-06-23  3360  =

4a705fef986231a Naoya Horiguchi    2014-06-23  3361  	if (huge_pte_none(pte=
) || pte_present(pte))
4a705fef986231a Naoya Horiguchi    2014-06-23  3362  		return 0;
4a705fef986231a Naoya Horiguchi    2014-06-23  3363  	swp =3D pte_to_swp_en=
try(pte);
4a705fef986231a Naoya Horiguchi    2014-06-23 @3364  	if (non_swap_entry(sw=
p) && is_hwpoison_entry(swp))
4a705fef986231a Naoya Horiguchi    2014-06-23  3365  		return 1;
4a705fef986231a Naoya Horiguchi    2014-06-23  3366  	else
4a705fef986231a Naoya Horiguchi    2014-06-23  3367  		return 0;
4a705fef986231a Naoya Horiguchi    2014-06-23  3368  }
1e8f889b10d8d22 David Gibson       2006-01-06  3369  =

63551ae0feaaa23 David Gibson       2005-06-21  3370  int copy_hugetlb_page_=
range(struct mm_struct *dst, struct mm_struct *src,
63551ae0feaaa23 David Gibson       2005-06-21  3371  			    struct vm_area_=
struct *vma)
63551ae0feaaa23 David Gibson       2005-06-21  3372  {
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3373  	pte_t *src_pte, *dst_=
pte, entry, dst_entry;
63551ae0feaaa23 David Gibson       2005-06-21  3374  	struct page *ptepage;
1c59827d1da9bcd Hugh Dickins       2005-10-19  3375  	unsigned long addr;
1e8f889b10d8d22 David Gibson       2006-01-06  3376  	int cow;
a5516438959d90b Andi Kleen         2008-07-23  3377  	struct hstate *h =3D =
hstate_vma(vma);
a5516438959d90b Andi Kleen         2008-07-23  3378  	unsigned long sz =3D =
huge_page_size(h);
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3379  	struct mmu_=
notifier_range range;
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3380  	int ret =3D 0;
1e8f889b10d8d22 David Gibson       2006-01-06  3381  =

1e8f889b10d8d22 David Gibson       2006-01-06  3382  	cow =3D (vma->vm_flag=
s & (VM_SHARED | VM_MAYWRITE)) =3D=3D VM_MAYWRITE;
63551ae0feaaa23 David Gibson       2005-06-21  3383  =

ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3384  	if (cow) {
7269f999934b289 J=C3=A9r=C3=B4me Glisse      2019-05-13  3385  		mmu_notifi=
er_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, src,
6f4f13e8d9e27ce J=C3=A9r=C3=B4me Glisse      2019-05-13  3386  					vma->vm=
_start,
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3387  					vma->vm=
_end);
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3388  		mmu_notifi=
er_invalidate_range_start(&range);
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3389  	}
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3390  =

a5516438959d90b Andi Kleen         2008-07-23  3391  	for (addr =3D vma->vm=
_start; addr < vma->vm_end; addr +=3D sz) {
cb900f412154474 Kirill A. Shutemov 2013-11-14  3392  		spinlock_t *src_ptl,=
 *dst_ptl;
7868a2087ec13ec Punit Agrawal      2017-07-06  3393  		src_pte =3D huge_pte=
_offset(src, addr, sz);
c74df32c724a165 Hugh Dickins       2005-10-29  3394  		if (!src_pte)
c74df32c724a165 Hugh Dickins       2005-10-29  3395  			continue;
a5516438959d90b Andi Kleen         2008-07-23  3396  		dst_pte =3D huge_pte=
_alloc(dst, addr, sz);
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3397  		if (!dst_pte) {
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3398  			ret =3D -ENOMEM;
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3399  			break;
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3400  		}
c5c99429fa57dcf Larry Woodman      2008-01-24  3401  =

5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3402  		/*
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3403  		 * If the pagetables=
 are shared don't copy or take references.
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3404  		 * dst_pte =3D=3D sr=
c_pte is the common case of src/dest sharing.
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3405  		 *
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3406  		 * However, src coul=
d have 'unshared' and dst shares with
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3407  		 * another vma.  If =
dst_pte !none, this implies sharing.
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3408  		 * Check here before=
 taking page table lock, and once again
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3409  		 * after taking the =
lock below.
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3410  		 */
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3411  		dst_entry =3D huge_p=
tep_get(dst_pte);
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3412  		if ((dst_pte =3D=3D =
src_pte) || !huge_pte_none(dst_entry))
c5c99429fa57dcf Larry Woodman      2008-01-24  3413  			continue;
c5c99429fa57dcf Larry Woodman      2008-01-24  3414  =

cb900f412154474 Kirill A. Shutemov 2013-11-14  3415  		dst_ptl =3D huge_pte=
_lock(h, dst, dst_pte);
cb900f412154474 Kirill A. Shutemov 2013-11-14  3416  		src_ptl =3D huge_pte=
_lockptr(h, src, src_pte);
cb900f412154474 Kirill A. Shutemov 2013-11-14  3417  		spin_lock_nested(src=
_ptl, SINGLE_DEPTH_NESTING);
4a705fef986231a Naoya Horiguchi    2014-06-23  3418  		entry =3D huge_ptep_=
get(src_pte);
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3419  		dst_entry =3D huge_p=
tep_get(dst_pte);
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3420  		if (huge_pte_none(en=
try) || !huge_pte_none(dst_entry)) {
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3421  			/*
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3422  			 * Skip if src entr=
y none.  Also, skip in the
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3423  			 * unlikely case ds=
t entry !none as this implies
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3424  			 * sharing with ano=
ther vma.
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3425  			 */
4a705fef986231a Naoya Horiguchi    2014-06-23  3426  			;
4a705fef986231a Naoya Horiguchi    2014-06-23  3427  		} else if (unlikely(=
is_hugetlb_entry_migration(entry) ||
4a705fef986231a Naoya Horiguchi    2014-06-23  3428  				    is_hugetlb_ent=
ry_hwpoisoned(entry))) {
4a705fef986231a Naoya Horiguchi    2014-06-23 @3429  			swp_entry_t swp_ent=
ry =3D pte_to_swp_entry(entry);
4a705fef986231a Naoya Horiguchi    2014-06-23  3430  =

4a705fef986231a Naoya Horiguchi    2014-06-23 @3431  			if (is_write_migrat=
ion_entry(swp_entry) && cow) {
4a705fef986231a Naoya Horiguchi    2014-06-23  3432  				/*
4a705fef986231a Naoya Horiguchi    2014-06-23  3433  				 * COW mappings re=
quire pages in both
4a705fef986231a Naoya Horiguchi    2014-06-23  3434  				 * parent and chil=
d to be set to read.
4a705fef986231a Naoya Horiguchi    2014-06-23  3435  				 */
4a705fef986231a Naoya Horiguchi    2014-06-23 @3436  				make_migration_ent=
ry_read(&swp_entry);
4a705fef986231a Naoya Horiguchi    2014-06-23 @3437  				entry =3D swp_entr=
y_to_pte(swp_entry);
e5251fd43007f9e Punit Agrawal      2017-07-06  3438  				set_huge_swap_pte_=
at(src, addr, src_pte,
e5251fd43007f9e Punit Agrawal      2017-07-06  3439  						     entry, sz);
4a705fef986231a Naoya Horiguchi    2014-06-23  3440  			}
e5251fd43007f9e Punit Agrawal      2017-07-06  3441  			set_huge_swap_pte_a=
t(dst, addr, dst_pte, entry, sz);
4a705fef986231a Naoya Horiguchi    2014-06-23  3442  		} else {
34ee645e83b60ae Joerg Roedel       2014-11-13  3443  			if (cow) {
0f10851ea475e08 J=C3=A9r=C3=B4me Glisse      2017-11-15  3444  				/*
0f10851ea475e08 J=C3=A9r=C3=B4me Glisse      2017-11-15  3445  				 * No ne=
ed to notify as we are downgrading page
0f10851ea475e08 J=C3=A9r=C3=B4me Glisse      2017-11-15  3446  				 * table=
 protection not changing it to point
0f10851ea475e08 J=C3=A9r=C3=B4me Glisse      2017-11-15  3447  				 * to a =
new page.
0f10851ea475e08 J=C3=A9r=C3=B4me Glisse      2017-11-15  3448  				 *
ad56b738c5dd223 Mike Rapoport      2018-03-21  3449  				 * See Documentati=
on/vm/mmu_notifier.rst
0f10851ea475e08 J=C3=A9r=C3=B4me Glisse      2017-11-15  3450  				 */
7f2e9525ba55b1c Gerald Schaefer    2008-04-28  3451  				huge_ptep_set_wrpr=
otect(src, addr, src_pte);
34ee645e83b60ae Joerg Roedel       2014-11-13  3452  			}
0253d634e0803a8 Naoya Horiguchi    2014-07-23  3453  			entry =3D huge_ptep=
_get(src_pte);
63551ae0feaaa23 David Gibson       2005-06-21 @3454  			ptepage =3D pte_pag=
e(entry);
63551ae0feaaa23 David Gibson       2005-06-21  3455  			get_page(ptepage);
53f9263baba69fc Kirill A. Shutemov 2016-01-15 @3456  			page_dup_rmap(ptepa=
ge, true);
63551ae0feaaa23 David Gibson       2005-06-21  3457  			set_huge_pte_at(dst=
, addr, dst_pte, entry);
5d317b2b6536592 Naoya Horiguchi    2015-11-05  3458  			hugetlb_count_add(p=
ages_per_huge_page(h), dst);
1c59827d1da9bcd Hugh Dickins       2005-10-19  3459  		}
cb900f412154474 Kirill A. Shutemov 2013-11-14  3460  		spin_unlock(src_ptl);
cb900f412154474 Kirill A. Shutemov 2013-11-14  3461  		spin_unlock(dst_ptl);
63551ae0feaaa23 David Gibson       2005-06-21  3462  	}
63551ae0feaaa23 David Gibson       2005-06-21  3463  =

e8569dd299dbc7b Andreas Sandberg   2014-01-21  3464  	if (cow)
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3465  		mmu_notifi=
er_invalidate_range_end(&range);
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3466  =

e8569dd299dbc7b Andreas Sandberg   2014-01-21  3467  	return ret;
63551ae0feaaa23 David Gibson       2005-06-21  3468  }
63551ae0feaaa23 David Gibson       2005-06-21  3469  =

24669e58477e275 Aneesh Kumar K.V   2012-07-31  3470  void __unmap_hugepage_=
range(struct mmu_gather *tlb, struct vm_area_struct *vma,
24669e58477e275 Aneesh Kumar K.V   2012-07-31  3471  			    unsigned long s=
tart, unsigned long end,
24669e58477e275 Aneesh Kumar K.V   2012-07-31  3472  			    struct page *re=
f_page)
63551ae0feaaa23 David Gibson       2005-06-21  3473  {
63551ae0feaaa23 David Gibson       2005-06-21  3474  	struct mm_struct *mm =
=3D vma->vm_mm;
63551ae0feaaa23 David Gibson       2005-06-21  3475  	unsigned long address;
c7546f8f03f5a4f David Gibson       2005-08-05  3476  	pte_t *ptep;
63551ae0feaaa23 David Gibson       2005-06-21  3477  	pte_t pte;
cb900f412154474 Kirill A. Shutemov 2013-11-14  3478  	spinlock_t *ptl;
63551ae0feaaa23 David Gibson       2005-06-21  3479  	struct page *page;
a5516438959d90b Andi Kleen         2008-07-23  3480  	struct hstate *h =3D =
hstate_vma(vma);
a5516438959d90b Andi Kleen         2008-07-23  3481  	unsigned long sz =3D =
huge_page_size(h);
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3482  	struct mmu_=
notifier_range range;
a5516438959d90b Andi Kleen         2008-07-23  3483  =

63551ae0feaaa23 David Gibson       2005-06-21  3484  	WARN_ON(!is_vm_hugetl=
b_page(vma));
a5516438959d90b Andi Kleen         2008-07-23  3485  	BUG_ON(start & ~huge_=
page_mask(h));
a5516438959d90b Andi Kleen         2008-07-23  3486  	BUG_ON(end & ~huge_pa=
ge_mask(h));
63551ae0feaaa23 David Gibson       2005-06-21  3487  =

07e326610e5634e Aneesh Kumar K.V   2016-12-12  3488  	/*
07e326610e5634e Aneesh Kumar K.V   2016-12-12  3489  	 * This is a hugetlb =
vma, all the pte entries should point
07e326610e5634e Aneesh Kumar K.V   2016-12-12  3490  	 * to huge page.
07e326610e5634e Aneesh Kumar K.V   2016-12-12  3491  	 */
ed6a79352cad00e Peter Zijlstra     2018-08-31 @3492  	tlb_change_page_size(=
tlb, sz);
24669e58477e275 Aneesh Kumar K.V   2012-07-31 @3493  	tlb_start_vma(tlb, vm=
a);
dff11abe280b47c Mike Kravetz       2018-10-05  3494  =

dff11abe280b47c Mike Kravetz       2018-10-05  3495  	/*
dff11abe280b47c Mike Kravetz       2018-10-05  3496  	 * If sharing possibl=
e, alert mmu notifiers of worst case.
dff11abe280b47c Mike Kravetz       2018-10-05  3497  	 */
6f4f13e8d9e27ce J=C3=A9r=C3=B4me Glisse      2019-05-13  3498  	mmu_notifie=
r_range_init(&range, MMU_NOTIFY_UNMAP, 0, vma, mm, start,
6f4f13e8d9e27ce J=C3=A9r=C3=B4me Glisse      2019-05-13  3499  				end);
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3500  	adjust_rang=
e_if_pmd_sharing_possible(vma, &range.start, &range.end);
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3501  	mmu_notifie=
r_invalidate_range_start(&range);
569f48b85813f05 Hillf Danton       2014-12-10  3502  	address =3D start;
569f48b85813f05 Hillf Danton       2014-12-10  3503  	for (; address < end;=
 address +=3D sz) {
7868a2087ec13ec Punit Agrawal      2017-07-06  3504  		ptep =3D huge_pte_of=
fset(mm, address, sz);
c7546f8f03f5a4f David Gibson       2005-08-05  3505  		if (!ptep)
c7546f8f03f5a4f David Gibson       2005-08-05  3506  			continue;
c7546f8f03f5a4f David Gibson       2005-08-05  3507  =

cb900f412154474 Kirill A. Shutemov 2013-11-14  3508  		ptl =3D huge_pte_loc=
k(h, mm, ptep);
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3509  		if (huge_pmd_unshare=
(mm, &address, ptep)) {
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3510  			spin_unlock(ptl);
dff11abe280b47c Mike Kravetz       2018-10-05  3511  			/*
dff11abe280b47c Mike Kravetz       2018-10-05  3512  			 * We just unmapped=
 a page of PMDs by clearing a PUD.
dff11abe280b47c Mike Kravetz       2018-10-05  3513  			 * The caller's TLB=
 flush range should cover this area.
dff11abe280b47c Mike Kravetz       2018-10-05  3514  			 */
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3515  			continue;
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3516  		}
39dde65c9940c97 Kenneth W Chen     2006-12-06  3517  =

6629326b89b6e69 Hillf Danton       2012-03-23  3518  		pte =3D huge_ptep_ge=
t(ptep);
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3519  		if (huge_pte_none(pt=
e)) {
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3520  			spin_unlock(ptl);
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3521  			continue;
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3522  		}
6629326b89b6e69 Hillf Danton       2012-03-23  3523  =

6629326b89b6e69 Hillf Danton       2012-03-23  3524  		/*
9fbc1f635fd0bd2 Naoya Horiguchi    2015-02-11  3525  		 * Migrating hugepag=
e or HWPoisoned hugepage is already
9fbc1f635fd0bd2 Naoya Horiguchi    2015-02-11  3526  		 * unmapped and its =
refcount is dropped, so just clear pte here.
6629326b89b6e69 Hillf Danton       2012-03-23  3527  		 */
9fbc1f635fd0bd2 Naoya Horiguchi    2015-02-11  3528  		if (unlikely(!pte_pr=
esent(pte))) {
9386fac34c7cbe3 Punit Agrawal      2017-07-06  3529  			huge_pte_clear(mm, =
address, ptep, sz);
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3530  			spin_unlock(ptl);
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3531  			continue;
8c4894c6bc790d0 Naoya Horiguchi    2012-12-12  3532  		}
6629326b89b6e69 Hillf Danton       2012-03-23  3533  =

6629326b89b6e69 Hillf Danton       2012-03-23  3534  		page =3D pte_page(pt=
e);
04f2cbe35699d22 Mel Gorman         2008-07-23  3535  		/*
04f2cbe35699d22 Mel Gorman         2008-07-23  3536  		 * If a reference pa=
ge is supplied, it is because a specific
04f2cbe35699d22 Mel Gorman         2008-07-23  3537  		 * page is being unm=
apped, not a range. Ensure the page we
04f2cbe35699d22 Mel Gorman         2008-07-23  3538  		 * are about to unma=
p is the actual page of interest.
04f2cbe35699d22 Mel Gorman         2008-07-23  3539  		 */
04f2cbe35699d22 Mel Gorman         2008-07-23  3540  		if (ref_page) {
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3541  			if (page !=3D ref_p=
age) {
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3542  				spin_unlock(ptl);
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3543  				continue;
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3544  			}
04f2cbe35699d22 Mel Gorman         2008-07-23  3545  			/*
04f2cbe35699d22 Mel Gorman         2008-07-23  3546  			 * Mark the VMA as =
having unmapped its page so that
04f2cbe35699d22 Mel Gorman         2008-07-23  3547  			 * future faults in=
 this VMA will fail rather than
04f2cbe35699d22 Mel Gorman         2008-07-23  3548  			 * looking like dat=
a was lost
04f2cbe35699d22 Mel Gorman         2008-07-23  3549  			 */
04f2cbe35699d22 Mel Gorman         2008-07-23  3550  			set_vma_resv_flags(=
vma, HPAGE_RESV_UNMAPPED);
04f2cbe35699d22 Mel Gorman         2008-07-23  3551  		}
04f2cbe35699d22 Mel Gorman         2008-07-23  3552  =

c7546f8f03f5a4f David Gibson       2005-08-05  3553  		pte =3D huge_ptep_ge=
t_and_clear(mm, address, ptep);
b528e4b6405b9fd Aneesh Kumar K.V   2016-12-12 @3554  		tlb_remove_huge_tlb_=
entry(h, tlb, ptep, address);
106c992a5ebef28 Gerald Schaefer    2013-04-29  3555  		if (huge_pte_dirty(p=
te))
6649a3863232eb2 Ken Chen           2007-02-08  3556  			set_page_dirty(page=
);
9e81130b7ce2305 Hillf Danton       2012-03-21  3557  =

5d317b2b6536592 Naoya Horiguchi    2015-11-05  3558  		hugetlb_count_sub(pa=
ges_per_huge_page(h), mm);
d281ee614518359 Kirill A. Shutemov 2016-01-15 @3559  		page_remove_rmap(pag=
e, true);
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3560  =

cb900f412154474 Kirill A. Shutemov 2013-11-14  3561  		spin_unlock(ptl);
e77b0852b551ffd Aneesh Kumar K.V   2016-07-26 @3562  		tlb_remove_page_size=
(tlb, page, huge_page_size(h));
24669e58477e275 Aneesh Kumar K.V   2012-07-31  3563  		/*
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3564  		 * Bail out after un=
mapping reference page if supplied
24669e58477e275 Aneesh Kumar K.V   2012-07-31  3565  		 */
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3566  		if (ref_page)
31d49da5ad01728 Aneesh Kumar K.V   2016-07-26  3567  			break;
fe1668ae5bf0145 Kenneth W Chen     2006-10-04  3568  	}
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3569  	mmu_notifie=
r_invalidate_range_end(&range);
24669e58477e275 Aneesh Kumar K.V   2012-07-31 @3570  	tlb_end_vma(tlb, vma);
^1da177e4c3f415 Linus Torvalds     2005-04-16  3571  }
63551ae0feaaa23 David Gibson       2005-06-21  3572  =

d833352a4338dc3 Mel Gorman         2012-07-31  3573  void __unmap_hugepage_=
range_final(struct mmu_gather *tlb,
d833352a4338dc3 Mel Gorman         2012-07-31  3574  			  struct vm_area_st=
ruct *vma, unsigned long start,
d833352a4338dc3 Mel Gorman         2012-07-31  3575  			  unsigned long end=
, struct page *ref_page)
d833352a4338dc3 Mel Gorman         2012-07-31  3576  {
d833352a4338dc3 Mel Gorman         2012-07-31  3577  	__unmap_hugepage_rang=
e(tlb, vma, start, end, ref_page);
d833352a4338dc3 Mel Gorman         2012-07-31  3578  =

d833352a4338dc3 Mel Gorman         2012-07-31  3579  	/*
d833352a4338dc3 Mel Gorman         2012-07-31  3580  	 * Clear this flag so=
 that x86's huge_pmd_share page_table_shareable
d833352a4338dc3 Mel Gorman         2012-07-31  3581  	 * test will fail on =
a vma being torn down, and not grab a page table
d833352a4338dc3 Mel Gorman         2012-07-31  3582  	 * on its way out.  W=
e're lucky that the flag has such an appropriate
d833352a4338dc3 Mel Gorman         2012-07-31  3583  	 * name, and can in f=
act be safely cleared here. We could clear it
d833352a4338dc3 Mel Gorman         2012-07-31  3584  	 * before the __unmap=
_hugepage_range above, but all that's necessary
c8c06efa8b55260 Davidlohr Bueso    2014-12-12  3585  	 * is to clear it bef=
ore releasing the i_mmap_rwsem. This works
d833352a4338dc3 Mel Gorman         2012-07-31  3586  	 * because in the con=
text this is called, the VMA is about to be
c8c06efa8b55260 Davidlohr Bueso    2014-12-12  3587  	 * destroyed and the =
i_mmap_rwsem is held.
d833352a4338dc3 Mel Gorman         2012-07-31  3588  	 */
d833352a4338dc3 Mel Gorman         2012-07-31  3589  	vma->vm_flags &=3D ~V=
M_MAYSHARE;
d833352a4338dc3 Mel Gorman         2012-07-31  3590  }
d833352a4338dc3 Mel Gorman         2012-07-31  3591  =

502717f4e112b18 Kenneth W Chen     2006-10-11  3592  void unmap_hugepage_ra=
nge(struct vm_area_struct *vma, unsigned long start,
04f2cbe35699d22 Mel Gorman         2008-07-23  3593  			  unsigned long end=
, struct page *ref_page)
502717f4e112b18 Kenneth W Chen     2006-10-11  3594  {
24669e58477e275 Aneesh Kumar K.V   2012-07-31  3595  	struct mm_struct *mm;
24669e58477e275 Aneesh Kumar K.V   2012-07-31 @3596  	struct mmu_gather tlb;
dff11abe280b47c Mike Kravetz       2018-10-05  3597  	unsigned long tlb_sta=
rt =3D start;
dff11abe280b47c Mike Kravetz       2018-10-05  3598  	unsigned long tlb_end=
 =3D end;
dff11abe280b47c Mike Kravetz       2018-10-05  3599  =

dff11abe280b47c Mike Kravetz       2018-10-05  3600  	/*
dff11abe280b47c Mike Kravetz       2018-10-05  3601  	 * If shared PMDs wer=
e possibly used within this vma range, adjust
dff11abe280b47c Mike Kravetz       2018-10-05  3602  	 * start/end for wors=
t case tlb flushing.
dff11abe280b47c Mike Kravetz       2018-10-05  3603  	 * Note that we can n=
ot be sure if PMDs are shared until we try to
dff11abe280b47c Mike Kravetz       2018-10-05  3604  	 * unmap pages.  Howe=
ver, we want to make sure TLB flushing covers
dff11abe280b47c Mike Kravetz       2018-10-05  3605  	 * the largest possib=
le range.
dff11abe280b47c Mike Kravetz       2018-10-05  3606  	 */
dff11abe280b47c Mike Kravetz       2018-10-05  3607  	adjust_range_if_pmd_s=
haring_possible(vma, &tlb_start, &tlb_end);
24669e58477e275 Aneesh Kumar K.V   2012-07-31  3608  =

24669e58477e275 Aneesh Kumar K.V   2012-07-31  3609  	mm =3D vma->vm_mm;
24669e58477e275 Aneesh Kumar K.V   2012-07-31  3610  =

dff11abe280b47c Mike Kravetz       2018-10-05  3611  	tlb_gather_mmu(&tlb, =
mm, tlb_start, tlb_end);
24669e58477e275 Aneesh Kumar K.V   2012-07-31  3612  	__unmap_hugepage_rang=
e(&tlb, vma, start, end, ref_page);
dff11abe280b47c Mike Kravetz       2018-10-05  3613  	tlb_finish_mmu(&tlb, =
tlb_start, tlb_end);
502717f4e112b18 Kenneth W Chen     2006-10-11  3614  }
502717f4e112b18 Kenneth W Chen     2006-10-11  3615  =


:::::: The code at line 3454 was first introduced by commit
:::::: 63551ae0feaaa23807ebea60de1901564bbef32e [PATCH] Hugepage consolidat=
ion

:::::: TO: David Gibson <david@gibson.dropbear.id.au>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1998566913481643198==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AwyXQxqwogEA
--===============1998566913481643198==--

