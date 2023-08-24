Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20C17F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 20:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692910150; x=1724446150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=frEczVeYMq0Xa4hA/XNQ2FI+YRH3aai/6BczHjKVrOs=;
  b=O+lpsebifLSHIIhGGfYEyTg8pV0iJ6z0YhSyNAj3AjlGV5PeDoO1ZPu1
   DcbfbtybSd9QmemqR7A8RS8HrjMVAQ1vckpB1W42Q5MO899lPwa/z9EZq
   /xXjv2Vp6r+oD+72UHODmqpqVB7Eln/sJgqqzk6koxbpPrNqIM6gaMLsO
   ohOv9rdX+Ftfu2bwt2D7xNan90yTxNGxm08xdfu7TmqOBLI6iWarYB49x
   QNKInFohJbP7E8JUBv2SPa2hyN3/oHLVqo0/raWJlYusPi0DNWls8Mm/S
   A7W1xzjUcSV4MDRRojAk3nANbt2ZTKLCMZKs+VC3uptBDx8DnaUd8/bVB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="371955933"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="371955933"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 13:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="730785939"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="730785939"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 24 Aug 2023 13:49:06 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZHGL-0002xQ-16;
	Thu, 24 Aug 2023 20:49:05 +0000
Date: Fri, 25 Aug 2023 04:48:26 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:for-6.7/work 111/155]
 drivers/thermal/tegra/soctherm.c:448: warning: Function parameter or member
 'ts' not described in 'enforce_temp_range'
Message-ID: <202308250408.rbfOa3s7-lkp@intel.com>
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
commit: 6b6ef223f3b0501cfd3246228c7129cb3ca17ef0 [111/155] thermal: tegra: Use driver-private data consistently
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230825/202308250408.rbfOa3s7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250408.rbfOa3s7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250408.rbfOa3s7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/tegra/soctherm.c:448: warning: Function parameter or member 'ts' not described in 'enforce_temp_range'
>> drivers/thermal/tegra/soctherm.c:448: warning: Excess function parameter 'dev' description in 'enforce_temp_range'
>> drivers/thermal/tegra/soctherm.c:478: warning: Function parameter or member 'ts' not described in 'thermtrip_program'
>> drivers/thermal/tegra/soctherm.c:478: warning: Excess function parameter 'dev' description in 'thermtrip_program'
   drivers/thermal/tegra/soctherm.c:735: warning: Function parameter or member 'ts' not described in 'tegra_soctherm_set_hwtrips'
   drivers/thermal/tegra/soctherm.c:735: warning: Excess function parameter 'dev' description in 'tegra_soctherm_set_hwtrips'


vim +448 drivers/thermal/tegra/soctherm.c

