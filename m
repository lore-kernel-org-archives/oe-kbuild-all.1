Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6D41F12E9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 19:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755978655; cv=none; b=D+54+CfO5F3yHiW1im2MzP41Dd3E7lUkcAYKl9utZ8CEnuS7RW1ShIn/TSqF8wuRWzvvCLzcB0xx0GmsTYN8/zZPjQtcrFLZxGqbxZBgpc5KvY0YVeThQTgkGvDpQxmgYCmiJNJyy6IjRpOBOoP/JZVtW2WOeng1t0do4vOAyz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755978655; c=relaxed/simple;
	bh=qX0J8vBxh+rpUu2U+98jN+g0gLSiYMh07mrHwwIrDVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sEE0CIQVSbbSJeafhDtxe6tpF+qJrZJPmK6v5RV+zMuPcD2t2dRNhKz5GR22LraPpMV5U/BPb1d8qbC95uZfn1tf/k9KTSIPML25LXPZxkeaB0vSfgL+X7Mlc7bNiCksMjWEEjlIrHJJ4/TLJ51a4HN09G2kt/Ubo5GtVxojOFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNvLWofF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNvLWofF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755978653; x=1787514653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qX0J8vBxh+rpUu2U+98jN+g0gLSiYMh07mrHwwIrDVw=;
  b=QNvLWofFXV81rlxw5uxqhNfK9Tk1ilUpj/mrngtYwGqLcIDuC4TW06Lc
   iZr9Re4JRVELcIPBzHLMt4uiwxxiEjmgeVEgkqdreluc3+5OZI8kA7Q5Z
   SDLIxXt4V84vy0IXdoanSr7cMq/RmnhN01FExOGkhkQoruw95M0BTO2Ag
   so8AJ2PO7nza6cbmdQ4E+BTkSocgShLFQIGUnuyXvpnhQSNnP5Y3VhCxF
   SIoXwrjIeTZ6L/xSlnaAwQ6UaHP9jKk2lgl7KgVpuGGdASxak1vHKFNjW
   WfDLwpruMhtB0Wv7+ebBXfrm3NHl3gz1nqbkhXLreO48dImyjUtmyTHSY
   Q==;
X-CSE-ConnectionGUID: ExBXLo8OTLiYG716msu7Iw==
X-CSE-MsgGUID: QL7fZjHrQw2XxFLoaxQepA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="80843659"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="80843659"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 12:50:53 -0700
X-CSE-ConnectionGUID: mL1DDiIyTuOOjZdLn1ixng==
X-CSE-MsgGUID: vf+wawscSiy2Gcfnb/nugw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168197167"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Aug 2025 12:50:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upuGH-000MY5-0B;
	Sat, 23 Aug 2025 19:50:49 +0000
Date: Sun, 24 Aug 2025 03:50:16 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-GNR-perf-uncore-ANBZ24140 0/2]
 mm/khugepaged.c:109: warning: Function parameter or member 'nr_exec_vma' not
 described in 'mm_slot'
Message-ID: <202508240331.QAHBHMUi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xu,

First bad commit (maybe != root cause):

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-GNR-perf-uncore-ANBZ24140
head:   5b97140220e2f9196fa5de48f6be468691f8b43b
commit: 5c3c3afed0fd68c32fca885daf7c6fbf46007a25 [0/2] anolis: mm, thp: hugetext: accelerate khugepaged for hugetext vma
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250824/202508240331.QAHBHMUi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240331.QAHBHMUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240331.QAHBHMUi-lkp@intel.com/

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
