Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF0B3C6A7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 22:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8SGc5K5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699654255; x=1731190255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eswIQnfQCtcPAOIAbrWXzdAilxWlzMo85n+b4SMSmEU=;
  b=J8SGc5K5b/PLAcmcFHjrqaBXXCZZP9xhYXpGvkbpphLlskfxBe9hZbyc
   3F3lDkOjXRwrt+5iRlxqV3yUDmE4HPvpFHskhkS30hGFK66I/B1raf4cd
   4JH3Z6p9bSP8QoQWsRSXPxnNBset4Zy5FDW7jKLnKlqweZ3OqwDrD5Eje
   yzeyWAlRbLgpmnex6FS5mZpslmSN1HpLF+C33q2o/FwGSdAhjOZTjHfcJ
   doZ2x4wKz5ofbO+wcVjeCDfYXXYHK5D7+mKmeCl1d1IbbcsqscQug08zO
   /a1GvxsEAkfvQh8STeyCiLs6nO5pI2gC/sjvIsanQx8iJxm3da9OgTzh1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="375269783"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="375269783"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 14:10:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="757302029"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="757302029"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Nov 2023 14:10:54 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ZiF-0009xW-3D;
	Fri, 10 Nov 2023 22:10:52 +0000
Date: Sat, 11 Nov 2023 06:10:15 +0800
From: kernel test robot <lkp@intel.com>
To: Joy Chakraborty <joychakr@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] PM: runtime: Apply pinctrl settings if defined
Message-ID: <202311110544.WwrXSaQG-lkp@intel.com>
References: <20231110102054.1393570-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110102054.1393570-1-joychakr@google.com>

Hi Joy,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus rafael-pm/linux-next rafael-pm/acpi-bus linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.6 next-20231110]
[cannot apply to rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joy-Chakraborty/PM-runtime-Apply-pinctrl-settings-if-defined/20231111-015438
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231110102054.1393570-1-joychakr%40google.com
patch subject: [RFC PATCH] PM: runtime: Apply pinctrl settings if defined
config: csky-randconfig-002-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110544.WwrXSaQG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110544.WwrXSaQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110544.WwrXSaQG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/pinctrl.c:113: warning: Function parameter or member 'dev' not described in 'pinctrl_state_try_default'
>> drivers/base/pinctrl.c:123: warning: Function parameter or member 'dev' not described in 'pinctrl_state_try_idle'
>> drivers/base/pinctrl.c:133: warning: Function parameter or member 'dev' not described in 'pinctrl_state_try_sleep'


vim +113 drivers/base/pinctrl.c

   106	
   107	#ifdef CONFIG_PM
   108	/**
   109	 * pinctrl_state_try_default() - Try setting default state if available
   110	 * @dev The device to set pinctrl state
   111	 */
   112	inline void pinctrl_state_try_default(struct device *dev)
 > 113	{
   114		if (dev->pins && !IS_ERR(dev->pins->default_state))
   115			pinctrl_select_state(dev->pins->p, dev->pins->default_state);
   116	}
   117	
   118	/**
   119	 * pinctrl_state_try_idle() - Try setting idle state if available
   120	 * @dev The device to set pinctrl state
   121	 */
   122	inline void pinctrl_state_try_idle(struct device *dev)
 > 123	{
   124		if (dev->pins && !IS_ERR(dev->pins->idle_state))
   125			pinctrl_select_state(dev->pins->p, dev->pins->idle_state);
   126	}
   127	
   128	/**
   129	 * pinctrl_state_try_sleep() - Try setting sleep state if available
   130	 * @dev The device to set pinctrl state
   131	 */
   132	inline void pinctrl_state_try_sleep(struct device *dev)
 > 133	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
