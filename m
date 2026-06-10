Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E1935950
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 03:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781062387; cv=none; b=FPa1vryvpD/2xfOieEYYnf4XdqqcBH5wTr6he1cMvPiuJCIk3aOgpnAeMRvRbgX+116oCLchXN4Xqac0t2F8hbzrN0BfUMWdJg2Mt3P7mOd35aJCOOsKZl57dXIN/zSXmeTY+FaUzCSMq9o7a2OmUuWkCUqVpv9s4UdQpbTLsxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781062387; c=relaxed/simple;
	bh=/2QhCgREYwl5zLbWgooFRTmWmmAMqobs70AJXspl48k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O2LQAKgWMMHEoNabCAkhKl8XleD0OeRtFc9AKUp6QBuFBFByWShZAzkvYsnomWzzLkBMkX1JXjIY+cyNYkBGzsQ4gAa1OsQTbo8H5JdkYRj82h5rE5w3n6Bpn9zujdMVBLK2KcKYvLjS7Oocslerouf3Lf9DGNd+wRQq7uwdK3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=noW56yiO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="noW56yiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781062385; x=1812598385;
  h=date:from:to:cc:subject:message-id;
  bh=/2QhCgREYwl5zLbWgooFRTmWmmAMqobs70AJXspl48k=;
  b=noW56yiOK3cVqTRmiwv2t/Uk0AFSuJPxQKwhcY4/EvvMklzVWlPL4ehZ
   tRYEZcUtRaMcR82lDrP4EAuG2vY9v6zNJHmTNVDZoYkM/tjgcrxLb+m7E
   FSrTMBW4HBqViwOAtkNcrDLU8qiDv/pwxy387B4PicpRxmlf8+ocYgwn8
   iGvBXtyhGuWDCiQC+SOyWWD8OZ3cyaXFH5adYjCKNw6KjYiUQSiy26pDA
   WMOoht60rluEPgoLYhDa/1GTJee4h1jsDhXtmGEhf09J2q/my5dSCiTRh
   6Qf8sTTU/UQeimHibvNcQzpZLuM/nc+YhJWdQCepfGkVU/0P3b5lxmnI+
   g==;
X-CSE-ConnectionGUID: a60uW1sTTjKQ7lKSCbWEAw==
X-CSE-MsgGUID: 4H1a8V6sT/GgpVtPdGXadA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104511102"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="104511102"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:33:04 -0700
X-CSE-ConnectionGUID: bLuvjj6vSOeh4ErQH1lIRQ==
X-CSE-MsgGUID: h1R8XmWATv2P+0SwO7JwoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="246068559"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jun 2026 20:33:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX9ga-00000000KrS-3liA;
	Wed, 10 Jun 2026 03:33:00 +0000
Date: Wed, 10 Jun 2026 11:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v5 42/42]
 include/linux/mmzone.h:806:52: error: 'PAGE_ALLOC_COSTLY_ORDER' undeclared
 here (not in a function); did you mean 'CONFIG_PAGE_ALLOC_COSTLY_ORDER'?
Message-ID: <202606101112.23HNOhWb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v5
head:   6a13a5d67caca4ca57eb8e916f762a491d8c3120
commit: 6a13a5d67caca4ca57eb8e916f762a491d8c3120 [42/42] mm,block: Make PAGE_ALLOC_COSTLY_ORDER configurable
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260610/202606101112.23HNOhWb-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101112.23HNOhWb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101112.23HNOhWb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from arch/arc/kernel/asm-offsets.c:8:
>> include/linux/mmzone.h:806:52: error: 'PAGE_ALLOC_COSTLY_ORDER' undeclared here (not in a function); did you mean 'CONFIG_PAGE_ALLOC_COSTLY_ORDER'?
     806 | #define NR_LOWORDER_PCP_LISTS (MIGRATE_PCPTYPES * (PAGE_ALLOC_COSTLY_ORDER + 1))
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:807:23: note: in expansion of macro 'NR_LOWORDER_PCP_LISTS'
     807 | #define NR_PCP_LISTS (NR_LOWORDER_PCP_LISTS + NR_PCP_THP)
         |                       ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:839:32: note: in expansion of macro 'NR_PCP_LISTS'
     839 |         struct list_head lists[NR_PCP_LISTS];
         |                                ^~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/arc/kernel/asm-offsets.s] Error 1
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
