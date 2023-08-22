Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F128F64
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692714906; x=1724250906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UjGDfugucju2TvJYov+DRdvF/bBRC4SckSZc9SMW8lE=;
  b=lxnbMzFDSOoAcGS8wHN4i52NGpLmeWr+pH23p5UUK1Ej2XGAFxuu546J
   sK6+1yxdk4/qYfZMRyuaJBXZmeidq3ZCANHZB1eK1GpGBSF0qHHANo+8x
   DReDL1pnhvQzoHtKhoH7XvL4qs+uqbFl1sVJd5mtxEotEKvlF1edAMpzT
   lcxCJ0OsL2UU1OsuFs2pVMpsH0mo8Ota3fP5OcdRA2QAB1S8X4P/E5GKq
   e0v2ZOFroQmNvYhFG1tNruE1Jr+8Qyb7t17I/gGF626pXXvZCwuajJesI
   nzkEvoeHLHbOKgD3WQ38Qw++KGLwcDYEURLMLy8j7YN4/Ur7NwyeNaWI6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437819090"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="437819090"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 07:35:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="801698695"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="801698695"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2023 07:35:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYSTE-0000Fa-0H;
	Tue, 22 Aug 2023 14:35:00 +0000
Date: Tue, 22 Aug 2023 22:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14244/30000]
 drivers/thermal/of-thermal.c:122: warning: Function parameter or member
 'num_sensors' not described in 'virtual_sensor'
Message-ID: <202308222231.LhP29sNG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   ef983429ea2180ce7f3b17f1c8f5bff8ae61c1fa
commit: 3b10834869b8101f6339f3d3acb18643477dca6f [14244/30000] ANDROID: GKI: Add devm_thermal_of_virtual_sensor_register API.
config: x86_64-randconfig-002-20230822 (https://download.01.org/0day-ci/archive/20230822/202308222231.LhP29sNG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308222231.LhP29sNG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308222231.LhP29sNG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/of-thermal.c:122: warning: Function parameter or member 'num_sensors' not described in 'virtual_sensor'
>> drivers/thermal/of-thermal.c:122: warning: Function parameter or member 'tz' not described in 'virtual_sensor'
>> drivers/thermal/of-thermal.c:122: warning: Function parameter or member 'virt_tz' not described in 'virtual_sensor'
>> drivers/thermal/of-thermal.c:122: warning: Function parameter or member 'logic' not described in 'virtual_sensor'
>> drivers/thermal/of-thermal.c:122: warning: Function parameter or member 'last_reading' not described in 'virtual_sensor'
>> drivers/thermal/of-thermal.c:122: warning: Function parameter or member 'coefficients' not described in 'virtual_sensor'
>> drivers/thermal/of-thermal.c:122: warning: Function parameter or member 'avg_offset' not described in 'virtual_sensor'
>> drivers/thermal/of-thermal.c:122: warning: Function parameter or member 'avg_denominator' not described in 'virtual_sensor'
   drivers/thermal/of-thermal.c:964: warning: cannot understand function prototype: 'const char * const trip_types[] = '


vim +122 drivers/thermal/of-thermal.c

3b10834869b810 Ram Chandrasekar 2017-03-03   97  
3b10834869b810 Ram Chandrasekar 2017-03-03   98  /**
3b10834869b810 Ram Chandrasekar 2017-03-03   99   * struct virtual_sensor - internal representation of a virtual thermal zone
3b10834869b810 Ram Chandrasekar 2017-03-03  100   * @num_sensors - number of sensors this virtual sensor will reference to
3b10834869b810 Ram Chandrasekar 2017-03-03  101   *		  estimate temperature
3b10834869b810 Ram Chandrasekar 2017-03-03  102   * @tz - Array of thermal zones of the sensors this virtual sensor will use
3b10834869b810 Ram Chandrasekar 2017-03-03  103   *	 to estimate temperature
3b10834869b810 Ram Chandrasekar 2017-03-03  104   * @virt_tz - Virtual thermal zone pointer
3b10834869b810 Ram Chandrasekar 2017-03-03  105   * @logic - aggregation logic to be used to estimate the temperature
3b10834869b810 Ram Chandrasekar 2017-03-03  106   * @last_reading - last estimated temperature
3b10834869b810 Ram Chandrasekar 2017-03-03  107   * @coefficients - array of coefficients to be used for weighted aggregation
3b10834869b810 Ram Chandrasekar 2017-03-03  108   *		       logic
3b10834869b810 Ram Chandrasekar 2017-03-03  109   * @avg_offset - offset value to be used for the weighted aggregation logic
3b10834869b810 Ram Chandrasekar 2017-03-03  110   * @avg_denominator - denominator value to be used for the weighted aggregation
3b10834869b810 Ram Chandrasekar 2017-03-03  111   *			logic
3b10834869b810 Ram Chandrasekar 2017-03-03  112   */
3b10834869b810 Ram Chandrasekar 2017-03-03  113  struct virtual_sensor {
3b10834869b810 Ram Chandrasekar 2017-03-03  114  	int                        num_sensors;
3b10834869b810 Ram Chandrasekar 2017-03-03  115  	struct thermal_zone_device *tz[THERMAL_MAX_VIRT_SENSORS];
3b10834869b810 Ram Chandrasekar 2017-03-03  116  	struct thermal_zone_device *virt_tz;
3b10834869b810 Ram Chandrasekar 2017-03-03  117  	enum aggregation_logic     logic;
3b10834869b810 Ram Chandrasekar 2017-03-03  118  	int                        last_reading;
3b10834869b810 Ram Chandrasekar 2017-03-03  119  	int                        coefficients[THERMAL_MAX_VIRT_SENSORS];
3b10834869b810 Ram Chandrasekar 2017-03-03  120  	int                        avg_offset;
3b10834869b810 Ram Chandrasekar 2017-03-03  121  	int                        avg_denominator;
4e5e4705bf69ea Eduardo Valentin 2013-07-03 @122  };
4e5e4705bf69ea Eduardo Valentin 2013-07-03  123  
3b10834869b810 Ram Chandrasekar 2017-03-03  124  

:::::: The code at line 122 was first introduced by commit
:::::: 4e5e4705bf69ea450f58fc709ac5888f321a9299 thermal: introduce device tree parser

:::::: TO: Eduardo Valentin <eduardo.valentin@ti.com>
:::::: CC: Eduardo Valentin <eduardo.valentin@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
