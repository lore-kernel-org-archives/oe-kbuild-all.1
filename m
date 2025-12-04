Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E6B398FAB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 23:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764890505; cv=none; b=AJBaVXk0EvyJIWfteplI1M6V143lSTWCKHDck5MHaMJ+GsgjFoS86HnNm0Bs56cuUIwHaYlfM44eP0ZpYvICvTvhUMMDz3RkFxPlBAmSW/E/z5mMlg/FFO3FojnN3eRmRTjjEr2KkHucrLsgB6dWebob8ZHgPeUqa2AU5sAQO4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764890505; c=relaxed/simple;
	bh=5y10tCpmUwCMDbM/99f+u7tzBawnZqi2tWTQHcHkuyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHD5ztkc/fdLIKJYZkSUL4J7ei1qZlaU1kR+kVC8o05HxJ3kUXmndyVLx7G00PZeOY2pJxof665uETZITnlIxX3iuW5gFRn73Pc7N8yp9VbPxXi716AOEfSp2kEGkwR9GU8PEN+cIEWgOuQ7pWN2siUVruX74UaiNyUoyIhmr3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1hX3+eL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1hX3+eL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764890503; x=1796426503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5y10tCpmUwCMDbM/99f+u7tzBawnZqi2tWTQHcHkuyE=;
  b=C1hX3+eLa1AdFg17wvPfH+5xpX1jEw7s7+UAfKov4A6GuXh1+Y2A946c
   3BUxBPsuEv6ZKqZ613bsMxJNxAxbK3NKEQ7PWZygUBtnBlPtjNfmTiIJa
   fN+IxjAY4EK6V53k8vzn9LqflJ7xeW/is3uLhMSGGSM8NbN0/2WXC3+vf
   2WmIMvQM8+a92NS39IK578WdscUdrYOkTb8zzLSSWVBSq4IN4rP4FAmt9
   dSGTf346IaeSsHYle+ypQDE+BPzZMRAaHjXw/BUXep7ryJrNLf6xAq5TW
   SSEbt3J13GO926QwzZ/HSxgJT6RYzv7b25bYaJi7jnitmUdsFD8wvIWWz
   Q==;
X-CSE-ConnectionGUID: r9UsinUQTcKQOYigTljcWQ==
X-CSE-MsgGUID: l+DUsfjpRTSKMiE2tPCeBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84530046"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="84530046"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:21:42 -0800
X-CSE-ConnectionGUID: kco3Rj4SQi2Kwq8Tx7OAKg==
X-CSE-MsgGUID: APANPhWwSyqg2Izctbu6Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="232473194"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Dec 2025 15:21:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRIdn-00000000ELd-0OsQ;
	Thu, 04 Dec 2025 23:21:39 +0000
Date: Fri, 5 Dec 2025 07:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/khugepaged.c:153: warning:
 Function parameter or member 'recheck_hugetext' not described in 'mm_slot'
Message-ID: <202512050719.plmfmj8x-lkp@intel.com>
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
head:   31b356d59497695e1135b4c6ea07b6d0bd148e07
commit: f835999265e7e2bab5dcadbe2347c28d35e52c94 [2/2] anolis: mm: hugetext: Split cold adaptive thp
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251205/202512050719.plmfmj8x-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050719.plmfmj8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512050719.plmfmj8x-lkp@intel.com/

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
