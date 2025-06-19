Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292F814A4E0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 02:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750298643; cv=none; b=sAkOYoI48JX81V/NiJX/hhhvQyjlAjbpOm1Kw86oYVs93MVI3gZ5g28fq5AyLVPAbhRSIHyiZ/2O8KF9QFkW1pe0pl4RRTEYU30wESUA8fY6Xmnhay2OHBU+YXE8SPLHmDZULsVpSIYIqYt7EZiEhgPeMKblSop6KvlDgKkODGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750298643; c=relaxed/simple;
	bh=einD8Xw+KN0TKLsJOKxdouLLbIZTXPMNkpo2ft/nl8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=swY/vl26jssmdj4qWgEvWsK6+S8hOincH5G/B1yu8a8D2zP1DGP/Bna5pFuzkChsorMhNMICi0/AJj2nFP4mplZa21LKVTc5WIW4RQ72GkfOFfG/UewGhIdv8iG3tNjp3NPyYP+EBxDfwG6a/n3l7jAqjB4LZ9qIzyvXl4CiOWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsfPTE5d; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsfPTE5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750298640; x=1781834640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=einD8Xw+KN0TKLsJOKxdouLLbIZTXPMNkpo2ft/nl8w=;
  b=QsfPTE5dcKlEgqbsU21dt6O27vXbpvOMzeUiDVVyIjsY4PTwiU7a8rqW
   J85e35hXZ87MKZgrDGHF+MLsHbaOyHMZC1tSzMCbTy2oWnf6Zor+cPGas
   FmztIH7MNMXyZ5BqqMIDCAM6m4gckPdYGZk6vqmreBQgbhv8fQzoM2Mts
   ddMwsB/K4NglIrhdLY9ufgcmAjXQTWY+LcWQVtHo0iwlXrDJtI8A+MlfW
   aHP4hQRbDSJ0ZIPlPQFYKKlQb9yCHbyVeuh9BDMlo3JtqnKQK8J8uVoU4
   9P02ELXhB9ArTkCSQEhEok3Seb3UYBGyA3uVdEXg5V/jg4yh9dM4m/EIo
   w==;
X-CSE-ConnectionGUID: txv3eEXiT2OeuhjxTaJuYQ==
X-CSE-MsgGUID: NCcTPWDMTbmjwh9qfDkx8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="69977920"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="69977920"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 19:03:59 -0700
X-CSE-ConnectionGUID: aSKilCszSqes0c5uXh+fXA==
X-CSE-MsgGUID: Q1iUyCjKQfK1Qc0SRn1VFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="150164310"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jun 2025 19:03:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS4dA-000KKU-1i;
	Thu, 19 Jun 2025 02:03:56 +0000
Date: Thu, 19 Jun 2025 10:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] mm/khugepaged.c:153: warning:
 Function parameter or member 'recheck_hugetext' not described in 'mm_slot'
Message-ID: <202506190942.VEIgcOdz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rongwei,

First bad commit (maybe != root cause):

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   72ad9fd00b32380d70b2ad46ae6dfbf606f42a02
commit: f835999265e7e2bab5dcadbe2347c28d35e52c94 [0/1] anolis: mm: hugetext: Split cold adaptive thp
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250619/202506190942.VEIgcOdz-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506190942.VEIgcOdz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506190942.VEIgcOdz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/khugepaged.c:153: warning: Function parameter or member 'nr_pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:153: warning: Function parameter or member 'pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:153: warning: Function parameter or member 'nr_exec_vma' not described in 'mm_slot'
   mm/khugepaged.c:153: warning: Function parameter or member 'exec_vma' not described in 'mm_slot'
   mm/khugepaged.c:153: warning: Function parameter or member 'nr_adapt_vma' not described in 'mm_slot'
   mm/khugepaged.c:153: warning: Function parameter or member 'adapt_vmas' not described in 'mm_slot'
   mm/khugepaged.c:153: warning: Function parameter or member 'adaptive_regions' not described in 'mm_slot'
   mm/khugepaged.c:153: warning: Function parameter or member 'work' not described in 'mm_slot'
   mm/khugepaged.c:153: warning: Function parameter or member 'evict_timestamp' not described in 'mm_slot'
   mm/khugepaged.c:153: warning: Function parameter or member 'state' not described in 'mm_slot'
