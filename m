Content-Type: multipart/mixed; boundary="===============5615790654268107111=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v4 1/4] mm: arch: remove indirection level in alloc_zeroed_user_highpage_movable()
Date: Sat, 29 May 2021 00:33:38 +0800
Message-ID: <202105290002.6thE9Cjr-lkp@intel.com>
In-Reply-To: <20210528010415.1852012-2-pcc@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5615790654268107111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on m68knommu/for-next s390/features tip/x86/core tip=
/perf/core linus/master v5.13-rc3 next-20210528]
[cannot apply to hnaz-linux-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Peter-Collingbourne/arm64-=
improve-efficiency-of-setting-tags-for-user-pages/20210528-090548
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for=
-next/core
config: s390-randconfig-r025-20210528 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 6505c6=
30407c5feec818f0bb1c284f9eeebf2071)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/32afff0556041349738b20190=
7c1c81cabb5ca10
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Peter-Collingbourne/arm64-improve-=
efficiency-of-setting-tags-for-user-pages/20210528-090548
        git checkout 32afff0556041349738b201907c1c81cabb5ca10
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from mm/memory.c:50:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:25:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from mac=
ro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from mm/memory.c:50:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:25:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from mm/memory.c:50:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:25:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> mm/memory.c:2891:14: error: implicit declaration of function 'alloc_zero=
ed_user_highpage_movable' [-Werror,-Wimplicit-function-declaration]
                   new_page =3D alloc_zeroed_user_highpage_movable(vma,
                              ^
>> mm/memory.c:2891:12: warning: incompatible integer to pointer conversion=
 assigning to 'struct page *' from 'int' [-Wint-conversion]
                   new_page =3D alloc_zeroed_user_highpage_movable(vma,
                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:3589:9: error: implicit declaration of function 'alloc_zeroe=
d_user_highpage_movable' [-Werror,-Wimplicit-function-declaration]
           page =3D alloc_zeroed_user_highpage_movable(vma, vmf->address);
                  ^
   mm/memory.c:3589:7: warning: incompatible integer to pointer conversion =
assigning to 'struct page *' from 'int' [-Wint-conversion]
           page =3D alloc_zeroed_user_highpage_movable(vma, vmf->address);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   14 warnings and 2 errors generated.


vim +/alloc_zeroed_user_highpage_movable +2891 mm/memory.c

4e047f89777122 Shachar Raindel    2015-04-14  2860  =

2f38ab2c3c7fef Shachar Raindel    2015-04-14  2861  /*
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2862   * Handle the case of a=
 page which we actually need to copy to a new page.
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2863   *
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08  2864   * Called with mmap_loc=
k locked and the old page referenced, but
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2865   * without the ptl held.
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2866   *
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2867   * High level logic flo=
w:
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2868   *
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2869   * - Allocate a page, c=
opy the content of the old page to the new one.
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2870   * - Handle book keepin=
g and accounting - cgroups, mmu-notifiers, etc.
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2871   * - Take the PTL. If t=
he pte changed, bail out and release the allocated page
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2872   * - If the pte is stil=
l the way we remember it, update the page table and all
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2873   *   relevant reference=
s. This includes dropping the reference the page-table
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2874   *   held to the old pa=
ge, as well as updating the rmap.
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2875   * - In any case, unloc=
k the PTL and drop the reference we took to the old page.
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2876   */
2b7403035459c7 Souptick Joarder   2018-08-23  2877  static vm_fault_t wp_pa=
ge_copy(struct vm_fault *vmf)
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2878  {
82b0f8c39a3869 Jan Kara           2016-12-14  2879  	struct vm_area_struct =
*vma =3D vmf->vma;
bae473a423f65e Kirill A. Shutemov 2016-07-26  2880  	struct mm_struct *mm =
=3D vma->vm_mm;
a41b70d6dfc28b Jan Kara           2016-12-14  2881  	struct page *old_page =
=3D vmf->page;
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2882  	struct page *new_page =
=3D NULL;
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2883  	pte_t entry;
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2884  	int page_copied =3D 0;
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse      2018-12-28  2885  	struct mmu_n=
otifier_range range;
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2886  =

2f38ab2c3c7fef Shachar Raindel    2015-04-14  2887  	if (unlikely(anon_vma_=
prepare(vma)))
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2888  		goto oom;
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2889  =

2994302bc8a171 Jan Kara           2016-12-14  2890  	if (is_zero_pfn(pte_pf=
n(vmf->orig_pte))) {
82b0f8c39a3869 Jan Kara           2016-12-14 @2891  		new_page =3D alloc_ze=
roed_user_highpage_movable(vma,
82b0f8c39a3869 Jan Kara           2016-12-14  2892  							      vmf->addre=
ss);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2893  		if (!new_page)
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2894  			goto oom;
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2895  	} else {
bae473a423f65e Kirill A. Shutemov 2016-07-26  2896  		new_page =3D alloc_pa=
ge_vma(GFP_HIGHUSER_MOVABLE, vma,
82b0f8c39a3869 Jan Kara           2016-12-14  2897  				vmf->address);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2898  		if (!new_page)
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2899  			goto oom;
83d116c53058d5 Jia He             2019-10-11  2900  =

83d116c53058d5 Jia He             2019-10-11  2901  		if (!cow_user_page(ne=
w_page, old_page, vmf)) {
83d116c53058d5 Jia He             2019-10-11  2902  			/*
83d116c53058d5 Jia He             2019-10-11  2903  			 * COW failed, if th=
e fault was solved by other,
83d116c53058d5 Jia He             2019-10-11  2904  			 * it's fine. If not=
, userspace would re-fault on
83d116c53058d5 Jia He             2019-10-11  2905  			 * the same address =
and we will handle the fault
83d116c53058d5 Jia He             2019-10-11  2906  			 * from the second a=
ttempt.
83d116c53058d5 Jia He             2019-10-11  2907  			 */
83d116c53058d5 Jia He             2019-10-11  2908  			put_page(new_page);
83d116c53058d5 Jia He             2019-10-11  2909  			if (old_page)
83d116c53058d5 Jia He             2019-10-11  2910  				put_page(old_page);
83d116c53058d5 Jia He             2019-10-11  2911  			return 0;
83d116c53058d5 Jia He             2019-10-11  2912  		}
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2913  	}
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2914  =

d9eb1ea2bf8734 Johannes Weiner    2020-06-03  2915  	if (mem_cgroup_charge(=
new_page, mm, GFP_KERNEL))
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2916  		goto oom_free_new;
9d82c69438d0df Johannes Weiner    2020-06-03  2917  	cgroup_throttle_swapra=
te(new_page, GFP_KERNEL);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2918  =

eb3c24f305e56c Mel Gorman         2015-06-24  2919  	__SetPageUptodate(new_=
page);
eb3c24f305e56c Mel Gorman         2015-06-24  2920  =

7269f999934b28 J=C3=A9r=C3=B4me Glisse      2019-05-13  2921  	mmu_notifier=
_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, mm,
6f4f13e8d9e27c J=C3=A9r=C3=B4me Glisse      2019-05-13  2922  				vmf->addr=
ess & PAGE_MASK,
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse      2018-12-28  2923  				(vmf->add=
ress & PAGE_MASK) + PAGE_SIZE);
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse      2018-12-28  2924  	mmu_notifier=
_invalidate_range_start(&range);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2925  =

2f38ab2c3c7fef Shachar Raindel    2015-04-14  2926  	/*
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2927  	 * Re-check the pte - =
we dropped the lock
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2928  	 */
82b0f8c39a3869 Jan Kara           2016-12-14  2929  	vmf->pte =3D pte_offse=
t_map_lock(mm, vmf->pmd, vmf->address, &vmf->ptl);
2994302bc8a171 Jan Kara           2016-12-14  2930  	if (likely(pte_same(*v=
mf->pte, vmf->orig_pte))) {
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2931  		if (old_page) {
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2932  			if (!PageAnon(old_pa=
ge)) {
eca56ff906bdd0 Jerome Marchand    2016-01-14  2933  				dec_mm_counter_fast=
(mm,
eca56ff906bdd0 Jerome Marchand    2016-01-14  2934  						mm_counter_file(o=
ld_page));
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2935  				inc_mm_counter_fast=
(mm, MM_ANONPAGES);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2936  			}
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2937  		} else {
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2938  			inc_mm_counter_fast(=
mm, MM_ANONPAGES);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2939  		}
2994302bc8a171 Jan Kara           2016-12-14  2940  		flush_cache_page(vma,=
 vmf->address, pte_pfn(vmf->orig_pte));
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2941  		entry =3D mk_pte(new_=
page, vma->vm_page_prot);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2942  		entry =3D maybe_mkwri=
te(pte_mkdirty(entry), vma);
111fe7186b29d1 Nicholas Piggin    2020-12-29  2943  =

2f38ab2c3c7fef Shachar Raindel    2015-04-14  2944  		/*
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2945  		 * Clear the pte entr=
y and flush it first, before updating the
111fe7186b29d1 Nicholas Piggin    2020-12-29  2946  		 * pte with the new e=
ntry, to keep TLBs on different CPUs in
111fe7186b29d1 Nicholas Piggin    2020-12-29  2947  		 * sync. This code us=
ed to set the new PTE then flush TLBs, but
111fe7186b29d1 Nicholas Piggin    2020-12-29  2948  		 * that left a window=
 where the new PTE could be loaded into
111fe7186b29d1 Nicholas Piggin    2020-12-29  2949  		 * some TLBs while th=
e old PTE remains in others.
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2950  		 */
82b0f8c39a3869 Jan Kara           2016-12-14  2951  		ptep_clear_flush_noti=
fy(vma, vmf->address, vmf->pte);
82b0f8c39a3869 Jan Kara           2016-12-14  2952  		page_add_new_anon_rma=
p(new_page, vma, vmf->address, false);
b518154e59aab3 Joonsoo Kim        2020-08-11  2953  		lru_cache_add_inactiv=
e_or_unevictable(new_page, vma);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2954  		/*
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2955  		 * We call the notify=
 macro here because, when using secondary
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2956  		 * mmu page tables (s=
uch as kvm shadow page tables), we want the
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2957  		 * new page to be map=
ped directly into the secondary page table.
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2958  		 */
82b0f8c39a3869 Jan Kara           2016-12-14  2959  		set_pte_at_notify(mm,=
 vmf->address, vmf->pte, entry);
82b0f8c39a3869 Jan Kara           2016-12-14  2960  		update_mmu_cache(vma,=
 vmf->address, vmf->pte);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2961  		if (old_page) {
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2962  			/*
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2963  			 * Only after switch=
ing the pte to the new page may
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2964  			 * we remove the map=
count here. Otherwise another
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2965  			 * process may come =
and find the rmap count decremented
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2966  			 * before the pte is=
 switched to the new page, and
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2967  			 * "reuse" the old p=
age writing into it while our pte
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2968  			 * here still points=
 into it and can be read by other
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2969  			 * threads.
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2970  			 *
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2971  			 * The critical issu=
e is to order this
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2972  			 * page_remove_rmap =
with the ptp_clear_flush above.
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2973  			 * Those stores are =
ordered by (if nothing else,)
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2974  			 * the barrier prese=
nt in the atomic_add_negative
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2975  			 * in page_remove_rm=
ap.
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2976  			 *
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2977  			 * Then the TLB flus=
h in ptep_clear_flush ensures that
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2978  			 * no process can ac=
cess the old page before the
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2979  			 * decremented mapco=
unt is visible. And the old page
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2980  			 * cannot be reused =
until after the decremented
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2981  			 * mapcount is visib=
le. So transitively, TLBs to
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2982  			 * old page will be =
flushed before it can be reused.
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2983  			 */
d281ee61451835 Kirill A. Shutemov 2016-01-15  2984  			page_remove_rmap(old=
_page, false);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2985  		}
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2986  =

2f38ab2c3c7fef Shachar Raindel    2015-04-14  2987  		/* Free the old page.=
. */
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2988  		new_page =3D old_page;
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2989  		page_copied =3D 1;
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2990  	} else {
7df676974359f9 Bibo Mao           2020-05-27  2991  		update_mmu_tlb(vma, v=
mf->address, vmf->pte);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2992  	}
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2993  =

2f38ab2c3c7fef Shachar Raindel    2015-04-14  2994  	if (new_page)
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  2995  		put_page(new_page);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  2996  =

82b0f8c39a3869 Jan Kara           2016-12-14  2997  	pte_unmap_unlock(vmf->=
pte, vmf->ptl);
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2998  	/*
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2999  	 * No need t=
o double call mmu_notifier->invalidate_range() callback as
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  3000  	 * the above=
 ptep_clear_flush_notify() did already call it.
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  3001  	 */
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse      2018-12-28  3002  	mmu_notifier=
_invalidate_range_only_end(&range);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3003  	if (old_page) {
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3004  		/*
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3005  		 * Don't let another =
task, with possibly unlocked vma,
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3006  		 * keep the mlocked p=
age.
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3007  		 */
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3008  		if (page_copied && (v=
ma->vm_flags & VM_LOCKED)) {
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3009  			lock_page(old_page);=
	/* LRU manipulation */
e90309c9f7722d Kirill A. Shutemov 2016-01-15  3010  			if (PageMlocked(old_=
page))
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3011  				munlock_vma_page(ol=
d_page);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3012  			unlock_page(old_page=
);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3013  		}
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  3014  		put_page(old_page);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3015  	}
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3016  	return page_copied ? V=
M_FAULT_WRITE : 0;
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3017  oom_free_new:
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  3018  	put_page(new_page);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3019  oom:
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3020  	if (old_page)
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  3021  		put_page(old_page);
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3022  	return VM_FAULT_OOM;
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3023  }
2f38ab2c3c7fef Shachar Raindel    2015-04-14  3024  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5615790654268107111==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5615790654268107111==--