65b6d57c24ed0a Wei Ni         2016-03-29  435  
2a895871f27fdc Wei Ni         2016-03-29  436  /**
2a895871f27fdc Wei Ni         2016-03-29  437   * enforce_temp_range() - check and enforce temperature range [min, max]
6a6d634cd8df10 Amit Kucheria  2019-11-20  438   * @dev: struct device * of the SOC_THERM instance
2a895871f27fdc Wei Ni         2016-03-29  439   * @trip_temp: the trip temperature to check
2a895871f27fdc Wei Ni         2016-03-29  440   *
2a895871f27fdc Wei Ni         2016-03-29  441   * Checks and enforces the permitted temperature range that SOC_THERM
2a895871f27fdc Wei Ni         2016-03-29  442   * HW can support This is
2a895871f27fdc Wei Ni         2016-03-29  443   * done while taking care of precision.
2a895871f27fdc Wei Ni         2016-03-29  444   *
2a895871f27fdc Wei Ni         2016-03-29  445   * Return: The precision adjusted capped temperature in millicelsius.
2a895871f27fdc Wei Ni         2016-03-29  446   */
6b6ef223f3b050 Thierry Reding 2023-02-13  447  static int enforce_temp_range(struct tegra_soctherm *ts, int trip_temp)
2a895871f27fdc Wei Ni         2016-03-29 @448  {
2a895871f27fdc Wei Ni         2016-03-29  449  	int temp;
2a895871f27fdc Wei Ni         2016-03-29  450  
2a895871f27fdc Wei Ni         2016-03-29  451  	temp = clamp_val(trip_temp, min_low_temp, max_high_temp);
2a895871f27fdc Wei Ni         2016-03-29  452  	if (temp != trip_temp)
6b6ef223f3b050 Thierry Reding 2023-02-13  453  		dev_dbg(ts->dev, "trip temperature %d forced to %d\n",
2a895871f27fdc Wei Ni         2016-03-29  454  			trip_temp, temp);
6b6ef223f3b050 Thierry Reding 2023-02-13  455  
2a895871f27fdc Wei Ni         2016-03-29  456  	return temp;
2a895871f27fdc Wei Ni         2016-03-29  457  }
2a895871f27fdc Wei Ni         2016-03-29  458  
2a895871f27fdc Wei Ni         2016-03-29  459  /**
2a895871f27fdc Wei Ni         2016-03-29  460   * thermtrip_program() - Configures the hardware to shut down the
2a895871f27fdc Wei Ni         2016-03-29  461   * system if a given sensor group reaches a given temperature
2a895871f27fdc Wei Ni         2016-03-29  462   * @dev: ptr to the struct device for the SOC_THERM IP block
2a895871f27fdc Wei Ni         2016-03-29  463   * @sg: pointer to the sensor group to set the thermtrip temperature for
2a895871f27fdc Wei Ni         2016-03-29  464   * @trip_temp: the temperature in millicelsius to trigger the thermal trip at
2a895871f27fdc Wei Ni         2016-03-29  465   *
2a895871f27fdc Wei Ni         2016-03-29  466   * Sets the thermal trip threshold of the given sensor group to be the
2a895871f27fdc Wei Ni         2016-03-29  467   * @trip_temp.  If this threshold is crossed, the hardware will shut
2a895871f27fdc Wei Ni         2016-03-29  468   * down.
2a895871f27fdc Wei Ni         2016-03-29  469   *
2a895871f27fdc Wei Ni         2016-03-29  470   * Note that, although @trip_temp is specified in millicelsius, the
2a895871f27fdc Wei Ni         2016-03-29  471   * hardware is programmed in degrees Celsius.
2a895871f27fdc Wei Ni         2016-03-29  472   *
2a895871f27fdc Wei Ni         2016-03-29  473   * Return: 0 upon success, or %-EINVAL upon failure.
2a895871f27fdc Wei Ni         2016-03-29  474   */
6b6ef223f3b050 Thierry Reding 2023-02-13  475  static int thermtrip_program(struct tegra_soctherm *ts,
2a895871f27fdc Wei Ni         2016-03-29  476  			     const struct tegra_tsensor_group *sg,
2a895871f27fdc Wei Ni         2016-03-29  477  			     int trip_temp)
2a895871f27fdc Wei Ni         2016-03-29 @478  {
2a895871f27fdc Wei Ni         2016-03-29  479  	int temp;
2a895871f27fdc Wei Ni         2016-03-29  480  	u32 r;
2a895871f27fdc Wei Ni         2016-03-29  481  
f350098070e36e Wei Ni         2016-04-06  482  	if (!sg || !sg->thermtrip_threshold_mask)
2a895871f27fdc Wei Ni         2016-03-29  483  		return -EINVAL;
2a895871f27fdc Wei Ni         2016-03-29  484  
6b6ef223f3b050 Thierry Reding 2023-02-13  485  	temp = enforce_temp_range(ts, trip_temp) / ts->soc->thresh_grain;
2a895871f27fdc Wei Ni         2016-03-29  486  
2a895871f27fdc Wei Ni         2016-03-29  487  	r = readl(ts->regs + THERMCTL_THERMTRIP_CTL);
2a895871f27fdc Wei Ni         2016-03-29  488  	r = REG_SET_MASK(r, sg->thermtrip_threshold_mask, temp);
2a895871f27fdc Wei Ni         2016-03-29  489  	r = REG_SET_MASK(r, sg->thermtrip_enable_mask, 1);
2a895871f27fdc Wei Ni         2016-03-29  490  	r = REG_SET_MASK(r, sg->thermtrip_any_en_mask, 0);
2a895871f27fdc Wei Ni         2016-03-29  491  	writel(r, ts->regs + THERMCTL_THERMTRIP_CTL);
2a895871f27fdc Wei Ni         2016-03-29  492  
2a895871f27fdc Wei Ni         2016-03-29  493  	return 0;
2a895871f27fdc Wei Ni         2016-03-29  494  }
2a895871f27fdc Wei Ni         2016-03-29  495  

:::::: The code at line 448 was first introduced by commit
:::::: 2a895871f27fdc82ac7b365d3f94e2c7b3467898 thermal: tegra: add thermtrip function

:::::: TO: Wei Ni <wni@nvidia.com>
:::::: CC: Eduardo Valentin <edubezval@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
