Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1500D17EE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 08:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694246756; x=1725782756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qgclq8CPOgKk8H4kSoQbCWxgSCvCuniQV8vHrOX5+YQ=;
  b=Jxj3W7yfBFFD1RdzW2YZ4MifgNvI28brdzTv8uBdRsq3E5BniqYHsLHr
   oe3MJ3qBIav0waR3oIDd/oovlsZtkqt+o5zCm8wwzYthaK0aWUmQZ409n
   Ltq8HLCojEWVR3R+1XcdKe7GzndKfO+JO7hwBDHG9xeTIGgOKciqUWltM
   pnOf38JYroZU+zf/srHS81OjQAQyKbpDrFnol+tYwimZf6BJUR2049Xch
   mhjiK/LhDvm1a4vpBKgizDlw3cH7qfEyS950KznNsRYvAQSBqOwvb6o6F
   xY4SWWVSgkFUHzLONSt3BxZUBehrrmLkvfV6JY08M7qZmLwALn71ERaxq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="362853635"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="362853635"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 01:05:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="812803563"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="812803563"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Sep 2023 01:05:53 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qesyW-00037i-05;
	Sat, 09 Sep 2023 08:05:52 +0000
Date: Sat, 9 Sep 2023 16:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/opp/core.c:2809: warning: Function parameter or member
 'token' not described in 'dev_pm_opp_clear_config'
Message-ID: <202309091558.x3JJrxFI-lkp@intel.com>
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
commit: 11b9b663585c4f8b00846089ebbca4d1e3283e86 OPP: Add dev_pm_opp_set_config() and friends
date:   1 year, 2 months ago
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230909/202309091558.x3JJrxFI-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091558.x3JJrxFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091558.x3JJrxFI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/opp/core.c:2113: warning: Excess function parameter 'count' description in 'dev_pm_opp_set_regulators'
   drivers/opp/core.c:2251: warning: Excess function parameter 'count' description in 'devm_pm_opp_set_regulators'
>> drivers/opp/core.c:2809: warning: Function parameter or member 'token' not described in 'dev_pm_opp_clear_config'
>> drivers/opp/core.c:2809: warning: Excess function parameter 'opp_table' description in 'dev_pm_opp_clear_config'


vim +2809 drivers/opp/core.c

  2794	
  2795	/**
  2796	 * dev_pm_opp_clear_config() - Releases resources blocked for OPP configuration.
  2797	 * @opp_table: OPP table returned from dev_pm_opp_set_config().
  2798	 *
  2799	 * This allows all device OPP configurations to be cleared at once. This must be
  2800	 * called once for each call made to dev_pm_opp_set_config(), in order to free
  2801	 * the OPPs properly.
  2802	 *
  2803	 * Currently the first call itself ends up freeing all the OPP configurations,
  2804	 * while the later ones only drop the OPP table reference. This works well for
  2805	 * now as we would never want to use an half initialized OPP table and want to
  2806	 * remove the configurations together.
  2807	 */
  2808	void dev_pm_opp_clear_config(int token)
> 2809	{
  2810		struct opp_config_data *data;
  2811	
  2812		/*
  2813		 * This lets the callers call this unconditionally and keep their code
  2814		 * simple.
  2815		 */
  2816		if (unlikely(token <= 0))
  2817			return;
  2818	
  2819		data = xa_erase(&opp_configs, token);
  2820		if (WARN_ON(!data))
  2821			return;
  2822	
  2823		_opp_clear_config(data);
  2824	}
  2825	EXPORT_SYMBOL_GPL(dev_pm_opp_clear_config);
  2826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
