Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B264431E832
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014943; cv=none; b=lBCta3jSZ4sGBmfVaQIFQG16IXwzL75KtavSwI8hbmHk5mfO1MF3HCa/KR5PWOnRLwap52YvugEQDr1qxzGvLJyo9yxIX5JBl/KcMycUX/6yAxuTP+TOWgpT0OutKbJbPaoPzH0c8AlL3e+/ioAOlTUvKehv7Ix9UxcU/atya6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014943; c=relaxed/simple;
	bh=Dpy1x6+mwjtTFuplCTCF1ygM82EYVd5VndUOGRLJDvs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DYXmE3yRB2vMijd8U3FIo9qzME5RBgfoLM8qvOa6/c92eOpK9T/d8jsHa+YBMqqus8oQE/zu6NzjEGUmPvrGWRDmFTrieJdWX5TGf5IFy5WTgjFIJh7YjnfH0WoV1YeJLxRG3Qv56dxkMjvXb5Ea1RsjwcTCEzZw8aD+pI/OsL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGESbSGp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGESbSGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781014942; x=1812550942;
  h=date:from:to:cc:subject:message-id;
  bh=Dpy1x6+mwjtTFuplCTCF1ygM82EYVd5VndUOGRLJDvs=;
  b=hGESbSGpod+ElkcRPwz4/1agky2VmWksY/wy6CcH3M/b9Ebjwy8ad/yv
   QWteWoQRAqrILdUbxktz/mDD5NrWZvzvdm4C/iql1SX6isMH0JHaZMYp+
   uLAul+KVr4RtLSfI7SPmNqOMqSKrSGK8klbLr/Y92a4u7wOQWuyczl3f9
   7nI4cJ7AubLViCK79JbCpgF98MaL+ZuOCL8DZ/nIWKJ7rI4d5yfd6xi4o
   oWb3ID9Ygyc8701ZZTj3WLSkm3PSlOJNir7z6XQkxDtvvnUu/0i2XiAnJ
   4RqDZvFgB5/JpQmr4L+/0RVBrrxaUxo0QYn6liCZXsQsjlJxAPNKb1/Rn
   Q==;
X-CSE-ConnectionGUID: C31g7rp0SvO0ml5qIXuByg==
X-CSE-MsgGUID: A7+p8w/FQv2SdYa0L748xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81783729"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81783729"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:22:21 -0700
X-CSE-ConnectionGUID: qIX6+yAPRWG/LW3gZt7TiQ==
X-CSE-MsgGUID: ZmjQ95scQ8S9W5Kfz5T3PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="244733374"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Jun 2026 07:22:20 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWxLN-000000003SX-2ULn;
	Tue, 09 Jun 2026 14:22:17 +0000
Date: Tue, 09 Jun 2026 16:21:28 +0200
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v5 42/42]
 include/linux/mmzone.h:806:52: error: 'PAGE_ALLOC_COSTLY_ORDER' undeclared
 here (not in a function); did you mean 'CONFIG_PAGE_ALLOC_COSTLY_ORDER'?
Message-ID: <202606091635.knY62ZUA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v5
head:   6a13a5d67caca4ca57eb8e916f762a491d8c3120
commit: 6a13a5d67caca4ca57eb8e916f762a491d8c3120 [42/42] mm,block: Make PAGE_ALLOC_COSTLY_ORDER configurable
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260609/202606091635.knY62ZUA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606091635.knY62ZUA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606091635.knY62ZUA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:7,
                    from include/linux/slab.h:17,
                    from include/linux/crypto.h:18,
                    from arch/x86/kernel/asm-offsets.c:9:
>> include/linux/mmzone.h:806:52: error: 'PAGE_ALLOC_COSTLY_ORDER' undeclared here (not in a function); did you mean 'CONFIG_PAGE_ALLOC_COSTLY_ORDER'?
     806 | #define NR_LOWORDER_PCP_LISTS (MIGRATE_PCPTYPES * (PAGE_ALLOC_COSTLY_ORDER + 1))
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:807:23: note: in expansion of macro 'NR_LOWORDER_PCP_LISTS'
     807 | #define NR_PCP_LISTS (NR_LOWORDER_PCP_LISTS + NR_PCP_THP)
         |                       ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:839:32: note: in expansion of macro 'NR_PCP_LISTS'
     839 |         struct list_head lists[NR_PCP_LISTS];
         |                                ^~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1373: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +806 include/linux/mmzone.h

418589663d6011 Mel Gorman 2009-06-16  795  
44042b4498728f Mel Gorman 2021-06-28  796  /*
bf14ed81f571f8 yangge     2024-06-20  797   * One per migratetype for each PAGE_ALLOC_COSTLY_ORDER. Two additional lists
bf14ed81f571f8 yangge     2024-06-20  798   * are added for THP. One PCP list is used by GPF_MOVABLE, and the other PCP list
bf14ed81f571f8 yangge     2024-06-20  799   * is used by GFP_UNMOVABLE and GFP_RECLAIMABLE.
44042b4498728f Mel Gorman 2021-06-28  800   */
44042b4498728f Mel Gorman 2021-06-28  801  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
bf14ed81f571f8 yangge     2024-06-20  802  #define NR_PCP_THP 2
44042b4498728f Mel Gorman 2021-06-28  803  #else
44042b4498728f Mel Gorman 2021-06-28  804  #define NR_PCP_THP 0
44042b4498728f Mel Gorman 2021-06-28  805  #endif
5d0a661d808fc8 Mel Gorman 2022-06-24 @806  #define NR_LOWORDER_PCP_LISTS (MIGRATE_PCPTYPES * (PAGE_ALLOC_COSTLY_ORDER + 1))
5d0a661d808fc8 Mel Gorman 2022-06-24  807  #define NR_PCP_LISTS (NR_LOWORDER_PCP_LISTS + NR_PCP_THP)
44042b4498728f Mel Gorman 2021-06-28  808  

:::::: The code at line 806 was first introduced by commit
:::::: 5d0a661d808fc8ddc26940b1a12b82ae356f3ae2 mm/page_alloc: use only one PCP list for THP-sized allocations

:::::: TO: Mel Gorman <mgorman@techsingularity.net>
:::::: CC: akpm <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
