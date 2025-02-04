Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2470E4A01
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738628386; cv=none; b=OkUrzy9XINw5h0AaaXi86QhA/hPXjlblR/YpsTPr5mMqPM98UnGjdlYv4aO/xKibb8e/pypL84nDc/xeti9Ci9YKG4s+ulBxT1GtdwP4oNkAs6gxRTD4vDcqrLebgYY+3nrBX+TC8jHYouKBUFlXM14ZR69kSVzIByd/k8x9//g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738628386; c=relaxed/simple;
	bh=St9A/MDJYip5P5pUy8xHORXamCvuFWiYGRuy9oEh66M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IVPAW2B2SRNg4orwmcKNRe+NXVXVPYC2m0EiqM7aT07Z+pYbvnEnYd5eQhkqtQn9raLMyXoyaZ9wUjnNy4+2xxh/LNmzJN5bP5f1P+JMzR3aSJr40qlAwfbWA898mtyuRNBJZ9a6aNIuLYi4Paf6pYd0bymaUStFIaQqBjsx/9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WV5h5sdp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WV5h5sdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738628385; x=1770164385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=St9A/MDJYip5P5pUy8xHORXamCvuFWiYGRuy9oEh66M=;
  b=WV5h5sdpXiXjbhSatv6X6wsqn5rSakScNbsTApQlxvcRqY8mKEmnY35D
   HbqTKhpv0V/Eu11Hqet+/wHXUhQnxrCR4Z2Y1mCYIMIRMCWb7f2PdnErX
   ord6AYMhDEZWvs74w85Ahtxy/szqNNmUAEBPMYvSmpsRZmAWAb6xiQ35d
   ls8Z60zpEtGbv58UGR01aMsau+HKUfFUshw+Dt9eTw9HhbBpsU4RZqWEX
   Nn91oFFRBIRMgiKYhFz4m32tC4VcUSQDTz6EHERRUSpQNwz/Gh4TyMZ2H
   TwS4578I6daHd6jGwBGEEXR/YxBj34+mfOZVqF/bTXUM+jHHHJxmVpjD9
   A==;
X-CSE-ConnectionGUID: y03EzfmoTQ+DXtgVoQ9Dlg==
X-CSE-MsgGUID: rdm+Vfx4SzSwYSHhzGbFGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39035828"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="39035828"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 16:19:44 -0800
X-CSE-ConnectionGUID: QD4TO55JRDu+2qXQ9GhJhw==
X-CSE-MsgGUID: SqyqbANjR1+3ozZIWLvY+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111273375"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Feb 2025 16:19:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf6fF-000rjO-1l;
	Tue, 04 Feb 2025 00:19:41 +0000
Date: Tue, 4 Feb 2025 08:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/5] mm/page_alloc.c:562:56:
 error: 'MIGRATE_CMA' undeclared; did you mean 'MIGRATE_SYNC'?
Message-ID: <202502040831.PSBsZWd2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   88298f5bdf8b7de9d5aaf8979d13191d4c37622b
commit: 3f2cf700ae99c47444d68a8b10df2083fb080c89 [0/5] ANDROID: mm: add cma pcp list
config: i386-buildonly-randconfig-001-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040831.PSBsZWd2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040831.PSBsZWd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040831.PSBsZWd2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/page_alloc.c:19:
   mm/page_alloc.c: In function 'order_to_pindex':
>> mm/page_alloc.c:562:56: error: 'MIGRATE_CMA' undeclared (first use in this function); did you mean 'MIGRATE_SYNC'?
     562 |         VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
         |                                                        ^~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/page_alloc.c:562:9: note: in expansion of macro 'VM_BUG_ON'
     562 |         VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
         |         ^~~~~~~~~
   mm/page_alloc.c:562:56: note: each undeclared identifier is reported only once for each function it appears in
     562 |         VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
         |                                                        ^~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/page_alloc.c:562:9: note: in expansion of macro 'VM_BUG_ON'
     562 |         VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
         |         ^~~~~~~~~
   mm/page_alloc.c: In function 'free_unref_page':
   mm/page_alloc.c:2749:58: error: 'MIGRATE_CMA' undeclared (first use in this function); did you mean 'MIGRATE_SYNC'?
    2749 |                 if (!cma_has_pcplist() || migratetype != MIGRATE_CMA)
         |                                                          ^~~~~~~~~~~
         |                                                          MIGRATE_SYNC
   mm/page_alloc.c: In function 'free_unref_folios':
   mm/page_alloc.c:2854:66: error: 'MIGRATE_CMA' undeclared (first use in this function); did you mean 'MIGRATE_SYNC'?
    2854 |                         if (!cma_has_pcplist() || migratetype != MIGRATE_CMA)
         |                                                                  ^~~~~~~~~~~
         |                                                                  MIGRATE_SYNC


vim +562 mm/page_alloc.c

   552	
   553	static inline unsigned int order_to_pindex(int migratetype, int order)
   554	{
   555		bool __maybe_unused movable;
   556	
   557		/*
   558		 * We shouldn't get here for MIGRATE_CMA if those pages don't
   559		 * have their own pcp list. For instance, free_unref_page() sets
   560		 * pcpmigratetype to MIGRATE_MOVABLE.
   561		 */
 > 562		VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
   563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
