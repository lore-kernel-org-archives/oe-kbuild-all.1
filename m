Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2005D908
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 19:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706988986; cv=none; b=c48i8PSeAajkvf9tajWqH7G3ei7/uLkwHLT0jcqds1ASojTSx0/2Uuknp7vlG0Q+K23PacSMhikAyQfctiujHkKEYGY+A4t6xwK/f+mIcA3MfTuII01o8XBY/0C4u3IfaqNqUcXdkFPC9kyFoWXKM/TgqlHKAk4ErKL6P8z8Q70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706988986; c=relaxed/simple;
	bh=lDounSYiwWnUmbRtuGLi7eNQBLXko3Va2IlY8CBMqXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MHvxzUPXZV4sh6hVWCyBCBh+ZTMtc3GQsN1PJTph6FVzIcl5rdpBdHQfJuVhs0Gm4zLRzTUXJtY3nUbNqdz7+eIOTGNTwfysh1CDEiZUwpK9/davKOpvZeYN4z7SOhTtc8YaRToB1nMd3Ftn29tb8buE+bvDHUW5b7E5t44RrRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjNvACv4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjNvACv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706988984; x=1738524984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lDounSYiwWnUmbRtuGLi7eNQBLXko3Va2IlY8CBMqXA=;
  b=DjNvACv4mBXbD4nRdBjpZbRO/784IMnzTNOXV0lH+4d0U6VEDv2/5noH
   749NYTL7Thrf/FODB8u98lr3g5udyRygDLy6Iwr3ZAhIAWt9u7VFhkTGZ
   E9A9m/op5JPf2yJ1q4l5Zp2zy02iPlODMjsBBHOphsTRzZLDHUFQmFyU8
   AZOx01YzFOa1om002ezV9XyEVbofzcCZZrO92Z3E7Nns36feWlS7hTFN9
   S4WqUMNoyuDWacQgr/E7xYpFwJfC8aeg26bQ1l2P13q4FcljxqEpq39/C
   j4mvAyb/zsNREk0oCLJEwv1VgV/5pHaO0/rGZTLRUsBO0QY4dFZU0Eifh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="17750013"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="17750013"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 11:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="31152344"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Feb 2024 11:36:22 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWLoJ-0005Wg-1U;
	Sat, 03 Feb 2024 19:36:19 +0000
Date: Sun, 4 Feb 2024 03:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 19/51]
 drivers/power/reset/odroid-reboot.c:141:17: error: 'arm_pm_restart'
 undeclared; did you mean 'alarm_restart'?
Message-ID: <202402040320.reovXamT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   0ea9759612aba09cc99b50301b281417f70e847c
commit: 5eff876806397ef1a51aafa3cba44aeaaa40475c [19/51] ODROID-COMMON: power:reset: Add odroid support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240204/202402040320.reovXamT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040320.reovXamT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040320.reovXamT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/power/reset/odroid-reboot.c:63:6: warning: no previous prototype for 'odroid_card_reset' [-Wmissing-prototypes]
      63 | void odroid_card_reset(void)
         |      ^~~~~~~~~~~~~~~~~
   drivers/power/reset/odroid-reboot.c: In function 'odroid_restart_probe':
>> drivers/power/reset/odroid-reboot.c:141:17: error: 'arm_pm_restart' undeclared (first use in this function); did you mean 'alarm_restart'?
     141 |                 arm_pm_restart = do_odroid_restart;
         |                 ^~~~~~~~~~~~~~
         |                 alarm_restart
   drivers/power/reset/odroid-reboot.c:141:17: note: each undeclared identifier is reported only once for each function it appears in


vim +141 drivers/power/reset/odroid-reboot.c

   133	
   134	static int odroid_restart_probe(struct platform_device *pdev)
   135	{
   136		struct device_node *of_node;
   137		u32 id;
   138	
   139		if (!of_property_read_u32(pdev->dev.of_node, "sys_reset", &id)) {
   140			psci_function_id_restart = id;
 > 141			arm_pm_restart = do_odroid_restart;
   142		}
   143	
   144		if (!of_property_read_u32(pdev->dev.of_node, "sys_poweroff", &id)) {
   145			psci_function_id_poweroff = id;
   146			pm_power_off = do_odroid_poweroff;
   147		}
   148	
   149		of_node = pdev->dev.of_node;
   150	
   151		sd_vqsw = of_get_named_gpio(of_node, "sd-vqsw", 0);
   152		if (!gpio_is_valid(sd_vqsw)) sd_vqsw = 0;
   153	
   154		sd_vmmc = of_get_named_gpio(of_node, "sd-vmmc", 0);
   155		if (!gpio_is_valid(sd_vmmc)) sd_vmmc = 0;
   156	
   157		sd_vqen = of_get_named_gpio(of_node, "sd-vqen", 0);
   158		if (!gpio_is_valid(sd_vqen)) sd_vqen = 0;
   159	
   160		return 0;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
