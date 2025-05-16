Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767101B808
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 13:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401648; cv=none; b=QAk8/6+nB9O2k70ZkPVLIeBU4t2KIMtU2nfrmZMEIgy/c42FnPZM73cRuGCz5xahW1XKTSMOiFnxHqiAtonkHb4dG3PGaCAFBTkoJ5gkVXC6wTsY2O1XoE+B8LJ00uN7JAkFhYJbMseU8/KLgHAJ4Gh/YQROXei6C0tjo31TSq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401648; c=relaxed/simple;
	bh=MlqSAPICrNgbj1Gd0pPvs/jiHp5DGsZwDp72ZBH4yPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OmboXvONrM1dSmtDYIpMKehNFu74MYbKoAvecjazX2yHjBBZVGmcV56move65D06ZJtcFjhmIJXufLc6nCt34h4rV/6ucjQ+rXjZGkltDe5gxDbRzuiEQnrccuw7Iyu5WEihTWBqTywTZ0YH3ufS5bFXPgkaOhsBaiPvnolShhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1GwVUMR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1GwVUMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747401646; x=1778937646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MlqSAPICrNgbj1Gd0pPvs/jiHp5DGsZwDp72ZBH4yPQ=;
  b=Q1GwVUMRmfqshLw1WbAkRjbC8fuiN+mPRGT2hDKxhy7IgDS0oL5EAuIV
   fNzHFRCbt9OKeI1wbd1omdiR28MgbpWGZbnfTvUtgU/cS0VcX7nhcJBlp
   PTuOmmxX2N7LBulDMFznNOiogleJ8tuIIiI5h4dv1zoLBMUH9ulMevKu4
   5a9P8UFA4Y3D4DoI+0zLUetU0RxjRRQG3wqJu7OiU8wTOttGvKhjP3Jat
   Yjivfij1ARJsQxCoeJKYWa6wuxfxYzHlkG54/oS+blW2vifDPRlenOVxw
   1ebSGzKBvB+192OS23Xm8n5tE45DsRZFDs+HHOqHB/8P5R047+nrERN98
   A==;
X-CSE-ConnectionGUID: 2UgpBwQvRAqfiJ5c0qQ46Q==
X-CSE-MsgGUID: yu/cm+0sQvCx0z1OLP1THQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53045369"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="53045369"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 06:20:46 -0700
X-CSE-ConnectionGUID: KEhvED4hT5Gn/kl+11Umwg==
X-CSE-MsgGUID: rL2EZuCDRLuDmvSS1CSjlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="143935187"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 May 2025 06:20:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFuzS-000JNH-2Y;
	Fri, 16 May 2025 13:20:42 +0000
Date: Fri, 16 May 2025 21:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 5/5] mm/khugepaged.c:152: warning:
 Function parameter or member 'evict_timestamp' not described in 'mm_slot'
Message-ID: <202505162103.aBOKvkID-lkp@intel.com>
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
head:   bfc84bc1ba93833ad3fd1e370a33e511711611a6
commit: bf2c1d13d55c0fdac556938a3cde016341d985ec [5/5] anolis: mm: hugetext: Update adaptive entries
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250516/202505162103.aBOKvkID-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505162103.aBOKvkID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505162103.aBOKvkID-lkp@intel.com/

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
