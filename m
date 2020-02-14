Content-Type: multipart/mixed; boundary="===============0336429143026100368=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [yhuang:autonuma-r0.7 1/36] mm/hugetlb.c:3281:29: error: implicit declaration of function 'is_migration_entry'; did you mean 'next_migration_node'?
Date: Fri, 14 Feb 2020 14:45:54 +0800
Message-ID: <202002141440.cu46Dx27%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0336429143026100368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   yhuang/autonuma-r0.7
head:   ef2554821d4d0e8bbfcbe6715e9f0a860614232a
commit: 654adef186771c484878df814ce23ba830262a09 [1/36] node: Define and ex=
port memory migration path
config: riscv-randconfig-a001-20200214 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 654adef186771c484878df814ce23ba830262a09
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Driscv =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

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
   mm/hugetlb.c:3257:10: error: implicit declaration of function 'pte_mkyou=
ng'; did you mean 'page_mapping'? [-Werror=3Dimplicit-function-declaration]
     entry =3D pte_mkyoung(entry);
             ^~~~~~~~~~~
             page_mapping
   mm/hugetlb.c:3257:8: error: incompatible types when assigning to type 'p=
te_t {aka struct <anonymous>}' from type 'int'
     entry =3D pte_mkyoung(entry);
           ^
   mm/hugetlb.c:3258:10: error: implicit declaration of function 'pte_mkhug=
e'; did you mean 'pud_huge'? [-Werror=3Dimplicit-function-declaration]
     entry =3D pte_mkhuge(entry);
             ^~~~~~~~~~
             pud_huge
   mm/hugetlb.c:3258:8: error: incompatible types when assigning to type 'p=
te_t {aka struct <anonymous>}' from type 'int'
     entry =3D pte_mkhuge(entry);
           ^
   mm/hugetlb.c: In function 'set_huge_ptep_writable':
   mm/hugetlb.c:3271:3: error: implicit declaration of function 'update_mmu=
_cache'; did you mean 'node_add_cache'? [-Werror=3Dimplicit-function-declar=
ation]
      update_mmu_cache(vma, address, ptep);
      ^~~~~~~~~~~~~~~~
      node_add_cache
   mm/hugetlb.c: In function 'is_hugetlb_entry_migration':
   mm/hugetlb.c:3278:28: error: implicit declaration of function 'pte_prese=
nt'; did you mean 'pud_present'? [-Werror=3Dimplicit-function-declaration]
     if (huge_pte_none(pte) || pte_present(pte))
                               ^~~~~~~~~~~
                               pud_present
   mm/hugetlb.c:3280:8: error: implicit declaration of function 'pte_to_swp=
_entry'; did you mean 'get_plt_entry'? [-Werror=3Dimplicit-function-declara=
tion]
     swp =3D pte_to_swp_entry(pte);
           ^~~~~~~~~~~~~~~~
           get_plt_entry
   mm/hugetlb.c:3280:6: error: incompatible types when assigning to type 's=
wp_entry_t {aka struct <anonymous>}' from type 'int'
     swp =3D pte_to_swp_entry(pte);
         ^
   mm/hugetlb.c:3281:6: error: implicit declaration of function 'non_swap_e=
ntry'; did you mean 'init_wait_entry'? [-Werror=3Dimplicit-function-declara=
tion]
     if (non_swap_entry(swp) && is_migration_entry(swp))
         ^~~~~~~~~~~~~~
         init_wait_entry
>> mm/hugetlb.c:3281:29: error: implicit declaration of function 'is_migrat=
ion_entry'; did you mean 'next_migration_node'? [-Werror=3Dimplicit-functio=
n-declaration]
     if (non_swap_entry(swp) && is_migration_entry(swp))
                                ^~~~~~~~~~~~~~~~~~
                                next_migration_node
   mm/hugetlb.c: In function 'is_hugetlb_entry_hwpoisoned':
   mm/hugetlb.c:3293:6: error: incompatible types when assigning to type 's=
wp_entry_t {aka struct <anonymous>}' from type 'int'
     swp =3D pte_to_swp_entry(pte);
         ^
   mm/hugetlb.c:3294:29: error: implicit declaration of function 'is_hwpois=
