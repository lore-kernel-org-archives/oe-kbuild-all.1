Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E920521A42F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 19:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753297798; cv=none; b=eCxKqKHXTInIQIQ9wRYFnrAIHa6M/muDTNMesg76dr2DeKOiVLX8KxHrNvSpMVQe8zZIRjT/8ty4W//My3xGwpYcGfjypilLLMNWU+VOwTLL/dAoNiPNvXgAqNGmNBPns1E4p3eNZYbe+D18DL6AdPpe6KiA1HZpTUTWrmsy1cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753297798; c=relaxed/simple;
	bh=G4c6/ZBDkM1u7b35ZpACz9m8yf1Lyz9LyUrQojvSkSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=liJ3uM1HyoYDKfY2hmcjPsZYGViZ5NPMl5j5HU6GmFmy91ZhNFQjt1IEw29z4ZUW3YAro8qzwkNhBvmgZwv5s49MeWQYfRfy9/FduAbQWm+35sYZ1DdZyozGApEhQ4lI/7Y5r0XmGesRBm4MHxZ8FXaLwrPZMVyBlkEZmDgbGE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwPujnSi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwPujnSi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753297796; x=1784833796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G4c6/ZBDkM1u7b35ZpACz9m8yf1Lyz9LyUrQojvSkSE=;
  b=fwPujnSiEK1l+gNz1Udr21XTyf6b8876whHsaP6WvyZwtDRAwePF84tK
   um/+jNAf6i26VhvJK2XVIIr/3sD+eVBQIHI7JeFHifDkg/vT11jc/HqKK
   7Fp2Bzn0GHEfL+DJ8Zh3ja8hTTIvsKfQr223RPKh8mBPxvtA3v+UjTgQw
   g7eK5dPxSxLfXM9EdwR+wk7ImjEeKSPEO4aGFwmv9yHe1VyX8MYzqydXw
   2EOnH4+FkLq8aqqc9vG6B9xGBigRQQyC47ifPhDOUXGA2WEXjR6sHzQ1j
   lslr2KCPvRQX8871ExBs+lZr31DiwnFVtFl3ihtusazRRuoz+NOR2z7WF
   w==;
X-CSE-ConnectionGUID: qy5BBtbvTAiKaLn3TPaWpw==
X-CSE-MsgGUID: NUsLjxIdQgKdsBJYGtklsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66292878"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="66292878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 12:09:55 -0700
X-CSE-ConnectionGUID: dJnhYmVyRsGr/BO/fJQE6Q==
X-CSE-MsgGUID: 6aiHIUDuQ4Wklob85LZV4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="163963166"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jul 2025 12:09:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueeqe-000Ji3-2Z;
	Wed, 23 Jul 2025 19:09:52 +0000
Date: Thu, 24 Jul 2025 03:09:19 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/9] mm/khugepaged.c:153: warning:
 Function parameter or member 'recheck_hugetext' not described in 'mm_slot'
Message-ID: <202507240319.36SLLT9z-lkp@intel.com>
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
head:   7fc3abd8b21f1ef01108269b858d36abd6b95372
commit: f835999265e7e2bab5dcadbe2347c28d35e52c94 [0/9] anolis: mm: hugetext: Split cold adaptive thp
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250724/202507240319.36SLLT9z-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507240319.36SLLT9z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507240319.36SLLT9z-lkp@intel.com/

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
