Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1640D7CF39
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 23:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721431495; cv=none; b=gOw+akCEnte4+/LGcy5dvSoOjq6RpnOylTtu07OqD9pnk141hUixYhVqt5ET9GKqDhxB2ZAECcM8O2TGQjQ3tR2o7eYpFKBMtB+jRX7Z4rmP/BMZQzVX+SnAaioGFHF4X64bmt2NtemIRB7x9uQ9fgt2Z4XVO7hLP00sCzKaCwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721431495; c=relaxed/simple;
	bh=E7ZuH/beHxDbTF4xauJ88sFIEgRdhfqFmt3CVhiBn28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O2QF2e0S8B+0YSzWFpN33JhkdhbzLIXRwKr5DR3AD9NvWo9DTry3TFJfj0mYEnG4eSY17Cw8rr9j0ZGP0DQX72eT5YmMW3re46u2+SOa2veqpuA95RzpaW0000ZGOAwYCuF4QiSCk2B42o4kI9Ubv3V+mfyAYSVyS9Ju7Ytkvag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLDpuVhU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLDpuVhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721431491; x=1752967491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E7ZuH/beHxDbTF4xauJ88sFIEgRdhfqFmt3CVhiBn28=;
  b=RLDpuVhUjav+0tJ93gtkPFeYd629sfNR2gRfZz9FeiillBL+/JDQKcxN
   7REUkUn+8IUyI97NLoBYv1K0v4r5hn/C94CAgQONqx8s2PIJpDS4yVgMi
   C0A5jdLD8jseyAPT+aMP+IxNYueVVSvIA52eQkm4zl6FXr8wIKQ8N7Rk6
   6YHdh9E0zb9a8IpSMUQA3K3JFWO5Sq/iCy21qNY1ESzYdWsx6EHOJzCw8
   UN7xsOKC29dHWa0CleRCcn1nTG8KVWyWGsgWX3A1PB5L5N/e2+Liz7u+X
   jztZNkYIiR+/LfZwI+9nw1Nq3s26xNko1s3XuRGNbOgW9dQ89GSKKROFL
   w==;
X-CSE-ConnectionGUID: lzpCHb6oTVK+yi6Vr/SeZQ==
X-CSE-MsgGUID: iDu3wQumQtGKwoN8mAEQaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="12628368"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="12628368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 16:24:50 -0700
X-CSE-ConnectionGUID: vbQ6VIWSSJOWbCPkvXguCA==
X-CSE-MsgGUID: hkIysDeuSKaOVODFjG0sbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="81896808"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Jul 2024 16:24:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUwxy-000ifQ-2K;
	Fri, 19 Jul 2024 23:24:46 +0000
Date: Sat, 20 Jul 2024 07:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable3 32/35] mm/memory.c:194:27: error: passing
 argument 2 of 'pte_free' from incompatible pointer type
Message-ID: <202407200719.Ob6zJQsn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable3
head:   3fb6eb9b0272c82ed231fdf2a20f6b6d265c4259
commit: af61d3794790e45fe26bdc10599fd86281d03fd3 [32/35] mm/pgtable: return ptdesc in pte_free
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407200719.Ob6zJQsn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200719.Ob6zJQsn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200719.Ob6zJQsn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:88:
   mm/memory.c: In function 'free_pte_range':
>> mm/memory.c:194:27: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
     194 |         pte_free_tlb(tlb, token, addr);
         |                           ^~~~~
         |                           |
         |                           pgtable_t {aka struct page *}
   arch/parisc/include/asm/tlb.h:10:61: note: in definition of macro '__pte_free_tlb'
      10 | #define __pte_free_tlb(tlb, pte, addr)  pte_free((tlb)->mm, pte)
         |                                                             ^~~
   mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
     194 |         pte_free_tlb(tlb, token, addr);
         |         ^~~~~~~~~~~~
   In file included from arch/parisc/include/asm/pgalloc.h:16,
                    from mm/memory.c:86:
   include/asm-generic/pgalloc.h:108:66: note: expected 'struct ptdesc *' but argument is of type 'pgtable_t' {aka 'struct page *'}
     108 | static inline void pte_free(struct mm_struct *mm, struct ptdesc *ptdesc)
         |                                                   ~~~~~~~~~~~~~~~^~~~~~


