Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918D715D3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 04:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756011499; cv=none; b=gOq1wr/WGDuTzXee2/uhxq8aH+9ByvC+cM19qFUU33S+DCXaDR/TCJw1DWpx9ZCYVkQohYcyiZ5bEwJfAfMD8gDlJoMK2aYU87R0Cgoe8fj3GBDpALSmkdDlRRUvT4mftnXwR1RN4ZqffD9VtosYyM9Noka4nQCOENplbFpWgLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756011499; c=relaxed/simple;
	bh=5PPLoRDk0W1ex6AfiJG5pI/ntYTochOhSCrdlWsWcRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lB9b0BZlWx/2RHpyTS2wT9/Tnmyk6Da6Jc/EL7wjhiniMlw2ek2cKs7bIPw7j5UD9pOKt0QPweMuXBp4Pr+ytbdCeD+2NC59v51uCIec5WSdvhQCY6hUHdlkQ9cEhS5NXDMZqtH43VnAqx13yhFlWBbMMV4zeAUQm4qJicS4MHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHwGTXX8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHwGTXX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756011498; x=1787547498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5PPLoRDk0W1ex6AfiJG5pI/ntYTochOhSCrdlWsWcRM=;
  b=KHwGTXX8sqzI3XLyAx/yibXZEzJi1BG9LvTGAonzv+DhXOrciTH/VRL4
   Jq+GZI7/BmA28mKgC+FIvk8ZlwTqFIyenFXJia2Cb8cVBsPNfvk+SyYqV
   IqupqnwgxaIeyqd+mWCujvR2TNKykHb9yqgHkSAzvmPvncKs78dARBgZh
   llzmix3qGOfA+6BwL0pXjt1o2N+4aYVgAJoUiQKTlMvNdC5m9HtBp/5K8
   IZ/LwZTTl5IjeFURBCHwdY7Nh3a5wnaEhX8U48YGK0j/JjJuyrtcfQtZA
   OWe08nN+Ji9NNS7r/I9L7vFJhvFqKu75Wszs0bzj0SiOX1QafHEHI/ivl
   g==;
X-CSE-ConnectionGUID: 3VyrGCTaQYeZzHfBkGopJw==
X-CSE-MsgGUID: 6nK6JREvSzaMUsGQt/jn3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="57463880"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="57463880"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 21:58:16 -0700
X-CSE-ConnectionGUID: cMiCvNZwSuSJ4MK9uaDJlA==
X-CSE-MsgGUID: Gw3fYOPGT7um2Gz7eME2xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168922503"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Aug 2025 21:58:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq2o0-000Mlz-1p;
	Sun, 24 Aug 2025 04:58:12 +0000
Date: Sun, 24 Aug 2025 12:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-GNR-perf-uncore-ANBZ24140 0/2]
 mm/khugepaged.c:152: warning: Function parameter or member 'evict_timestamp'
 not described in 'mm_slot'
Message-ID: <202508241257.1M7NftMO-lkp@intel.com>
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
commit: bf2c1d13d55c0fdac556938a3cde016341d985ec [0/2] anolis: mm: hugetext: Update adaptive entries
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250824/202508241257.1M7NftMO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241257.1M7NftMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241257.1M7NftMO-lkp@intel.com/

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
