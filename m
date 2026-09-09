Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50D23358B0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979229; cv=none; b=Aev3npajfK2AxXIlksBkjg9Du65FXLpznlh4nmI/WCMrOpe6urG1ibaB96daAtC9Kis7n25nxp0sfmPSvq4+1XVJ1lpeLW4VJ1C8tSf9VQ+wmMczB6CzO3JiG/FRmkwEKN3ZKh3tpEIwhOyfPYA/bidWKUDNuAQwU+3Ol2JkgtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979229; c=relaxed/simple;
	bh=AEDiA50dSiv+rRqCGCM70sauCICT2kIp3QNT54foBss=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nn5A5u17nBOCkF4iMswWk2DvvHR8ASj6zm4L9doXxPGclgP50reyjqa9Fs1mrFLVcne6c7TfnZT2fzeN9DDUtZ16eiiqFUUIiyDsmKMvUlXqdnFNeQs7nKow1O2GRb7KovjSMMCWKbqsteVOQQhDeeK5qPKHzGcUdgfv+HSOX5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYL8rzsY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYL8rzsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788979227; x=1820515227;
  h=date:from:to:cc:subject:message-id;
  bh=AEDiA50dSiv+rRqCGCM70sauCICT2kIp3QNT54foBss=;
  b=ZYL8rzsY8Y3/Mj7WLTVPqdC2nlLP86bYhLHmlmEQRQnzl2CjGgd3emCe
   BSkcpgrGMkRDzrHeloqky0eLmt0RkJPaRKKe4UX85PfX+E0MNMdh/7SRT
   NqPGzieOhsdBVkkVU1TmfUPTF8oQ1Ng9y9+9nOMuJPFy9MNDBibi4gDZj
   0lzEoR6bKAkr+elTXdkwCQFf1EDIG+lGpUfQpfesGwArcFKfQbZg65ora
   dTQ5H3K05d96VTCXvme+5MOufxHV53JwlHA3hgYhItV1VzNx1T5/V9yxm
   4l43QCsHS3ABC+OdbI9tSS29ylI5MxvvEpbZYbXzGQzZ2iinBl0ZKdI4i
   w==;
X-CSE-ConnectionGUID: 4VTs4pqHRV6DvurJdOoVSQ==
X-CSE-MsgGUID: +XI7C7l+QQCQLqtHuwrBpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93240393"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="93240393"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 11:40:26 -0700
X-CSE-ConnectionGUID: NAziY+fdTkyUjhJRYJOrig==
X-CSE-MsgGUID: +1z4fbTLTIq4QmWNZ8+8CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="271889173"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Sep 2026 11:40:24 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4NDa-000000000oK-2FSK;
	Wed, 09 Sep 2026 18:40:22 +0000
Date: Thu, 10 Sep 2026 02:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 8/8]
 drivers/soc/tegra/pmc.c:491: warning: Function parameter or struct member
 'wake_work' not described in 'tegra_pmc'
Message-ID: <202609100213.YMTPABSy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   89698cd757af7c756e90649f8b51589755d96cd3
commit: 44c08dd637feb7b542ccb2e06d27424f09bb66ac [8/8] BACKPORT: soc/tegra: pmc: Fix unsafe generic_handle_irq() call
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609100213.YMTPABSy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100213.YMTPABSy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100213.YMTPABSy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/tegra/pmc.c:491: warning: Function parameter or struct member 'syscore' not described in 'tegra_pmc'
>> drivers/soc/tegra/pmc.c:491: warning: Function parameter or struct member 'wake_work' not described in 'tegra_pmc'
>> drivers/soc/tegra/pmc.c:491: warning: Function parameter or struct member 'wake_status' not described in 'tegra_pmc'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +491 drivers/soc/tegra/pmc.c

