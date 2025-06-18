Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5179821D5A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 20:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280319; cv=none; b=NtFVy1ax3LiKc2PMoJwjpaYx42vWBvEct3HTjdktzw0gIp9c0zFWSFvzbzC6XkPLOHEwrE0LfLp5+c6WvT5+OtFtxZI8NsrGBDFRwtDFvZqrfscd1HESLCbSFbajSROSlCKNXKQuG5Z++/kgzeY/wLLjJZ/eeB4ZDDCrqNOPxME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280319; c=relaxed/simple;
	bh=idIGyuWN/Z0SuiHlkIMMWeYeQfulkuge0YNfgzu2D+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BOpBt3ULPg+6tbbjhSU4JwjgM3Uv0eqQdXWVlyZmyG3fVPhGPyjLnJLmTQakhQN9Gr8IVRnyPAvLegNjxv2lrKz070OrQ/zoG6MORLMK3HkQcXnMZUOzHKn2nIUZHMt5aRqoYfJV0rep0egbILV6HXai8+/D3mlW+ukn2qJCp+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7gcw2VP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7gcw2VP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750280317; x=1781816317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=idIGyuWN/Z0SuiHlkIMMWeYeQfulkuge0YNfgzu2D+4=;
  b=T7gcw2VPdK+aEXyPYtWuregVQRxmDG1i7A5gZ7qYB3Ps9kJPUgFkY+KU
   TCiHNHUYKp+PHxzURlPHfrHndVjk/e6IDSb7h/NDq3/t3turdesIOsbAi
   MQK3k1SVjF3JKuUvv5FIjkd4lHGn4t7e1L0aoRhfZcMgdBTeIVvFv5sa2
   wdryAZVQJc35c7l8TMnGOsrP1rlgw2Pd7N9QWbNiU4dRUQmed5x4NRLBq
   tRCpeSoqGvt8eD/Gtq1aRjfcdeW7QIAxKAp6WYZiHHnSjVe9dbDlbfwZf
   9VBRXN83Z7DcVZm8XYDXAqu/UhJ1JpJs+5KomH8Vdmcbt+T0VzNh+Mpab
   A==;
X-CSE-ConnectionGUID: IZFeHkCtRyCjktGy/OCwdw==
X-CSE-MsgGUID: Wozth7qhSeK+bFowKEnRyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="55147201"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="55147201"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 13:58:36 -0700
X-CSE-ConnectionGUID: Cqkat9cTQPu1fmQfCRVFcA==
X-CSE-MsgGUID: j/9dMiNbQjO5e0Mq8yCOrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="150020052"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jun 2025 13:58:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRzrd-000KAs-03;
	Wed, 18 Jun 2025 20:58:33 +0000
Date: Thu, 19 Jun 2025 04:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] mm/khugepaged.c:152: warning:
 Function parameter or member 'evict_timestamp' not described in 'mm_slot'
Message-ID: <202506190441.cUEMizgq-lkp@intel.com>
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
head:   182e47fd81e1f2341328ae1ae465ff25a83ca7a4
commit: bf2c1d13d55c0fdac556938a3cde016341d985ec [0/1] anolis: mm: hugetext: Update adaptive entries
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250619/202506190441.cUEMizgq-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506190441.cUEMizgq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506190441.cUEMizgq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/khugepaged.c:152: warning: Function parameter or member 'nr_pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:152: warning: Function parameter or member 'pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:152: warning: Function parameter or member 'nr_exec_vma' not described in 'mm_slot'
   mm/khugepaged.c:152: warning: Function parameter or member 'exec_vma' not described in 'mm_slot'
   mm/khugepaged.c:152: warning: Function parameter or member 'nr_adapt_vma' not described in 'mm_slot'
   mm/khugepaged.c:152: warning: Function parameter or member 'adapt_vmas' not described in 'mm_slot'
   mm/khugepaged.c:152: warning: Function parameter or member 'adaptive_regions' not described in 'mm_slot'
   mm/khugepaged.c:152: warning: Function parameter or member 'work' not described in 'mm_slot'
>> mm/khugepaged.c:152: warning: Function parameter or member 'evict_timestamp' not described in 'mm_slot'
   mm/khugepaged.c:152: warning: Function parameter or member 'state' not described in 'mm_slot'
   mm/khugepaged.c:152: warning: Function parameter or member 'nr_hugetext' not described in 'mm_slot'
   mm/khugepaged.c:1855: warning: Function parameter or member 'mm' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:1855: warning: Function parameter or member 'addr' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:2057: warning: Function parameter or member 'mm' not described in 'collapse_file'
   mm/khugepaged.c:2057: warning: Function parameter or member 'file' not described in 'collapse_file'
   mm/khugepaged.c:2057: warning: Function parameter or member 'start' not described in 'collapse_file'
   mm/khugepaged.c:2057: warning: Function parameter or member 'hpage' not described in 'collapse_file'
   mm/khugepaged.c:2057: warning: Function parameter or member 'node' not described in 'collapse_file'


vim +152 mm/khugepaged.c

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
b188234c53aafe Rongwei Wang       2022-11-26  150  	int nr_hugetext;
5c3c3afed0fd68 Xu Yu              2021-08-19  151  #endif
b46e756f5e4703 Kirill A. Shutemov 2016-07-26 @152  };
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  153  

:::::: The code at line 152 was first introduced by commit
:::::: b46e756f5e47031c67658ff036e5ffe27062fa43 thp: extract khugepaged from mm/huge_memory.c

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