>> mm/khugepaged.c:153: warning: Function parameter or member 'recheck_hugetext' not described in 'mm_slot'
   mm/khugepaged.c:153: warning: Function parameter or member 'nr_hugetext' not described in 'mm_slot'
   mm/khugepaged.c:1856: warning: Function parameter or member 'mm' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:1856: warning: Function parameter or member 'addr' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:2058: warning: Function parameter or member 'mm' not described in 'collapse_file'
   mm/khugepaged.c:2058: warning: Function parameter or member 'file' not described in 'collapse_file'
   mm/khugepaged.c:2058: warning: Function parameter or member 'start' not described in 'collapse_file'
   mm/khugepaged.c:2058: warning: Function parameter or member 'hpage' not described in 'collapse_file'
   mm/khugepaged.c:2058: warning: Function parameter or member 'node' not described in 'collapse_file'


vim +153 mm/khugepaged.c

b188234c53aafe Rongwei Wang       2022-11-26  122  
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  123  /**
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  124   * struct mm_slot - hash lookup from mm to mm_slot
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  125   * @hash: hash collision list
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  126   * @mm_node: khugepaged scan list headed in khugepaged_scan.mm_head
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  127   * @mm: the mm that this information is valid for
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  128   */
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  129  struct mm_slot {
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  130  	struct hlist_node hash;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  131  	struct list_head mm_node;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  132  	struct mm_struct *mm;
27e1f8273113ad Song Liu           2019-09-23  133  
27e1f8273113ad Song Liu           2019-09-23  134  	/* pte-mapped THP in this mm */
27e1f8273113ad Song Liu           2019-09-23  135  	int nr_pte_mapped_thp;
27e1f8273113ad Song Liu           2019-09-23  136  	unsigned long pte_mapped_thp[MAX_PTE_MAPPED_THP];
5c3c3afed0fd68 Xu Yu              2021-08-19  137  
5c3c3afed0fd68 Xu Yu              2021-08-19  138  #ifdef CONFIG_HUGETEXT
5c3c3afed0fd68 Xu Yu              2021-08-19  139  #define MAX_EXEC_VMA       8
5c3c3afed0fd68 Xu Yu              2021-08-19  140  	/* exec vma vm_start in this mm */
5c3c3afed0fd68 Xu Yu              2021-08-19  141  	int nr_exec_vma;
5c3c3afed0fd68 Xu Yu              2021-08-19  142  	unsigned long exec_vma[MAX_EXEC_VMA];
b188234c53aafe Rongwei Wang       2022-11-26  143  	int nr_adapt_vma;
b188234c53aafe Rongwei Wang       2022-11-26  144  	struct adapt_vma_t adapt_vmas[MAX_EXEC_VMA];
b188234c53aafe Rongwei Wang       2022-11-26  145  	struct xarray adaptive_regions;
b188234c53aafe Rongwei Wang       2022-11-26  146  	struct delayed_work work;
bf2c1d13d55c0f Rongwei Wang       2022-11-26  147  	unsigned long evict_timestamp;
b188234c53aafe Rongwei Wang       2022-11-26  148  	/* Current state of adapt vma */
b188234c53aafe Rongwei Wang       2022-11-26  149  	atomic_t state;
f835999265e7e2 Rongwei Wang       2022-11-26  150  	int recheck_hugetext;
b188234c53aafe Rongwei Wang       2022-11-26  151  	int nr_hugetext;
5c3c3afed0fd68 Xu Yu              2021-08-19  152  #endif
b46e756f5e4703 Kirill A. Shutemov 2016-07-26 @153  };
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  154  

:::::: The code at line 153 was first introduced by commit
:::::: b46e756f5e47031c67658ff036e5ffe27062fa43 thp: extract khugepaged from mm/huge_memory.c

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
