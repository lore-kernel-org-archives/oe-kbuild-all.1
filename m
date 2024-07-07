Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11657DDC0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720347947; cv=none; b=rIdcfrhSZ45JYN995NS52oTQrryt86RNB93YjKXTQKeMj1gY+f791WiTMKacCb6YSYQt1I+Akr6NSfsBkrTrgzdUsZSa/syas8eZLOEzPdOZZP8n2EAxBiQSI27jQsrT8yEOqdnR5mt0W/T3fJ1NBJhI4LrCtbQ1gppHAaQpsOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720347947; c=relaxed/simple;
	bh=vnjMFjjQb3/n5uXYhBlFhFipXnPyOHEWBH0t5rQSf/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LrYTW+JvKB2u3B4T/RDHI7UMR8tMoCzT3fG/mzUAA7GxukY2fKB+YQvkzzK1zHmPebjPpRgonXiBag9ePJ5yGdq9iHGyNZEq7F+HyeOYSeh144XiLudLt/stk9O91m+k+7Tdk+Md/4yXJioaj+KLqMoXhojT+vNa9ldJXG6Jl3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6LxJbSo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6LxJbSo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720347945; x=1751883945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vnjMFjjQb3/n5uXYhBlFhFipXnPyOHEWBH0t5rQSf/U=;
  b=k6LxJbSo2y3XmHfFT4jYhFVhR6n8FpwC44ZeIaHI/0ubkIKwSD4eTZ6P
   Wjiby8Fc5IxVVNruuxWvN41rzdXBBhdrixVDHgRMZnKiI25YAeLK6ySPC
   WnDblPLhpijPUvoVKGwbZvrcdbPZmFdmRJLFEWt4iPPor8DxnxqsHJ+kt
   vswvchE5p1LR899wQPY9VM7NXCZNlLZ16OarMy8dN/atxQn/DX8KN2YhL
   NZMuq+ms5fWbvzRmGdxbKcWENWKrIShsYFGkAhvWGaQ6FzDSOZV9duFUt
   gvlnZbnYjFFNfgxwNa21+EnaaFMNGSfaOPF9/gOFAW62WjzCh/DrwJbwt
   A==;
X-CSE-ConnectionGUID: CBTynsmjTFqKu3yrUxnLfw==
X-CSE-MsgGUID: Fn/uRNG+SRSzr9GOdJNOkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="40072458"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="40072458"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 03:25:45 -0700
X-CSE-ConnectionGUID: 4i7KFPOUQviI21RdxO6PeQ==
X-CSE-MsgGUID: 7yVyKNx4Sdm33NxnaNVI3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="52067230"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jul 2024 03:25:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQP5R-000Upq-13;
	Sun, 07 Jul 2024 10:25:41 +0000
Date: Sun, 7 Jul 2024 18:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14319/15088]
 drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c:215:30: error: 'struct
 kbase_device' has no member named 'nr_regulators'
Message-ID: <202407071853.Ylfd5Zp6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   2166fa6b0c817630441a03552541b022f35cfc03
commit: ecff92f8af7a95cb874c791cd97ea306774c68fb [14319/15088] CHROMIUM: gpu: mali: Apply r44p1 fixes
config: arm64-randconfig-r064-20240707 (https://download.01.org/0day-ci/archive/20240707/202407071853.Ylfd5Zp6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071853.Ylfd5Zp6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407071853.Ylfd5Zp6-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: kbuild/src/consumer/drivers/gpu/arm/mali: No such file or directory [-Wmissing-include-dirs]
   drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c: In function 'kbase_devfreq_target':
>> drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c:215:30: error: 'struct kbase_device' has no member named 'nr_regulators'
     215 |         for (i = 0; i < kbdev->nr_regulators; i++)
         |                              ^~
   drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c:216:28: error: implicit declaration of function 'dev_pm_opp_get_voltage_supply'; did you mean 'dev_pm_opp_get_voltage'? [-Werror=implicit-function-declaration]
     216 |                 volts[i] = dev_pm_opp_get_voltage_supply(opp, i);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                            dev_pm_opp_get_voltage
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +215 drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c

   183	
   184	
   185	static int
   186	kbase_devfreq_target(struct device *dev, unsigned long *target_freq, u32 flags)
   187	{
   188		struct kbase_device *kbdev = dev_get_drvdata(dev);
   189		struct dev_pm_opp *opp;
   190		unsigned long nominal_freq;
   191		unsigned long freqs[BASE_MAX_NR_CLOCKS_REGULATORS] = {0};
   192		unsigned long volts[BASE_MAX_NR_CLOCKS_REGULATORS] = {0};
   193	#if IS_ENABLED(CONFIG_MTK_SVS)
   194		unsigned long unused_volts[BASE_MAX_NR_CLOCKS_REGULATORS] = {0};
   195		unsigned int i;
   196	#endif
   197		u64 core_mask;
   198		int err;
   199	
   200		nominal_freq = *target_freq;
   201	
   202	#if KERNEL_VERSION(4, 11, 0) > LINUX_VERSION_CODE
   203		rcu_read_lock();
   204	#endif
   205		opp = devfreq_recommended_opp(dev, &nominal_freq, flags);
   206	#if KERNEL_VERSION(4, 11, 0) > LINUX_VERSION_CODE
   207		rcu_read_unlock();
   208	#endif
   209		if (IS_ERR_OR_NULL(opp)) {
   210			dev_err(dev, "Failed to get opp (%d)\n", PTR_ERR_OR_ZERO(opp));
   211			return IS_ERR(opp) ? PTR_ERR(opp) : -ENODEV;
   212		}
   213	
   214	#if IS_ENABLED(CONFIG_MTK_SVS)
 > 215		for (i = 0; i < kbdev->nr_regulators; i++)
   216			volts[i] = dev_pm_opp_get_voltage_supply(opp, i);
   217	#endif
   218	#if KERNEL_VERSION(4, 11, 0) <= LINUX_VERSION_CODE
   219		dev_pm_opp_put(opp);
   220	#endif
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
