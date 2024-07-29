Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBB019148D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722263033; cv=none; b=QNY6a3JB4i+KqYuBefwuAMUnzTQ6cqLyvnhTNKAE4E2ZuYHpCTx1DEHThDQvNqDX/nCfei1W2+vygmW6L0vLgnnSrCcMQZWP1Q71J+QNy5vXmxIdCBSzK9es/CEY8d8dvZ3YWveBJT7J1wkon069R6hDA0wjT9uuHM+WAKKGkV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722263033; c=relaxed/simple;
	bh=J/G2z6d3PJ8h30S9LmudFaafWsecq1wrwyuQrCveaBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pzD+SmJbGJIP48HwVGOrFVSotlQO4NVvaKGnpu8vkwAIsNbMvnr6688E1ueyBphBZJftwma1qLe9Ib24f5OVrDuQBsoENMfj6+Vy/inhSi0wEMZ12A/am5IOnFyjCQNoU4GHLOlpBxgopBb7QwBD1sFrWPpZ68/4i0Mu/kd/nlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JydC3SfZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JydC3SfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722263031; x=1753799031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J/G2z6d3PJ8h30S9LmudFaafWsecq1wrwyuQrCveaBA=;
  b=JydC3SfZRzmeKauGtmAJmZJMXatLCXLZyscq5UJknd8a76Ap0kyfqMyQ
   cmTpZMe50ouDyEmZng2nYDpBpO0pW/mrHC+E6sIHBtMokX/0AC//wDoyZ
   xERWbqHX9VgySOR14AaT4yEZjqG9n+3juOHiN5tjJrBlPQ/CdpDPcaPL6
   8RAzdbDS6/s37ZclYRorojG3DzNjHQVWq5pidEJJKqWKsySk3g+yUeDgD
   N0pCbtOYbJLss6s60pCixV/lYGDHyEYGXOjWXXo7Tm422d1c20/sa95Xx
   qQT8XfpAxUklWlwYVUZbjAjoJYPsn8lGeHWeH9hX02Zw8yoBoFwJNsCbf
   A==;
X-CSE-ConnectionGUID: miq/TTNhSFm4pVuRzOBHGw==
X-CSE-MsgGUID: XLsKdAVzTjeueai+qtw3Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="12770804"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="12770804"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 07:23:50 -0700
X-CSE-ConnectionGUID: yBEpjVV0SG6JKJARV0Ie2Q==
X-CSE-MsgGUID: HqHBx8SyRea6oVmCcTAzfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="91478886"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jul 2024 07:23:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYRHv-000rki-0p;
	Mon, 29 Jul 2024 14:23:47 +0000
Date: Mon, 29 Jul 2024 22:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 21/25]
 drivers/iommu/generic_pt/pt_defs.h:212:36: warning: 'pt_table_ptr' declared
 'static' but never defined
Message-ID: <202407292218.A8A7DkPl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   fdbabce35e6ecdfd15c336a368e411e0ac7450f6
commit: ade751a31a300ecb4bba4db3a4bc6e684f9a2e04 [21/25] iommupt: Add a kunit test
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240729/202407292218.A8A7DkPl-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240729/202407292218.A8A7DkPl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407292218.A8A7DkPl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/pt_alloc.c:6:
   drivers/iommu/generic_pt/pt_defs.h:211:1: warning: 'pt_table_item_size' declared 'static' but never defined [-Wunused-function]
     211 | pt_table_item_size(const struct pt_state *pts);
         | ^~~~~~~~~~~~~~~~~~
>> drivers/iommu/generic_pt/pt_defs.h:212:36: warning: 'pt_table_ptr' declared 'static' but never defined [-Wunused-function]
     212 | static __maybe_unused inline void *pt_table_ptr(const struct pt_state *pts);
         |                                    ^~~~~~~~~~~~


vim +212 drivers/iommu/generic_pt/pt_defs.h

ec7ae341c58b57 Jason Gunthorpe 2024-06-28  209  
ec7ae341c58b57 Jason Gunthorpe 2024-06-28  210  static __maybe_unused inline pt_vaddr_t
ec7ae341c58b57 Jason Gunthorpe 2024-06-28  211  pt_table_item_size(const struct pt_state *pts);
ec7ae341c58b57 Jason Gunthorpe 2024-06-28 @212  static __maybe_unused inline void *pt_table_ptr(const struct pt_state *pts);
ec7ae341c58b57 Jason Gunthorpe 2024-06-28  213  

:::::: The code at line 212 was first introduced by commit
:::::: ec7ae341c58b577633d87f7527e8276403f8e1f9 genpt: Generic Page Table base API

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