on_entry'; did you mean 'hwpoison_filter'? [-Werror=3Dimplicit-function-dec=
laration]
     if (non_swap_entry(swp) && is_hwpoison_entry(swp))
                                ^~~~~~~~~~~~~~~~~
                                hwpoison_filter
   mm/hugetlb.c: In function 'copy_hugetlb_page_range':
   mm/hugetlb.c:3359:28: error: invalid initializer
       swp_entry_t swp_entry =3D pte_to_swp_entry(entry);
                               ^~~~~~~~~~~~~~~~
>> mm/hugetlb.c:3361:8: error: implicit declaration of function 'is_write_m=
igration_entry'; did you mean 'next_migration_node'? [-Werror=3Dimplicit-fu=
nction-declaration]
       if (is_write_migration_entry(swp_entry) && cow) {
           ^~~~~~~~~~~~~~~~~~~~~~~~
           next_migration_node
>> mm/hugetlb.c:3366:5: error: implicit declaration of function 'make_migra=
tion_entry_read'; did you mean 'next_migration_node'? [-Werror=3Dimplicit-f=
unction-declaration]
        make_migration_entry_read(&swp_entry);
        ^~~~~~~~~~~~~~~~~~~~~~~~~
        next_migration_node
   mm/hugetlb.c:3367:13: error: implicit declaration of function 'swp_entry=
_to_pte'; did you mean '__d_entry_type'? [-Werror=3Dimplicit-function-decla=
ration]
        entry =3D swp_entry_to_pte(swp_entry);
                ^~~~~~~~~~~~~~~~
                __d_entry_type
   mm/hugetlb.c:3367:11: error: incompatible types when assigning to type '=
pte_t {aka struct <anonymous>}' from type 'int'
        entry =3D swp_entry_to_pte(swp_entry);
              ^
   mm/hugetlb.c:3384:14: error: implicit declaration of function 'pte_page'=
; did you mean 'put_page'? [-Werror=3Dimplicit-function-declaration]
       ptepage =3D pte_page(entry);
                 ^~~~~~~~
                 put_page
   mm/hugetlb.c:3384:12: warning: assignment makes pointer from integer wit=
hout a cast [-Wint-conversion]
       ptepage =3D pte_page(entry);
               ^
   mm/hugetlb.c:3386:4: error: implicit declaration of function 'page_dup_r=
map'; did you mean 'page_is_ram'? [-Werror=3Dimplicit-function-declaration]
       page_dup_rmap(ptepage, true);
       ^~~~~~~~~~~~~
       page_is_ram
   mm/hugetlb.c: In function '__unmap_hugepage_range':
   mm/hugetlb.c:3422:2: error: implicit declaration of function 'tlb_change=
_page_size'; did you mean 'huge_page_size'? [-Werror=3Dimplicit-function-de=
claration]
     tlb_change_page_size(tlb, sz);
     ^~~~~~~~~~~~~~~~~~~~
     huge_page_size
   mm/hugetlb.c:3423:2: error: implicit declaration of function 'tlb_start_=
vma'; did you mean 'hstate_vma'? [-Werror=3Dimplicit-function-declaration]
     tlb_start_vma(tlb, vma);
     ^~~~~~~~~~~~~
     hstate_vma
   mm/hugetlb.c:3464:8: warning: assignment makes pointer from integer with=
out a cast [-Wint-conversion]
      page =3D pte_page(pte);
           ^
   mm/hugetlb.c:3484:3: error: implicit declaration of function 'tlb_remove=
_huge_tlb_entry'; did you mean 'move_hugetlb_state'? [-Werror=3Dimplicit-fu=
nction-declaration]
      tlb_remove_huge_tlb_entry(h, tlb, ptep, address);
      ^~~~~~~~~~~~~~~~~~~~~~~~~
      move_hugetlb_state
   mm/hugetlb.c:3489:3: error: implicit declaration of function 'page_remov=
e_rmap'; did you mean 'page_anon_vma'? [-Werror=3Dimplicit-function-declara=
tion]
      page_remove_rmap(page, true);
      ^~~~~~~~~~~~~~~~
      page_anon_vma
   mm/hugetlb.c:3492:3: error: implicit declaration of function 'tlb_remove=
