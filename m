Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA367F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 21:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692912650; x=1724448650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GLTFtgHUpe1IpeJ2uP8tAoOwax15BFxk12C/XW+BkWY=;
  b=bj4p9P60oRAne50N5KGAnJOBqQhy9K7OHJiPvzhnXMz84zD7VDWIkwwB
   yC4x6LhpizGd9EVNfvsXrRs6kqyefWpK9ATxsvRsxTs9YaN/cC8Z0RQcM
   1HmggSrPE8bpFlerDKZ/mNN1kYg0i7cinmv3gfJE4sMwc+i27cxjJJYfZ
   4w7Rkho21jSI8Y/2Fo/2U6qnfJPj/i+PS5Z07KxM1uSCuE2kuA4PYOY92
   D4+LmFiXOLbKxm8T8f9zcB3N4k26IupZAisw3gtADft13WQuMbb/pvT5X
   tLN1tqDSqpANp4bUzZt8lAJGc9dhWft003sEdatzaS6OfknxHv2t2uIOU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364754225"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="364754225"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 14:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="983858664"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="983858664"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2023 14:30:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZHug-0002yG-1O;
	Thu, 24 Aug 2023 21:30:46 +0000
Date: Fri, 25 Aug 2023 05:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:for-6.7/work 152/155]
 drivers/thermal/tegra/soctherm.c:516: warning: Function parameter or member
 'tegra' not described in 'throttrip_program'
Message-ID: <202308250529.9Qz85Bog-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thierryreding/linux for-6.7/work
head:   d2d040e9f9638cb9ba406431a2ba176047d4bdc7
commit: 45172c0ac7063d980e192ee5d6939cb903560551 [152/155] WIP
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230825/202308250529.9Qz85Bog-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250529.9Qz85Bog-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250529.9Qz85Bog-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/tegra/soctherm.c:451: warning: Function parameter or member 'ts' not described in 'enforce_temp_range'
   drivers/thermal/tegra/soctherm.c:451: warning: Excess function parameter 'dev' description in 'enforce_temp_range'
   drivers/thermal/tegra/soctherm.c:481: warning: Function parameter or member 'ts' not described in 'thermtrip_program'
   drivers/thermal/tegra/soctherm.c:481: warning: Excess function parameter 'dev' description in 'thermtrip_program'
>> drivers/thermal/tegra/soctherm.c:516: warning: Function parameter or member 'tegra' not described in 'throttrip_program'
>> drivers/thermal/tegra/soctherm.c:516: warning: Excess function parameter 'ts' description in 'throttrip_program'


vim +516 drivers/thermal/tegra/soctherm.c

