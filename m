Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3565F10971
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714395524; cv=none; b=hpAK6hNyCzsr0zgGTX4JG91ZJ0VbYAAzcuKYhe6siCTUAbILor+GwuhNSy/X2NCod9gDq/OQaB/GqoYpvWU5tsjXKVu6C0ZiA5MjvLM1Sa8CW7Vrg/1nkubU3lb0R7Sz/pm6AUS5bVpv74FyHuqc+fjnJNIciJneY8J/I7mHj9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714395524; c=relaxed/simple;
	bh=nz54BL5jPjNIYSQfaP0zKv43tVLokz5Elo2HqALNXf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lQoSLJkHlppiLlVx89no7oVv41P4joPvMlXx35tPpS51/w77twfSG0V5YVnUhM4yKfTU5nWh/3COGuJHtZ/xdf1UYah4TsJfEYU0X0Td9RAIC0FWIgQQFt690heB+zxpzGvty75Ok3spUXE9spgWoYTmDn6Dkpj5WEp1SszCRfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAaHMT/v; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAaHMT/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714395522; x=1745931522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nz54BL5jPjNIYSQfaP0zKv43tVLokz5Elo2HqALNXf8=;
  b=PAaHMT/vyrGgq3j83x95VOiaeHx0UqmeBDgvzCaxujVghB93tDBMmMJ8
   O7YlMs9mKqBAaUo/0Vki0qRcg98p8SSDc3SV4CTv/rXAtleqbXIlYz3b7
   a4KB8AYzl6IDZCrrxO7GtM5vrd7qyIVGJ4fvgeDkmrFaHIhigEHhwIuqn
   cMnI9UnMcoEi7lwXfvVe+pwavr0FifRcYDznf2al4eK38m7jjl8216yBA
   1NfXEHyJPGj3iSxXQxtr8VwCiwRHb0KRmpP4QyfDWIk6SB4PjoPkAgdFn
   WS6pFdmKMHo1JG5oor4kZhBLoUk0KhkAYwQc6MajaTGQgBgknZ+7/B4wK
   A==;
X-CSE-ConnectionGUID: F2rCVfVxRKCEy1PiCwbmTw==
X-CSE-MsgGUID: eCJlm6TVRzePIAJqSPNDYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9933760"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9933760"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 05:58:42 -0700
X-CSE-ConnectionGUID: YINP5QM0SmeNc42Qx6SXBQ==
X-CSE-MsgGUID: WxHjUyUiStmCcKA5tIvTXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26206224"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2024 05:58:40 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Qac-0007BO-0k;
	Mon, 29 Apr 2024 12:58:38 +0000
Date: Mon, 29 Apr 2024 20:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 14036/29983]
 drivers/base/power/domain.c:635:20: error: 'pm_wq' undeclared
Message-ID: <202404292057.d0Qx8pYS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: c7aa30ff9f1ace2dbacdb6cd2720606e7f74c4c5 [14036/29983] MLK-25894-4 soc: imx: add i.MX93 SRC power domain driver
config: powerpc-randconfig-002-20240429 (https://download.01.org/0day-ci/archive/20240429/202404292057.d0Qx8pYS-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404292057.d0Qx8pYS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404292057.d0Qx8pYS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/power/domain.c:255:6: warning: no previous prototype for 'pm_genpd_disable_clks' [-Wmissing-prototypes]
     255 | void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:261:5: warning: no previous prototype for 'pm_genpd_enable_clks' [-Wmissing-prototypes]
     261 | int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c: In function 'genpd_queue_power_off_work':
>> drivers/base/power/domain.c:635:20: error: 'pm_wq' undeclared (first use in this function)
     635 |         queue_work(pm_wq, &genpd->power_off_work);
         |                    ^~~~~
   drivers/base/power/domain.c:635:20: note: each undeclared identifier is reported only once for each function it appears in
   drivers/base/power/domain.c: In function 'genpd_dev_pm_qos_notifier':
>> drivers/base/power/domain.c:841:39: error: 'struct dev_pm_info' has no member named 'ignore_children'
     841 |                 if (!dev || dev->power.ignore_children)
         |                                       ^
   drivers/base/power/domain.c: In function 'rtpm_status_str':
>> drivers/base/power/domain.c:3144:23: error: 'struct dev_pm_info' has no member named 'runtime_error'
    3144 |         if (dev->power.runtime_error)
         |                       ^
>> drivers/base/power/domain.c:3146:28: error: 'struct dev_pm_info' has no member named 'disable_depth'
    3146 |         else if (dev->power.disable_depth)
         |                            ^
>> drivers/base/power/domain.c:3148:28: error: 'struct dev_pm_info' has no member named 'runtime_status'
    3148 |         else if (dev->power.runtime_status < ARRAY_SIZE(status_lookup))
         |                            ^
   drivers/base/power/domain.c:3149:45: error: 'struct dev_pm_info' has no member named 'runtime_status'
    3149 |                 p = status_lookup[dev->power.runtime_status];
         |                                             ^
--
   drivers/base/power/domain_governor.c: In function 'default_suspend_ok':
>> drivers/base/power/domain_governor.c:82:24: error: 'struct dev_pm_info' has no member named 'ignore_children'
      82 |         if (!dev->power.ignore_children)
         |                        ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
   Depends on [n]: PM [=n]
   Selected by [y]:
   - SOC_IMX9 [=y] && (ARCH_MXC || COMPILE_TEST [=y])


vim +/pm_wq +635 drivers/base/power/domain.c

c8f0ea45169c57 Geert Uytterhoeven 2014-11-10  625  
29e47e2173349e Ulf Hansson        2015-09-02  626  /**
86e12eac1f7f84 Ulf Hansson        2016-12-08  627   * genpd_queue_power_off_work - Queue up the execution of genpd_power_off().
a3d09c73492e57 Moritz Fischer     2016-01-27  628   * @genpd: PM domain to power off.
29e47e2173349e Ulf Hansson        2015-09-02  629   *
86e12eac1f7f84 Ulf Hansson        2016-12-08  630   * Queue up the execution of genpd_power_off() unless it's already been done
29e47e2173349e Ulf Hansson        2015-09-02  631   * before.
29e47e2173349e Ulf Hansson        2015-09-02  632   */
29e47e2173349e Ulf Hansson        2015-09-02  633  static void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
29e47e2173349e Ulf Hansson        2015-09-02  634  {
29e47e2173349e Ulf Hansson        2015-09-02 @635  	queue_work(pm_wq, &genpd->power_off_work);
29e47e2173349e Ulf Hansson        2015-09-02  636  }
29e47e2173349e Ulf Hansson        2015-09-02  637  

:::::: The code at line 635 was first introduced by commit
:::::: 29e47e2173349ee06bd339f7753821c720d50923 PM / Domains: Try power off masters in error path of __pm_genpd_poweron()

:::::: TO: Ulf Hansson <ulf.hansson@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
