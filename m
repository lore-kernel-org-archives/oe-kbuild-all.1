Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAC74414
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 07:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747379836; cv=none; b=IHiGI5dhI6OI8/rRuZwceaHqGCA3+P6uI0k0mPKZlfPGFlum/pwoMz0nomKOv0Rg4mZS+fxAvVwj4ZBx3xlMSyA6JkZJgRxo2dOcL8c2owZ7OgAtsJoGpceO4wlEPPfHHtZpnvy+KJw4zFsGk98aPUfSGAUMs7VBBehKp2zTStQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747379836; c=relaxed/simple;
	bh=KpI/mSMkBZE7S/7IbzQlZeky7v+4OsFMawJnEQ7pZgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NTzJP+vcFt9sTyJ1NYMduBvQ4R68ON8FwnpGpgXZz0JtG8pC/5jmYSMa1aJA9uburLDz3x8guZbRHcI5nH4c5+2kon3/8qfsjJOmgDtKs98r0LvIEE3AU8tLMOB1ArmAgs/jIAFVEF7ge6CxzGEl67K33DCqFsOBd/w3/MPz31k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h79NUCL5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h79NUCL5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747379835; x=1778915835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KpI/mSMkBZE7S/7IbzQlZeky7v+4OsFMawJnEQ7pZgc=;
  b=h79NUCL5gicHp1cNcPY1Viy9rD/FDBzt4tO4sgFVheNeaiLpnlMbz/Ps
   q6O1YemqzNHfIQ5xPzj3CVbryW/cOW0ik5A9T3mL1n2fmENEAFFl9+0IJ
   KHNQDYvQN7jXomv98Ck7omhGhxjNqG+AIYFUUFfrH3cJSlGe9+/YJKHZL
   VLwFt1RMS9V3cU+9LyYIIyJqUAgDXZIjifQtNrNPsJDDI4U2GIVjPnduw
   nZzI4d0NpPHDfHIli7chmId8jXFquQo7YoctJ8rBlg3nt+Yy/7JXKN2Vx
   pfxlrcXLWR2TIE37bC1NBzzmkQ5uzTvfc8+TKtJot9vLKVwsIFKyL0Q2I
   Q==;
X-CSE-ConnectionGUID: i/T4HRI8Rpud3gvDUXq+dQ==
X-CSE-MsgGUID: xVFxktH0QrmdMJUPzX5jEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="74741226"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="74741226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 00:17:14 -0700
X-CSE-ConnectionGUID: nK03aAh3R6e2u4+E8LVhLQ==
X-CSE-MsgGUID: Inn/NoJoRz+G4yG0v2ZBDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="175742074"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 May 2025 00:17:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFpJe-000J5T-1Z;
	Fri, 16 May 2025 07:17:10 +0000
Date: Fri, 16 May 2025 15:16:39 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 5/5] mm/khugepaged.c:109: warning:
 Function parameter or member 'nr_exec_vma' not described in 'mm_slot'
Message-ID: <202505161533.eZDM7nec-lkp@intel.com>
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
head:   bfc84bc1ba93833ad3fd1e370a33e511711611a6
commit: 5c3c3afed0fd68c32fca885daf7c6fbf46007a25 [5/5] anolis: mm, thp: hugetext: accelerate khugepaged for hugetext vma
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250516/202505161533.eZDM7nec-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161533.eZDM7nec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161533.eZDM7nec-lkp@intel.com/

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
