Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1A5286D53
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 09:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753264333; cv=none; b=VBqO81tmKypRn1jdIOFCqvz/ulhrnOR5ym7nGHEJh1CfVzqkp7m8ckRUx6Z2YaqP8Mffc7/jDG7pYJl5022Fh/i5E3n/TySxX8bI02IIUhdo4b8KPoKk02WI6ujOfkxGbRTimS4aH9jTv4dRnbl90gWaE0ARrMqVmhbqidUZxUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753264333; c=relaxed/simple;
	bh=ytxEXdiKNHxL33EU9kUjkdwrz0GNo6Jn5eDLlNPzwYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nPY8LGaaOfssQ/OUPvLJ+GarA+SEykSvjrRIIN1pLI2VsoXGjLWOz3bGYIzu1HSQxj0q4oqLMI0nKzaz50nXy7Rbnon/R4V6NVndy6GsImr8yzVuQwvDnUnqU8vak5rNxv+d8XhBhrv6k/GkfdF4drcsXJwSKIoLPp3S7ySR63I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btlFpbSc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btlFpbSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753264333; x=1784800333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ytxEXdiKNHxL33EU9kUjkdwrz0GNo6Jn5eDLlNPzwYk=;
  b=btlFpbScxqS9/PHhqEYOsSmGnZU7GoD34FfGStUIFdME4BfyA+T8bvED
   F4A4HxWlU7pSqnNe6SiGTzAH1M7MAtqCeVbf30cTNs18BvVqbed8vCuP1
   0RI6WYU7aThiprHNp56a4KmoIgRPB8uwzmewdbuBSODsKcyd704E+kYVB
   b3Pg/+tR4kj7xjbbBQbLavWLw+ilEYpstbOh/1iNM97cxdUTBIsgeRI9n
   x6uJ5te3V8vAXyHMaWFV5vKPAjPuVCnla0xZufwBId0PULO1d/dFM05Rk
   xYcWDBvdWLdHux4quBpO4+33AvJiihtpoV21SX9QNC1jxb3ITxcgLE/pG
   A==;
X-CSE-ConnectionGUID: Su5xAKTUSLio09FIAjRxnQ==
X-CSE-MsgGUID: U88p6sWFStyqATlap+9yEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55687525"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55687525"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 02:52:12 -0700
X-CSE-ConnectionGUID: invC9FNeTA+MrXYlLEKsZw==
X-CSE-MsgGUID: zm9FMQJEQBO9wtIvN71KMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="190371284"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jul 2025 02:52:10 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueW8u-000JCb-0Q;
	Wed, 23 Jul 2025 09:52:08 +0000
Date: Wed, 23 Jul 2025 17:52:04 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/9] mm/khugepaged.c:150: warning:
 Function parameter or member 'nr_adapt_vma' not described in 'mm_slot'
Message-ID: <202507231736.cnE4fPX9-lkp@intel.com>
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
commit: b188234c53aafe8941f2f2662bf015353418eb81 [0/9] anolis: mm: hugetext: Implement principal part
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250723/202507231736.cnE4fPX9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231736.cnE4fPX9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231736.cnE4fPX9-lkp@intel.com/

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
