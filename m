Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448402DB7BB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 18:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846807; cv=none; b=d578a4CfYtIoebVgMEIuYG3M4eJgHVnXT2zrEZnl9uqrAYSZRS2hG6setp8gZm4woMwyD97k7zAWlJdb6G/qu1JskwPw1fKhxSfLJZOsHFkMMT4ay/KFTZXlUSnkzo+4Wl9FxWiI4jMy8nup0igLcVDCSrQMo07hi6+6Gy9gUWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846807; c=relaxed/simple;
	bh=f0Bv21GoDNQMJh1E9g58LQswyGkeNuIdY7OhasHcSfA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j9dzJzHoHdfdXoQDC6KKrKAPNS8Lf2z1oPo2zFFRAB6XUl9ILhufW404WE6diYYiOB9YdfCMOF40FUd6XonD/i0svOPI89g0tZdebs74TMouoklI5ID9AjSF+3zN7i9tS07fgzMMLCT5cAdJ8EhHUVyO2Q6lypkjM6McK0hgJ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsNe6YVG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsNe6YVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768846806; x=1800382806;
  h=date:from:to:cc:subject:message-id;
  bh=f0Bv21GoDNQMJh1E9g58LQswyGkeNuIdY7OhasHcSfA=;
  b=TsNe6YVG3W5alAzcTBqKRQKpRZaSLu4zH1rJ0BC/lATR/Juqp3Zi3fJT
   4wn3gHxd3hDj006G+TuKU1FzjEOO8ZgQdRyJzNWGIzPkUVgTAAK6aDmBW
   FF7BqR98CvBcBLTWp1CXfjbov6+Knh/m/d3Wmw9inhuv7L9dOo+S14yce
   TOACpwbhz88U11tKU7mv+Lk3q6oKpFaMrBuMzI/blzww7siBBj2PM8Pnn
   s2Eq5EUGBWb1Xxw6ZAEbygBgx8Nsdi5lkucFsf1O4KzVmuicFSkkU0TbY
   Gzq2INRKAMck9Y/LfdCHCwriLbW3GklzI188h5/QZwJTErsQYHMYqwHii
   g==;
X-CSE-ConnectionGUID: Bt+G2hkoQcSy8GiT8ULp2w==
X-CSE-MsgGUID: 5Ot86x7qQYmSrjIhRRALcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57618324"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="57618324"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 10:20:05 -0800
X-CSE-ConnectionGUID: wTX/MtV9SVmZXfSwxXlczQ==
X-CSE-MsgGUID: S0WRVqeqTN+nXduNXhESaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205076200"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Jan 2026 10:20:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhtr7-00000000OA1-1Mp8;
	Mon, 19 Jan 2026 18:20:01 +0000
Date: Tue, 20 Jan 2026 02:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ulfh-pm:debug_pm 24/27]
 drivers/pmdomain/pm_domain_test.c:152:35: error: 'pm_domain_cpu_gov'
 undeclared
Message-ID: <202601200232.0YTYbppa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git debug_pm
head:   9906dfc4ce39030a1b96f46d4158406e5ba21b16
commit: f51046345a48ae9d1e9e06ca89d92c842bdf90e2 [24/27] pmdomain: Add driver for simple PM domain providers with perf support
config: arm-randconfig-004-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200232.0YTYbppa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200232.0YTYbppa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200232.0YTYbppa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pmdomain/pm_domain_test.c: In function 'pd_init':
>> drivers/pmdomain/pm_domain_test.c:152:35: error: 'pm_domain_cpu_gov' undeclared (first use in this function)
     152 |                         pd_gov = &pm_domain_cpu_gov;
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/pmdomain/pm_domain_test.c:152:35: note: each undeclared identifier is reported only once for each function it appears in


vim +/pm_domain_cpu_gov +152 drivers/pmdomain/pm_domain_test.c

   124	
   125	static int pd_init(struct device *dev, struct device_node *np)
   126	{
   127		struct generic_pm_domain *pd;
   128		struct dev_power_governor *pd_gov = NULL;
   129		struct genpd_power_state *states = NULL;
   130		int state_count = 0, ret;
   131		bool boot_on, cpu_pd;
   132	
   133		pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
   134		if (!pd)
   135			return -ENOMEM;
   136	
   137		/* DT property for CPU PM domain. */
   138		cpu_pd = of_property_present(np, "cpu_pm_domain");
   139		if (cpu_pd)
   140			pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
   141	
   142		ret = of_genpd_parse_idle_states(np, &states, &state_count);
   143		if (ret)
   144			dev_err(dev, "%s failed parsing idle states err=%d\n",
   145				__func__, ret);
   146		if (states) {
   147			pd->free_states = pd_free_states;
   148			pd->states = states;
   149			pd->state_count = state_count;
   150	
   151			if (cpu_pd)
 > 152				pd_gov = &pm_domain_cpu_gov;
   153			else
   154				pd_gov = &simple_qos_governor;
   155		}
   156	
   157		pd->name = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
   158		pd->name = kbasename(pd->name);
   159		pd->power_off = pd_power_off;
   160		pd->power_on = pd_power_on;
   161	
   162		if (strcmp(dev_name(dev), "domain_perf") == 0) {
   163			dev_info(dev, "set perf-cb for %s\n", pd->name);
   164			pd->set_performance_state = pd_set_performance_state;
   165		}
   166	
   167		if (strcmp(dev_name(dev), "domain_perf_single") == 0) {
   168			dev_info(dev, "set perf-cb for %s\n", pd->name);
   169			pd->set_performance_state = pd_set_performance_state;
   170		}
   171	
   172		if (strcmp(dev_name(dev), "domain_irq_safe") == 0) {
   173			dev_info(dev, "Set GENPD_FLAG_IRQ_SAFE for %s\n", pd->name);
   174			pd->flags |= GENPD_FLAG_IRQ_SAFE;
   175		}
   176	
   177		/* DT property to see if boot-on|off. */
   178		boot_on = of_property_present(np, "boot-on");
   179	
   180		ret = pm_genpd_init(pd, pd_gov, !boot_on);
   181		if (ret) {
   182			kfree(pd->states);
   183			return ret;
   184		}
   185	
   186		ret = of_genpd_add_provider_simple(np, pd);
   187		if (ret)
   188			pm_genpd_remove(pd);
   189	
   190		return ret;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
