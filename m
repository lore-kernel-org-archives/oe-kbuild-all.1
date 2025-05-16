Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909CD232368
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389209; cv=none; b=X3lXoK5dEjOUnEKaJ67XDKxfASzfyq5FVAZG3kT9glngu+SpKDRyAjmg0sWCsktTQamLyUF0BVAct3/LelFQjK4eZe5XyunSwVD2ggXsWrP/AQMQf6wQ7vdyNRE481gNOzmKrmr8vn09hZeFernFS2Hq34WCxFqZU0vFhAOuNf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389209; c=relaxed/simple;
	bh=0fx3jOMQoAQVnX3BcALqVF1MiSzmJF6suFJ+g89nqsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CjQQgmoR2A0+BDzkHg4Zj4djIgDgDplLf5f9KZ778ZoC3RB4mlVgh7Jq79zGr67Domd9dgv1sOzRaUGiYve89SpRJlXSmwc8nXqqZh4hdG6KxlG4np+YJId4DdXfTEPsEdHec6J8GqAERPsZnOsTtbcWWZn578psHLuy+n85HsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7gFSxkx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7gFSxkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747389207; x=1778925207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0fx3jOMQoAQVnX3BcALqVF1MiSzmJF6suFJ+g89nqsM=;
  b=N7gFSxkxOQl0bvsIA98lnuWZtDQBBity2SE6ewyrE7wyNJIM6fuQRjnd
   TZfF727td5BkniRW8FH7ny2RvB/KwZDCv4h96No5PgYnOBZF3VYqI38P7
   g9YZHj4ufWFTIwG5D9zMXOIHhBIQPsGY/2qNf5Gx9NeFfJ8o6ti//UrwK
   H07ldcIjwcWuybz7ppLoHNmJdHBiFxqs8u2PlFfYZAu53K4/xt04s8Jfl
   FEMrn4W/PKc2u8UzGfiBhskaZwqG7Q8KLGE4dK3iQ6zNmualdPFdC12eF
   rFXE/BZANr6z/QppzDB0WiFAeqbwfz6e+U8e6grtxgv0lJkH+cWtMj3Xi
   Q==;
X-CSE-ConnectionGUID: qrAINtNmRsSJ3Ed7+LjnQQ==
X-CSE-MsgGUID: C6Gq42QIRmmfnEiV+frWnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="66905318"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="66905318"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:53:26 -0700
X-CSE-ConnectionGUID: xVidwTGjTRCQiXkEjILeRg==
X-CSE-MsgGUID: eraPixVaTeCWvyal+SIuDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138694311"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 May 2025 02:53:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFrkp-000JD1-2H;
	Fri, 16 May 2025 09:53:23 +0000
Date: Fri, 16 May 2025 17:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 5/5] mm/khugepaged.c:150: warning:
 Function parameter or member 'nr_adapt_vma' not described in 'mm_slot'
Message-ID: <202505161702.2UbApGa7-lkp@intel.com>
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
head:   bfc84bc1ba93833ad3fd1e370a33e511711611a6
commit: b188234c53aafe8941f2f2662bf015353418eb81 [5/5] anolis: mm: hugetext: Implement principal part
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250516/202505161702.2UbApGa7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161702.2UbApGa7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161702.2UbApGa7-lkp@intel.com/

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
