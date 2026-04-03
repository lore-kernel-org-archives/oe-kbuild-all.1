Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1C037F8B8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205845; cv=none; b=f7C7jm/yd4g6CcpccTKqT4KnEhx5KQLF/m/fUK5lmsQOUaetrlLc7xEJz9MxnfRp51YJIDtHFwIrFuv0PsrESS7Eews7G3J/5jHlODrEcL0JsBpdkWTZz0KdaHKK3pbZqxiSlphc7HMERT96wmFVb6fUlXqEjQW9XxdmD951weA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205845; c=relaxed/simple;
	bh=/KYqzmL5l/jvF0ZZVJiW13KyAW8Twx4BHnaSWYjrFfQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hucirjhvKP5yM2sXg3m2s+4WD/+fobgQoGFUqCJl527SVPUa85qqBh2TganuS5Eq+RQTAndMw5Q74pvDVoHU7kB7K6yPHBT+hHUQCYwnSqizl1fd02M7/0PaZ0r/pGtY/5nFxfZnpXBZN0ZfedoYwYpAjggKraIYoW4tGaD0X5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5BkfmOU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5BkfmOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205843; x=1806741843;
  h=date:from:to:cc:subject:message-id;
  bh=/KYqzmL5l/jvF0ZZVJiW13KyAW8Twx4BHnaSWYjrFfQ=;
  b=k5BkfmOU0McgJE0rZ2ROewmtjpJqxwRUmc2Pw6ozov3zQQ6ajX0YP4pe
   gSzGhUZhSQSGPToeQk79SLn2V++5TTONQMGFVtqx5gSX7q3vTqAHW1uuf
   0uEVWQNkCT+k8Wjnb1YPcG3Srs3g0dbOSJ8Y1kZ8E2Rz+7PTPBxkzz7id
   CEPedoRE/uBNXCFLUkQZKTcfh+yU9ka2VNgVF70ZxI2uvq7xqoL+mkM3S
   uIKGXfyzOTh+67q7oBU7Pp7Z0M9l4+HPYbDgcsBIF37smD+r4aKvtQkIj
   hLkoDuvtZsO4EwH4+V0JN5ncQBC0Wa4cSEC06KafBOjjFl6T0q3gVPh1/
   g==;
X-CSE-ConnectionGUID: aBhInRUYRxmkA6mBLSurqA==
X-CSE-MsgGUID: CBEbuxXvRxWUYHrhIyDBxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93852244"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93852244"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:44:00 -0700
X-CSE-ConnectionGUID: P6JKH11LSHCK6JDH/XY8Ag==
X-CSE-MsgGUID: scpGxLnhSUOR+oz+r4DY0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223943432"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 01:43:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a8C-0000000014m-0nb3;
	Fri, 03 Apr 2026 08:43:56 +0000
Date: Fri, 03 Apr 2026 16:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Austen <hpausten@protonmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpu/drm/xe/xe_hw_engine.c:812:undefined reference to
 `xe_configfs_get_engines_allowed'
Message-ID: <202604030453.L1SnHcsh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5619b098e2fbf3a23bf13d91897056a1fe238c6d
commit: a559434880b320b83733d739733250815aecf1b0 drm/xe: Allow dropping kunit dependency as built-in
date:   9 months ago
config: arc-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260403/202604030453.L1SnHcsh-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030453.L1SnHcsh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a559434880b3 ("drm/xe: Allow dropping kunit dependency as built-in")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030453.L1SnHcsh-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
>> drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x9e2): undefined reference to `xe_configfs_get_engines_allowed'
>> arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x9e2): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_fini':
   drivers/gpu/drm/xe/xe_survivability_mode.c:149:(.text+0x14e): undefined reference to `xe_configfs_clear_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:149:(.text+0x14e): undefined reference to `xe_configfs_clear_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:224:(.text+0x1b0): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:224:(.text+0x1b0): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:229:(.text+0x1ca): undefined reference to `xe_configfs_clear_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:229:(.text+0x1ca): undefined reference to `xe_configfs_clear_survivability_mode'


vim +812 drivers/gpu/drm/xe/xe_hw_engine.c

9897eb855544f0 Daniele Ceraolo Spurio 2023-11-17  808  
58b51df807d739 Lucas De Marchi        2025-05-28  809  static void check_sw_disable(struct xe_gt *gt)
58b51df807d739 Lucas De Marchi        2025-05-28  810  {
58b51df807d739 Lucas De Marchi        2025-05-28  811  	struct xe_device *xe = gt_to_xe(gt);
58b51df807d739 Lucas De Marchi        2025-05-28 @812  	u64 sw_allowed = xe_configfs_get_engines_allowed(to_pci_dev(xe->drm.dev));
58b51df807d739 Lucas De Marchi        2025-05-28  813  	enum xe_hw_engine_id id;
58b51df807d739 Lucas De Marchi        2025-05-28  814  
58b51df807d739 Lucas De Marchi        2025-05-28  815  	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
58b51df807d739 Lucas De Marchi        2025-05-28  816  		if (!(gt->info.engine_mask & BIT(id)))
58b51df807d739 Lucas De Marchi        2025-05-28  817  			continue;
58b51df807d739 Lucas De Marchi        2025-05-28  818  
58b51df807d739 Lucas De Marchi        2025-05-28  819  		if (!(sw_allowed & BIT(id))) {
58b51df807d739 Lucas De Marchi        2025-05-28  820  			gt->info.engine_mask &= ~BIT(id);
58b51df807d739 Lucas De Marchi        2025-05-28  821  			xe_gt_info(gt, "%s disabled via configfs\n",
58b51df807d739 Lucas De Marchi        2025-05-28  822  				   engine_infos[id].name);
58b51df807d739 Lucas De Marchi        2025-05-28  823  		}
58b51df807d739 Lucas De Marchi        2025-05-28  824  	}
58b51df807d739 Lucas De Marchi        2025-05-28  825  }
58b51df807d739 Lucas De Marchi        2025-05-28  826  

:::::: The code at line 812 was first introduced by commit
:::::: 58b51df807d7394a09ddb95b47099d59465e3777 drm/xe: Allow to disable engines

:::::: TO: Lucas De Marchi <lucas.demarchi@intel.com>
:::::: CC: Lucas De Marchi <lucas.demarchi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
