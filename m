Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9093D1FCFDA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 18:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781009; cv=none; b=sXXsCiy1LfkK20Yep1xW4UtZr4msOouqZV1vwvGThDso5jeuFisAuteh8eYxrFQMwYWQA2jandshJ8Vnsv+1X4DhEIFxivMgQCWIvzDohzB3OB3wRRczyrJnG+MN9uW7m0/5OiuIYy/2+MnTUdiGoMKXjoEIfBecEl+7iSFFsto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781009; c=relaxed/simple;
	bh=o+kjVY1xn7F5a5Ci6CY7oWK6l59RRuHTinlmtBzfHoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lgVYLTYPCGjoZAdQ0VwT0BuTimC49M8Ei/iFMQihyRGDHf3a3sLT/etSk4gM1uQSjLnitARkM45rhigdRl/YizuGBAUtdHiKzrcXi9t1irySEjiwmmRJJR8YwzzhXpxDNvm84qfj51pwbOGW9I9Ooze2UM9drX3DQhiC1ebRvIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eT8kBhlY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eT8kBhlY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738781006; x=1770317006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o+kjVY1xn7F5a5Ci6CY7oWK6l59RRuHTinlmtBzfHoc=;
  b=eT8kBhlYNwcjoH0pmIrCzM3Pdy9Z7KOIYC1fApzdl/jAvAVAFUFAHzmH
   pr7ptsOL4/rdBzDXyfWIZtp3AU+6muu9Unpjs6mnh+Br3wP2eCU1I3Phl
   8NezE5/rT2AxCxRUqaQOCYnF/Zi/AQP9sw+oN+tYnftoSLJaNqEM/ysml
   zF66Q9lIV3v5EdsnFlXdRndhNExQpEwyocedJkVJl1Lkq2ahszeyJy1g1
   AIFzTx97Ay3eZZll4YOI195Wvz0kcgGo/amEWLArjYaNoFqS/FMOw2EHY
   s18hT4Guc9+0RZdDdwyNDJSgSKEz4n0ODFii/67OxaGznyAPrPfpEt7AC
   Q==;
X-CSE-ConnectionGUID: MvJCP6KrQI2DncuyEUCjtg==
X-CSE-MsgGUID: 8HuySafTQnOF8yUELbKL/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43284877"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="43284877"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 10:43:26 -0800
X-CSE-ConnectionGUID: w601wf/ERT6qAGjZVr3A5A==
X-CSE-MsgGUID: bVwErT17R7yv0CDBn+A5xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="141866087"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Feb 2025 10:43:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfkMs-000vwR-1k;
	Wed, 05 Feb 2025 18:43:22 +0000
Date: Thu, 6 Feb 2025 02:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:pmc 25/26] drivers/soc/tegra/pmc.c:475: warning:
 Function parameter or struct member 'reboot_notifier' not described in
 'tegra_pmc'
