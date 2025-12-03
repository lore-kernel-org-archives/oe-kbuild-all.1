Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88442C2ABF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 08:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750267; cv=none; b=uwvJpP1qgxXxoaLJ2ZwOHoY2MTpbC+EJemUjT3KCP8FnhmqGT9qpuKZMlrr4OjxQE59msc7s5i7WnsLiJwPSAjs453s+GVURr+C71AWWK1+UdE3Ucj44KU5OkxyfLo1i7zQ9sqqiHbi4M0EMuDLpjqE7gGE3z7ygGRs7Wf/EiH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750267; c=relaxed/simple;
	bh=YYHSXdZFI6iwXN8a65rdwL8LYD2q7OuYUHUkV+80Q1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5S+l+yuPwiNaibDf1vIom7ah4Xg8o7lpZyMlSMPyJv6/rJBguEMGuIg1DEERYhqe9P4+A4aN2L2FQ10FTaBV4d8TtjiMJSh1vOwAK1E48H4olAo1akMGImfKDegnxvgvzlViRVedU+WZSkMu5jUBaNxeDbvnId+eMOEb+0SJ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XV6qCQic; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XV6qCQic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764750265; x=1796286265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YYHSXdZFI6iwXN8a65rdwL8LYD2q7OuYUHUkV+80Q1g=;
  b=XV6qCQiclsxGlq3/BK7Beg4w4NItml/bt7bfeULP/K2EuDbVsmMtk/6k
   v1HQROoOJrT1SVd+6+Odswj1GIfF7qvBohkiGwZrzavfKyhD1kfrGtPCG
   Bs/pCV9W7H0q8zsOytZdnpiyF/SxD3/0H1MrHpGQx6WP0E9eONWr372Ue
   oeLUqYFafimFh0LELg/s77PguYsOOQkN7hdEzbpJaeCJ2GYHdRsmAtQ4i
   +qm3eIMNq8r5wvzGYTkQ7jj6mxebkOZ/lAwXd8bZSNy8LyFwlIRfGHdlE
   VE7L5OzQFzrNvv/tQ8K5eqwd+7VV1To/5uE69J4U8S703qZkqgQZSDX8F
   w==;
X-CSE-ConnectionGUID: JFiu2IegTB6+NqbP6qEWFQ==
X-CSE-MsgGUID: xtOvvXhjQdS/ylyuypgNEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84332427"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="84332427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 00:24:25 -0800
X-CSE-ConnectionGUID: hBaHeMKaRSOHP172H57xVA==
X-CSE-MsgGUID: STYUNi/zRfyRk5Sbxd6bzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="194434494"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Dec 2025 00:24:23 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQi9t-00000000Akf-16OV;
	Wed, 03 Dec 2025 08:24:21 +0000
Date: Wed, 3 Dec 2025 16:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/khugepaged.c:109: warning:
 Function parameter or member 'nr_exec_vma' not described in 'mm_slot'
Message-ID: <202512031617.aalPV9fs-lkp@intel.com>
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
head:   495c6b49736046cad5a06a343ca0be2750aed6fe
commit: 5c3c3afed0fd68c32fca885daf7c6fbf46007a25 [2/2] anolis: mm, thp: hugetext: accelerate khugepaged for hugetext vma
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251203/202512031617.aalPV9fs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031617.aalPV9fs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031617.aalPV9fs-lkp@intel.com/

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

27e1f8273113ad Song Liu           2019-09-23   87  
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   88  /**
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   89   * struct mm_slot - hash lookup from mm to mm_slot
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   90   * @hash: hash collision list
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   91   * @mm_node: khugepaged scan list headed in khugepaged_scan.mm_head
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   92   * @mm: the mm that this information is valid for
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   93   */
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   94  struct mm_slot {
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   95  	struct hlist_node hash;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   96  	struct list_head mm_node;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   97  	struct mm_struct *mm;
27e1f8273113ad Song Liu           2019-09-23   98  
27e1f8273113ad Song Liu           2019-09-23   99  	/* pte-mapped THP in this mm */
27e1f8273113ad Song Liu           2019-09-23  100  	int nr_pte_mapped_thp;
27e1f8273113ad Song Liu           2019-09-23  101  	unsigned long pte_mapped_thp[MAX_PTE_MAPPED_THP];
5c3c3afed0fd68 Xu Yu              2021-08-19  102  
5c3c3afed0fd68 Xu Yu              2021-08-19  103  #ifdef CONFIG_HUGETEXT
5c3c3afed0fd68 Xu Yu              2021-08-19  104  #define MAX_EXEC_VMA       8
5c3c3afed0fd68 Xu Yu              2021-08-19  105  	/* exec vma vm_start in this mm */
5c3c3afed0fd68 Xu Yu              2021-08-19  106  	int nr_exec_vma;
5c3c3afed0fd68 Xu Yu              2021-08-19  107  	unsigned long exec_vma[MAX_EXEC_VMA];
5c3c3afed0fd68 Xu Yu              2021-08-19  108  #endif
b46e756f5e4703 Kirill A. Shutemov 2016-07-26 @109  };
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  110  

:::::: The code at line 109 was first introduced by commit
:::::: b46e756f5e47031c67658ff036e5ffe27062fa43 thp: extract khugepaged from mm/huge_memory.c

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
