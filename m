Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22EE15D1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736272324; cv=none; b=nHxwf4uQUIJgaZGEC0SaYag110QirF1mInlWq+SL4GSaO0nh0ZogU6jTCebCwNf+Nlkrww38AOUpkXsp274NxjCBOlIe0KQchnYqI3emHdN1pOBOmFl0n6/tIJa4Q698AlnjYvj+TrtSdCYWlg+2JgXes3IcuZzUXCied+DLXw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736272324; c=relaxed/simple;
	bh=9PbhL8AYb6wkGkXD9gTBjHfIv4NDkd+GiO1/fa0+vww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PnMr7fjg2QuBEv29kbKuFZ6Brx5DYqYCj0RuAEHd6+p5dBPDDKDkdPUhIFRNxL9yAHlrK3KLmMrSiHt4Mbyt/UlVw+XFQOg1yrcopbvPGO5nwAJGMdkHwHOMmnpt/lTXYyEOEOkVm7JZTxBhCkAj0BqIZFWsSwUAGEUepz8FAu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDorbC+b; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDorbC+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736272321; x=1767808321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9PbhL8AYb6wkGkXD9gTBjHfIv4NDkd+GiO1/fa0+vww=;
  b=nDorbC+bY8pSijnIQSPAX8kwhg9obzzaYZe5kzXgqpU/fxJbtxzl8CY8
   JL5hVB5Ttdrb050tScY8+J073WDabqBpae1kgBaVtSMlQrlzf/2xey9qC
   /w2QRFH/x7w2y63lm11rpM5eubPnnhAS8y4y4Sams/zpIO3hXpNlXHZyD
   Y3rGYM/ARI4p78iJkQdOmWIwUybVabBGZ8Cpym7qpBwXhabMaJfbpeX9W
   DkokiGFeMF4z6P5xM0+cjzziq4b7URnTvBpqWqm5B3SBvf1P9whmtwatQ
   JipB3OMNCXZaMT3SAm49x/0mXpRRFccbV/7UMuTPfkbZPnOBgzLGtTE23
   g==;
X-CSE-ConnectionGUID: 7jlo/DB+SX2+K2eoQwsbZg==
X-CSE-MsgGUID: P5T0jExNTzai8VCB8l1GOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36164623"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36164623"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 09:52:01 -0800
X-CSE-ConnectionGUID: T1WKLwziT9O8DZHQOrfMbg==
X-CSE-MsgGUID: K4JdyoKwSmaUC8JoxuMuEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="102658676"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jan 2025 09:51:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVDkD-000F3e-0X;
	Tue, 07 Jan 2025 17:51:57 +0000
Date: Wed, 8 Jan 2025 01:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: Vasant Hegde <vasant.hegde@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Joerg Roedel <jroedel@suse.de>, Jason Gunthorpe <jgg@nvidia.com>
Subject: drivers/iommu/amd/iommu.c:1269 domain_flush_complete() warn:
 inconsistent indenting
Message-ID: <202501080139.yHwH0ePx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: d16041124de1dea4389b5e6b330657f34f8c0492 iommu/amd: xarray to track protection_domain->iommu list
date:   10 weeks ago
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250108/202501080139.yHwH0ePx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080139.yHwH0ePx-lkp@intel.com/

New smatch warnings:
drivers/iommu/amd/iommu.c:1269 domain_flush_complete() warn: inconsistent indenting

Old smatch warnings:
drivers/iommu/amd/iommu.c:1269 domain_flush_complete() warn: iterator 'i' not incremented
drivers/iommu/amd/iommu.c:1462 domain_flush_pages_v1() warn: iterator 'i' not incremented
drivers/iommu/amd/iommu.c:1996 init_gcr3_table() warn: missing error code? 'ret'

vim +1269 drivers/iommu/amd/iommu.c

  1257	
  1258	static void domain_flush_complete(struct protection_domain *domain)
  1259	{
  1260		struct pdom_iommu_info *pdom_iommu_info;
  1261		unsigned long i;
  1262	
  1263		lockdep_assert_held(&domain->lock);
  1264	
  1265		/*
  1266		 * Devices of this domain are behind this IOMMU
  1267		 * We need to wait for completion of all commands.
  1268		 */
> 1269		 xa_for_each(&domain->iommu_array, i, pdom_iommu_info)
  1270			iommu_completion_wait(pdom_iommu_info->iommu);
  1271	}
  1272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
