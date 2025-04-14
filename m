Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C7A1DED70
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744661755; cv=none; b=ZImuO3wJ2ke8WktyjrU76ph0iRt86VTM7NlB4QSdAh9x+ms8mZjpcc/jvTRPjB0guuikrOv+IO49Fe99Z3xM4S69KzeMTJ/MBKSOu2nltasf/RkIszhJQu/7danOE/Wrj5+WhZxsS+ceGRN5+Nog0Hz3xYWyqcG/aLDrrbfEOkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744661755; c=relaxed/simple;
	bh=Sn6JapdJJghG6PAXBielxQfeia40lhUEmHVq6X041yI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aGzcVjWgoFiV1hEYU0Z89noWsrozigRrlgLgdhPfFlwDEKffk8rXGDVRoPAuAXQdiNS3p7EfehjzwEPA+gtCZsESV3+MJZaf12JMjiBrJ2c8r8SrsDj23WKMlrMzrDGadKIj3eILmjjQXFN79mhSX14j1RYJ9ZiZ6KjZFgCxYQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdHoKWV+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdHoKWV+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744661754; x=1776197754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sn6JapdJJghG6PAXBielxQfeia40lhUEmHVq6X041yI=;
  b=gdHoKWV+fbcZROau7UooGC9neLeX2Cx7VxbxUiPp9w2h8y4E8mOtHf5k
   sjE6TPDq104ZOMvQs4BwNuMKxMCav94E18aIMIi82y69oDCAYyTgQkBB0
   2g0gY9pW3obkOMkTEipq/elKg3ELe7lRCxuSYWLiRIVUd0Ee1W5NJl9VT
   wKQIJEXgXea/hBhwysSTFsqYA/kE3UsGw+zupG56v9WkA8Um2moCHK9Li
   mTCU7r3DpGOWLN/H5JRlef654dHbzLpkKjKG9LwL2tyIkRd7iFl2bYDuY
   /9NmX7nSo9DSzLFkwsEJ1cugTBPby538GRxLuRhGrlwUT7ppP62ngJafV
   g==;
X-CSE-ConnectionGUID: SKRI1mqiTYqLYB8lqUxRgg==
X-CSE-MsgGUID: tJXoIV+2SXmTwXsPFNO91A==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46029943"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="46029943"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 13:15:50 -0700
X-CSE-ConnectionGUID: uGAXTFW7QVW86+UcjZNFSw==
X-CSE-MsgGUID: QOCSl875TIi1QqIE6ywngg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="130881731"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Apr 2025 13:15:49 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4QDb-000Eeg-09;
	Mon, 14 Apr 2025 20:15:47 +0000
Date: Tue, 15 Apr 2025 04:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/khugepaged.c:152: warning:
 Function parameter or member 'evict_timestamp' not described in 'mm_slot'
Message-ID: <202504150428.ylzPUmgN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rongwei,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   a3551a1593289aa46ae6f085ec80d9d0a7a1bfed
commit: bf2c1d13d55c0fdac556938a3cde016341d985ec [9/9] anolis: mm: hugetext: Update adaptive entries
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250415/202504150428.ylzPUmgN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504150428.ylzPUmgN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504150428.ylzPUmgN-lkp@intel.com/

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