_page_size'; did you mean 'vma_mmu_pagesize'? [-Werror=3Dimplicit-function-=
declaration]
      tlb_remove_page_size(tlb, page, huge_page_size(h));
      ^~~~~~~~~~~~~~~~~~~~
      vma_mmu_pagesize
   mm/hugetlb.c:3500:2: error: implicit declaration of function 'tlb_end_vm=
a'; did you mean 'find_vma'? [-Werror=3Dimplicit-function-declaration]
     tlb_end_vma(tlb, vma);
     ^~~~~~~~~~~
     find_vma
   mm/hugetlb.c: In function 'unmap_hugepage_range':
   mm/hugetlb.c:3526:20: error: storage size of 'tlb' isn't known
     struct mmu_gather tlb;
                       ^~~
   mm/hugetlb.c:3526:20: warning: unused variable 'tlb' [-Wunused-variable]
   mm/hugetlb.c: In function 'hugetlb_cow':
   mm/hugetlb.c:3621:11: warning: assignment makes pointer from integer wit=
hout a cast [-Wint-conversion]
     old_page =3D pte_page(pte);
              ^
   mm/hugetlb.c:3627:3: error: implicit declaration of function 'page_move_=
anon_rmap'; did you mean 'page_anon_vma'? [-Werror=3Dimplicit-function-decl=
aration]
      page_move_anon_rmap(old_page, vma);
      ^~~~~~~~~~~~~~~~~~~
      page_anon_vma
   In file included from include/linux/kernel.h:11:0,
                    from include/linux/list.h:9,
                    from mm/hugetlb.c:6:
   mm/hugetlb.c:3670:8: error: implicit declaration of function 'pte_same';=
 did you mean 'pte_val'? [-Werror=3Dimplicit-function-declaration]
           pte_same(huge_ptep_get(ptep), pte)))
           ^
   include/linux/compiler.h:33:34: note: in definition of macro '__branch_c=
