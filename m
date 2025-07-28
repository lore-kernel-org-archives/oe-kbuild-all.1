Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D449620
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 03:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753674651; cv=none; b=iXrfwNsCYihxd5pqxp5cCqmep8knsZ4zqJB8y8jBMr6rLhTIGXJ+lRN81k0WoViV/jqG/yI0EHzACVWhLfYtQ4/h+Y2xejgBYkINFExV519/tuypr7WU9Je8snYj8+NK8lMYPri3KsfVQzc8FkoCo2eUgikdI7qxrAdBl/EtfAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753674651; c=relaxed/simple;
	bh=sHAzYD2F7uAjrO1AwUsjnM8OGikRWeeQ/Yi6Xe5GVfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=isp4N1QwdkIhgE4ebZ9VUiQ/Ut0iYrgPv0iTD3s00kBs70fg2swLGxg8AijFoxFpz1pCh9slSBFSQBhTXNOeTpu8VXHik6sYhePjzywLzIt3tLVKfQ39VlXgWPbz4K++Ui++JSrg+oGj0rjCIlkI82Ny4yOb3k+8+MUr28H1LO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JK2znDBX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JK2znDBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753674651; x=1785210651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sHAzYD2F7uAjrO1AwUsjnM8OGikRWeeQ/Yi6Xe5GVfc=;
  b=JK2znDBXrQHCd3bA+uFl61ZTId8wcoxR7ML3Tn4HJCvb5RlYpPxVoKJ9
   6YbxOiUcup2zS7H5dr1ajcC2Z0YZdPXdWNjMY+Vs8cFn1IswceC2IfBoH
   joZaxUbBIAcVIdpDVtSvm1v/S1TOhahff6iXWVkXvXcvrXgAHLBKZWPPj
   KfFHivJ/UDHmmtF9QZxuQR2gdbv8uAW3v/ggdUgT37UpB6McMpYKp+4+A
   XBmLTU1fU+YDscD4rI3rG9AO66GIIvMGabEQLJ2wUbBGN4ZnOS3ZnpQey
   F10yCfAT20RN6qmY3abR6pMBDxQ9jlFMRy+OSDZ6Pg6TWjCOQyzMSv4QU
   g==;
X-CSE-ConnectionGUID: AONxbiuYSWiYiLzNX+ng2w==
X-CSE-MsgGUID: VuPXJXhXR7y/l2O456+aew==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55614984"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55614984"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 20:50:50 -0700
X-CSE-ConnectionGUID: Pe8QX50NRfqhcoicOuaZ9Q==
X-CSE-MsgGUID: RDfYoZkWSaqrNnn9SpWe7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="167643551"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jul 2025 20:50:48 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugEsw-0000UB-0h;
	Mon, 28 Jul 2025 03:50:46 +0000
Date: Mon, 28 Jul 2025 05:50:23 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 92/92] include/linux/hugetlb.h:261:1:
 warning: no return statement in function returning non-void
Message-ID: <202507280509.ZGPb4BId-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning still remains.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: ae1584fe66d0d69c4ae034d6afa8abc3c8948614 [92/92] hugetlb: simplify hugetlb handling in follow_page_mask
config: arm64-randconfig-2005-20250719 (https://download.01.org/0day-ci/archive/20250728/202507280509.ZGPb4BId-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507280509.ZGPb4BId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507280509.ZGPb4BId-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/migrate.h:8,
                    from mm/vmscan.c:43:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^
   mm/vmscan.c: At top level:
   mm/vmscan.c:191:38: error: macro "get_total_swap_pages" passed 1 arguments, but takes just 0
     191 | inline long get_total_swap_pages(void)
         |                                      ^
   In file included from mm/vmscan.c:20:
   include/linux/swap.h:568: note: macro "get_total_swap_pages" defined here
     568 | #define get_total_swap_pages()   0L
         | 
   mm/vmscan.c:192:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     192 | {
         | ^
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:778:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     778 |  int err;
         |      ^~~
--
   In file included from include/linux/migrate.h:8,
                    from include/linux/balloon_compaction.h:41,
                    from mm/balloon_compaction.c:12:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^
--
   In file included from include/linux/migrate.h:8,
                    from mm/page_alloc.c:62:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^
   mm/page_alloc.c: At top level:
   mm/page_alloc.c:3986:15: warning: no previous prototype for 'should_fail_alloc_page' [-Wmissing-prototypes]
    3986 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^~~~~~~~~~~~~~~~~~~~~~


vim +261 include/linux/hugetlb.h

   256	
   257	static inline struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
   258					unsigned long address, unsigned int flags)
   259	{
   260		BUILD_BUG(); /* should never be compiled in if !CONFIG_HUGETLB_PAGE*/
 > 261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
