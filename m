Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9273E63AD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183177; cv=none; b=d2YWtg9Odxa6H4Vm3g7+WI7M3aDMN8npgr3bg8kpJBirTvy4qrxw03M4z9JwmollbuuAkRZRH/Pe6WcvSLvhT2k2rcrl/nH6kMTR8LtP4tIMQKrr1mp6o5GYGcn4LAtk6Nu7M/UnxOYjZc1YhW6Sq42aMtxJh5Hqx9rfDjsTcMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183177; c=relaxed/simple;
	bh=8dMOHmaYSLr1DFi+SUKw4ru9n5OdjOvX/5FFE964Rzs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UeCKAs+8hwprl0b18tTaBPVQ/XML360sO6CDBZD6YXabH3Zb5n++othi/MxiCg0UDQFSuhSmBSKtYOxvGz/1ynwtNOe/HIxNK3zs5xr7/4r4b2sMUrOgGIbVR5PZEltO2ZrGQiKNdZUDY9KcciAm+Pj3GxQ1Shif2RMk1VEkg0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E87JQ7+f; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E87JQ7+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776183175; x=1807719175;
  h=date:from:to:cc:subject:message-id;
  bh=8dMOHmaYSLr1DFi+SUKw4ru9n5OdjOvX/5FFE964Rzs=;
  b=E87JQ7+fedE0NqRLauxMp2DPwSh0kGxohClecte+G1yWYCxb3SG8oO3B
   oYU0ze50T0s6xgDUmMVvHs6ZgBDguaBgKqz1Jky5mlDR8jr0iMEnt01j9
   sBqxD4oZFpFbE4Gy/ipepK793mOQuFQhAikhKYo8oXj/J+Q05RvsOW5GW
   K+wqkSKKESVUXWXaZLSrrk5+0G/H7koqfxXt5R23s17PXbtn0bjPkWfuw
   zZVxJJ9Ybp3gcO3yhcYg2sc5BDP48URKGwrCbDiNvxARmFRXuLA8rmAes
   6OLGvMRVMIT+OUWmwphsBf0JUomT2bzgcWRtLP6N3lpCs/K8uX2J7GkGe
   w==;
X-CSE-ConnectionGUID: j3RyNd+eRcSXyRkg1yCfVg==
X-CSE-MsgGUID: eWmLd/lpQKiHLFCYG8e/pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="79732141"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="79732141"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 09:12:55 -0700
X-CSE-ConnectionGUID: lp0nQdcBQzOXL/6FFCkd7A==
X-CSE-MsgGUID: P7Pl4/CsQC2/PGjrm/tcxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225422928"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2026 09:12:53 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCgNf-000000001dl-0p3c;
	Tue, 14 Apr 2026 16:12:51 +0000
Date: Wed, 15 Apr 2026 00:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id 23/25]
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1794:32: error: too many arguments to
 function 'thermal_of_cooling_device_register'; expected 4, have 5
Message-ID: <202604150019.EszeBD58-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id
head:   4fea531ae8a1095b1fc1122441fc173a33b93005
commit: c045fc07fa888c25f248b661a8fdda955528baf2 [23/25] thermal/of: Introduce cooling device of_index
config: openrisc-randconfig-r121-20260414 (https://download.01.org/0day-ci/archive/20260415/202604150019.EszeBD58-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150019.EszeBD58-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150019.EszeBD58-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/etnaviv/etnaviv_gpu.c:17:
   include/linux/thermal.h:333:1: warning: no previous prototype for 'devm_thermal_cooling_device_register' [-Wmissing-prototypes]
     333 | devm_thermal_cooling_device_register(struct device *dev, const char *type,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c: In function 'etnaviv_gpu_bind':
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1795:56: error: passing argument 4 of 'thermal_of_cooling_device_register' from incompatible pointer type [-Wincompatible-pointer-types]
    1795 |                                 (char *)dev_name(dev), gpu, &cooling_ops);
         |                                                        ^~~
         |                                                        |
         |                                                        struct etnaviv_gpu *
   include/linux/thermal.h:231:77: note: expected 'const struct thermal_cooling_device_ops *' but argument is of type 'struct etnaviv_gpu *'
     231 |                                    const struct thermal_cooling_device_ops *ops)
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1794:32: error: too many arguments to function 'thermal_of_cooling_device_register'; expected 4, have 5
    1794 |                 gpu->cooling = thermal_of_cooling_device_register(dev->of_node, 0,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1795 |                                 (char *)dev_name(dev), gpu, &cooling_ops);
         |                                                             ~~~~~~~~~~~~
   include/linux/thermal.h:229:1: note: declared here
     229 | thermal_of_cooling_device_register(struct device_node *np,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/thermal_of_cooling_device_register +1794 drivers/gpu/drm/etnaviv/etnaviv_gpu.c

  1784	
  1785	static int etnaviv_gpu_bind(struct device *dev, struct device *master,
  1786		void *data)
  1787	{
  1788		struct drm_device *drm = data;
  1789		struct etnaviv_drm_private *priv = drm->dev_private;
  1790		struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
  1791		int ret;
  1792	
  1793		if (IS_ENABLED(CONFIG_DRM_ETNAVIV_THERMAL)) {
> 1794			gpu->cooling = thermal_of_cooling_device_register(dev->of_node, 0,
  1795					(char *)dev_name(dev), gpu, &cooling_ops);
  1796			if (IS_ERR(gpu->cooling))
  1797				return PTR_ERR(gpu->cooling);
  1798		}
  1799	
  1800		gpu->wq = alloc_ordered_workqueue(dev_name(dev), 0);
  1801		if (!gpu->wq) {
  1802			ret = -ENOMEM;
  1803			goto out_thermal;
  1804		}
  1805	
  1806		ret = etnaviv_sched_init(gpu);
  1807		if (ret)
  1808			goto out_workqueue;
  1809	
  1810		if (!IS_ENABLED(CONFIG_PM)) {
  1811			ret = etnaviv_gpu_clk_enable(gpu);
  1812			if (ret < 0)
  1813				goto out_sched;
  1814		}
  1815	
  1816		gpu->drm = drm;
  1817		gpu->fence_context = dma_fence_context_alloc(1);
  1818		xa_init_flags(&gpu->user_fences, XA_FLAGS_ALLOC);
  1819		spin_lock_init(&gpu->fence_spinlock);
  1820	
  1821		INIT_WORK(&gpu->sync_point_work, sync_point_worker);
  1822		init_waitqueue_head(&gpu->fence_event);
  1823	
  1824		priv->gpu[priv->num_gpus++] = gpu;
  1825	
  1826		return 0;
  1827	
  1828	out_sched:
  1829		etnaviv_sched_fini(gpu);
  1830	
  1831	out_workqueue:
  1832		destroy_workqueue(gpu->wq);
  1833	
  1834	out_thermal:
  1835		if (IS_ENABLED(CONFIG_DRM_ETNAVIV_THERMAL))
  1836			thermal_cooling_device_unregister(gpu->cooling);
  1837	
  1838		return ret;
  1839	}
  1840	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