vim +/pte_free +194 mm/memory.c

b3d1411b6726ea Joel Fernandes (Google  2019-11-30   83) 
6952b61de99840 Alexey Dobriyan         2009-09-18   84  #include <asm/io.h>
33a709b25a760b Dave Hansen             2016-02-12   85  #include <asm/mmu_context.h>
^1da177e4c3f41 Linus Torvalds          2005-04-16   86  #include <asm/pgalloc.h>
7c0f6ba682b9c7 Linus Torvalds          2016-12-24   87  #include <linux/uaccess.h>
^1da177e4c3f41 Linus Torvalds          2005-04-16  @88  #include <asm/tlb.h>
^1da177e4c3f41 Linus Torvalds          2005-04-16   89  #include <asm/tlbflush.h>
^1da177e4c3f41 Linus Torvalds          2005-04-16   90  
e80d3909be42f7 Joerg Roedel            2020-09-04   91  #include "pgalloc-track.h"
42b7772812d15b Jan Beulich             2008-07-23   92  #include "internal.h"
014bb1de4fc17d NeilBrown               2022-05-09   93  #include "swap.h"
42b7772812d15b Jan Beulich             2008-07-23   94  
af27d9403f5b80 Arnd Bergmann           2018-02-16   95  #if defined(LAST_CPUPID_NOT_IN_PAGE_FLAGS) && !defined(CONFIG_COMPILE_TEST)
90572890d20252 Peter Zijlstra          2013-10-07   96  #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid.
75980e97daccfc Peter Zijlstra          2013-02-22   97  #endif
75980e97daccfc Peter Zijlstra          2013-02-22   98  
a9ee6cf5c60ed1 Mike Rapoport           2021-06-28   99  #ifndef CONFIG_NUMA
^1da177e4c3f41 Linus Torvalds          2005-04-16  100  unsigned long max_mapnr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  101  EXPORT_SYMBOL(max_mapnr);
166f61b9435a1b Tobin C Harding         2017-02-24  102  
166f61b9435a1b Tobin C Harding         2017-02-24  103  struct page *mem_map;
^1da177e4c3f41 Linus Torvalds          2005-04-16  104  EXPORT_SYMBOL(mem_map);
^1da177e4c3f41 Linus Torvalds          2005-04-16  105  #endif
^1da177e4c3f41 Linus Torvalds          2005-04-16  106  
5c041f5d1f23d3 Peter Xu                2022-05-12  107  static vm_fault_t do_fault(struct vm_fault *vmf);
2bad466cc9d9b4 Peter Xu                2023-03-09  108  static vm_fault_t do_anonymous_page(struct vm_fault *vmf);
2bad466cc9d9b4 Peter Xu                2023-03-09  109  static bool vmf_pte_changed(struct vm_fault *vmf);
2bad466cc9d9b4 Peter Xu                2023-03-09  110  
2bad466cc9d9b4 Peter Xu                2023-03-09  111  /*
2bad466cc9d9b4 Peter Xu                2023-03-09  112   * Return true if the original pte was a uffd-wp pte marker (so the pte was
2bad466cc9d9b4 Peter Xu                2023-03-09  113   * wr-protected).
2bad466cc9d9b4 Peter Xu                2023-03-09  114   */
6ed31ba3921162 Kefeng Wang             2024-04-22  115  static __always_inline bool vmf_orig_pte_uffd_wp(struct vm_fault *vmf)
2bad466cc9d9b4 Peter Xu                2023-03-09  116  {
6ed31ba3921162 Kefeng Wang             2024-04-22  117  	if (!userfaultfd_wp(vmf->vma))
6ed31ba3921162 Kefeng Wang             2024-04-22  118  		return false;
2bad466cc9d9b4 Peter Xu                2023-03-09  119  	if (!(vmf->flags & FAULT_FLAG_ORIG_PTE_VALID))
2bad466cc9d9b4 Peter Xu                2023-03-09  120  		return false;
2bad466cc9d9b4 Peter Xu                2023-03-09  121  
2bad466cc9d9b4 Peter Xu                2023-03-09  122  	return pte_marker_uffd_wp(vmf->orig_pte);
2bad466cc9d9b4 Peter Xu                2023-03-09  123  }
5c041f5d1f23d3 Peter Xu                2022-05-12  124  
^1da177e4c3f41 Linus Torvalds          2005-04-16  125  /*
^1da177e4c3f41 Linus Torvalds          2005-04-16  126   * A number of key systems in x86 including ioremap() rely on the assumption
^1da177e4c3f41 Linus Torvalds          2005-04-16  127   * that high_memory defines the upper bound on direct map memory, then end
e99fb98d478a04 Kefeng Wang             2023-12-22  128   * of ZONE_NORMAL.
^1da177e4c3f41 Linus Torvalds          2005-04-16  129   */
^1da177e4c3f41 Linus Torvalds          2005-04-16  130  void *high_memory;
^1da177e4c3f41 Linus Torvalds          2005-04-16  131  EXPORT_SYMBOL(high_memory);
^1da177e4c3f41 Linus Torvalds          2005-04-16  132  
32a932332c8bad Ingo Molnar             2008-02-06  133  /*
32a932332c8bad Ingo Molnar             2008-02-06  134   * Randomize the address space (stacks, mmaps, brk, etc.).
32a932332c8bad Ingo Molnar             2008-02-06  135   *
32a932332c8bad Ingo Molnar             2008-02-06  136   * ( When CONFIG_COMPAT_BRK=y we exclude brk from randomization,
32a932332c8bad Ingo Molnar             2008-02-06  137   *   as ancient (libc5 based) binaries can segfault. )
32a932332c8bad Ingo Molnar             2008-02-06  138   */
32a932332c8bad Ingo Molnar             2008-02-06  139  int randomize_va_space __read_mostly =
32a932332c8bad Ingo Molnar             2008-02-06  140  #ifdef CONFIG_COMPAT_BRK
32a932332c8bad Ingo Molnar             2008-02-06  141  					1;
32a932332c8bad Ingo Molnar             2008-02-06  142  #else
32a932332c8bad Ingo Molnar             2008-02-06  143  					2;
32a932332c8bad Ingo Molnar             2008-02-06  144  #endif
a62eaf151d9cb4 Andi Kleen              2006-02-16  145  
46bdb4277f98e7 Will Deacon             2020-11-24  146  #ifndef arch_wants_old_prefaulted_pte
46bdb4277f98e7 Will Deacon             2020-11-24  147  static inline bool arch_wants_old_prefaulted_pte(void)
46bdb4277f98e7 Will Deacon             2020-11-24  148  {
46bdb4277f98e7 Will Deacon             2020-11-24  149  	/*
46bdb4277f98e7 Will Deacon             2020-11-24  150  	 * Transitioning a PTE from 'old' to 'young' can be expensive on
46bdb4277f98e7 Will Deacon             2020-11-24  151  	 * some architectures, even if it's performed in hardware. By
46bdb4277f98e7 Will Deacon             2020-11-24  152  	 * default, "false" means prefaulted entries will be 'young'.
46bdb4277f98e7 Will Deacon             2020-11-24  153  	 */
46bdb4277f98e7 Will Deacon             2020-11-24  154  	return false;
46bdb4277f98e7 Will Deacon             2020-11-24  155  }
46bdb4277f98e7 Will Deacon             2020-11-24  156  #endif
46bdb4277f98e7 Will Deacon             2020-11-24  157  
a62eaf151d9cb4 Andi Kleen              2006-02-16  158  static int __init disable_randmaps(char *s)
a62eaf151d9cb4 Andi Kleen              2006-02-16  159  {
a62eaf151d9cb4 Andi Kleen              2006-02-16  160  	randomize_va_space = 0;
9b41046cd0ee0a OGAWA Hirofumi          2006-03-31  161  	return 1;
a62eaf151d9cb4 Andi Kleen              2006-02-16  162  }
a62eaf151d9cb4 Andi Kleen              2006-02-16  163  __setup("norandmaps", disable_randmaps);
a62eaf151d9cb4 Andi Kleen              2006-02-16  164  
62eede62dafb4a Hugh Dickins            2009-09-21  165  unsigned long zero_pfn __read_mostly;
0b70068e47e8f0 Ard Biesheuvel          2014-09-12  166  EXPORT_SYMBOL(zero_pfn);
0b70068e47e8f0 Ard Biesheuvel          2014-09-12  167  
166f61b9435a1b Tobin C Harding         2017-02-24  168  unsigned long highest_memmap_pfn __read_mostly;
166f61b9435a1b Tobin C Harding         2017-02-24  169  
a13ea5b759645a Hugh Dickins            2009-09-21  170  /*
a13ea5b759645a Hugh Dickins            2009-09-21  171   * CONFIG_MMU architectures set up ZERO_PAGE in their paging_init()
a13ea5b759645a Hugh Dickins            2009-09-21  172   */
a13ea5b759645a Hugh Dickins            2009-09-21  173  static int __init init_zero_pfn(void)
a13ea5b759645a Hugh Dickins            2009-09-21  174  {
a13ea5b759645a Hugh Dickins            2009-09-21  175  	zero_pfn = page_to_pfn(ZERO_PAGE(0));
a13ea5b759645a Hugh Dickins            2009-09-21  176  	return 0;
a13ea5b759645a Hugh Dickins            2009-09-21  177  }
e720e7d0e983bf Ilya Lipnitskiy         2021-03-29  178  early_initcall(init_zero_pfn);
a62eaf151d9cb4 Andi Kleen              2006-02-16  179  
f1a7941243c102 Shakeel Butt            2022-10-24  180  void mm_trace_rss_stat(struct mm_struct *mm, int member)
b3d1411b6726ea Joel Fernandes (Google  2019-11-30  181) {
f1a7941243c102 Shakeel Butt            2022-10-24  182  	trace_rss_stat(mm, member);
b3d1411b6726ea Joel Fernandes (Google  2019-11-30  183) }
d559db086ff5be KAMEZAWA Hiroyuki       2010-03-05  184  
^1da177e4c3f41 Linus Torvalds          2005-04-16  185  /*
^1da177e4c3f41 Linus Torvalds          2005-04-16  186   * Note: this doesn't free the actual pages themselves. That
^1da177e4c3f41 Linus Torvalds          2005-04-16  187   * has been handled earlier when unmapping all the memory regions.
^1da177e4c3f41 Linus Torvalds          2005-04-16  188   */
9e1b32caa525cb Benjamin Herrenschmidt  2009-07-22  189  static void free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
9e1b32caa525cb Benjamin Herrenschmidt  2009-07-22  190  			   unsigned long addr)
^1da177e4c3f41 Linus Torvalds          2005-04-16  191  {
2f569afd9ced9e Martin Schwidefsky      2008-02-08  192  	pgtable_t token = pmd_pgtable(*pmd);
^1da177e4c3f41 Linus Torvalds          2005-04-16  193  	pmd_clear(pmd);
9e1b32caa525cb Benjamin Herrenschmidt  2009-07-22 @194  	pte_free_tlb(tlb, token, addr);
c4812909f5d5a9 Kirill A. Shutemov      2017-11-15  195  	mm_dec_nr_ptes(tlb->mm);
^1da177e4c3f41 Linus Torvalds          2005-04-16  196  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  197  

:::::: The code at line 194 was first introduced by commit
:::::: 9e1b32caa525cb236e80e9c671e179bcecccc657 mm: Pass virtual address to [__]p{te,ud,md}_free_tlb()

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
