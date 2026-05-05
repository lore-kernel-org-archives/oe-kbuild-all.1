Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D48C48BD4E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998550; cv=none; b=QhXspeaeI1dQwH4/XtEpINTGjA0dnAYH9UdJ7e9PKgXPGDZ5opAxK0izqfJRLtel+KuRdE0wOJWZJ5oE8SFUvLwu/5uJLJl/3loFP8KZSnoE52tYH2CJ5TQfH3KJ02k7vDlF0syG/Q71j4q6/mWKpPVxD0FOVjZaODaT35i+zPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998550; c=relaxed/simple;
	bh=KvfMVdpRley/+WIdidsNW1LRFF/W8bVALcXRMAFhPgw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jNXxNsxH/h4lO4i2mwhe8ZonohMB1ybRYnCVjNOZtmxlBWxa33wbYXDQunznwfyycMLc8mC335+jW9GOFPku3GEP6pNAbQ1AS/sTo7hwPlL+A/Ipvw3pLaLtsFRlYg73rNpW3G0PwW+bXFea8CxGp6R/uEwcc8c++4DN35jlDBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIEV0NE3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIEV0NE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777998549; x=1809534549;
  h=date:from:to:cc:subject:message-id;
  bh=KvfMVdpRley/+WIdidsNW1LRFF/W8bVALcXRMAFhPgw=;
  b=oIEV0NE3JeZqZmeLfDbTSKrx79RDKg+Ju+oAGzTQOUHossqNcw9OWU/P
   yOzldayIYsPl8FtmWhFoofZk/7HRiqzTf7M0dJmkOEsagxQHEUF/d/fcv
   JBpMtC/m35LQd1bR60YUKSMT7mlhXvBKV4723CJN0wB1KSuy1nYjfGRVY
   9mU9zFkm9xjQgZv5irYetRs/UHmAVOM11mdqdN5M+cCkXmmjFk/ZfdHx0
   HBYJXXV1YBECJLqvQqQ8rFlR8MEdeez7+UaVvT+X9FAUSej7U550Y5pDr
   XQRcxdWAQUkCgDu12SlsXNtVmfCfYcyYUFQ9B1Hp2lBKuEGUXdpVdhlD1
   g==;
X-CSE-ConnectionGUID: rAKPOLmkTzmyx1o2eOU0MQ==
X-CSE-MsgGUID: TEyE/6IFQ/CZV2bgM9wF0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82743806"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="82743806"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 09:29:09 -0700
X-CSE-ConnectionGUID: mVFgS6oIRZ+gK1qwmwhHNw==
X-CSE-MsgGUID: gRNvUrdFSlSgYTN0qXlbVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="237635309"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 May 2026 09:29:07 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKIdt-000000000Hp-0xRV;
	Tue, 05 May 2026 16:29:05 +0000
Date: Wed, 06 May 2026 00:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Austen <hpausten@protonmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpu/drm/xe/xe_oa.c:2384:15: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202605060058.gvgETBpP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
commit: aa18d5769fcafe645a3ba01a9a69dde4f8dc8cc3 drm/xe: Allow dropping kunit dependency as built-in
date:   10 months ago
config: arm-randconfig-r132-20260505 (https://download.01.org/0day-ci/archive/20260506/202605060058.gvgETBpP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060058.gvgETBpP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: aa18d5769fca ("drm/xe: Allow dropping kunit dependency as built-in")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060058.gvgETBpP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_oa.c:2371:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [usertype] *ptr @@     got void [noderef] __user * @@
   drivers/gpu/drm/xe/xe_oa.c:2371:25: sparse:     expected unsigned long long [usertype] *ptr
   drivers/gpu/drm/xe/xe_oa.c:2371:25: sparse:     got void [noderef] __user *
>> drivers/gpu/drm/xe/xe_oa.c:2384:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] __user *register __p @@     got unsigned long long [usertype] *ptr @@
   drivers/gpu/drm/xe/xe_oa.c:2384:15: sparse:     expected unsigned long long [noderef] __user *register __p
   drivers/gpu/drm/xe/xe_oa.c:2384:15: sparse:     got unsigned long long [usertype] *ptr

vim +2384 drivers/gpu/drm/xe/xe_oa.c

cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2359  
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2360  /**
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2361   * xe_oa_remove_config_ioctl - Removes one OA config
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2362   * @dev: @drm_device
8169b2097d88d9 Ashutosh Dixit   2024-07-03  2363   * @data: pointer to struct @drm_xe_observation_param
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2364   * @file: @drm_file
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2365   */
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2366  int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2367  {
cb925d31f09146 Michal Wajdeczko 2024-06-19  2368  	struct xe_device *xe = to_xe_device(dev);
cb925d31f09146 Michal Wajdeczko 2024-06-19  2369  	struct xe_oa *oa = &xe->oa;
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2370  	struct xe_oa_config *oa_config;
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17 @2371  	u64 arg, *ptr = u64_to_user_ptr(data);
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2372  	int ret;
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2373  
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2374  	if (!oa->xe) {
cb925d31f09146 Michal Wajdeczko 2024-06-19  2375  		drm_dbg(&xe->drm, "xe oa interface not available for this system\n");
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2376  		return -ENODEV;
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2377  	}
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2378  
8169b2097d88d9 Ashutosh Dixit   2024-07-03  2379  	if (xe_observation_paranoid && !perfmon_capable()) {
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2380  		drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2381  		return -EACCES;
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2382  	}
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2383  
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17 @2384  	ret = get_user(arg, ptr);
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2385  	if (XE_IOCTL_DBG(oa->xe, ret))
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2386  		return ret;
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2387  
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2388  	ret = mutex_lock_interruptible(&oa->metrics_lock);
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2389  	if (ret)
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2390  		return ret;
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2391  
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2392  	oa_config = idr_find(&oa->metrics_idr, arg);
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2393  	if (!oa_config) {
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2394  		drm_dbg(&oa->xe->drm, "Failed to remove unknown OA config\n");
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2395  		ret = -ENOENT;
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2396  		goto err_unlock;
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2397  	}
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2398  
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2399  	WARN_ON(arg != oa_config->id);
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2400  
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2401  	sysfs_remove_group(oa->metrics_kobj, &oa_config->sysfs_metric);
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2402  	idr_remove(&oa->metrics_idr, arg);
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2403  
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2404  	mutex_unlock(&oa->metrics_lock);
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2405  
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2406  	drm_dbg(&oa->xe->drm, "Removed config %s id=%i\n", oa_config->uuid, oa_config->id);
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2407  
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2408  	xe_oa_config_put(oa_config);
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2409  
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2410  	return 0;
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2411  
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2412  err_unlock:
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2413  	mutex_unlock(&oa->metrics_lock);
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2414  	return ret;
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2415  }
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2416  

:::::: The code at line 2384 was first introduced by commit
:::::: cdf02fe1a94a768cbcd20f5c4e1a1d805f4a06c0 drm/xe/oa/uapi: Add/remove OA config perf ops

:::::: TO: Ashutosh Dixit <ashutosh.dixit@intel.com>
:::::: CC: Ashutosh Dixit <ashutosh.dixit@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
