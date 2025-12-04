Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B3F33D6F2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764849609; cv=none; b=e7yYObHYjXa2wOGedlb/ejWiSj79mji4hrbaMnd5LIuYuVzkFzUw7vrrw2Q2TnxaN3g8XM+OidZXHSME7Uyd6EucPu7inuB8x6LqbbH5b7Z56D+WtRt0eErdNpilgamv4XZieQ8V8bUhc2fVhAToMhznNiegpwK5+bU4X7+1lzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764849609; c=relaxed/simple;
	bh=lw+JuFSuszqlsXeLE0X4WSq4uQuRVTEnhKFpsymK2xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=juquNTc55/D7gZ3E5i6/UWz1MwHUJbxmTNAgoOJd8yUxO79V93LkiiQJG7luBzDJ/UfOZOCS9aVkrk+O8M9xNzVLHLeVyXsWdZoOq6CTIMhRyejp5IpSrgkmj8ZBv407DJSJyn1R4ZYqJRXbxlYDvkhtRUK8Xfj+YI31quyIrbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CsbYq731; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CsbYq731"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764849608; x=1796385608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lw+JuFSuszqlsXeLE0X4WSq4uQuRVTEnhKFpsymK2xw=;
  b=CsbYq731scjqN0D+X1ilQRhi+CzJAFe/etsOlN/ztBoV+cq05UwK82XJ
   cAKhg5hgrpHgBhwxUipqwFTIATkXUe1Xgyzaj5nDvZ6F//NzwY67gbLOs
   Xli1d69+Vk5bWiHMhGFowH4+BDTdR99M5WsPdsaYPdaxd4hZofc8ZljoT
   fbaIFX/U/EFFJqqzeqhcXjeNHtHfAg2V9QF3RSYuxT27lFj/xRQFBTnYi
   C8baggbVw/dhG+txSQssrc83K58lsvSf5l9hxw5CRT9sqpN+iDPu5b6xV
   cz0J/LW6jlwB55Lpcx9PIY0HbFr03QPRRtoX0GdLaE6nwEx6wAhDwUTKd
   g==;
X-CSE-ConnectionGUID: +grcYdo8QGS/9i90xgDtzw==
X-CSE-MsgGUID: 9VrMqQkSQUi7rQKLkhl9uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84467142"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="84467142"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:00:06 -0800
X-CSE-ConnectionGUID: it9wIZymRRacX8Ri2DUcvg==
X-CSE-MsgGUID: Ts7Zka4IR0WoEAVsXGZUOw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Dec 2025 04:00:04 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR80A-00000000Dlh-30ca;
	Thu, 04 Dec 2025 12:00:02 +0000
Date: Thu, 4 Dec 2025 19:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/khugepaged.c:150: warning:
 Function parameter or member 'nr_adapt_vma' not described in 'mm_slot'
Message-ID: <202512041924.imA7eP8M-lkp@intel.com>
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
head:   495c6b49736046cad5a06a343ca0be2750aed6fe
commit: b188234c53aafe8941f2f2662bf015353418eb81 [2/2] anolis: mm: hugetext: Implement principal part
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251204/202512041924.imA7eP8M-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041924.imA7eP8M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041924.imA7eP8M-lkp@intel.com/

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

b188234c53aafe8 Rongwei Wang       2022-11-26  121  
b46e756f5e47031 Kirill A. Shutemov 2016-07-26  122  /**
b46e756f5e47031 Kirill A. Shutemov 2016-07-26  123   * struct mm_slot - hash lookup from mm to mm_slot
b46e756f5e47031 Kirill A. Shutemov 2016-07-26  124   * @hash: hash collision list
b46e756f5e47031 Kirill A. Shutemov 2016-07-26  125   * @mm_node: khugepaged scan list headed in khugepaged_scan.mm_head
b46e756f5e47031 Kirill A. Shutemov 2016-07-26  126   * @mm: the mm that this information is valid for
b46e756f5e47031 Kirill A. Shutemov 2016-07-26  127   */
b46e756f5e47031 Kirill A. Shutemov 2016-07-26  128  struct mm_slot {
b46e756f5e47031 Kirill A. Shutemov 2016-07-26  129  	struct hlist_node hash;
b46e756f5e47031 Kirill A. Shutemov 2016-07-26  130  	struct list_head mm_node;
b46e756f5e47031 Kirill A. Shutemov 2016-07-26  131  	struct mm_struct *mm;
27e1f8273113ade Song Liu           2019-09-23  132  
27e1f8273113ade Song Liu           2019-09-23  133  	/* pte-mapped THP in this mm */
27e1f8273113ade Song Liu           2019-09-23  134  	int nr_pte_mapped_thp;
27e1f8273113ade Song Liu           2019-09-23  135  	unsigned long pte_mapped_thp[MAX_PTE_MAPPED_THP];
5c3c3afed0fd68c Xu Yu              2021-08-19  136  
5c3c3afed0fd68c Xu Yu              2021-08-19  137  #ifdef CONFIG_HUGETEXT
5c3c3afed0fd68c Xu Yu              2021-08-19  138  #define MAX_EXEC_VMA       8
5c3c3afed0fd68c Xu Yu              2021-08-19  139  	/* exec vma vm_start in this mm */
5c3c3afed0fd68c Xu Yu              2021-08-19  140  	int nr_exec_vma;
5c3c3afed0fd68c Xu Yu              2021-08-19  141  	unsigned long exec_vma[MAX_EXEC_VMA];
b188234c53aafe8 Rongwei Wang       2022-11-26  142  	int nr_adapt_vma;
b188234c53aafe8 Rongwei Wang       2022-11-26  143  	struct adapt_vma_t adapt_vmas[MAX_EXEC_VMA];
b188234c53aafe8 Rongwei Wang       2022-11-26  144  	struct xarray adaptive_regions;
b188234c53aafe8 Rongwei Wang       2022-11-26  145  	struct delayed_work work;
b188234c53aafe8 Rongwei Wang       2022-11-26  146  	/* Current state of adapt vma */
b188234c53aafe8 Rongwei Wang       2022-11-26  147  	atomic_t state;
b188234c53aafe8 Rongwei Wang       2022-11-26  148  	int nr_hugetext;
5c3c3afed0fd68c Xu Yu              2021-08-19  149  #endif
b46e756f5e47031 Kirill A. Shutemov 2016-07-26 @150  };
b46e756f5e47031 Kirill A. Shutemov 2016-07-26  151  

:::::: The code at line 150 was first introduced by commit
:::::: b46e756f5e47031c67658ff036e5ffe27062fa43 thp: extract khugepaged from mm/huge_memory.c

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
