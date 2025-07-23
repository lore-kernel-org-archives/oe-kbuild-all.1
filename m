Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FCC23BD1F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753281564; cv=none; b=qqZvsZKdGbynkUOInjZ406Wxj4WMrFUbMSujWhT5K30LxOcFjnOkdN3ZdR/8I7hWSEDhkOU1qd9fQ5GqrGwcY7FLRC1xOzXvJfdyKPByf5nXZmVIMVOneXEwzk18+MkEczzwZfI/My5iY/63Ls2bbtgj1CIp8P7w+CrJcTwjZe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753281564; c=relaxed/simple;
	bh=UeSr3FQEEdS2EzQzQlKwW1K+b6fD1vIqeg4j4iftx1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iS92kJbuUnb+g8Bem2hzyZh+BHoFysfGrauXs9n4vpgnjpgtsIlOwRPUR1YcDc0LaZa3RX+Vc2Uf6G6JbYygx29ncAPaRoGKHleEqJszB25o62sDDT3PzFcjGjzsJZGXV3obbbI3mIoD9OU1+R4/U8RoVeCO7S60+KzWk5Qj1i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRXKY2dj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRXKY2dj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753281563; x=1784817563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UeSr3FQEEdS2EzQzQlKwW1K+b6fD1vIqeg4j4iftx1g=;
  b=IRXKY2djHyQL3QVQcA7PGTDA5OZuY2C60zAJowgna0fO50B64pIrlnS3
   Q7X+GOt6PNY9uXLlRL0erB99DIwqCkAUP37ireQZfqXtLzFSKOHMN5zZ+
   c6u/xGsg1duTlSdtxCYis0H3/kYu/oy7rz3+N7MOBJYDQXe5kiCBqPmX3
   A8DduoBAKPBJ+3MakFnDDGAUktF04Mf6XhRl8xKXw2hlv185zCrN9yE31
   pwUH1F7gjDH3076Zq4xjS5GOXikxyonZdG2l0kheZqP4m/6Po51PMYZkg
   BfqICU5rhIpN0kP6iiM99dKvakUEWxE3u1Q3QMr0NzbwEIB7UnuTh8Qhg
   w==;
X-CSE-ConnectionGUID: gE+18m1zTjarb0vH2mGSxQ==
X-CSE-MsgGUID: bb9mILrMTmu45mdKuoNnjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55509098"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55509098"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 07:39:23 -0700
X-CSE-ConnectionGUID: IWPpSpEfT5KkTAAjiL/Zuw==
X-CSE-MsgGUID: naxI0VSqQGKkcAIADwiwUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="165186035"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Jul 2025 07:39:22 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueacp-000JRX-0x;
	Wed, 23 Jul 2025 14:39:19 +0000
Date: Wed, 23 Jul 2025 22:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/9] mm/khugepaged.c:152: warning:
 Function parameter or member 'evict_timestamp' not described in 'mm_slot'
Message-ID: <202507232245.k4uihdv0-lkp@intel.com>
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
commit: bf2c1d13d55c0fdac556938a3cde016341d985ec [0/9] anolis: mm: hugetext: Update adaptive entries
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250723/202507232245.k4uihdv0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507232245.k4uihdv0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507232245.k4uihdv0-lkp@intel.com/

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
