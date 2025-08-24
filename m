Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21F41552FA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 08:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756023279; cv=none; b=JjnlaVcQrKsoPBTi14Tz61YAx9U2OJk4ZMyLqfy7l2avcZl2H+JLJB4C73VEiVLntBRFw1eksxSBHe8PLwsKWCUO7FbrYnIN9Px92wkijiNe+x+6hu2xk+RwHSmI2TpexQtacNh8zZkDD6sbDsOTAMljlkFQ6rGE57SOh+tC1O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756023279; c=relaxed/simple;
	bh=Z1w1qZi6Pkf27ivVItD2F1YKME/zrEh/zJZh+1LydbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q6Z2OpEAzy6GKeHuChkFILLd9eLeg6egQJsnQvZOQ964dfIpkfpds6wmth/3Yh8Hpk+oiSJV+OBt7LBwMZXepL2NCk2/kZD+fZWHmw+I8UUdh76zcYmmiysuVwQWqoYTkfjAEORR/ZhyBNK+Em8CXVDtV/0WZ98rTLlkN9I9+cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkrxyOzK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkrxyOzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756023278; x=1787559278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z1w1qZi6Pkf27ivVItD2F1YKME/zrEh/zJZh+1LydbQ=;
  b=IkrxyOzK68hm/EzGHRs8u1kLVzJyhSmLPzBGpaM/i0peXLLhwRPse0Ei
   cbl38hG5OsHdVLp3vSjKDvOTuhdomIzZXrQPfGAkfqLnjCMCWy4FbdskK
   IgK/DeDauZzFLaYgKUwdCG0Oar4+fcfCUO+i6QF0mUbtmSZz01evsjzZq
   XSLQEiiKZwbZ2cKkGN0K9nRENcjYXpXc01ZtFYqV6CfPC9XK87/I2E2YR
   Edi8Olds1RPis9EFC4aisPWTlpJCmbYWGCyElmY5yyZZFjE5u/VetUoqW
   uTWHFl1K0DAt2bKiO7vofSeJzzZUGWrlnUFGWQjwICq3j1K9Pc7oJcZVx
   A==;
X-CSE-ConnectionGUID: O316ZQVUQQW7ZZf4hQ/Rqg==
X-CSE-MsgGUID: kwvf+kfrShKTBUieF8uH+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="57285904"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="57285904"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 01:14:37 -0700
X-CSE-ConnectionGUID: VN30LZVzS4SWZhJK2PS22g==
X-CSE-MsgGUID: iHTobK7RTAuJNVEPFMHQUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168654205"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Aug 2025 01:14:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq5s1-000Mt5-0z;
	Sun, 24 Aug 2025 08:14:33 +0000
Date: Sun, 24 Aug 2025 16:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-GNR-perf-uncore-ANBZ24140 0/2]
 mm/khugepaged.c:153: warning: Function parameter or member
 'recheck_hugetext' not described in 'mm_slot'
Message-ID: <202508241611.ObMAR4DF-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-GNR-perf-uncore-ANBZ24140
head:   5b97140220e2f9196fa5de48f6be468691f8b43b
commit: f835999265e7e2bab5dcadbe2347c28d35e52c94 [0/2] anolis: mm: hugetext: Split cold adaptive thp
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250824/202508241611.ObMAR4DF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241611.ObMAR4DF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241611.ObMAR4DF-lkp@intel.com/

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