heck__'
       ______r =3D __builtin_expect(!!(x), expect); \
                                     ^
   mm/hugetlb.c:3669:8: note: in expansion of macro 'likely'
       if (likely(ptep &&
           ^~~~~~
   mm/hugetlb.c:3715:3: error: implicit declaration of function 'hugepage_a=
dd_new_anon_rmap'; did you mean 'hugepage_new_subpool'? [-Werror=3Dimplicit=
-function-declaration]
      hugepage_add_new_anon_rmap(new_page, vma, haddr);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~
      hugepage_new_subpool
   mm/hugetlb.c: In function 'hugetlb_fault':
   mm/hugetlb.c:4017:4: error: implicit declaration of function 'migration_=
entry_wait_huge' [-Werror=3Dimplicit-function-declaration]
       migration_entry_wait_huge(vma, mm, ptep);
       ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:4089:7: warning: assignment makes pointer from integer with=
out a cast [-Wint-conversion]
     page =3D pte_page(entry);
          ^
   mm/hugetlb.c:4106:8: error: incompatible types when assigning to type 'p=
te_t {aka struct <anonymous>}' from type 'int'
     entry =3D pte_mkyoung(entry);
           ^
   mm/hugetlb.c: In function 'hugetlb_mcopy_atomic_pte':
   mm/hugetlb.c:4239:11: error: incompatible types when assigning to type '=
pte_t {aka struct <anonymous>}' from type 'int'
     _dst_pte =3D pte_mkyoung(_dst_pte);
              ^
   mm/hugetlb.c: In function 'follow_hugetlb_page':
   mm/hugetlb.c:4330:17: error: implicit declaration of function 'is_swap_p=
te'; did you mean 'is_swap_pmd'? [-Werror=3Dimplicit-function-declaration]
      if (absent || is_swap_pte(huge_ptep_get(pte)) ||
                    ^~~~~~~~~~~
                    is_swap_pmd
   mm/hugetlb.c:4376:8: warning: assignment makes pointer from integer with=
out a cast [-Wint-conversion]
      page =3D pte_page(huge_ptep_get(pte));
           ^

vim +3281 mm/hugetlb.c

1e8f889b10d8d22 David Gibson       2006-01-06  3273  =

d5ed7444dafb94b Aneesh Kumar K.V   2017-07-06  3274  bool is_hugetlb_entry_=
migration(pte_t pte)
4a705fef986231a Naoya Horiguchi    2014-06-23  3275  {
4a705fef986231a Naoya Horiguchi    2014-06-23  3276  	swp_entry_t swp;
4a705fef986231a Naoya Horiguchi    2014-06-23  3277  =

4a705fef986231a Naoya Horiguchi    2014-06-23  3278  	if (huge_pte_none(pte=
) || pte_present(pte))
d5ed7444dafb94b Aneesh Kumar K.V   2017-07-06  3279  		return false;
4a705fef986231a Naoya Horiguchi    2014-06-23 @3280  	swp =3D pte_to_swp_en=
try(pte);
4a705fef986231a Naoya Horiguchi    2014-06-23 @3281  	if (non_swap_entry(sw=
p) && is_migration_entry(swp))
d5ed7444dafb94b Aneesh Kumar K.V   2017-07-06  3282  		return true;
4a705fef986231a Naoya Horiguchi    2014-06-23  3283  	else
d5ed7444dafb94b Aneesh Kumar K.V   2017-07-06  3284  		return false;
4a705fef986231a Naoya Horiguchi    2014-06-23  3285  }
4a705fef986231a Naoya Horiguchi    2014-06-23  3286  =

4a705fef986231a Naoya Horiguchi    2014-06-23  3287  static int is_hugetlb_=
entry_hwpoisoned(pte_t pte)
4a705fef986231a Naoya Horiguchi    2014-06-23  3288  {
4a705fef986231a Naoya Horiguchi    2014-06-23  3289  	swp_entry_t swp;
4a705fef986231a Naoya Horiguchi    2014-06-23  3290  =

4a705fef986231a Naoya Horiguchi    2014-06-23  3291  	if (huge_pte_none(pte=
) || pte_present(pte))
4a705fef986231a Naoya Horiguchi    2014-06-23  3292  		return 0;
4a705fef986231a Naoya Horiguchi    2014-06-23  3293  	swp =3D pte_to_swp_en=
try(pte);
4a705fef986231a Naoya Horiguchi    2014-06-23 @3294  	if (non_swap_entry(sw=
p) && is_hwpoison_entry(swp))
4a705fef986231a Naoya Horiguchi    2014-06-23  3295  		return 1;
4a705fef986231a Naoya Horiguchi    2014-06-23  3296  	else
4a705fef986231a Naoya Horiguchi    2014-06-23  3297  		return 0;
4a705fef986231a Naoya Horiguchi    2014-06-23  3298  }
1e8f889b10d8d22 David Gibson       2006-01-06  3299  =

63551ae0feaaa23 David Gibson       2005-06-21  3300  int copy_hugetlb_page_=
range(struct mm_struct *dst, struct mm_struct *src,
63551ae0feaaa23 David Gibson       2005-06-21  3301  			    struct vm_area_=
struct *vma)
63551ae0feaaa23 David Gibson       2005-06-21  3302  {
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3303  	pte_t *src_pte, *dst_=
pte, entry, dst_entry;
63551ae0feaaa23 David Gibson       2005-06-21  3304  	struct page *ptepage;
1c59827d1da9bcd Hugh Dickins       2005-10-19  3305  	unsigned long addr;
1e8f889b10d8d22 David Gibson       2006-01-06  3306  	int cow;
a5516438959d90b Andi Kleen         2008-07-23  3307  	struct hstate *h =3D =
hstate_vma(vma);
a5516438959d90b Andi Kleen         2008-07-23  3308  	unsigned long sz =3D =
huge_page_size(h);
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3309  	struct mmu_=
notifier_range range;
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3310  	int ret =3D 0;
1e8f889b10d8d22 David Gibson       2006-01-06  3311  =

1e8f889b10d8d22 David Gibson       2006-01-06  3312  	cow =3D (vma->vm_flag=
s & (VM_SHARED | VM_MAYWRITE)) =3D=3D VM_MAYWRITE;
63551ae0feaaa23 David Gibson       2005-06-21  3313  =

ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3314  	if (cow) {
7269f999934b289 J=C3=A9r=C3=B4me Glisse      2019-05-13  3315  		mmu_notifi=
er_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, src,
6f4f13e8d9e27ce J=C3=A9r=C3=B4me Glisse      2019-05-13  3316  					vma->vm=
_start,
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3317  					vma->vm=
_end);
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3318  		mmu_notifi=
er_invalidate_range_start(&range);
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3319  	}
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3320  =

a5516438959d90b Andi Kleen         2008-07-23  3321  	for (addr =3D vma->vm=
_start; addr < vma->vm_end; addr +=3D sz) {
cb900f412154474 Kirill A. Shutemov 2013-11-14  3322  		spinlock_t *src_ptl,=
 *dst_ptl;
7868a2087ec13ec Punit Agrawal      2017-07-06  3323  		src_pte =3D huge_pte=
_offset(src, addr, sz);
c74df32c724a165 Hugh Dickins       2005-10-29  3324  		if (!src_pte)
c74df32c724a165 Hugh Dickins       2005-10-29  3325  			continue;
a5516438959d90b Andi Kleen         2008-07-23  3326  		dst_pte =3D huge_pte=
_alloc(dst, addr, sz);
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3327  		if (!dst_pte) {
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3328  			ret =3D -ENOMEM;
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3329  			break;
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3330  		}
c5c99429fa57dcf Larry Woodman      2008-01-24  3331  =

5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3332  		/*
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3333  		 * If the pagetables=
 are shared don't copy or take references.
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3334  		 * dst_pte =3D=3D sr=
c_pte is the common case of src/dest sharing.
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3335  		 *
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3336  		 * However, src coul=
d have 'unshared' and dst shares with
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3337  		 * another vma.  If =
dst_pte !none, this implies sharing.
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3338  		 * Check here before=
 taking page table lock, and once again
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3339  		 * after taking the =
lock below.
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3340  		 */
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3341  		dst_entry =3D huge_p=
tep_get(dst_pte);
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3342  		if ((dst_pte =3D=3D =
src_pte) || !huge_pte_none(dst_entry))
c5c99429fa57dcf Larry Woodman      2008-01-24  3343  			continue;
c5c99429fa57dcf Larry Woodman      2008-01-24  3344  =

cb900f412154474 Kirill A. Shutemov 2013-11-14  3345  		dst_ptl =3D huge_pte=
_lock(h, dst, dst_pte);
cb900f412154474 Kirill A. Shutemov 2013-11-14  3346  		src_ptl =3D huge_pte=
_lockptr(h, src, src_pte);
cb900f412154474 Kirill A. Shutemov 2013-11-14  3347  		spin_lock_nested(src=
_ptl, SINGLE_DEPTH_NESTING);
4a705fef986231a Naoya Horiguchi    2014-06-23  3348  		entry =3D huge_ptep_=
get(src_pte);
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3349  		dst_entry =3D huge_p=
tep_get(dst_pte);
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3350  		if (huge_pte_none(en=
try) || !huge_pte_none(dst_entry)) {
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3351  			/*
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3352  			 * Skip if src entr=
y none.  Also, skip in the
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3353  			 * unlikely case ds=
t entry !none as this implies
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3354  			 * sharing with ano=
ther vma.
5e41540c8a0f0e9 Mike Kravetz       2018-11-16  3355  			 */
4a705fef986231a Naoya Horiguchi    2014-06-23  3356  			;
4a705fef986231a Naoya Horiguchi    2014-06-23  3357  		} else if (unlikely(=
is_hugetlb_entry_migration(entry) ||
4a705fef986231a Naoya Horiguchi    2014-06-23  3358  				    is_hugetlb_ent=
ry_hwpoisoned(entry))) {
4a705fef986231a Naoya Horiguchi    2014-06-23 @3359  			swp_entry_t swp_ent=
ry =3D pte_to_swp_entry(entry);
4a705fef986231a Naoya Horiguchi    2014-06-23  3360  =

4a705fef986231a Naoya Horiguchi    2014-06-23 @3361  			if (is_write_migrat=
ion_entry(swp_entry) && cow) {
4a705fef986231a Naoya Horiguchi    2014-06-23  3362  				/*
4a705fef986231a Naoya Horiguchi    2014-06-23  3363  				 * COW mappings re=
quire pages in both
4a705fef986231a Naoya Horiguchi    2014-06-23  3364  				 * parent and chil=
d to be set to read.
4a705fef986231a Naoya Horiguchi    2014-06-23  3365  				 */
4a705fef986231a Naoya Horiguchi    2014-06-23 @3366  				make_migration_ent=
ry_read(&swp_entry);
4a705fef986231a Naoya Horiguchi    2014-06-23  3367  				entry =3D swp_entr=
y_to_pte(swp_entry);
e5251fd43007f9e Punit Agrawal      2017-07-06  3368  				set_huge_swap_pte_=
at(src, addr, src_pte,
e5251fd43007f9e Punit Agrawal      2017-07-06  3369  						     entry, sz);
4a705fef986231a Naoya Horiguchi    2014-06-23  3370  			}
e5251fd43007f9e Punit Agrawal      2017-07-06  3371  			set_huge_swap_pte_a=
t(dst, addr, dst_pte, entry, sz);
4a705fef986231a Naoya Horiguchi    2014-06-23  3372  		} else {
34ee645e83b60ae Joerg Roedel       2014-11-13  3373  			if (cow) {
0f10851ea475e08 J=C3=A9r=C3=B4me Glisse      2017-11-15  3374  				/*
0f10851ea475e08 J=C3=A9r=C3=B4me Glisse      2017-11-15  3375  				 * No ne=
ed to notify as we are downgrading page
0f10851ea475e08 J=C3=A9r=C3=B4me Glisse      2017-11-15  3376  				 * table=
 protection not changing it to point
0f10851ea475e08 J=C3=A9r=C3=B4me Glisse      2017-11-15  3377  				 * to a =
new page.
0f10851ea475e08 J=C3=A9r=C3=B4me Glisse      2017-11-15  3378  				 *
ad56b738c5dd223 Mike Rapoport      2018-03-21  3379  				 * See Documentati=
on/vm/mmu_notifier.rst
0f10851ea475e08 J=C3=A9r=C3=B4me Glisse      2017-11-15  3380  				 */
7f2e9525ba55b1c Gerald Schaefer    2008-04-28  3381  				huge_ptep_set_wrpr=
otect(src, addr, src_pte);
34ee645e83b60ae Joerg Roedel       2014-11-13  3382  			}
0253d634e0803a8 Naoya Horiguchi    2014-07-23  3383  			entry =3D huge_ptep=
_get(src_pte);
63551ae0feaaa23 David Gibson       2005-06-21  3384  			ptepage =3D pte_pag=
e(entry);
63551ae0feaaa23 David Gibson       2005-06-21  3385  			get_page(ptepage);
53f9263baba69fc Kirill A. Shutemov 2016-01-15  3386  			page_dup_rmap(ptepa=
ge, true);
63551ae0feaaa23 David Gibson       2005-06-21  3387  			set_huge_pte_at(dst=
, addr, dst_pte, entry);
5d317b2b6536592 Naoya Horiguchi    2015-11-05  3388  			hugetlb_count_add(p=
ages_per_huge_page(h), dst);
1c59827d1da9bcd Hugh Dickins       2005-10-19  3389  		}
cb900f412154474 Kirill A. Shutemov 2013-11-14  3390  		spin_unlock(src_ptl);
cb900f412154474 Kirill A. Shutemov 2013-11-14  3391  		spin_unlock(dst_ptl);
63551ae0feaaa23 David Gibson       2005-06-21  3392  	}
63551ae0feaaa23 David Gibson       2005-06-21  3393  =

e8569dd299dbc7b Andreas Sandberg   2014-01-21  3394  	if (cow)
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  3395  		mmu_notifi=
er_invalidate_range_end(&range);
e8569dd299dbc7b Andreas Sandberg   2014-01-21  3396  =

e8569dd299dbc7b Andreas Sandberg   2014-01-21  3397  	return ret;
63551ae0feaaa23 David Gibson       2005-06-21  3398  }
63551ae0feaaa23 David Gibson       2005-06-21  3399  =


:::::: The code at line 3281 was first introduced by commit
:::::: 4a705fef986231a3e7a6b1a6d3c37025f021f49f hugetlb: fix copy_hugetlb_p=
age_range() to handle migration/hwpoisoned entry

:::::: TO: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0336429143026100368==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
/wBmOUgeYKsBAA==
--===============0336429143026100368==--