5f84bb1a4099e2 Sandipan Patra       2018-10-24  405  
7232398abc6a71 Thierry Reding       2014-07-11  406  /**
7232398abc6a71 Thierry Reding       2014-07-11  407   * struct tegra_pmc - NVIDIA Tegra PMC
35b67291b4a85d Jon Hunter           2015-12-04  408   * @dev: pointer to PMC device structure
7232398abc6a71 Thierry Reding       2014-07-11  409   * @base: pointer to I/O remapped register region
bbe5af60041cae Thierry Reding       2019-01-25  410   * @wake: pointer to I/O remapped region for WAKE registers
bbe5af60041cae Thierry Reding       2019-01-25  411   * @aotag: pointer to I/O remapped region for AOTAG registers
bbe5af60041cae Thierry Reding       2019-01-25  412   * @scratch: pointer to I/O remapped region for scratch registers
7232398abc6a71 Thierry Reding       2014-07-11  413   * @clk: pointer to pclk clock
35b67291b4a85d Jon Hunter           2015-12-04  414   * @soc: pointer to SoC data structure
e247deae1a5508 Mikko Perttunen      2019-01-25  415   * @tz_only: flag specifying if the PMC can only be accessed via TrustZone
7232398abc6a71 Thierry Reding       2014-07-11  416   * @rate: currently configured rate of pclk
7232398abc6a71 Thierry Reding       2014-07-11  417   * @suspend_mode: lowest suspend mode available
7232398abc6a71 Thierry Reding       2014-07-11  418   * @cpu_good_time: CPU power good time (in microseconds)
7232398abc6a71 Thierry Reding       2014-07-11  419   * @cpu_off_time: CPU power off time (in microsecends)
7232398abc6a71 Thierry Reding       2014-07-11  420   * @core_osc_time: core power good OSC time (in microseconds)
7232398abc6a71 Thierry Reding       2014-07-11  421   * @core_pmu_time: core power good PMU time (in microseconds)
7232398abc6a71 Thierry Reding       2014-07-11  422   * @core_off_time: core power off time (in microseconds)
7232398abc6a71 Thierry Reding       2014-07-11  423   * @corereq_high: core power request is active-high
7232398abc6a71 Thierry Reding       2014-07-11  424   * @sysclkreq_high: system clock request is active-high
7232398abc6a71 Thierry Reding       2014-07-11  425   * @combined_req: combined power request for CPU & core
7232398abc6a71 Thierry Reding       2014-07-11  426   * @cpu_pwr_good_en: CPU power good signal is enabled
7232398abc6a71 Thierry Reding       2014-07-11  427   * @lp0_vec_phys: physical base address of the LP0 warm boot code
7232398abc6a71 Thierry Reding       2014-07-11  428   * @lp0_vec_size: size of the LP0 warm boot code
a38045121bf421 Jon Hunter           2016-03-30  429   * @powergates_available: Bitmap of available power gates
7232398abc6a71 Thierry Reding       2014-07-11  430   * @powergates_lock: mutex for power gate register access
bbe5af60041cae Thierry Reding       2019-01-25  431   * @pctl_dev: pin controller exposed by the PMC
bbe5af60041cae Thierry Reding       2019-01-25  432   * @domain: IRQ domain provided by the PMC
bbe5af60041cae Thierry Reding       2019-01-25  433   * @irq: chip implementation for the IRQ domain
e57a243f5d896f Dmitry Osipenko      2019-09-26  434   * @clk_nb: pclk clock changes handler
d3a20dcbca4880 Thierry Reding       2022-05-06  435   * @core_domain_state_synced: flag marking the core domain's state as synced
d3a20dcbca4880 Thierry Reding       2022-05-06  436   * @core_domain_registered: flag marking the core domain as registered
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  437   * @wake_type_level_map: Bitmap indicating level type for non-dual edge wakes
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  438   * @wake_type_dual_edge_map: Bitmap indicating if a wake is dual-edge or not
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  439   * @wake_sw_status_map: Bitmap to hold raw status of wakes without mask
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  440   * @wake_cntrl_level_map: Bitmap to hold wake levels to be programmed in
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  441   *     cntrl register associated with each wake during system suspend.
7232398abc6a71 Thierry Reding       2014-07-11  442   */
7232398abc6a71 Thierry Reding       2014-07-11  443  struct tegra_pmc {
3568df3d31d62b Mikko Perttunen      2015-01-06  444  	struct device *dev;
7232398abc6a71 Thierry Reding       2014-07-11  445  	void __iomem *base;
c641ec6eab8587 Thierry Reding       2017-08-30  446  	void __iomem *wake;
c641ec6eab8587 Thierry Reding       2017-08-30  447  	void __iomem *aotag;
5be2255676bf2b Thierry Reding       2017-08-30  448  	void __iomem *scratch;
7232398abc6a71 Thierry Reding       2014-07-11  449  	struct clk *clk;
7232398abc6a71 Thierry Reding       2014-07-11  450  
7232398abc6a71 Thierry Reding       2014-07-11  451  	const struct tegra_pmc_soc *soc;
e247deae1a5508 Mikko Perttunen      2019-01-25  452  	bool tz_only;
7232398abc6a71 Thierry Reding       2014-07-11  453  
7232398abc6a71 Thierry Reding       2014-07-11  454  	unsigned long rate;
7232398abc6a71 Thierry Reding       2014-07-11  455  
7232398abc6a71 Thierry Reding       2014-07-11  456  	enum tegra_suspend_mode suspend_mode;
7232398abc6a71 Thierry Reding       2014-07-11  457  	u32 cpu_good_time;
7232398abc6a71 Thierry Reding       2014-07-11  458  	u32 cpu_off_time;
7232398abc6a71 Thierry Reding       2014-07-11  459  	u32 core_osc_time;
7232398abc6a71 Thierry Reding       2014-07-11  460  	u32 core_pmu_time;
7232398abc6a71 Thierry Reding       2014-07-11  461  	u32 core_off_time;
7232398abc6a71 Thierry Reding       2014-07-11  462  	bool corereq_high;
7232398abc6a71 Thierry Reding       2014-07-11  463  	bool sysclkreq_high;
7232398abc6a71 Thierry Reding       2014-07-11  464  	bool combined_req;
7232398abc6a71 Thierry Reding       2014-07-11  465  	bool cpu_pwr_good_en;
7232398abc6a71 Thierry Reding       2014-07-11  466  	u32 lp0_vec_phys;
7232398abc6a71 Thierry Reding       2014-07-11  467  	u32 lp0_vec_size;
a38045121bf421 Jon Hunter           2016-03-30  468  	DECLARE_BITMAP(powergates_available, TEGRA_POWERGATE_MAX);
7232398abc6a71 Thierry Reding       2014-07-11  469  
7232398abc6a71 Thierry Reding       2014-07-11  470  	struct mutex powergates_lock;
4a37f11c8f57ff Aapo Vienamo         2018-08-10  471  
4a37f11c8f57ff Aapo Vienamo         2018-08-10  472  	struct pinctrl_dev *pctl_dev;
19906e6b166721 Thierry Reding       2018-09-17  473  
19906e6b166721 Thierry Reding       2018-09-17  474  	struct irq_domain *domain;
19906e6b166721 Thierry Reding       2018-09-17  475  	struct irq_chip irq;
e57a243f5d896f Dmitry Osipenko      2019-09-26  476  
e57a243f5d896f Dmitry Osipenko      2019-09-26  477  	struct notifier_block clk_nb;
41bafa698ddd07 Dmitry Osipenko      2021-06-01  478  
41bafa698ddd07 Dmitry Osipenko      2021-06-01  479  	bool core_domain_state_synced;
41bafa698ddd07 Dmitry Osipenko      2021-06-01  480  	bool core_domain_registered;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  481  
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  482  	unsigned long *wake_type_level_map;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  483  	unsigned long *wake_type_dual_edge_map;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  484  	unsigned long *wake_sw_status_map;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  485  	unsigned long *wake_cntrl_level_map;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  486  	struct syscore_ops syscore;
44c08dd637feb7 Prathamesh Shete     2026-01-08  487  
44c08dd637feb7 Prathamesh Shete     2026-01-08  488  	/* Pending wake IRQ processing */
44c08dd637feb7 Prathamesh Shete     2026-01-08  489  	struct irq_work wake_work;
44c08dd637feb7 Prathamesh Shete     2026-01-08  490  	u32 *wake_status;
7232398abc6a71 Thierry Reding       2014-07-11 @491  };
7232398abc6a71 Thierry Reding       2014-07-11  492  

:::::: The code at line 491 was first introduced by commit
:::::: 7232398abc6a7186e315425638c367d50c674718 ARM: tegra: Convert PMC to a driver

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
