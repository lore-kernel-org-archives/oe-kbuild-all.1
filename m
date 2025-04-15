Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC2C1AB6C8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Apr 2025 12:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721583; cv=none; b=efY4XJaEDA13hCiojie/21nurg73XosewWsTZahUM4w/JSv2sH4fE6Xe00OJdhRvemZsd6pDTQq0VWRNW1F5qkwRoZ+x9rO/Mplb9EnG7La9Je7DGT6PB1DeDk829yCMpKbnUijI4ZTXS7jJmLq4FV1F33doTRDusAVHmjUS4Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721583; c=relaxed/simple;
	bh=004eR3cBI6KibXRlN0Kw9bPCmW9zz9ShVZ3RKupqV7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ojotcu9Ct6V4EfHNizipeFZapLomQaVtqG0i78TeYR/9lBhK5sry+h8x3nEy9SiWs304Sm4hmDHP4HfI9etrhJfxuuJEmmzxEuZSr9jiNK8ZGXdLb/iiFQG73G4+4ZNS9+uL7P6F1Pr57cJ2jmWDF6UwUfSvXbOk2rLJG1srTMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Smzs9mtw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Smzs9mtw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744721582; x=1776257582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=004eR3cBI6KibXRlN0Kw9bPCmW9zz9ShVZ3RKupqV7Q=;
  b=Smzs9mtwav8qdFPts2Up1MsGe1zaWTbeLoWZGCZxvhfJoAASwKJg8QT4
   gf7wd75TqzeDJ07tWwYx9GzjumgpFWQA3o2CqXuX5sZQZpCljNVAq544d
   OksNo6TYHFkt8eQainyMdrkPe+uSljca9ZzWmX7UVDg1Hu+F0UDLReKYa
   9EEOKT3hwekGY2IUDnt5onTh/D8ljhU6SBnMUvMAash0q55QnTRUEP3LJ
   pachjOWJASjJ0/VJBUHo+CuSSeNdRjsRLfK9wmf+M4fyN3ewn6qlA9TNP
   +tEP6dhsQLj1olQ8aWsQdfeQcouEOCwAjlAHGvsUkTBm0W6xmtAK5xw6J
   Q==;
X-CSE-ConnectionGUID: LtMztxmTRNa4ZGC2CYidIQ==
X-CSE-MsgGUID: yG2PnHPwTV6egfkYAnSTSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46144623"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46144623"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:53:01 -0700
X-CSE-ConnectionGUID: 00+iH8yJQ/6e9zMLCdZmpg==
X-CSE-MsgGUID: +cVreRNyTsWjOYSMkSqLnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="134216457"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Apr 2025 05:53:00 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4fmc-000GBC-02;
	Tue, 15 Apr 2025 12:52:58 +0000
Date: Tue, 15 Apr 2025 20:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/khugepaged.c:153: warning:
 Function parameter or member 'recheck_hugetext' not described in 'mm_slot'
Message-ID: <202504152035.zbEUg7xn-lkp@intel.com>
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
head:   2c7dfbdd3c7b70c7b1386b9615f4670e2861d1b0
commit: f835999265e7e2bab5dcadbe2347c28d35e52c94 [9/9] anolis: mm: hugetext: Split cold adaptive thp
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250415/202504152035.zbEUg7xn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504152035.zbEUg7xn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504152035.zbEUg7xn-lkp@intel.com/

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
