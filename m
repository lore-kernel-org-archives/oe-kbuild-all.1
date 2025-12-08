Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61C0270EAB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 22:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765233729; cv=none; b=ME9WhmTpQDQfX793kkSmmr+3mBs39Jf54ZrO0PkWhOa41EJnejVygKAOc7eo6nChd5MmjPIPRazcPqbZkW7xTcoKvQe3W+Fjkw7CPZ5DfkbQa2sOAO8GrV+8e7W1XN45ghT/3igI3z7NlIkgKweUZ14kcm3/eXb2EnpgG5lfX1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765233729; c=relaxed/simple;
	bh=Om1o2CGv+i+htOAIjq7yOUaqVmiYT2Bh6dBGEVjRuF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uxZwtNbuxeQxVAiPnIaAqmCb8Y6p2Zz4nV5+e4EOsWIUvUR7FeF/PH360Xrk1qF2qYS8BNMcQUksZvgMrUk1VGavu5dVlSodpMlcYz5T2KFBgoR9tVwDuXwwKtgXKZOolhfjR0JnVxZ2sjOXtPGDWplyQS7gx3D9mlAR5bPIc2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRyGSf+/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRyGSf+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765233728; x=1796769728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Om1o2CGv+i+htOAIjq7yOUaqVmiYT2Bh6dBGEVjRuF0=;
  b=MRyGSf+/SLyTzOXxcCE6XxTBJmlqj0h2gztPVgr/0BbazbnjghEwrMAN
   tzuiHllk1TUmhuFIL6pURpPnoWaZEC+vP6719VRp0++oAXI6AZp67tXxC
   /81+BLNT2UO9B48oZWREPhbqVjKcGUqVrHPOsCWvORHfy38//bQ+Uh1/Q
   s8aAQYTdOohzRtcQ+gt85iEw8uDwYk2HMouU48aGkNTRl8DST1duvrnC7
   kERN2uKgI5LCvwnmLF98KJOBb9iuBpwFYykdIzQAXZhwubbbI4eRrtAA1
   fqGucD+cEd9sCmL5gu/4WtxOQKb4omkYHclLjDJebsV+huflThxis5Zk/
   A==;
X-CSE-ConnectionGUID: ySFHFXO+SVmJkxM1Cvl1Lg==
X-CSE-MsgGUID: /ftASA+YQ8W70lsL62xOdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67264359"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="67264359"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 14:42:07 -0800
X-CSE-ConnectionGUID: ugLerUeAQI2LLlrd+alxEA==
X-CSE-MsgGUID: Dh6/AOieSqanZvgVqsuMwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="195661391"
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 08 Dec 2025 14:42:06 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSjvg-000000002Gf-1Wpq;
	Mon, 08 Dec 2025 22:42:04 +0000
Date: Mon, 8 Dec 2025 23:41:11 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lei Gong <gonglei25@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3493/3493] ./include/linux/iommu.h:2001:40:
 warning: 'struct iommu_plb_gather' declared inside parameter list will not
 be visible outside of this definition or declaration
Message-ID: <202512082342.kZY4UVlP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   36141432a37f7dedddde8825e724b07ce3a440fb
commit: d46a4bd5bdfd7f1d6e2fa159398df4c54345070c [3493/3493] iommu/ummu-core: introduce iommu sva permission operation
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251208/202512082342.kZY4UVlP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512082342.kZY4UVlP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512082342.kZY4UVlP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:101:
>> ./include/linux/iommu.h:2001:40: warning: 'struct iommu_plb_gather' declared inside parameter list will not be visible outside of this definition or declaration
    2001 |                                 struct iommu_plb_gather *plb_gather) {}
         |                                        ^~~~~~~~~~~~~~~~


vim +2001 ./include/linux/iommu.h

  1993	
  1994	static inline int iommu_sva_ungrant(struct iommu_sva *sva, void *va,
  1995					    size_t size, void *cookie)
  1996	{
  1997		return -EOPNOTSUPP;
  1998	}
  1999	static inline void iommu_plb_sync_all(struct iommu_domain *domain) {}
  2000	static inline void iommu_plb_sync(struct iommu_domain *domain,
> 2001					struct iommu_plb_gather *plb_gather) {}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
