Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C0B238D52
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 19:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766431648; cv=none; b=O/jZGps6f7YHcg12rm8yFodkDdXTm3LNp8QqNNJdlgKybDqOKtvpA7ep+JUZMg21mA4otP23tdIHDk9t2x5luvgrgbpp+ZHe0e/fLQ8MpkXgNwy3HzC08xKqXcpiFqhv4onZFYODzU3TyYJF/JKwpsz9Aq0fiUHiwo65dTUXVws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766431648; c=relaxed/simple;
	bh=wiLufbk8QlZx3ZW5tM2zlWjpgzuILxYFe3j7CwKRmeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sF67z4BIW01vsgE68+vLwEoTgAx70qlo16fkpqyEurJbRf54g1+F70tN3IIx7IetfiXgBkX+FirWKfD/jplfAwizRLUuRpZlMTVdKR6ENHsh19IruhwfvC73Ij0dGTpnx0uOQcJJVOUKribGjScopEjMbny+VYMOtbfZkuD1RU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCLUPdEh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCLUPdEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766431646; x=1797967646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wiLufbk8QlZx3ZW5tM2zlWjpgzuILxYFe3j7CwKRmeM=;
  b=NCLUPdEhqNuVK97RvVljgzhAgO9RsGxYf6YnYsV+Yme1aWxTGrLErIzX
   3rxQeWA/lHhrluw5vwxeEWHQaVxDhOn2C3/2gNaROIBHMsXr+bvo5875i
   rkbSuFD+V0xen7Xy/DbIvHithy1YZ95qLpqMvzNHyyiw2d6+bhPyWSc24
   hPBy19XBOfIxzQpqjYw4JEbPAmv11FKR1Srck0mB0E8HwYplVzF95kYZ+
   YoHMTXJGqROjqwm2e84wK6Lkby9LAYs1TnvCBCuXmHjqZutmmVx1zW8rW
   aEx4OEj61F5cexge+jk5Q+33GwM/QbeKXJO+dKNhTKU16nCS6NaBMQCBs
   w==;
X-CSE-ConnectionGUID: fr/AT4W/Qgen2gVO7a2UVA==
X-CSE-MsgGUID: NHOw+rI9SuezMfDusSLBqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79743011"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="79743011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 11:27:25 -0800
X-CSE-ConnectionGUID: f5aAGjgxSb+9KgvMnl29KA==
X-CSE-MsgGUID: v21RnsYRRumDtJomxNeYtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199512228"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 11:27:24 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXlYv-000000005ay-3xXu;
	Mon, 22 Dec 2025 19:27:21 +0000
Date: Mon, 22 Dec 2025 20:26:50 +0100
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pgtable14 2/2] mm/huge_memory.c:2337:17: error: assignment
 to 'pgtable_t' {aka 'long unsigned int *'} from incompatible pointer type
 'struct page *'
Message-ID: <202512222025.09FwIM9h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git pgtable14
head:   d9bb8deea009b236ba354e09f922bfa97741bced
commit: d9bb8deea009b236ba354e09f922bfa97741bced [2/2] mm/pgtable: convert pgtable_trans_huge_withdraw to ptdesc-6.19
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512222025.09FwIM9h-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222025.09FwIM9h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222025.09FwIM9h-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/mmzone.h:22,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/mm.h:7,
                    from mm/huge_memory.c:8:
   mm/huge_memory.c: In function '__do_huge_pmd_anonymous_page':
   ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/huge_memory.c:1356:49: note: in expansion of macro 'page_ptdesc'
    1356 |                                                 page_ptdesc(pgtable));
         |                                                 ^~~~~~~~~~~
   mm/huge_memory.c: In function 'set_huge_zero_folio':
   ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/huge_memory.c:1454:45: note: in expansion of macro 'page_ptdesc'
    1454 |         pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
         |                                             ^~~~~~~~~~~
   mm/huge_memory.c: In function 'insert_pmd':
   ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/huge_memory.c:1580:53: note: in expansion of macro 'page_ptdesc'
    1580 |                 pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
         |                                                     ^~~~~~~~~~~
   mm/huge_memory.c: In function 'copy_huge_non_present_pmd':
   ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/huge_memory.c:1841:53: note: in expansion of macro 'page_ptdesc'
    1841 |         pgtable_trans_huge_deposit(dst_mm, dst_pmd, page_ptdesc(pgtable));
         |                                                     ^~~~~~~~~~~
   mm/huge_memory.c: In function 'copy_huge_pmd':
   ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/huge_memory.c:1936:53: note: in expansion of macro 'page_ptdesc'
    1936 |         pgtable_trans_huge_deposit(dst_mm, dst_pmd, page_ptdesc(pgtable));
         |                                                     ^~~~~~~~~~~
   mm/huge_memory.c: In function 'zap_deposited_table':
>> mm/huge_memory.c:2337:17: error: assignment to 'pgtable_t' {aka 'long unsigned int *'} from incompatible pointer type 'struct page *' [-Wincompatible-pointer-types]
    2337 |         pgtable = ptdesc_page(pgtable_trans_huge_withdraw(mm, pmd));
         |                 ^
   In file included from ./arch/s390/include/asm/processor.h:37,
                    from ./arch/s390/include/asm/smp.h:10,
                    from ./include/linux/smp.h:119,
                    from ./include/linux/lockdep.h:14,
                    from ./include/linux/spinlock.h:63,
                    from ./include/linux/mmzone.h:8:
   ./arch/s390/include/asm/page.h:120:16: note: 'pgtable_t' declared here
     120 | typedef pte_t *pgtable_t;
         |                ^~~~~~~~~
   mm/huge_memory.c: In function '__split_huge_zero_page_pmd':
   mm/huge_memory.c:2964:17: error: assignment to 'pgtable_t' {aka 'long unsigned int *'} from incompatible pointer type 'struct page *' [-Wincompatible-pointer-types]
    2964 |         pgtable = ptdesc_page(pgtable_trans_huge_withdraw(mm, pmd));
         |                 ^
   ./arch/s390/include/asm/page.h:120:16: note: 'pgtable_t' declared here
     120 | typedef pte_t *pgtable_t;
         |                ^~~~~~~~~
   mm/huge_memory.c: In function '__split_huge_pmd_locked':
   mm/huge_memory.c:3171:17: error: assignment to 'pgtable_t' {aka 'long unsigned int *'} from incompatible pointer type 'struct page *' [-Wincompatible-pointer-types]
    3171 |         pgtable = ptdesc_page(pgtable_trans_huge_withdraw(mm, pmd));
         |                 ^
   ./arch/s390/include/asm/page.h:120:16: note: 'pgtable_t' declared here
     120 | typedef pte_t *pgtable_t;
         |                ^~~~~~~~~


vim +2337 mm/huge_memory.c

  2332	
  2333	static inline void zap_deposited_table(struct mm_struct *mm, pmd_t *pmd)
  2334	{
  2335		pgtable_t pgtable;
  2336	
> 2337		pgtable = ptdesc_page(pgtable_trans_huge_withdraw(mm, pmd));
  2338		pte_free(mm, pgtable);
  2339		mm_dec_nr_ptes(mm);
  2340	}
  2341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
