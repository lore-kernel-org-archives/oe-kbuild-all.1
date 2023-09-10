Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418D710E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 02:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694313860; x=1725849860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BBrB4C8WENENbT69vmFWNvN4pRGJ44rD3Si2Hq7lPW4=;
  b=G3hjru6bz27H5B+PSGiiuWyds1QSNF3tgrp0ajoVBjbNTnCTRZoqWIt8
   QREOYQdz5lHvobqBr3UiFATbm5M+H2jM0f+vgr0M9yK6yHUuoLak4bG8m
   ZBgFkKYpnxIjJod5+al9a9I6eEUGhrk5YbD9z4O71J2UCbgGS6kJhVnDF
   78mAtzHOizPE7MlQccNsbNfvyEKVAmOMj4ys9SGVTFEL+FjjidUSw5lsn
   UdLYsAZvCO0hM1jRwFDYBHzSXA4dimNcWldZPK++JaW36+EmWljWqu+o8
   0JgHAse95XoWOWaCwgieHUxycw5GXEjTRRFxKU0v7qGmFUzEUnJg2Yjrw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="375232555"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="375232555"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 19:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="772166798"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="772166798"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Sep 2023 19:44:17 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfAQo-0004Fs-38;
	Sun, 10 Sep 2023 02:44:14 +0000
Date: Sun, 10 Sep 2023 10:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/opp/core.c:2304: warning: Function parameter or member
 'opp_table' not described in '_opp_set_config_regulators_helper'
Message-ID: <202309101018.J5Y4Fs3E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a3c57ab79a06e333a869ae340420cb3c6f5921d3
commit: aee3352f6ecf8cfad1f1ee5838cfc4d37c6b8f75 OPP: Add support for config_regulators() helper
date:   1 year, 2 months ago
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230910/202309101018.J5Y4Fs3E-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309101018.J5Y4Fs3E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309101018.J5Y4Fs3E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/opp/core.c:1989: warning: Function parameter or member 'opp_table' not described in '_opp_set_supported_hw'
   drivers/opp/core.c:1989: warning: Excess function parameter 'dev' description in '_opp_set_supported_hw'
   drivers/opp/core.c:2032: warning: Function parameter or member 'opp_table' not described in '_opp_set_prop_name'
   drivers/opp/core.c:2032: warning: Excess function parameter 'dev' description in '_opp_set_prop_name'
   drivers/opp/core.c:2073: warning: Function parameter or member 'opp_table' not described in '_opp_set_regulators'
   drivers/opp/core.c:2073: warning: Excess function parameter 'count' description in '_opp_set_regulators'
   drivers/opp/core.c:2186: warning: Function parameter or member 'opp_table' not described in '_opp_set_clknames'
   drivers/opp/core.c:2250: warning: Function parameter or member 'opp_table' not described in '_opp_register_set_opp_helper'
>> drivers/opp/core.c:2304: warning: Function parameter or member 'opp_table' not described in '_opp_set_config_regulators_helper'
   drivers/opp/core.c:2368: warning: Function parameter or member 'opp_table' not described in '_opp_attach_genpd'
   drivers/opp/core.c:2602: warning: Function parameter or member 'token' not described in 'dev_pm_opp_clear_config'
   drivers/opp/core.c:2602: warning: Excess function parameter 'opp_table' description in 'dev_pm_opp_clear_config'


vim +2304 drivers/opp/core.c

  2292	
  2293	/**
  2294	 * _opp_set_config_regulators_helper() - Register custom set regulator helper.
  2295	 * @dev: Device for which the helper is getting registered.
  2296	 * @config_regulators: Custom set regulator helper.
  2297	 *
  2298	 * This is useful to support platforms with multiple regulators per device.
  2299	 *
  2300	 * This must be called before any OPPs are initialized for the device.
  2301	 */
  2302	static int _opp_set_config_regulators_helper(struct opp_table *opp_table,
  2303			struct device *dev, config_regulators_t config_regulators)
> 2304	{
  2305		/* Another CPU that shares the OPP table has set the helper ? */
  2306		if (!opp_table->config_regulators)
  2307			opp_table->config_regulators = config_regulators;
  2308	
  2309		return 0;
  2310	}
  2311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
