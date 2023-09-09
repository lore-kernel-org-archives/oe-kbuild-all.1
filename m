Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDBE1861
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 10:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694256613; x=1725792613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jBF9UUw92i6Jdvyg4+vrgTVAmTYw3v8TbaMzVFJhzLo=;
  b=Rtk+qzplhU40vWHnQc+d4z4yRr2ggvYRsj2sbMMiRoiB5GHH8Mf5fb4v
   leH69xEsG6/26HO8xVILbE3aYQcFLTevcYhHRAlen828SpjBiWBmoid3l
   wZMIHg778GoIyg6FrvC38BYQkTZfH82NdgY5A94C881k1/OKAEB+hQKMm
   vtkO4vHP5wKiCzdm2/FLwl7ueWhh3/aJ1BNgp1/kCRv+XRoR31RSQ+0Z5
   xt05hL5mGKpMyvXTNX8lcybFDs5k1aFOB2eAOsuzpQuWg4J6eOXrVDIwL
   xfY5I+mMHVwUeI3CQV+9AdM+uha1mMeOoSTWYO4NLwvU7iEXEsr1qdDuz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464182910"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="464182910"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 03:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="772024262"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="772024262"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Sep 2023 03:50:10 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qevXT-0003Km-2U;
	Sat, 09 Sep 2023 10:50:07 +0000
Date: Sat, 9 Sep 2023 18:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/opp/core.c:1967: warning: Function parameter or member
 'opp_table' not described in '_opp_set_supported_hw'
Message-ID: <202309091848.KgU5T4Kb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6099776f9f268e61fe5ecd721f994a8cfce5306f
commit: 89f03984fa2abface1ffb1fe050b7c175651ffc7 OPP: Migrate set-supported-hw API to use set-config helpers
date:   1 year, 2 months ago
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230909/202309091848.KgU5T4Kb-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091848.KgU5T4Kb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091848.KgU5T4Kb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/opp/core.c:1967: warning: Function parameter or member 'opp_table' not described in '_opp_set_supported_hw'
>> drivers/opp/core.c:1967: warning: Excess function parameter 'dev' description in '_opp_set_supported_hw'
   drivers/opp/core.c:2068: warning: Function parameter or member 'opp_table' not described in '_opp_set_regulators'
   drivers/opp/core.c:2068: warning: Excess function parameter 'count' description in '_opp_set_regulators'
   drivers/opp/core.c:2709: warning: Function parameter or member 'token' not described in 'dev_pm_opp_clear_config'
   drivers/opp/core.c:2709: warning: Excess function parameter 'opp_table' description in 'dev_pm_opp_clear_config'


vim +1967 drivers/opp/core.c

38393409da345c drivers/base/power/opp.c      Viresh Kumar 2014-11-25  1953  
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1954  /**
89f03984fa2abf drivers/opp/core.c            Viresh Kumar 2022-05-26  1955   * _opp_set_supported_hw() - Set supported platforms
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1956   * @dev: Device for which supported-hw has to be set.
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1957   * @versions: Array of hierarchy of versions to match.
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1958   * @count: Number of elements in the array.
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1959   *
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1960   * This is required only for the V2 bindings, and it enables a platform to
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1961   * specify the hierarchy of versions it supports. OPP layer will then enable
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1962   * OPPs, which are available for those versions, based on its 'opp-supported-hw'
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1963   * property.
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1964   */
89f03984fa2abf drivers/opp/core.c            Viresh Kumar 2022-05-26  1965  static int _opp_set_supported_hw(struct opp_table *opp_table,
fa30184d192ec7 drivers/base/power/opp/core.c Viresh Kumar 2017-01-23  1966  				 const u32 *versions, unsigned int count)
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09 @1967  {
25419de1b8dda2 drivers/opp/core.c            Viresh Kumar 2018-05-22  1968  	/* Another CPU that shares the OPP table has set the property ? */
25419de1b8dda2 drivers/opp/core.c            Viresh Kumar 2018-05-22  1969  	if (opp_table->supported_hw)
89f03984fa2abf drivers/opp/core.c            Viresh Kumar 2022-05-26  1970  		return 0;
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1971  
2c2709dc6921c5 drivers/base/power/opp/core.c Viresh Kumar 2016-02-16  1972  	opp_table->supported_hw = kmemdup(versions, count * sizeof(*versions),
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1973  					GFP_KERNEL);
89f03984fa2abf drivers/opp/core.c            Viresh Kumar 2022-05-26  1974  	if (!opp_table->supported_hw)
89f03984fa2abf drivers/opp/core.c            Viresh Kumar 2022-05-26  1975  		return -ENOMEM;
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1976  
2c2709dc6921c5 drivers/base/power/opp/core.c Viresh Kumar 2016-02-16  1977  	opp_table->supported_hw_count = count;
fa30184d192ec7 drivers/base/power/opp/core.c Viresh Kumar 2017-01-23  1978  
89f03984fa2abf drivers/opp/core.c            Viresh Kumar 2022-05-26  1979  	return 0;
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1980  }
7de36b0aa51a5a drivers/base/power/opp/core.c Viresh Kumar 2015-12-09  1981  

:::::: The code at line 1967 was first introduced by commit
:::::: 7de36b0aa51a5a59e28fb2da768fa3ab07de0674 PM / OPP: Parse 'opp-supported-hw' binding

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
