Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5DC1E7C1C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 21:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235404; cv=none; b=MhMF7tE7517wm/38OP2Q/gpQkJC3Wf6iBsYQdmn67nwZCxg9ns5A7NKrBqr2PMicS9+2UwgqeBjQlCyhQxjjHK/9vIaXa0oBhqbVmFBAYnzUaw1ZVAIJdN4GzZHeXYgsvlGgIAgxeT6kViV/rXSx/2WEF0NQG0REK+7Ow4Yf19U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235404; c=relaxed/simple;
	bh=NH9zoMbhJxqfzpaS+2hyroVEWwfTihi2gUOGmsU3Iww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a780QU5+pJZTQAbpILTqO6jUWh6g0okJBSOpNeSeHCZot+qVFSY9+Ln/5CpG4w46huX3RyPvzUWFx5WUT0xGLuO9FOXh9SzfcifoYY6SPMuu2GPhQPIxPUoSkajexO+OhP03KB1x79dR7u7gPbVAnac/6NtRqYvVmZGtuIXNHXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKENQ2YO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKENQ2YO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744235402; x=1775771402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NH9zoMbhJxqfzpaS+2hyroVEWwfTihi2gUOGmsU3Iww=;
  b=KKENQ2YOPeqOit79seJgmxexvvYEbMxtBQzqaG3ask4whM6sTTHNFqfR
   yS0cKWGFJE1FOBTGXhtiiHKpDxq3QGXcxxYR2OmnuyUl4h6w7e8ESrvEe
   M+D93rrbD3sIcx/WS+R5BUjvWwAXgO08zbeuFuTs+Jx3ff4b5CZN0pIRc
   p9azU5oTWBaxTeiG5e0Z2kaXKLXKmTAl1P2aU1sst2XEThm+8ELKeio5b
   OXb0UrV9JWcqJY9pOYM7XOOmatDAI4e4myDGDLr0exqV0DSFoYZEKEJ9O
   LzWAA8h3+7lDL/M1HSt/SPCC7ajg2A48mbu1IYrNL1WGv4CXgi9Wm3YFN
   Q==;
X-CSE-ConnectionGUID: 2tF2ojSMTCmu/Oo2mkgq2Q==
X-CSE-MsgGUID: SJPV8NfPSWawksxf1ehl5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45447163"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="45447163"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 14:50:02 -0700
X-CSE-ConnectionGUID: fuVTeWpzSXG3WSdIEv645Q==
X-CSE-MsgGUID: m9F/gK3UQ2a86vlD/pl5Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="128673002"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Apr 2025 14:50:01 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2dJ0-0009Lz-2q;
	Wed, 09 Apr 2025 21:49:58 +0000
Date: Thu, 10 Apr 2025 05:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/khugepaged.c:109: warning:
 Function parameter or member 'nr_exec_vma' not described in 'mm_slot'
Message-ID: <202504100509.Zq5nrogK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   c858cdc0756d595fe5de0dd4c617f7b5a8971ec6
commit: 5c3c3afed0fd68c32fca885daf7c6fbf46007a25 [9/9] anolis: mm, thp: hugetext: accelerate khugepaged for hugetext vma
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250410/202504100509.Zq5nrogK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504100509.Zq5nrogK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504100509.Zq5nrogK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/khugepaged.c:109: warning: Function parameter or member 'nr_pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:109: warning: Function parameter or member 'pte_mapped_thp' not described in 'mm_slot'
>> mm/khugepaged.c:109: warning: Function parameter or member 'nr_exec_vma' not described in 'mm_slot'
>> mm/khugepaged.c:109: warning: Function parameter or member 'exec_vma' not described in 'mm_slot'
   mm/khugepaged.c:1493: warning: Function parameter or member 'mm' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:1493: warning: Function parameter or member 'addr' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:1695: warning: Function parameter or member 'mm' not described in 'collapse_file'
   mm/khugepaged.c:1695: warning: Function parameter or member 'file' not described in 'collapse_file'
   mm/khugepaged.c:1695: warning: Function parameter or member 'start' not described in 'collapse_file'
   mm/khugepaged.c:1695: warning: Function parameter or member 'hpage' not described in 'collapse_file'
   mm/khugepaged.c:1695: warning: Function parameter or member 'node' not described in 'collapse_file'


vim +109 mm/khugepaged.c

27e1f8273113ade Song Liu           2019-09-23   87  
b46e756f5e47031 Kirill A. Shutemov 2016-07-26   88  /**
b46e756f5e47031 Kirill A. Shutemov 2016-07-26   89   * struct mm_slot - hash lookup from mm to mm_slot
b46e756f5e47031 Kirill A. Shutemov 2016-07-26   90   * @hash: hash collision list
b46e756f5e47031 Kirill A. Shutemov 2016-07-26   91   * @mm_node: khugepaged scan list headed in khugepaged_scan.mm_head
b46e756f5e47031 Kirill A. Shutemov 2016-07-26   92   * @mm: the mm that this information is valid for
b46e756f5e47031 Kirill A. Shutemov 2016-07-26   93   */
b46e756f5e47031 Kirill A. Shutemov 2016-07-26   94  struct mm_slot {
b46e756f5e47031 Kirill A. Shutemov 2016-07-26   95  	struct hlist_node hash;
b46e756f5e47031 Kirill A. Shutemov 2016-07-26   96  	struct list_head mm_node;
b46e756f5e47031 Kirill A. Shutemov 2016-07-26   97  	struct mm_struct *mm;
27e1f8273113ade Song Liu           2019-09-23   98  
27e1f8273113ade Song Liu           2019-09-23   99  	/* pte-mapped THP in this mm */
27e1f8273113ade Song Liu           2019-09-23  100  	int nr_pte_mapped_thp;
27e1f8273113ade Song Liu           2019-09-23  101  	unsigned long pte_mapped_thp[MAX_PTE_MAPPED_THP];
5c3c3afed0fd68c Xu Yu              2021-08-19  102  
5c3c3afed0fd68c Xu Yu              2021-08-19  103  #ifdef CONFIG_HUGETEXT
5c3c3afed0fd68c Xu Yu              2021-08-19  104  #define MAX_EXEC_VMA       8
5c3c3afed0fd68c Xu Yu              2021-08-19  105  	/* exec vma vm_start in this mm */
5c3c3afed0fd68c Xu Yu              2021-08-19  106  	int nr_exec_vma;
5c3c3afed0fd68c Xu Yu              2021-08-19  107  	unsigned long exec_vma[MAX_EXEC_VMA];
5c3c3afed0fd68c Xu Yu              2021-08-19  108  #endif
b46e756f5e47031 Kirill A. Shutemov 2016-07-26 @109  };
b46e756f5e47031 Kirill A. Shutemov 2016-07-26  110  

:::::: The code at line 109 was first introduced by commit
:::::: b46e756f5e47031c67658ff036e5ffe27062fa43 thp: extract khugepaged from mm/huge_memory.c

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
