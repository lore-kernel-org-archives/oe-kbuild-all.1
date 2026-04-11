Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21326FC5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 00:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775867502; cv=none; b=DjEjRL9A5V55HHk5mtEFQEHeuJF7klqgPlOcVzpNXoZlf7LCtJgnFqKgoDs+fkuUQPeroaN8BWNZKow2PluiV/ONHg0dwsvmkIwC4hoNUNKLqAdOoywU9mtZES+e3T+mSoBdrInOq0EtrDsAQnm2VMVxisIwkYYr3smnl9egFtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775867502; c=relaxed/simple;
	bh=mqHSN9SNavO4WVvno9tPJeVYWqKTY8r44IZ+bj1OrNc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JZvEpeTC/RP6LLgyty54m9SjwieoAI6dzdhTl9kEarE83/8uMBYFhRPPz7H8RrbMSaGXN08i0YqQjV6Vd+iKcEGtrSTUZ2PcEWnRpEZZq1IkBy2TkF+BVCphIZFxDir/G0TSK7NY2pNFfvzsFyDPdDk8oPnddX6PigMDCexTybo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2B4LLa/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2B4LLa/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775867500; x=1807403500;
  h=date:from:to:cc:subject:message-id;
  bh=mqHSN9SNavO4WVvno9tPJeVYWqKTY8r44IZ+bj1OrNc=;
  b=j2B4LLa/p9fR2+5zoOv8liW9IG1YAE/6iYemarbKdYMxRiTgtdRBJ0dd
   IK9dGivk41Ezpqi3xCpkmdvG9oymQ2jbumoXE6rjRnznL3zjbUs37Y1r0
   RYx+ffuGkWopL64LxDk6Nfa/t6fsVpU8ud51tuE44OVwyZbGoxBCcs8L1
   mCi1HtMISkalXGCcQt1ru9O8Zvt9YU5QdHzptWvYrtnH9GMfUYRDzaJwA
   AbuVMgQdTRE5tZPIbIMyvxKo3AyMDnugc/0cRcBkduojHYqQa5/jaT+bj
   EhWICs7gTToFn9SK8fIIRrOyVzpElCVhPqOwEjnQqdXSZLBy7ZxBlBx8O
   g==;
X-CSE-ConnectionGUID: p1dAPOyvQKCGKvzWFWkX7w==
X-CSE-MsgGUID: 3vUJoLgETmqfMB0a52C84Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94467954"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="94467954"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 17:31:39 -0700
X-CSE-ConnectionGUID: Us5BzirdRN6BqoJoQM3FIQ==
X-CSE-MsgGUID: BnwBxairSMSEHPXTQU/ocA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="226524926"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2026 17:31:38 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBMG7-000000000UN-1Z9Z;
	Sat, 11 Apr 2026 00:31:35 +0000
Date: Sat, 11 Apr 2026 08:31:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ulfh-pm:debug_pm 2/6]
 drivers/pmdomain/pm_domain_test.c:152:14: error: use of undeclared identifier
 'pm_domain_cpu_gov'
Message-ID: <202604110810.7BA8AsN0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git debug_pm
head:   a09aeaab168370f51d35266f52b804fd3809265b
commit: cf92a4ef872775fda995f1e8b7502c144e6190e3 [2/6] pmdomain: Add driver for simple PM domain providers with perf support
config: arm-randconfig-r071-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110810.7BA8AsN0-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110810.7BA8AsN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110810.7BA8AsN0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pmdomain/pm_domain_test.c:152:14: error: use of undeclared identifier 'pm_domain_cpu_gov'
     152 |                         pd_gov = &pm_domain_cpu_gov;
         |                                   ^~~~~~~~~~~~~~~~~
   1 error generated.


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
