Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB82018C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 21:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692740054; x=1724276054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jFiuc+5ZD8mqAh5S86UOzr7YSQ2lNVgtFtNzA+uNvS0=;
  b=SaEK/Vhk/yQqSBE5JJRLqKwrxizhoWwikdbjnFedYFbGtVXaBJSCPuyz
   4PbaTDJQogW9T+1gRx+Oi7Z/nF9CCnl62T4rrwlu7qCxwHIQV9ZRDoLJU
   v8wZvDQ9f9AikgRCWKw9bqquwySjxOPuebFC8XaUvs7u8/2PoXLB/Aw7Q
   l02w88D5Wgz5PgK96hp58qMWYEhfP7Xw+0mPhhF4/3O160YSB7TMOpBRO
   nIF9W+WGxsjI7V3Oy0xWfrBRRpF3oD1HG70FPUDlKJXCfLxWzzJrQp2PC
   4hI6dHJM2lACBYAfRPZRKQuOR/V9bbxTO0fEq3urPUycUwlqprJGK2UHI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="437932846"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="437932846"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 14:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="1067202911"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="1067202911"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2023 14:34:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYZ0o-0000Xi-1a;
	Tue, 22 Aug 2023 21:34:06 +0000
Date: Wed, 23 Aug 2023 05:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	manivannan.sadhasivam@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, helgaas@kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
	quic_ramkri@quicinc.com, quic_parass@quicinc.com,
	krzysztof.kozlowski@linaro.org,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"(open list:OPERATING PERFORMANCE POINTS (OPP))" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v4 3/4] OPP: Add api to retrieve opps which is at most
 the provided level
Message-ID: <202308230526.RjJmRzFy-lkp@intel.com>
References: <1692717141-32743-4-git-send-email-quic_krichai@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1692717141-32743-4-git-send-email-quic_krichai@quicinc.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/for-linus]
[also build test WARNING on robh/for-next rafael-pm/linux-next linus/master v6.5-rc7 next-20230822]
[cannot apply to pci/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-chaitanya-chundru/dt-bindings-pci-qcom-Add-opp-table/20230822-232104
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
patch link:    https://lore.kernel.org/r/1692717141-32743-4-git-send-email-quic_krichai%40quicinc.com
patch subject: [PATCH v4 3/4] OPP: Add api to retrieve opps which is at most the provided level
config: parisc-randconfig-r081-20230823 (https://download.01.org/0day-ci/archive/20230823/202308230526.RjJmRzFy-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230526.RjJmRzFy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230526.RjJmRzFy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/opp/core.c:756: warning: Function parameter or member 'level' not described in 'dev_pm_opp_find_level_floor'
>> drivers/opp/core.c:756: warning: Excess function parameter 'freq' description in 'dev_pm_opp_find_level_floor'
   drivers/opp/core.c:2025: warning: Function parameter or member 'opp_table' not described in '_opp_set_supported_hw'
   drivers/opp/core.c:2025: warning: Excess function parameter 'dev' description in '_opp_set_supported_hw'
   drivers/opp/core.c:2068: warning: Function parameter or member 'opp_table' not described in '_opp_set_prop_name'
   drivers/opp/core.c:2068: warning: Excess function parameter 'dev' description in '_opp_set_prop_name'
   drivers/opp/core.c:2109: warning: Function parameter or member 'opp_table' not described in '_opp_set_regulators'
   drivers/opp/core.c:2109: warning: Excess function parameter 'count' description in '_opp_set_regulators'
   drivers/opp/core.c:2213: warning: Function parameter or member 'opp_table' not described in '_opp_set_clknames'
   drivers/opp/core.c:2213: warning: Function parameter or member 'config_clks' not described in '_opp_set_clknames'
   drivers/opp/core.c:2311: warning: Function parameter or member 'opp_table' not described in '_opp_set_config_regulators_helper'
   drivers/opp/core.c:2375: warning: Function parameter or member 'opp_table' not described in '_opp_attach_genpd'
   drivers/opp/core.c:2602: warning: Function parameter or member 'token' not described in 'dev_pm_opp_clear_config'
   drivers/opp/core.c:2602: warning: Excess function parameter 'opp_table' description in 'dev_pm_opp_clear_config'


vim +756 drivers/opp/core.c

   734	
   735	
   736	/**
   737	 * dev_pm_opp_find_level_floor() - Search for a rounded floor freq
   738	 * @dev:	device for which we do this operation
   739	 * @freq:	Start level
   740	 *
   741	 * Search for the matching floor *available* OPP from a starting level
   742	 * for a device.
   743	 *
   744	 * Return: matching *opp and refreshes *level accordingly, else returns
   745	 * ERR_PTR in case of error and should be handled using IS_ERR. Error return
   746	 * values can be:
   747	 * EINVAL:	for bad pointer
   748	 * ERANGE:	no match found for search
   749	 * ENODEV:	if device not found in list of registered devices
   750	 *
   751	 * The callers are required to call dev_pm_opp_put() for the returned OPP after
   752	 * use.
   753	 */
   754	struct dev_pm_opp *dev_pm_opp_find_level_floor(struct device *dev,
   755						      unsigned long *level)
 > 756	{
   757		return _find_key_floor(dev, level, 0, true, _read_level, NULL);
   758	}
   759	EXPORT_SYMBOL_GPL(dev_pm_opp_find_level_floor);
   760	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
