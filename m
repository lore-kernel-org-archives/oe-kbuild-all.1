Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1B1EEE6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 23:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757807464; cv=none; b=Ckvz7JwBHGbP2wwSv70YAq6G4POr7C155wh67NQ5sBq2MspmfhbHRkIb+SklQv/SxFSVOnuyoRF4TSCtnqhbTn09tZrl+BH6NFS7d3pLXMfi/oTixQSoOIJc08I8blNoSLRi9sNW8Hmt2+hhbyRouwpAlX/pSypIbbaTokLOdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757807464; c=relaxed/simple;
	bh=7vo2g0TYDWqrKLey55w3muNbyhbPH/u850P98VwoRZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K6AEnE+22ePIZCcSuj78RiqUIzrUrw4gDEMivCIqgmpeCVkR+ukqN6rU9hI+KO8JhY6wPNEDg353NNOMHXi/w0BONYBRFC3DLzqwYpSfP8ROpynu4AQu5Vsg6AT+PwS0gQ8l9dhqmqtwhA+kRl/d3yJvCwi93kGhd6yZnYnUwZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKUsZl2J; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKUsZl2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757807461; x=1789343461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7vo2g0TYDWqrKLey55w3muNbyhbPH/u850P98VwoRZE=;
  b=cKUsZl2J46Sj0cKDaQXMjC0+V+kElsPUrz0zq4hZq0uRiR+69nEQFLvd
   o2GR66D16bh/saZsinUeJsMJwYFB6AjSfBPyYZmlMbGEPWqMvR3SPN7CY
   mPvkhSBIIELwKYlFZ3kXVJ/lp2e6VyGZjpNp/tgZyu8LYvCGmGt6VF8P0
   dvirv+kKXv4P5sK5UFiGEIA56jpLv5H9RaUbAoSnDaTA3cY7l77jXWsJo
   q2Ukr+SzB/gHKuCJaNclnL5Ig1BlpxMhPfsleRZ2GNbWHA/d07YdviarC
   dsdbtZz7/NQ8KuJfeKN8wCYxPq4yHrZ+7BgLlgpXOLCYah6wwKBvU9pze
   Q==;
X-CSE-ConnectionGUID: slBxvyJQS+qHOAfGO4QHZw==
X-CSE-MsgGUID: qqjXw0ZwRnWQfilFkfHJYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="71533391"
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="71533391"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 16:51:00 -0700
X-CSE-ConnectionGUID: D7k7fDnsS6SG09qZQbQCmQ==
X-CSE-MsgGUID: ErsNvpFYQn28fS85speBEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="179465091"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 13 Sep 2025 16:50:59 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxa1A-0001wy-0u;
	Sat, 13 Sep 2025 23:50:56 +0000
Date: Sun, 14 Sep 2025 07:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_first_size 35/38] drivers/perf/cxl_pmu.c:551:18:
 warning: variable 'i' is uninitialized when used here
