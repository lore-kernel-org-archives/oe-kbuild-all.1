Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C6B1C01
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 00:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775175511; cv=none; b=nDvKi9Ns13cdaelURIRT77rP3aNJRWiWcjWdtgZ/2hmpkXC8eMMjGCcLrVrT0bmdNzqDFyybz11JDM+wg6z04K7FDoBkXxKtUhZOKO7EPL3xsUqFz0zRQO28mPGPAY+dNN5/0kd4qO8fCPPYOUsaPMs9QnoRKYn9epjnpwkb+jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775175511; c=relaxed/simple;
	bh=RvrTo5bXhZ6b7HgGmXH9/dK7iHWuPpldSneoaiKOqzg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hdaEuFlJugJQ3sQ76Pi0r+HgJUQinsMpdBJwAA0fBpsB/3+ekeJRhRyaecZSA9Oa7HnUoptPtrToYlzO1h+bLcBjETEgyvR/BpcGKj/Z8MriBeG3tfVyq1YnEesGZa/D0WUNto/7SKlR0GiMfGKTO5tdylf/D6VJikIaCOQdGec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtDduR0o; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtDduR0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775175510; x=1806711510;
  h=date:from:to:cc:subject:message-id;
  bh=RvrTo5bXhZ6b7HgGmXH9/dK7iHWuPpldSneoaiKOqzg=;
  b=mtDduR0oqtyD390rnXl9+NcfYNn+kDTfzvpBzurJZr2aR9BooEWO1j6i
   m5X4+UGmwU9BvQz1/08ckawR3i8R2DYX4QEyQSR0PDtUPLRziBaoK+PKl
   A98A/QmAKxwpwOHfO5gBznVdbLljBZ/R6uiu4gk5y3dKAklfR516LB9xu
   q180E6Kw9X7b/MqiYCBEbuyK1R2nLHWG/IO5RJQeSAuepSDaCANkUjUQn
   41FhomCStUp1tFrGLLYGFfP9ELcG2nc7jOnfcwoTPnVNgHKxzmIZLbAoC
   9inrCRobT+ITb/pal2rW6s64hjWviRJSrJTx6HubNObftzBFy2B+J1Qoz
   A==;
X-CSE-ConnectionGUID: NtrTJU+VQemn0TNm6tH3Ww==
X-CSE-MsgGUID: ud1e82FCTrCqLjyh4808Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76434871"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="76434871"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 17:18:29 -0700
X-CSE-ConnectionGUID: KdxeRysiQWeDpmuhl6zi3w==
X-CSE-MsgGUID: NROCTn1tTUmabs8THBlMOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="228746541"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 02 Apr 2026 17:18:27 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8SEz-000000009Bv-27yi;
	Fri, 03 Apr 2026 00:18:25 +0000
Date: Fri, 03 Apr 2026 02:17:52 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_arm64 16/53]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:62:22: warning: variable
 'item_lg2sz' set but not used
Message-ID: <202604030213.YCdrx73u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   386de42c67a6d6b567ec9167593768eec79b8ce5
commit: 9f2e457e1598eab7d293e370fef201274accfc35 [16/53] iommupt: Add PT_FEAT_DETAILED_GATHER
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260403/202604030213.YCdrx73u-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030213.YCdrx73u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030213.YCdrx73u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:40,
                    from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:15:
   drivers/iommu/generic_pt/fmt/../iommu_pt.h: In function 'gather_add_leaf':
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:62:22: warning: variable 'item_lg2sz' set but not used [-Wunused-but-set-variable]
      62 |         unsigned int item_lg2sz;
         |                      ^~~~~~~~~~


vim +/item_lg2sz +62 drivers/iommu/generic_pt/fmt/../iommu_pt.h

    58	
    59	static void gather_add_leaf(struct iommupt_pending_gather *pending,
    60				    const struct pt_state *pts)
    61	{
  > 62		unsigned int item_lg2sz;
    63	
    64		if (!pts_feature(pts, PT_FEAT_DETAILED_GATHER))
    65			return;
    66	
    67		item_lg2sz = pt_table_item_lg2sz(pts);
    68	
    69		pending->leaf_levels_bitmap |= BIT(pts->level);
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