Message-ID: <202502060227.8pa2BZXX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thierryreding/linux pmc
head:   a4a9158dc615f5c96eefc0781954d4d5069865cc
commit: 81bf7fe71765511badd13021a2eade803fa264fa [25/26] soc/tegra: pmc: Remove legacy functions
config: arm64-randconfig-001-20250205 (https://download.01.org/0day-ci/archive/20250206/202502060227.8pa2BZXX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060227.8pa2BZXX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060227.8pa2BZXX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/tegra/pmc.c:475: warning: Function parameter or struct member 'reboot_notifier' not described in 'tegra_pmc'
   drivers/soc/tegra/pmc.c:475: warning: Function parameter or struct member 'syscore' not described in 'tegra_pmc'
>> drivers/soc/tegra/pmc.c:1000: warning: expecting prototype for tegra_pmc_get(). Prototype was for devm_tegra_pmc_get() instead
>> drivers/soc/tegra/pmc.c:1622: warning: expecting prototype for tegra_io_pad_power_enable(). Prototype was for tegra_pmc_io_pad_power_enable() instead


vim +475 drivers/soc/tegra/pmc.c

5f84bb1a4099e2 Sandipan Patra       2018-10-24  391  
7232398abc6a71 Thierry Reding       2014-07-11  392  /**
7232398abc6a71 Thierry Reding       2014-07-11  393   * struct tegra_pmc - NVIDIA Tegra PMC
35b67291b4a85d Jon Hunter           2015-12-04  394   * @dev: pointer to PMC device structure
7232398abc6a71 Thierry Reding       2014-07-11  395   * @base: pointer to I/O remapped register region
bbe5af60041cae Thierry Reding       2019-01-25  396   * @wake: pointer to I/O remapped region for WAKE registers
bbe5af60041cae Thierry Reding       2019-01-25  397   * @aotag: pointer to I/O remapped region for AOTAG registers
bbe5af60041cae Thierry Reding       2019-01-25  398   * @scratch: pointer to I/O remapped region for scratch registers
7232398abc6a71 Thierry Reding       2014-07-11  399   * @clk: pointer to pclk clock
35b67291b4a85d Jon Hunter           2015-12-04  400   * @soc: pointer to SoC data structure
e247deae1a5508 Mikko Perttunen      2019-01-25  401   * @tz_only: flag specifying if the PMC can only be accessed via TrustZone
7232398abc6a71 Thierry Reding       2014-07-11  402   * @rate: currently configured rate of pclk
7232398abc6a71 Thierry Reding       2014-07-11  403   * @suspend_mode: lowest suspend mode available
7232398abc6a71 Thierry Reding       2014-07-11  404   * @cpu_good_time: CPU power good time (in microseconds)
7232398abc6a71 Thierry Reding       2014-07-11  405   * @cpu_off_time: CPU power off time (in microsecends)
7232398abc6a71 Thierry Reding       2014-07-11  406   * @core_osc_time: core power good OSC time (in microseconds)
7232398abc6a71 Thierry Reding       2014-07-11  407   * @core_pmu_time: core power good PMU time (in microseconds)
7232398abc6a71 Thierry Reding       2014-07-11  408   * @core_off_time: core power off time (in microseconds)
7232398abc6a71 Thierry Reding       2014-07-11  409   * @corereq_high: core power request is active-high
7232398abc6a71 Thierry Reding       2014-07-11  410   * @sysclkreq_high: system clock request is active-high
7232398abc6a71 Thierry Reding       2014-07-11  411   * @combined_req: combined power request for CPU & core
7232398abc6a71 Thierry Reding       2014-07-11  412   * @cpu_pwr_good_en: CPU power good signal is enabled
7232398abc6a71 Thierry Reding       2014-07-11  413   * @lp0_vec_phys: physical base address of the LP0 warm boot code
7232398abc6a71 Thierry Reding       2014-07-11  414   * @lp0_vec_size: size of the LP0 warm boot code
a38045121bf421 Jon Hunter           2016-03-30  415   * @powergates_available: Bitmap of available power gates
7232398abc6a71 Thierry Reding       2014-07-11  416   * @powergates_lock: mutex for power gate register access
bbe5af60041cae Thierry Reding       2019-01-25  417   * @pctl_dev: pin controller exposed by the PMC
bbe5af60041cae Thierry Reding       2019-01-25  418   * @domain: IRQ domain provided by the PMC
bbe5af60041cae Thierry Reding       2019-01-25  419   * @irq: chip implementation for the IRQ domain
e57a243f5d896f Dmitry Osipenko      2019-09-26  420   * @clk_nb: pclk clock changes handler
d3a20dcbca4880 Thierry Reding       2022-05-06  421   * @core_domain_state_synced: flag marking the core domain's state as synced
d3a20dcbca4880 Thierry Reding       2022-05-06  422   * @core_domain_registered: flag marking the core domain as registered
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  423   * @wake_type_level_map: Bitmap indicating level type for non-dual edge wakes
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  424   * @wake_type_dual_edge_map: Bitmap indicating if a wake is dual-edge or not
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  425   * @wake_sw_status_map: Bitmap to hold raw status of wakes without mask
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  426   * @wake_cntrl_level_map: Bitmap to hold wake levels to be programmed in
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  427   *     cntrl register associated with each wake during system suspend.
7232398abc6a71 Thierry Reding       2014-07-11  428   */
7232398abc6a71 Thierry Reding       2014-07-11  429  struct tegra_pmc {
3568df3d31d62b Mikko Perttunen      2015-01-06  430  	struct device *dev;
7232398abc6a71 Thierry Reding       2014-07-11  431  	void __iomem *base;
c641ec6eab8587 Thierry Reding       2017-08-30  432  	void __iomem *wake;
c641ec6eab8587 Thierry Reding       2017-08-30  433  	void __iomem *aotag;
5be2255676bf2b Thierry Reding       2017-08-30  434  	void __iomem *scratch;
7232398abc6a71 Thierry Reding       2014-07-11  435  	struct clk *clk;
7232398abc6a71 Thierry Reding       2014-07-11  436  
7232398abc6a71 Thierry Reding       2014-07-11  437  	const struct tegra_pmc_soc *soc;
e247deae1a5508 Mikko Perttunen      2019-01-25  438  	bool tz_only;
7232398abc6a71 Thierry Reding       2014-07-11  439  
7232398abc6a71 Thierry Reding       2014-07-11  440  	unsigned long rate;
7232398abc6a71 Thierry Reding       2014-07-11  441  
7232398abc6a71 Thierry Reding       2014-07-11  442  	enum tegra_suspend_mode suspend_mode;
7232398abc6a71 Thierry Reding       2014-07-11  443  	u32 cpu_good_time;
7232398abc6a71 Thierry Reding       2014-07-11  444  	u32 cpu_off_time;
7232398abc6a71 Thierry Reding       2014-07-11  445  	u32 core_osc_time;
7232398abc6a71 Thierry Reding       2014-07-11  446  	u32 core_pmu_time;
7232398abc6a71 Thierry Reding       2014-07-11  447  	u32 core_off_time;
7232398abc6a71 Thierry Reding       2014-07-11  448  	bool corereq_high;
7232398abc6a71 Thierry Reding       2014-07-11  449  	bool sysclkreq_high;
7232398abc6a71 Thierry Reding       2014-07-11  450  	bool combined_req;
7232398abc6a71 Thierry Reding       2014-07-11  451  	bool cpu_pwr_good_en;
7232398abc6a71 Thierry Reding       2014-07-11  452  	u32 lp0_vec_phys;
7232398abc6a71 Thierry Reding       2014-07-11  453  	u32 lp0_vec_size;
a38045121bf421 Jon Hunter           2016-03-30  454  	DECLARE_BITMAP(powergates_available, TEGRA_POWERGATE_MAX);
7232398abc6a71 Thierry Reding       2014-07-11  455  
7232398abc6a71 Thierry Reding       2014-07-11  456  	struct mutex powergates_lock;
4a37f11c8f57ff Aapo Vienamo         2018-08-10  457  
4a37f11c8f57ff Aapo Vienamo         2018-08-10  458  	struct pinctrl_dev *pctl_dev;
19906e6b166721 Thierry Reding       2018-09-17  459  
19906e6b166721 Thierry Reding       2018-09-17  460  	struct irq_domain *domain;
19906e6b166721 Thierry Reding       2018-09-17  461  	struct irq_chip irq;
e57a243f5d896f Dmitry Osipenko      2019-09-26  462  
e57a243f5d896f Dmitry Osipenko      2019-09-26  463  	struct notifier_block clk_nb;
41bafa698ddd07 Dmitry Osipenko      2021-06-01  464  
41bafa698ddd07 Dmitry Osipenko      2021-06-01  465  	bool core_domain_state_synced;
41bafa698ddd07 Dmitry Osipenko      2021-06-01  466  	bool core_domain_registered;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  467  
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  468  	unsigned long *wake_type_level_map;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  469  	unsigned long *wake_type_dual_edge_map;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  470  	unsigned long *wake_sw_status_map;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  471  	unsigned long *wake_cntrl_level_map;
0333b6fb88df81 Thierry Reding       2025-02-03  472  
0333b6fb88df81 Thierry Reding       2025-02-03  473  	struct notifier_block reboot_notifier;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  474  	struct syscore_ops syscore;
7232398abc6a71 Thierry Reding       2014-07-11 @475  };
7232398abc6a71 Thierry Reding       2014-07-11  476  

:::::: The code at line 475 was first introduced by commit
:::::: 7232398abc6a7186e315425638c367d50c674718 ARM: tegra: Convert PMC to a driver

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
