Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA09219539
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 16:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687364236; x=1718900236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rxKRee1PvgvFVbzPPQZHgcw3OZcbiMAAqPT/0q5+tqg=;
  b=ZuiQuxR7n6A4jB0MlTU+BgzgPCF8U9wDeEExGIIZ+mRCC/2z2eCNKbmY
   rvaMyqyzev6ymG3n9R/DN3SggWZy/37NTBzFzm/NPouYcy5mmGMKTvqIf
   UJvBnLfnHrhZ4oyJjyf4LFVcWHND4ReGGGU15nqXJWOmjLJNuVM2BfAho
   HFxsd2A2Esi0tWu//cur5iOrV/tJm+V1sS4CHgpyxKnro9jU/h1ZfZXK7
   coHRErCu8fm4+WRgdkzex/Q9HIBO8rUm4cAu6YM4xpLt6TiLMGo3HS68D
   S5bQebGppfus8j2Ffy+4UwSj9Omh++9IEYEGwQ00zr2LPTH1SpKZsGM1t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="362766058"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="362766058"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 09:17:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="784538111"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="784538111"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2023 09:17:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC0W7-0006w7-1K;
	Wed, 21 Jun 2023 16:17:11 +0000
Date: Thu, 22 Jun 2023 00:16:55 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 4/4] PM: domains: Add and set generic sync state
 callback
Message-ID: <202306220007.ZM9y9ygo-lkp@intel.com>
References: <20230621144019.3219858-5-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621144019.3219858-5-abel.vesa@linaro.org>

Hi Abel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master v6.4-rc7 next-20230621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/driver-core-Add-dev_set_drv_sync_state/20230621-224109
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230621144019.3219858-5-abel.vesa%40linaro.org
patch subject: [RFC PATCH v5 4/4] PM: domains: Add and set generic sync state callback
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230622/202306220007.ZM9y9ygo-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220007.ZM9y9ygo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220007.ZM9y9ygo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain.c:664:6: warning: no previous prototype for 'pm_genpd_power_off_unused_sync_state' [-Wmissing-prototypes]
     664 | void pm_genpd_power_off_unused_sync_state(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pm_genpd_power_off_unused_sync_state +664 drivers/base/power/domain.c

   656	
   657	/**
   658	 * pm_genpd_power_off_unused_sync_state - Power off all domains for provider.
   659	 * @dev: Provider's device.
   660	 *
   661	 * Request power off for all unused domains of the provider.
   662	 * This should be used exclusively as sync state callback for genpd providers.
   663	 */
 > 664	void pm_genpd_power_off_unused_sync_state(struct device *dev)
   665	{
   666		struct generic_pm_domain *genpd;
   667	
   668		mutex_lock(&gpd_list_lock);
   669	
   670		list_for_each_entry(genpd, &gpd_list, gpd_list_node)
   671			if (genpd->provider && genpd->provider->dev == dev)
   672				genpd_queue_power_off_work(genpd);
   673	
   674		mutex_unlock(&gpd_list_lock);
   675	}
   676	EXPORT_SYMBOL_GPL(pm_genpd_power_off_unused_sync_state);
   677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
