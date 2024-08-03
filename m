Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8282101D4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 04:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722659728; cv=none; b=tuRVIQs400kwZrd/7CP/7Sj55SOEWW3QqxCsaWNMwU7i+hlOeJDATSoApr0dAktCjiSZRD6jOGDdQqQYtoPaZcQuEU0S09UOfmEREAiqmx3IA7YZxkzdrkUIIRA9JFdn/sl6AHYPtoF3yTn3qnyiqUBTsiqRRg2Zt9EZ6i0A9sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722659728; c=relaxed/simple;
	bh=P8aiQ5kxDHHlegk1fS71nc25JdCeCexO9szYiYOKJQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIdwNPqcyv59s/RpatJhiuxBqueKrs3OyLvEq/Miyto+LoESkA7gron+aPf2CjCcbIkeg00Js86zu2XFleaN1bi5PM+2vj7luD5d6hRUJJOPeniWUIUBqL6VeXrtrDrdlf3RAgebFGpRHhfKT8yrCPK1oesSHuhhR9yohP3tRAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3qB3HYT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3qB3HYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722659727; x=1754195727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P8aiQ5kxDHHlegk1fS71nc25JdCeCexO9szYiYOKJQ8=;
  b=A3qB3HYTDbBtwdh9yyLvbTd4+l3iaS9SSsEWq5osAzMArvIzAuWMKpkm
   JrL0BHkatE/oA97+wj5WGZXQ4rROl2DtILc24GvVToe//Mr/60a7dYGyC
   /tsHxoOCH8pey0fOC8l407cMrByCaw60+hyRwavaW3BKw2F+5jgqPNJqK
   ZSkhGnUmtKWRajM2NHHSTqbXuzSvtUxilLhynHBH6MkX8gREzIVK9OTL9
   I+qipKr90zuce5530FNdwTHXe/Bc7hUtCIvjj2fr4kZsO+GIZXD6BY5Jj
   dqQvI/pYAj1G3dae0lMDkU4EI//UjXgpoU8WwYxoeKtWrot4ssHm3KL0r
   g==;
X-CSE-ConnectionGUID: MSHtkZ0tRDCiPbGKtVhVxw==
X-CSE-MsgGUID: XvPyoVdHS0Cg3gcf3MAFTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20531283"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="20531283"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 21:35:25 -0700
X-CSE-ConnectionGUID: hWuRErHoSoG9m9MxyXDGpw==
X-CSE-MsgGUID: 8lzINk1kT/CoMrrCKZPTIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="55835734"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Aug 2024 21:35:24 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa6TH-00003a-1m;
	Sat, 03 Aug 2024 04:34:34 +0000
Date: Sat, 3 Aug 2024 12:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc 11/17] arch/sparc/mm/hugetlbpage.c:413:27: error:
 passing argument 2 of '__pte_free_tlb' from incompatible pointer type
Message-ID: <202408031240.0DkLhqAr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc
head:   3735e634f8feb67c941d17222b53906ace2fd2b8
commit: 4e971fd6730e86b2f8bbeca4f116e1cb77196218 [11/17] mm/pgtable: introduce ptdesc_pfn and use ptdesc in free_pte_range()
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240803/202408031240.0DkLhqAr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031240.0DkLhqAr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031240.0DkLhqAr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/tlb_64.h:36,
                    from arch/sparc/include/asm/tlb.h:5,
                    from arch/sparc/mm/hugetlbpage.c:17:
   arch/sparc/mm/hugetlbpage.c: In function 'hugetlb_free_pte_range':
>> arch/sparc/mm/hugetlbpage.c:413:27: error: passing argument 2 of '__pte_free_tlb' from incompatible pointer type [-Wincompatible-pointer-types]
     413 |         pte_free_tlb(tlb, token, addr);
         |                           ^~~~~
         |                           |
         |                           pgtable_t {aka pte_t *}
   include/asm-generic/tlb.h:706:37: note: in definition of macro 'pte_free_tlb'
     706 |                 __pte_free_tlb(tlb, ptep, address);             \
         |                                     ^~~~
   In file included from arch/sparc/include/asm/pgalloc.h:5,
                    from arch/sparc/mm/hugetlbpage.c:16:
   arch/sparc/include/asm/pgalloc_64.h:106:74: note: expected 'struct ptdesc *' but argument is of type 'pgtable_t' {aka 'pte_t *'}
     106 | static inline void __pte_free_tlb(struct mmu_gather *tlb, struct ptdesc *pte,
         |                                                           ~~~~~~~~~~~~~~~^~~


vim +/__pte_free_tlb +413 arch/sparc/mm/hugetlbpage.c

^1da177e4c3f41 arch/sparc64/mm/hugetlbpage.c Linus Torvalds     2005-04-16  406  
7bc3777ca19cf9 arch/sparc/mm/hugetlbpage.c   Nitin Gupta        2016-07-29  407  static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
7bc3777ca19cf9 arch/sparc/mm/hugetlbpage.c   Nitin Gupta        2016-07-29  408  			   unsigned long addr)
7bc3777ca19cf9 arch/sparc/mm/hugetlbpage.c   Nitin Gupta        2016-07-29  409  {
7bc3777ca19cf9 arch/sparc/mm/hugetlbpage.c   Nitin Gupta        2016-07-29  410  	pgtable_t token = pmd_pgtable(*pmd);
7bc3777ca19cf9 arch/sparc/mm/hugetlbpage.c   Nitin Gupta        2016-07-29  411  
7bc3777ca19cf9 arch/sparc/mm/hugetlbpage.c   Nitin Gupta        2016-07-29  412  	pmd_clear(pmd);
7bc3777ca19cf9 arch/sparc/mm/hugetlbpage.c   Nitin Gupta        2016-07-29 @413  	pte_free_tlb(tlb, token, addr);
c4812909f5d5a9 arch/sparc/mm/hugetlbpage.c   Kirill A. Shutemov 2017-11-15  414  	mm_dec_nr_ptes(tlb->mm);
7bc3777ca19cf9 arch/sparc/mm/hugetlbpage.c   Nitin Gupta        2016-07-29  415  }
7bc3777ca19cf9 arch/sparc/mm/hugetlbpage.c   Nitin Gupta        2016-07-29  416  

:::::: The code at line 413 was first introduced by commit
:::::: 7bc3777ca19cf9ecc5533980210f29c51df7fe5e sparc64: Trim page tables for 8M hugepages

:::::: TO: Nitin Gupta <nitin.m.gupta@oracle.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
