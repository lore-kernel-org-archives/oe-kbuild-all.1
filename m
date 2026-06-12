Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1479C390CAA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 04:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781239354; cv=none; b=FdM3xNgOj5mmXRTEWZNiDnAAQ3nQMtAmFjDvhXZwva9dwC3U1z/ZwHKtZ2Kyqh8s0ta6cSyHsEwIWv3ABu8rJs9+3chS33pheipGeG6X+hK6+0Gzzcvm3wiNO0TV6kIRb5gdtSdiLuZR88Cj8nXRONAhE7ikVgYSDrawpEoh4u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781239354; c=relaxed/simple;
	bh=9e+/zqPFnaKcEPhV/gHBl3vGnSUlgnqTmn1xLU7mX/8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oD/KkEhr93SyjBR9LBavdHU3ly/p4kcuSNOvPwTcZfOiKQGp78xDd+zA6637R647eLPZx907X705KD5IB8KJKwR15lttXdB9i4E4bz8b31PrYe247hwGYnrLAOBJvgyJ+Ict+dUIfa3Wt+1oBUQsqHiVLF/SgKfzgI4YdEM0N6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1p0eOnW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1p0eOnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781239352; x=1812775352;
  h=date:from:to:cc:subject:message-id;
  bh=9e+/zqPFnaKcEPhV/gHBl3vGnSUlgnqTmn1xLU7mX/8=;
  b=Z1p0eOnWdPc84T277vvw1WRHJnMV6s8roEUTlnhNgCE/Etm+HlC3Ks5n
   nOoJgUAQfZzgTA2pV+1PdCfozTnvzPCm7Yjc587/Mk398caZhNS5wdr7E
   jQkdJXiC2YzpGXZNswny6VcRXG2sI2IFFs5JRzZi1RBYr36U8X7oHB5l2
   FklWMOmZdWyDKQRh2Wbs4ICd0ZVbheIN/YNf7yL9nxWPKf0wlvDizoxbT
   LaC2bfysQDSxqf4jwtmv7b4Le/T3rI0Kyq2b49wxx4q/cRhjpOzv4OeEq
   D5eW6whRu5U9qbAoo0MBaDcOIfmVTkGKm5AWtjaroqi+uRLKF9fttnQNe
   w==;
X-CSE-ConnectionGUID: OdeNklXUTyu6f0snDG1k0A==
X-CSE-MsgGUID: GdlvyW/8QFOC8b5o30rEEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84636070"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="84636070"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 21:42:31 -0700
X-CSE-ConnectionGUID: pwhtxVyASHG4flEKMqNOmw==
X-CSE-MsgGUID: odAgjt21QgeJWpf53zKNXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="245822868"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jun 2026 21:42:29 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXtit-00000000OK9-05G2;
	Fri, 12 Jun 2026 04:42:27 +0000
Date: Fri, 12 Jun 2026 12:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Austen <hpausten@protonmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpu/drm/xe/xe_oa.c:2384:15: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202606121227.INI72DTN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: aa18d5769fcafe645a3ba01a9a69dde4f8dc8cc3 drm/xe: Allow dropping kunit dependency as built-in
date:   12 months ago
config: s390-randconfig-r133-20260612 (https://download.01.org/0day-ci/archive/20260612/202606121227.INI72DTN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121227.INI72DTN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: aa18d5769fca ("drm/xe: Allow dropping kunit dependency as built-in")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121227.INI72DTN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_oa.c:2371:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [usertype] *ptr @@     got void [noderef] __user * @@
   drivers/gpu/drm/xe/xe_oa.c:2371:25: sparse:     expected unsigned long long [usertype] *ptr
   drivers/gpu/drm/xe/xe_oa.c:2371:25: sparse:     got void [noderef] __user *
>> drivers/gpu/drm/xe/xe_oa.c:2384:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __user *____guptr @@     got unsigned long long [usertype] *ptr @@
   drivers/gpu/drm/xe/xe_oa.c:2384:15: sparse:     expected void const [noderef] __user *____guptr
   drivers/gpu/drm/xe/xe_oa.c:2384:15: sparse:     got unsigned long long [usertype] *ptr
   drivers/gpu/drm/xe/xe_oa.c:2384:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned long long [usertype] *ptr @@
   drivers/gpu/drm/xe/xe_oa.c:2384:15: sparse:     expected void const volatile [noderef] __user *ptr
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
cdf02fe1a94a76 Ashutosh Dixit   2024-06-17  2371  	u64 arg, *ptr = u64_to_user_ptr(data);
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
