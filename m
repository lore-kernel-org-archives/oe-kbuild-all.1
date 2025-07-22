Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3602D25B1CE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 16:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753200728; cv=none; b=nmjaF8R2+9yHsntX/IXrFNFEJfBJTL3AIS705y0PNAzSU4GH9u5kwHy/uyiURm6MnJ3mzqN2xsMKzUqjtl9SRWTwLq10IXJuMpmEh7RwMBlq2QY2ubPBWzquLRAy1jJHKqTUbB56piykaK+ZXBJ/Hjxc9xWhAQ3glePY0CMWMnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753200728; c=relaxed/simple;
	bh=/Ef6Hw+X+c1nsb6o0jyKp9JO0TX1XY+WPAVatK4S1Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E00u9i9o3QSjirMkGUlgi6l3uf2BxTobJspsZ/SYg2pqYBpO1Y25PalN9n+vMlWu0MwwT7vWWgLuwWDmgFgdHbg4Qv4Ibo1wW2wSH0iETVIispUXdY4twB5E01qTxFb92a01BmFi1MWxRHePefJcu9UcxrB7VDpkh4mcoyfgRyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDFeXNjq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDFeXNjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753200727; x=1784736727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Ef6Hw+X+c1nsb6o0jyKp9JO0TX1XY+WPAVatK4S1Ck=;
  b=GDFeXNjqeLwxL+zwUgSuhaydKLFFaisEdo9Ffo2h9cntviTREO9dSleJ
   bawSg5Ft5Ii0JnLv0IL6Oj7cn/jGKYd5yM5407wS/sSsgbmvUbPlbPbx3
   g/N+qPVXP4FAGULb2zF40vKTaNoAWE2dwRGRs3jV5rBygImiQwjVqJLjF
   H2kmkmCb3N2ItIO5nmWufb42/CHaoCb4FLHfKoy1jT1lkPWyTweWSLdnP
   yLG+J6B7aWdetPcSZWF2EoAWkMrlsxnyyJlBaaw0XJrAyKpz9EJJZjv24
   ZXSSk+/4UcWvRX9qaWEHzfS89QzvBiZpOnC34B/d+hARKZgeHWWBFjCgR
   g==;
X-CSE-ConnectionGUID: L3COnMFTRrOorlIRRgSDqw==
X-CSE-MsgGUID: AiYjJkjhRTm5t665V/bLAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="65724470"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="65724470"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 09:12:06 -0700
X-CSE-ConnectionGUID: d1i0gEEZTcC84MRYxg26tA==
X-CSE-MsgGUID: QSxWqAs1RWqxtURHfJKDVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="159922198"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jul 2025 09:12:04 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueFb0-000IVV-25;
	Tue, 22 Jul 2025 16:12:02 +0000
Date: Wed, 23 Jul 2025 00:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/9] mm/khugepaged.c:109: warning:
 Function parameter or member 'nr_exec_vma' not described in 'mm_slot'
Message-ID: <202507230004.i9Bn5EWu-lkp@intel.com>
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
head:   98170019bf7a4069eb0c41aba1bad66e55c20835
commit: 5c3c3afed0fd68c32fca885daf7c6fbf46007a25 [0/9] anolis: mm, thp: hugetext: accelerate khugepaged for hugetext vma
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250723/202507230004.i9Bn5EWu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507230004.i9Bn5EWu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230004.i9Bn5EWu-lkp@intel.com/

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
