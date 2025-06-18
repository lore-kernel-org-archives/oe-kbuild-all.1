Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0348F2EFDBC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261865; cv=none; b=S+y1JjpgyxQxUXU/of++wJuCoZbPqR3Qi1jQ5hpX5Psw3s5FlmTtLFp+dWnTABeTMZIf4gTuwY/3nKObQTo1rFBxR5jrgW1QHu4ax5ysmfNlK8dJNmscjSCKTGG5QLfpqIvG8P0mgM/qfUJtWCKM/1N1hr1ab+CNbaVdqJHybhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261865; c=relaxed/simple;
	bh=kx808KACG2QrMKXi2IY6vekiDwMWwcM0vkatJMtJi9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nwwV57ENcuK9yfTuBWAziByPqII4FML9cJXsdGtSfGQFQwJ55JNGw+u7+4Bprz4moRyJDmjaDramTtX162BpBCWo/JtkQF1WmX7yI/oNBDR29yfRqRpVQxd1rsm6hDCiM5VBpZqr3GXuHhgVg+Xd1hlTNfY09Nk/JDsOCzr0fH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejhcxcNt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejhcxcNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750261864; x=1781797864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kx808KACG2QrMKXi2IY6vekiDwMWwcM0vkatJMtJi9k=;
  b=ejhcxcNtf5mqsnvQOjBqDWQf7xZxm0R28FjvHiCzXuELRZjZst1QwpC2
   0kWomY5dMsXJ7H/yXYASKbHFqYTSNXcOAl9+VCUnt32epFKMJXc0VVh4g
   LfCCcWSagOOJYTBH3EaDtr3zQKmBiCoADVkwijP8p0SDcnLblXLiOIwO4
   IvzcrfUOt22Q9g5JuPdolnmV+cJR+f89KQ9kNBc2wXpkkjfr/0OQNXZg1
   vHb2QBizrtODoNOjHYFBtxSD8gLOsGfI6BRK7iN10RiYyiVqGm4ACgh9L
   oNfnim5LQCwykXmOY4sC6sKvZmtdbgC0FmAnpCqblztIpyFB7L8/pdVyj
   Q==;
X-CSE-ConnectionGUID: vfnV5sm+SUa2628vE4mtNg==
X-CSE-MsgGUID: gevk+F/pSlqXnC7zq0aEng==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63838543"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63838543"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 08:51:03 -0700
X-CSE-ConnectionGUID: tLaYbssJRYKsvBhoNSGX5g==
X-CSE-MsgGUID: DCoRaViVRvC4HoD5zs7pPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="155550619"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Jun 2025 08:51:02 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRv3z-000Jx0-1v;
	Wed, 18 Jun 2025 15:50:59 +0000
Date: Wed, 18 Jun 2025 23:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] mm/khugepaged.c:150: warning:
 Function parameter or member 'nr_adapt_vma' not described in 'mm_slot'
Message-ID: <202506182354.ZC1yCqnG-lkp@intel.com>
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
commit: b188234c53aafe8941f2f2662bf015353418eb81 [0/1] anolis: mm: hugetext: Implement principal part
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250618/202506182354.ZC1yCqnG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506182354.ZC1yCqnG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506182354.ZC1yCqnG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/khugepaged.c:150: warning: Function parameter or member 'nr_pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:150: warning: Function parameter or member 'pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:150: warning: Function parameter or member 'nr_exec_vma' not described in 'mm_slot'
   mm/khugepaged.c:150: warning: Function parameter or member 'exec_vma' not described in 'mm_slot'
>> mm/khugepaged.c:150: warning: Function parameter or member 'nr_adapt_vma' not described in 'mm_slot'
>> mm/khugepaged.c:150: warning: Function parameter or member 'adapt_vmas' not described in 'mm_slot'
>> mm/khugepaged.c:150: warning: Function parameter or member 'adaptive_regions' not described in 'mm_slot'
>> mm/khugepaged.c:150: warning: Function parameter or member 'work' not described in 'mm_slot'
>> mm/khugepaged.c:150: warning: Function parameter or member 'state' not described in 'mm_slot'
>> mm/khugepaged.c:150: warning: Function parameter or member 'nr_hugetext' not described in 'mm_slot'
   mm/khugepaged.c:1705: warning: Function parameter or member 'mm' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:1705: warning: Function parameter or member 'addr' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:1907: warning: Function parameter or member 'mm' not described in 'collapse_file'
   mm/khugepaged.c:1907: warning: Function parameter or member 'file' not described in 'collapse_file'
   mm/khugepaged.c:1907: warning: Function parameter or member 'start' not described in 'collapse_file'
   mm/khugepaged.c:1907: warning: Function parameter or member 'hpage' not described in 'collapse_file'
   mm/khugepaged.c:1907: warning: Function parameter or member 'node' not described in 'collapse_file'


vim +150 mm/khugepaged.c

b188234c53aafe Rongwei Wang       2022-11-26  121  
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  122  /**
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  123   * struct mm_slot - hash lookup from mm to mm_slot
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  124   * @hash: hash collision list
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  125   * @mm_node: khugepaged scan list headed in khugepaged_scan.mm_head
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  126   * @mm: the mm that this information is valid for
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  127   */
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  128  struct mm_slot {
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  129  	struct hlist_node hash;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  130  	struct list_head mm_node;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  131  	struct mm_struct *mm;
27e1f8273113ad Song Liu           2019-09-23  132  
27e1f8273113ad Song Liu           2019-09-23  133  	/* pte-mapped THP in this mm */
27e1f8273113ad Song Liu           2019-09-23  134  	int nr_pte_mapped_thp;
27e1f8273113ad Song Liu           2019-09-23  135  	unsigned long pte_mapped_thp[MAX_PTE_MAPPED_THP];
5c3c3afed0fd68 Xu Yu              2021-08-19  136  
5c3c3afed0fd68 Xu Yu              2021-08-19  137  #ifdef CONFIG_HUGETEXT
5c3c3afed0fd68 Xu Yu              2021-08-19  138  #define MAX_EXEC_VMA       8
5c3c3afed0fd68 Xu Yu              2021-08-19  139  	/* exec vma vm_start in this mm */
5c3c3afed0fd68 Xu Yu              2021-08-19  140  	int nr_exec_vma;
5c3c3afed0fd68 Xu Yu              2021-08-19  141  	unsigned long exec_vma[MAX_EXEC_VMA];
b188234c53aafe Rongwei Wang       2022-11-26  142  	int nr_adapt_vma;
b188234c53aafe Rongwei Wang       2022-11-26  143  	struct adapt_vma_t adapt_vmas[MAX_EXEC_VMA];
b188234c53aafe Rongwei Wang       2022-11-26  144  	struct xarray adaptive_regions;
b188234c53aafe Rongwei Wang       2022-11-26  145  	struct delayed_work work;
b188234c53aafe Rongwei Wang       2022-11-26  146  	/* Current state of adapt vma */
b188234c53aafe Rongwei Wang       2022-11-26  147  	atomic_t state;
b188234c53aafe Rongwei Wang       2022-11-26  148  	int nr_hugetext;
5c3c3afed0fd68 Xu Yu              2021-08-19  149  #endif
b46e756f5e4703 Kirill A. Shutemov 2016-07-26 @150  };
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  151  

:::::: The code at line 150 was first introduced by commit
:::::: b46e756f5e47031c67658ff036e5ffe27062fa43 thp: extract khugepaged from mm/huge_memory.c

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
