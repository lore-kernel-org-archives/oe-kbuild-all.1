Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8562EC2D1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 03:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741058040; cv=none; b=RGiN4bISXNlnW9dFGRBnJqxsHastB8pGNVPJAHRWZjz36HYk0eWWRMF5uNApKxW7NSqq6+qKnG4tRbag9+9NZ/O5DIK1piD/KEOzAkMy5fd9pgJrBWCG71oPW+9K6tEsCUooRjKLhIYpPanQgyxwKCj6Fn+kxIvIVsNnGDd/zRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741058040; c=relaxed/simple;
	bh=ONqsQd5MxR16ZUm3lxJvGlIKhqgKCmbvl8ZEqlC9DTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HstDfTBH4KB1UUqU2EbbdupAw1TCe3d0ydFtiNi8MZohhS66oqUt8THYEFQo7GQWvJyKYFRVUnXyVtisgkXdL8j5OX1ga0BCipRKy3tJPm7bvCCxJ23VFeKaE5pCeyE+7smIz9oax4Ku9B7V6V0SiRq+pd1FqlLPyV3AxXR1pTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHxwbCJc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHxwbCJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741058039; x=1772594039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ONqsQd5MxR16ZUm3lxJvGlIKhqgKCmbvl8ZEqlC9DTw=;
  b=iHxwbCJcDeT6iVEs0Aqng7IjIqQKrhVkhTLo+pkIKxBvD1ZcV5O09Eey
   1YpRhGYyVhbcwW8juJ1ANXOjy9V19+MUh1yzy6NRjXSR3y4NtbvdqzH4V
   OZmJ5Clkd4gU07oek+PHFKVRYjjFOrVreAvLVZpiyBoneW6s+16ZGndCb
   LagbjJ7g3hU1l8aFRQmueJJWOD+u66Y/fomExDajigqNewCQZTlOeYPqg
   ly4LqxaChx+yummLJnPlwShzV6gRKV4Lqh2WoEneXu5Qk8gGwAoLJKZb7
   ZS2L+RnRrhCCk0iShJZlntHunNo2RqoWM3KuCX1uLuxcAYnkSUfpitefO
   g==;
X-CSE-ConnectionGUID: qwYsOFX9ReGGnGtsDYyJ6A==
X-CSE-MsgGUID: mEV7UANuST+1knBojj6gMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52164429"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="52164429"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 19:13:58 -0800
X-CSE-ConnectionGUID: xdrktbmRSr6N8cl+PpU96Q==
X-CSE-MsgGUID: Tb7ks/tYR7KjGyVtKRHCvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118400024"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Mar 2025 19:13:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpIjC-000JD0-1V;
	Tue, 04 Mar 2025 03:13:54 +0000
Date: Tue, 4 Mar 2025 11:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] mm/khugepaged.c:109: warning:
 Function parameter or member 'nr_exec_vma' not described in 'mm_slot'
Message-ID: <202503041122.hkWZXPz4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   9ffea0022988c199590e1901b8379d60fc4a89a5
commit: 5c3c3afed0fd68c32fca885daf7c6fbf46007a25 [1/1] anolis: mm, thp: hugetext: accelerate khugepaged for hugetext vma
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250304/202503041122.hkWZXPz4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503041122.hkWZXPz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503041122.hkWZXPz4-lkp@intel.com/

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