2a895871f27fdc Wei Ni         2016-03-29  498  
ce0dbf04f685d4 Wei Ni         2016-05-11  499  /**
ce0dbf04f685d4 Wei Ni         2016-05-11  500   * throttrip_program() - Configures the hardware to throttle the
ce0dbf04f685d4 Wei Ni         2016-05-11  501   * pulse if a given sensor group reaches a given temperature
6b6ef223f3b050 Thierry Reding 2023-02-13  502   * @ts: pointer to a struct tegra_soctherm
ce0dbf04f685d4 Wei Ni         2016-05-11  503   * @stc: pointer to the throttle need to be triggered
ce0dbf04f685d4 Wei Ni         2016-05-11  504   *
ce0dbf04f685d4 Wei Ni         2016-05-11  505   * Sets the thermal trip threshold and throttle event of the given sensor
ce0dbf04f685d4 Wei Ni         2016-05-11  506   * group. If this threshold is crossed, the hardware will trigger the
ce0dbf04f685d4 Wei Ni         2016-05-11  507   * throttle.
ce0dbf04f685d4 Wei Ni         2016-05-11  508   *
ce0dbf04f685d4 Wei Ni         2016-05-11  509   * Note that, although @trip_temp is specified in millicelsius, the
ce0dbf04f685d4 Wei Ni         2016-05-11  510   * hardware is programmed in degrees Celsius.
ce0dbf04f685d4 Wei Ni         2016-05-11  511   *
ce0dbf04f685d4 Wei Ni         2016-05-11  512   * Return: 0 upon success, or %-EINVAL upon failure.
ce0dbf04f685d4 Wei Ni         2016-05-11  513   */
45172c0ac7063d Thierry Reding 2023-07-21  514  static int throttrip_program(struct tegra_soctherm *tegra,
45172c0ac7063d Thierry Reding 2023-07-21  515  			     struct soctherm_throt_cfg *stc)
ce0dbf04f685d4 Wei Ni         2016-05-11 @516  {
45172c0ac7063d Thierry Reding 2023-07-21  517  	struct tegra_thermctl_zone *zone = NULL;
45172c0ac7063d Thierry Reding 2023-07-21  518  	int high, low, cpu_throt, gpu_throt;
45172c0ac7063d Thierry Reding 2023-07-21  519  	unsigned int throt, i;
ce0dbf04f685d4 Wei Ni         2016-05-11  520  	u32 r, reg_off;
ce0dbf04f685d4 Wei Ni         2016-05-11  521  
45172c0ac7063d Thierry Reding 2023-07-21  522  	for (i = 0; i < tegra->soc->num_ttgs; ++i) {
45172c0ac7063d Thierry Reding 2023-07-21  523  		struct thermal_zone_device *tz = tegra->thermctl_tzs[i];
45172c0ac7063d Thierry Reding 2023-07-21  524  		if (tz->device.of_node == stc->zone) {
45172c0ac7063d Thierry Reding 2023-07-21  525  			zone = thermal_zone_device_priv(tz);
45172c0ac7063d Thierry Reding 2023-07-21  526  			break;
45172c0ac7063d Thierry Reding 2023-07-21  527  		}
45172c0ac7063d Thierry Reding 2023-07-21  528  	}
ce0dbf04f685d4 Wei Ni         2016-05-11  529  
45172c0ac7063d Thierry Reding 2023-07-21  530  	if (!zone)
45172c0ac7063d Thierry Reding 2023-07-21  531  		return 0;
45172c0ac7063d Thierry Reding 2023-07-21  532  
45172c0ac7063d Thierry Reding 2023-07-21  533  	high = enforce_temp_range(tegra, stc->temperature);
45172c0ac7063d Thierry Reding 2023-07-21  534  	high /= tegra->soc->thresh_grain;
45172c0ac7063d Thierry Reding 2023-07-21  535  	low = enforce_temp_range(tegra, stc->temperature - stc->hysteresis);
45172c0ac7063d Thierry Reding 2023-07-21  536  	low /= tegra->soc->thresh_grain;
ce0dbf04f685d4 Wei Ni         2016-05-11  537  
ce0dbf04f685d4 Wei Ni         2016-05-11  538  	/* Hardcode LIGHT on LEVEL1 and HEAVY on LEVEL2 */
ce0dbf04f685d4 Wei Ni         2016-05-11  539  	throt = stc->id;
45172c0ac7063d Thierry Reding 2023-07-21  540  	reg_off = THERMCTL_LVL_REG(zone->sg->thermctl_lvl0_offset, throt + 1);
ce0dbf04f685d4 Wei Ni         2016-05-11  541  
ce0dbf04f685d4 Wei Ni         2016-05-11  542  	if (throt == THROTTLE_LIGHT) {
ce0dbf04f685d4 Wei Ni         2016-05-11  543  		cpu_throt = THERMCTL_LVL0_CPU0_CPU_THROT_LIGHT;
ce0dbf04f685d4 Wei Ni         2016-05-11  544  		gpu_throt = THERMCTL_LVL0_CPU0_GPU_THROT_LIGHT;
ce0dbf04f685d4 Wei Ni         2016-05-11  545  	} else {
ce0dbf04f685d4 Wei Ni         2016-05-11  546  		cpu_throt = THERMCTL_LVL0_CPU0_CPU_THROT_HEAVY;
ce0dbf04f685d4 Wei Ni         2016-05-11  547  		gpu_throt = THERMCTL_LVL0_CPU0_GPU_THROT_HEAVY;
ce0dbf04f685d4 Wei Ni         2016-05-11  548  		if (throt != THROTTLE_HEAVY)
45172c0ac7063d Thierry Reding 2023-07-21  549  			dev_warn(tegra->dev,
ce0dbf04f685d4 Wei Ni         2016-05-11  550  				 "invalid throt id %d - assuming HEAVY",
ce0dbf04f685d4 Wei Ni         2016-05-11  551  				 throt);
ce0dbf04f685d4 Wei Ni         2016-05-11  552  	}
ce0dbf04f685d4 Wei Ni         2016-05-11  553  
45172c0ac7063d Thierry Reding 2023-07-21  554  	r = readl(tegra->regs + reg_off);
45172c0ac7063d Thierry Reding 2023-07-21  555  	r = REG_SET_MASK(r, zone->sg->thermctl_lvl0_up_thresh_mask, high);
45172c0ac7063d Thierry Reding 2023-07-21  556  	r = REG_SET_MASK(r, zone->sg->thermctl_lvl0_dn_thresh_mask, low);
ce0dbf04f685d4 Wei Ni         2016-05-11  557  	r = REG_SET_MASK(r, THERMCTL_LVL0_CPU0_CPU_THROT_MASK, cpu_throt);
ce0dbf04f685d4 Wei Ni         2016-05-11  558  	r = REG_SET_MASK(r, THERMCTL_LVL0_CPU0_GPU_THROT_MASK, gpu_throt);
ce0dbf04f685d4 Wei Ni         2016-05-11  559  	r = REG_SET_MASK(r, THERMCTL_LVL0_CPU0_EN_MASK, 1);
45172c0ac7063d Thierry Reding 2023-07-21  560  	writel(r, tegra->regs + reg_off);
ce0dbf04f685d4 Wei Ni         2016-05-11  561  
ce0dbf04f685d4 Wei Ni         2016-05-11  562  	return 0;
ce0dbf04f685d4 Wei Ni         2016-05-11  563  }
ce0dbf04f685d4 Wei Ni         2016-05-11  564  

:::::: The code at line 516 was first introduced by commit
:::::: ce0dbf04f685d48ffdec64a17ebb4965f828c3ff thermal: tegra: add hw-throttle function

:::::: TO: Wei Ni <wni@nvidia.com>
:::::: CC: Zhang Rui <rui.zhang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
