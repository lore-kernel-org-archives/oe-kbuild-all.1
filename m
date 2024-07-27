Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C17F3EA64
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722069564; cv=none; b=hn7x7YkJwq6IVltcZ0pGAfXZWpi2raIh86wdzVMetV+xhq1Qi7FgdQJ4tq+es+zJljHk+VDtcEByeVMu3eg1So9nOMiz8TKACw6FYDA/d+uKgKnyjU5uMB+rgQ5POGoHk08MfcQQStgpEP7eAB2I7lMAXWKrz5XeSzquaXAucp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722069564; c=relaxed/simple;
	bh=cwQac2wYBRMgYfSLMtxozIYmGeJ/A2h10YzUMMpY7Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KnM4YFJbmHAjMqG7fbjWM8Pnj3ARuHQG7t47GvFlyFNXTilSReuoowTY9gYk4l1dB2FEkE2SNRjFCPnlELSQGNsWYcYQQIdsVymqawRJqcPuu5Ekdd9RP+2Wxp+YCjAq7Rw/6B63UeEFx09iw27hWziFrlR2bjRCwRA2xs5s3gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zhi78Jtr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zhi78Jtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722069561; x=1753605561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cwQac2wYBRMgYfSLMtxozIYmGeJ/A2h10YzUMMpY7Dk=;
  b=Zhi78Jtr7FeGFqAgtvacq+4jFG/f3O9pVLRAfEBBPoRpYWc87qV/ns+1
   T1hPlBF7/NfCxT0a8Nwb9XiR1/yg+9WElBbPpreWIyPryHk+3ljOjqL5g
   lTA5HMkyhb69lApqgGnXzXhuqemCVJgDUUN3xRs3fnKQwcumPpOqbDUCN
   YPx4eXfI35Dkwyji/dqZJBV/xw43LhlIHhsGt6yHesogCTudQSWX75BGP
   vdtbriyq5BVYonL+opK6OVdWDvl2Zpu0eL7BcIlUIQqk6ajAMlla8VZgW
   P3Byp/c+2J4vDocHdDmvG7+RUwyAq7FEHlCDNSt2fOntn6jVTxz8foFus
   w==;
X-CSE-ConnectionGUID: jS3cWTdtTySJ7nwNKqQyYg==
X-CSE-MsgGUID: fmi6lW4YS+SUKNyv7iLbwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19826936"
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="19826936"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 01:39:21 -0700
X-CSE-ConnectionGUID: OF8tse0ITtqWw2Rw30eLlQ==
X-CSE-MsgGUID: BE46tuXBRqWrbDL1dSbwZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="76717429"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jul 2024 01:39:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXcxR-000plc-2i;
	Sat, 27 Jul 2024 08:39:17 +0000
Date: Sat, 27 Jul 2024 16:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 21/25]
 drivers/iommu/generic_pt/pt_defs.h:137:31: error: expected parameter
 declarator
Message-ID: <202407271615.gGwz4PtO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   ea5c6d0c8914861c8e337228c4880001bf40f7c4
commit: 2c39e478f1bbc1680ad47e8b418bbd76701a4496 [21/25] iommupt: Add a kunit test
config: x86_64-randconfig-r053-20240727 (https://download.01.org/0day-ci/archive/20240727/202407271615.gGwz4PtO-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407271615.gGwz4PtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407271615.gGwz4PtO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/pt_alloc.c:107:
>> drivers/iommu/generic_pt/pt_defs.h:137:31: error: expected parameter declarator
     137 | static inline bool PT_WARN_ON({bool condition)
         |                               ^
>> drivers/iommu/generic_pt/pt_defs.h:137:31: error: expected ')'
   drivers/iommu/generic_pt/pt_defs.h:137:30: note: to match this '('
     137 | static inline bool PT_WARN_ON({bool condition)
         |                              ^
>> drivers/iommu/generic_pt/pt_defs.h:137:30: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     137 | static inline bool PT_WARN_ON({bool condition)
         |                              ^               
         |                                              void
   3 errors generated.


vim +137 drivers/iommu/generic_pt/pt_defs.h

238517582c3f63 Jason Gunthorpe 2024-06-28  129  
238517582c3f63 Jason Gunthorpe 2024-06-28  130  /*
238517582c3f63 Jason Gunthorpe 2024-06-28  131   * PT_WARN_ON is used for invariants that the kunit should be checking can't
238517582c3f63 Jason Gunthorpe 2024-06-28  132   * happen.
238517582c3f63 Jason Gunthorpe 2024-06-28  133   */
238517582c3f63 Jason Gunthorpe 2024-06-28  134  #if IS_ENABLED(CONFIG_DEBUG_GENERIC_PT)
238517582c3f63 Jason Gunthorpe 2024-06-28  135  #define PT_WARN_ON WARN_ON
238517582c3f63 Jason Gunthorpe 2024-06-28  136  #else
238517582c3f63 Jason Gunthorpe 2024-06-28 @137  static inline bool PT_WARN_ON({bool condition)
238517582c3f63 Jason Gunthorpe 2024-06-28  138  {
238517582c3f63 Jason Gunthorpe 2024-06-28  139  	return false;
238517582c3f63 Jason Gunthorpe 2024-06-28  140  }
238517582c3f63 Jason Gunthorpe 2024-06-28  141  #endif
238517582c3f63 Jason Gunthorpe 2024-06-28  142  

:::::: The code at line 137 was first introduced by commit
:::::: 238517582c3f6345ebaf2eecc116501f67de8d7c genpt: Generic Page Table base API

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
