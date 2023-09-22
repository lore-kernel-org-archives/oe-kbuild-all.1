Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64A544483
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 18:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695405916; x=1726941916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+/1bWZUy5yZskQHG2u0RjCi50nIjJttLAo1RPvpWxrY=;
  b=LRoAT634jmhf+wTstiTjJJm7jP7SXKrSrDwuPd3uVgS19t4O6umHZ10o
   B9nuObB+JEwqFotSGn8xXrJaMQsvwLxUobIF5kjOeEphtirIHYcEQEaRs
   FgS9EFJaSdvU6Y0Tp1OfnnHonrCjuouBIKJgbxmRdh601hELD3fyg53Tk
   3fD1NhJnciGxY1K0f6PrjVPnR7fGBzZnT60vFv3g3Z8sXn6q4vrojSfC0
   FRsZPWE93XJI7iZ30kQxs6yRqvFQbdZ1YrhCBmHEtZ/h2GSjOMEz7jKGS
   m//0gINdtmufEJKF1VrDkcxKVYd2RqpyYAB6TE9PF+sSPG4JCBIqQVFI5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="411836686"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="411836686"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 11:05:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="747616238"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="747616238"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 22 Sep 2023 11:05:14 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjkWe-00017R-0z;
	Fri, 22 Sep 2023 18:05:12 +0000
Date: Sat, 23 Sep 2023 02:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/opp/core.c:2304: warning: Function parameter or member
 'opp_table' not described in '_opp_set_config_regulators_helper'
Message-ID: <202309230220.2XPQXigR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Viresh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc912ba91b7e2fa74650a0fc22cccf0e0d50f371
commit: aee3352f6ecf8cfad1f1ee5838cfc4d37c6b8f75 OPP: Add support for config_regulators() helper
date:   1 year, 3 months ago
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230923/202309230220.2XPQXigR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309230220.2XPQXigR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309230220.2XPQXigR-lkp@intel.com/

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