Message-ID: <202509140732.k24XeFLX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_first_size
head:   19fff28fbf729956258aeb0cd260f8dc1186952f
commit: 6fb390cff19244a617ca75c1f3bedfa2a3116268 [35/38] PCI: dwc: simplify cxl_pmu_get_event_idx()
config: loongarch-randconfig-001-20250914 (https://download.01.org/0day-ci/archive/20250914/202509140732.k24XeFLX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509140732.k24XeFLX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509140732.k24XeFLX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/perf/cxl_pmu.c:521:17: warning: unused variable 'configurable_and_free' [-Wunused-variable]
     521 |         DECLARE_BITMAP(configurable_and_free, CXL_PMU_MAX_COUNTERS);
         |                        ^~~~~~~~~~~~~~~~~~~~~
>> drivers/perf/cxl_pmu.c:551:18: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
     551 |                 *counter_idx = i;
         |                                ^
   drivers/perf/cxl_pmu.c:525:7: note: initialize the variable 'i' to silence this warning
     525 |         int i;
         |              ^
         |               = 0
   2 warnings generated.


vim +/i +551 drivers/perf/cxl_pmu.c

5d7107c72796df Jonathan Cameron    2023-05-26  515  
5d7107c72796df Jonathan Cameron    2023-05-26  516  /* If counter_idx == NULL, don't try to allocate a counter. */
5d7107c72796df Jonathan Cameron    2023-05-26  517  static int cxl_pmu_get_event_idx(struct perf_event *event, int *counter_idx,
5d7107c72796df Jonathan Cameron    2023-05-26  518  				 int *event_idx)
5d7107c72796df Jonathan Cameron    2023-05-26  519  {
5d7107c72796df Jonathan Cameron    2023-05-26  520  	struct cxl_pmu_info *info = pmu_to_cxl_pmu_info(event->pmu);
5d7107c72796df Jonathan Cameron    2023-05-26 @521  	DECLARE_BITMAP(configurable_and_free, CXL_PMU_MAX_COUNTERS);
5d7107c72796df Jonathan Cameron    2023-05-26  522  	struct cxl_pmu_ev_cap *pmu_ev;
5d7107c72796df Jonathan Cameron    2023-05-26  523  	u32 mask;
5d7107c72796df Jonathan Cameron    2023-05-26  524  	u16 gid, vid;
5d7107c72796df Jonathan Cameron    2023-05-26  525  	int i;
5d7107c72796df Jonathan Cameron    2023-05-26  526  
5d7107c72796df Jonathan Cameron    2023-05-26  527  	vid = cxl_pmu_config_get_vid(event);
5d7107c72796df Jonathan Cameron    2023-05-26  528  	gid = cxl_pmu_config_get_gid(event);
5d7107c72796df Jonathan Cameron    2023-05-26  529  	mask = cxl_pmu_config_get_mask(event);
5d7107c72796df Jonathan Cameron    2023-05-26  530  
5d7107c72796df Jonathan Cameron    2023-05-26  531  	pmu_ev = cxl_pmu_find_fixed_counter_ev_cap(info, vid, gid, mask);
5d7107c72796df Jonathan Cameron    2023-05-26  532  	if (!IS_ERR(pmu_ev)) {
5d7107c72796df Jonathan Cameron    2023-05-26  533  		if (!counter_idx)
5d7107c72796df Jonathan Cameron    2023-05-26  534  			return 0;
5d7107c72796df Jonathan Cameron    2023-05-26  535  		if (!test_bit(pmu_ev->counter_idx, info->used_counter_bm)) {
5d7107c72796df Jonathan Cameron    2023-05-26  536  			*counter_idx = pmu_ev->counter_idx;
5d7107c72796df Jonathan Cameron    2023-05-26  537  			return 0;
5d7107c72796df Jonathan Cameron    2023-05-26  538  		}
5d7107c72796df Jonathan Cameron    2023-05-26  539  		/* Fixed counter is in use, but maybe a configurable one? */
5d7107c72796df Jonathan Cameron    2023-05-26  540  	}
5d7107c72796df Jonathan Cameron    2023-05-26  541  
5d7107c72796df Jonathan Cameron    2023-05-26  542  	pmu_ev = cxl_pmu_find_config_counter_ev_cap(info, vid, gid, mask);
5d7107c72796df Jonathan Cameron    2023-05-26  543  	if (!IS_ERR(pmu_ev)) {
5d7107c72796df Jonathan Cameron    2023-05-26  544  		if (!counter_idx)
5d7107c72796df Jonathan Cameron    2023-05-26  545  			return 0;
5d7107c72796df Jonathan Cameron    2023-05-26  546  
6fb390cff19244 Yury Norov (NVIDIA  2025-09-13  547) 		if (bitmap_empty_andnot(info->conf_counter_bm,
6fb390cff19244 Yury Norov (NVIDIA  2025-09-13  548) 					info->used_counter_bm, CXL_PMU_MAX_COUNTERS))
5d7107c72796df Jonathan Cameron    2023-05-26  549  			return -EINVAL;
5d7107c72796df Jonathan Cameron    2023-05-26  550  
5d7107c72796df Jonathan Cameron    2023-05-26 @551  		*counter_idx = i;
5d7107c72796df Jonathan Cameron    2023-05-26  552  		return 0;
5d7107c72796df Jonathan Cameron    2023-05-26  553  	}
5d7107c72796df Jonathan Cameron    2023-05-26  554  
5d7107c72796df Jonathan Cameron    2023-05-26  555  	return -EINVAL;
5d7107c72796df Jonathan Cameron    2023-05-26  556  }
5d7107c72796df Jonathan Cameron    2023-05-26  557  

:::::: The code at line 551 was first introduced by commit
:::::: 5d7107c72796df3be2ba574f1cf6eca75c60d5ef perf: CXL Performance Monitoring Unit driver

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
