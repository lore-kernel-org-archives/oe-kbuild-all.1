Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F147A706
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 22:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709504003; cv=none; b=G94yJDL3c9CJYDTY15MD8+9675T9SZRo8I/exUksUj80W6JdjLjYD1jKuzsf8DubSaovWWdFytjFYxiCliN6hyW4bgDClLR5cAKbAs3x0P9O86PtsAZza+02vXW6pvBWmyvBLcfN2P/8qQyPYMI1u52DsiSFF7vUOGvwQEiKdv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709504003; c=relaxed/simple;
	bh=fohD5AgKSisIb2bizNsyV8lUJxC9bQUqoYgqRlvlClQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g2PUx98cqN95Dd59cARxScZd5OFmHezztVrLudm8RQxsN4q25rBvpoXkNYMTc/qppjAgcI/r/z9Ca1UsM1buvuBAHy1GUR9OVzmOOGNSg9q9yoE0035KIGhRX9OyOw9KnAPbvrWGsRLqGwUA4Ns8eKP+grpAUNTYJIK1GjwhB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3BvgTP3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3BvgTP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709504002; x=1741040002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fohD5AgKSisIb2bizNsyV8lUJxC9bQUqoYgqRlvlClQ=;
  b=J3BvgTP3fHuxLo4/oYpl8hn7Dbwn1/eiSp4Cwn0uIq68Nb9rv4bagarP
   sx6VD9X/XCBeSaKbdg4rGPAINa9jSs5BPZTYFLks4QYaFrg0RNrvy8hKT
   t8T7KAGsQlyyb65dkCqEYQtAgdzdE1J0Gay1gOiTL5fKAOtQay7yXiS/Y
   Phasyvxe70yDYFxJdshU/bkpX515jr/DGZKuIeEKIhMlddCw71r+ZXImD
   TmolmAnNlC7WPHGVFjF154sboqL0WAkB8jihYv4Lt12pOP8TeAwZLmIaj
   Dk+7jqZqU9NZfl9unPCW5+fGzlbI4C8x9yR4Br4S+zZfPWbcr8iDafVNU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14562497"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="14562497"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 14:13:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="39795243"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Mar 2024 14:13:19 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgu57-00028m-0Y;
	Sun, 03 Mar 2024 22:13:17 +0000
Date: Mon, 4 Mar 2024 06:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16561/21676] mm/pin_mem.c:844:63:
 error: lvalue required as unary '&' operand
Message-ID: <202403040641.1SwwRMg7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   415aa2f13fd4c4766b3b6deb471c6b909d39ac51
commit: 1a378b87531ea80e7847bf0105adedff28a73080 [16561/21676] mm: add pin memory method for checkpoint add restore
config: arm64-randconfig-001-20240302 (https://download.01.org/0day-ci/archive/20240304/202403040641.1SwwRMg7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040641.1SwwRMg7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040641.1SwwRMg7-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/pin_mem.c:171:6: warning: no previous prototype for 'reserve_page_from_buddy' [-Wmissing-prototypes]
     171 | void reserve_page_from_buddy(unsigned long nr_pages, struct page *page)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:254:6: warning: no previous prototype for 'free_user_map_pages' [-Wmissing-prototypes]
     254 | void free_user_map_pages(unsigned int pid_index, unsigned int entry_index, unsigned int page_index)
         |      ^~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:311:6: warning: no previous prototype for 'check_redirect_end_valid' [-Wmissing-prototypes]
     311 | bool check_redirect_end_valid(struct redirect_info *redirect_start,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:392:5: warning: no previous prototype for 'calculate_pin_mem_digest' [-Wmissing-prototypes]
     392 | int calculate_pin_mem_digest(struct pin_mem_dump_info *pmdi, char *digest)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:481:5: warning: no previous prototype for 'collect_pmd_huge_pages' [-Wmissing-prototypes]
     481 | int collect_pmd_huge_pages(struct task_struct *task,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:544:5: warning: no previous prototype for 'collect_normal_pages' [-Wmissing-prototypes]
     544 | int collect_normal_pages(struct task_struct *task,
         |     ^~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c: In function 'collect_normal_pages':
   mm/pin_mem.c:549:26: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
     549 |         unsigned long i, nr_pages;
         |                          ^~~~~~~~
   mm/pin_mem.c: At top level:
   mm/pin_mem.c:610:6: warning: no previous prototype for 'free_pin_pages' [-Wmissing-prototypes]
     610 | void free_pin_pages(struct page_map_entry *pme)
         |      ^~~~~~~~~~~~~~
   mm/pin_mem.c:770:12: warning: no previous prototype for 'remap_normal_pages' [-Wmissing-prototypes]
     770 | vm_fault_t remap_normal_pages(struct mm_struct *mm, struct vm_area_struct *vma,
         |            ^~~~~~~~~~~~~~~~~~
   mm/pin_mem.c: In function 'get_hugepage_gfpmask':
>> mm/pin_mem.c:844:63: error: lvalue required as unary '&' operand
     844 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG, &transparent_hugepage_flags))
         |                                                               ^
   mm/pin_mem.c:846:63: error: lvalue required as unary '&' operand
     846 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG, &transparent_hugepage_flags))
         |                                                               ^
   mm/pin_mem.c:848:71: error: lvalue required as unary '&' operand
     848 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG, &transparent_hugepage_flags))
         |                                                                       ^
   mm/pin_mem.c:851:65: error: lvalue required as unary '&' operand
     851 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG, &transparent_hugepage_flags))
         |                                                                 ^
   mm/pin_mem.c: At top level:
   mm/pin_mem.c:857:12: warning: no previous prototype for 'remap_huge_pmd_pages' [-Wmissing-prototypes]
     857 | vm_fault_t remap_huge_pmd_pages(struct mm_struct *mm, struct vm_area_struct *vma,
         |            ^~~~~~~~~~~~~~~~~~~~


vim +844 mm/pin_mem.c

   839	
   840	static inline gfp_t get_hugepage_gfpmask(struct vm_area_struct *vma)
   841	{
   842		const bool vma_madvised = !!(vma->vm_flags & VM_HUGEPAGE);
   843	
 > 844		if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG, &transparent_hugepage_flags))
   845			return GFP_TRANSHUGE | (vma_madvised ? 0 : __GFP_NORETRY);
   846		if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG, &transparent_hugepage_flags))
   847			return GFP_TRANSHUGE_LIGHT | __GFP_KSWAPD_RECLAIM;
   848		if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG, &transparent_hugepage_flags))
   849			return GFP_TRANSHUGE_LIGHT | (vma_madvised ? __GFP_DIRECT_RECLAIM :
   850								     __GFP_KSWAPD_RECLAIM);
   851		if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG, &transparent_hugepage_flags))
   852			return GFP_TRANSHUGE_LIGHT | (vma_madvised ? __GFP_DIRECT_RECLAIM :
   853								     0);
   854		return GFP_TRANSHUGE_LIGHT;
   855	}
   856	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
