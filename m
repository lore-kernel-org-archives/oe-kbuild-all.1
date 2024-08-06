Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E83216D9A0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722938638; cv=none; b=FG1gX+7rdacmIX78t8i3vv6zw1jRj541bPH1j7J1ouDF+wDa5ctjfkF/8dz0qdVLOIakec9cjDxrTCHzKeIYl1It27YH3oZfRvU21CSaJ6tg5Sd1VSWpgXNLfEaVl4vQTLgHkHiCqVIsrcull2cmAaDBf12JxuWvfGvdj0/ck5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722938638; c=relaxed/simple;
	bh=lGD20t/HqaYERn9Ji/0Eva6gvI/gxozUobghkSLHy6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JqVbww9BviXGpc5qCseoTV34rXr6LzIvmSCsMseeV2oY9a2LPB3ScJq0hp1MkdFs60pV8x2S4QfAJTWLvt+cxu/t4My0LGmgCuxDvd0noeiyoi7CnKM+1kvg/gg7zWOLRwA6CK0VdEXaBv0dW091uWbVrqiJXUbreI1GoiGaa0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/DQzQPU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/DQzQPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722938637; x=1754474637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lGD20t/HqaYERn9Ji/0Eva6gvI/gxozUobghkSLHy6w=;
  b=K/DQzQPU/9M9lDp2o4t2cldBo4Bu+RH9B28n9PSRW/hNhq4iKoJhx2Nc
   fmRDB2ZRi/Zp5usHIkujYkjfCJnPeLfzYlJ6v4jrr7PanUAVh+pNQrKW1
   9YZwT+072qgUOU+kaSjwA/tYMMwlpBa+3Hf6y/qCgl34IL53n5aVc+76Z
   oBg16ZhmQ7NlRxzOpnr9DHhEy0UVNSBwRxpaiE0LXry5pc5JcrmJXsEW7
   Sg0qjKWUz2HdyTM7U/nsBOnVrWdHmo2mkEUq1gYVEf67X/ypVTwilDucl
   olR93noYDPbxgmzNT7q3GQSiB4+fnJgjI0uGewA+y5AYV+PCjATjJMeD+
   A==;
X-CSE-ConnectionGUID: IsfTsQjFT1OlXBknS0aLRw==
X-CSE-MsgGUID: utX4vRWkQbW6ggWbSZf/xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21085889"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="21085889"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 03:03:56 -0700
X-CSE-ConnectionGUID: tn6EQNwtRwexsdHZrRftjw==
X-CSE-MsgGUID: At+gCAknRN6ineoxh3iRog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="57180057"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Aug 2024 03:03:55 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbH2l-0004O4-2o;
	Tue, 06 Aug 2024 10:03:51 +0000
Date: Tue, 6 Aug 2024 18:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:cpufreq-compile-test 6/6] drivers/opp/ti-opp-supply.c:364:34:
 warning: 'ti_opp_supply_of_match' defined but not used
Message-ID: <202408061750.VVrK7wBT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git cpufreq-compile-test
head:   51646201e21cdf40aad3925f7742a8d2ac727f43
commit: 51646201e21cdf40aad3925f7742a8d2ac727f43 [6/6] cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers
config: i386-buildonly-randconfig-003-20240806 (https://download.01.org/0day-ci/archive/20240806/202408061750.VVrK7wBT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061750.VVrK7wBT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061750.VVrK7wBT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/opp/ti-opp-supply.c:364:34: warning: 'ti_opp_supply_of_match' defined but not used [-Wunused-const-variable=]
     364 | static const struct of_device_id ti_opp_supply_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/cpufreq/ti-cpufreq.c:422:34: warning: 'ti_cpufreq_of_match' defined but not used [-Wunused-const-variable=]
     422 | static const struct of_device_id ti_cpufreq_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~


vim +/ti_opp_supply_of_match +364 drivers/opp/ti-opp-supply.c

9a835fa6e47f27 Dave Gerlach 2017-12-14  363  
9a835fa6e47f27 Dave Gerlach 2017-12-14 @364  static const struct of_device_id ti_opp_supply_of_match[] = {
9a835fa6e47f27 Dave Gerlach 2017-12-14  365  	{.compatible = "ti,omap-opp-supply", .data = &omap_generic_of_data},
9a835fa6e47f27 Dave Gerlach 2017-12-14  366  	{.compatible = "ti,omap5-opp-supply", .data = &omap_omap5_of_data},
9a835fa6e47f27 Dave Gerlach 2017-12-14  367  	{.compatible = "ti,omap5-core-opp-supply",
9a835fa6e47f27 Dave Gerlach 2017-12-14  368  	 .data = &omap_omap5core_of_data},
9a835fa6e47f27 Dave Gerlach 2017-12-14  369  	{},
9a835fa6e47f27 Dave Gerlach 2017-12-14  370  };
9a835fa6e47f27 Dave Gerlach 2017-12-14  371  MODULE_DEVICE_TABLE(of, ti_opp_supply_of_match);
9a835fa6e47f27 Dave Gerlach 2017-12-14  372  

:::::: The code at line 364 was first introduced by commit
:::::: 9a835fa6e47f27b1ae71390b6f12efce7335aaac PM / OPP: Add ti-opp-supply driver

:::::: TO: Dave Gerlach <d-gerlach@ti.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
