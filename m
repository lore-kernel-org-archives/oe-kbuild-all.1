Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B618C148FE1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714147138; cv=none; b=n73luAmRZ0BLaagWAMwtwrn94DNINzFOK1jPFCMaHVpDuPvHtdD3RzYPtGVrPnFkGpMQ6BRGAIqZmQwj3cFX+9DaV400UnEBa6lNETq7lNPbP8YU0+yEN8ipaEF3p9L+/9SMV/oBSO1n2XcSO2Jb1YnP//8Tuy9bybUFu13e6Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714147138; c=relaxed/simple;
	bh=viMajpwghsUekXGs/LhZvwBTTEfMgD8weQ4fAWMJB84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kfC5PInujk9q0cqmQrXFVeASpXQb9tBjUsVCPMAY+ZDfTH2BLxH9yO4HSw4yahqY66E4C5aXCOszYwDZ9gifa5jtWIWLJk4of64y+FkUwGTa+uD8vHgJtyvNYGP7NRyVYqFDapc2GqqHYni49swA3Jk9fDsZa8ZTUNZdnPO/wN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUwkNPnv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUwkNPnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714147137; x=1745683137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=viMajpwghsUekXGs/LhZvwBTTEfMgD8weQ4fAWMJB84=;
  b=PUwkNPnvBOwtVixuBmGVnnTaNInvp70A1pcsygiDUnHicwVE6rcxcr4y
   UpZdHAbBFvV7UX9BNcTIhalYEHTiVxjn0AbRfHD12B37hOBrk2DUa/E3i
   haXz64QbG0R7vLAPHOn31sDi0mKt5mUQSUvEBbA38j4ML8bhE3h/b9FAF
   zSWK3I8KBVlxyH+7ig+vfNV27W/IIqiyWnpSuG64yiqbA2/Rdq3bYIHnn
   5vviWU+1v/WPTeMKg3uIl7iHB06HFnEQr0BA5zMewzHxp/rHLtvto1Gdg
   ZXL9UZXLFAnLglEG1RQRr+JzhJQF6dYI5Bmc4kNk1g3H07l35hH8W2Mrq
   w==;
X-CSE-ConnectionGUID: c7BgHQXxRPuYjbO3s1JL2g==
X-CSE-MsgGUID: MagdBSZHSMyS14MIM4nfSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10008720"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="10008720"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:58:57 -0700
X-CSE-ConnectionGUID: qsEcWlxsRWC3iEc5MSnD4g==
X-CSE-MsgGUID: 2B+4rX8ZRl+DA3uuFGS4Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="25463418"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Apr 2024 08:58:54 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0NyO-0003tD-2m;
	Fri, 26 Apr 2024 15:58:52 +0000
Date: Fri, 26 Apr 2024 23:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 39/245] mm/page_alloc.c:594:56: error:
 'MIGRATE_CMA' undeclared; did you mean 'MIGRATE_SYNC'?
Message-ID: <202404262308.CqJlAyWj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3a483dde38073d7097405656305f05dcc5175b3a
commit: 634c33ee9d167bb46f3472c1cc2db5ce2f5a6408 [39/245] ANDROID: mm: add cma pcp list
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240426/202404262308.CqJlAyWj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404262308.CqJlAyWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404262308.CqJlAyWj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/page_alloc.c:19:
   mm/page_alloc.c: In function 'order_to_pindex':
>> mm/page_alloc.c:594:56: error: 'MIGRATE_CMA' undeclared (first use in this function); did you mean 'MIGRATE_SYNC'?
     594 |         VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
         |                                                        ^~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/page_alloc.c:594:9: note: in expansion of macro 'VM_BUG_ON'
     594 |         VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
         |         ^~~~~~~~~
   mm/page_alloc.c:594:56: note: each undeclared identifier is reported only once for each function it appears in
     594 |         VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
         |                                                        ^~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/page_alloc.c:594:9: note: in expansion of macro 'VM_BUG_ON'
     594 |         VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
         |         ^~~~~~~~~
   mm/page_alloc.c: In function 'free_unref_page':
   mm/page_alloc.c:2513:58: error: 'MIGRATE_CMA' undeclared (first use in this function); did you mean 'MIGRATE_SYNC'?
    2513 |                 if (!cma_has_pcplist() || migratetype != MIGRATE_CMA)
         |                                                          ^~~~~~~~~~~
         |                                                          MIGRATE_SYNC
   mm/page_alloc.c: In function 'free_unref_page_list':
   mm/page_alloc.c:2601:66: error: 'MIGRATE_CMA' undeclared (first use in this function); did you mean 'MIGRATE_SYNC'?
    2601 |                         if (!cma_has_pcplist() || migratetype != MIGRATE_CMA)
         |                                                                  ^~~~~~~~~~~
         |                                                                  MIGRATE_SYNC


vim +594 mm/page_alloc.c

   586	
   587	static inline unsigned int order_to_pindex(int migratetype, int order)
   588	{
   589		/*
   590		 * We shouldn't get here for MIGRATE_CMA if those pages don't
   591		 * have their own pcp list. For instance, free_unref_page() sets
   592		 * pcpmigratetype to MIGRATE_MOVABLE.
   593		 */
 > 594		VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
