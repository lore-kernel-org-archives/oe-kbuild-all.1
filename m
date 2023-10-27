Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5E8156DD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Go925sfa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698395839; x=1729931839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=upZRtdSG4DidffCOFfxOemF/gR08f/opQdqY7OInv44=;
  b=Go925sfa5+pHjJ5cB6PTE4+wWvwSdl6oEXKZn5etmD62szQVPEAmcDvS
   /bTww3i2P/HCK0NVX4QBZR8blbl039HZKxa0c53jTDv12wRgNOWQ1EAgh
   GjhzeCFeLoHy6WIH0gR4P0Rja2ySXG0JWDMDhDlOflmBvwriu90LTYn7S
   yGmkTszAnH8KAE71cZ8D4QyqGYgXq9Nm7zbwzpGROJFyAhSpmy8aqhQlS
   3QDQ/IOu2BjZQTB7FNyGyPqSl29tqghOp2uc1qDKq6RnoOU5Eu+xxd3nv
   6NiSLKEPJisueu/y+GRdQGPlWi6qjJZpNW83P9IuXfEwTkTRq1N8wEh5N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="418846409"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="418846409"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 01:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="788771968"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="788771968"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Oct 2023 01:37:17 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwILD-000Adv-0r;
	Fri, 27 Oct 2023 08:37:15 +0000
Date: Fri, 27 Oct 2023 16:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Shaopeng Tan <tan.shaopeng@fujitsu.com>
Subject: [morse:mpam/monitors_and_locking/v7 24/24]
 arch/x86/kernel/cpu/resctrl/core.c:374: undefined reference to
 `lockdep_is_cpus_held'
Message-ID: <202310271654.WvAlQLzj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/monitors_and_locking/v7
head:   4997bd3c46a319aba302b9ed72140c6e63eaadb9
commit: 4997bd3c46a319aba302b9ed72140c6e63eaadb9 [24/24] x86/resctrl: Separate arch and fs resctrl locks
config: i386-randconfig-013-20231027 (https://download.01.org/0day-ci/archive/20231027/202310271654.WvAlQLzj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271654.WvAlQLzj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271654.WvAlQLzj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/resctrl/core.o: in function `get_domain_from_cpu':
>> arch/x86/kernel/cpu/resctrl/core.c:374: undefined reference to `lockdep_is_cpus_held'
>> ld: arch/x86/kernel/cpu/resctrl/core.c:374: undefined reference to `lockdep_is_cpus_held'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +374 arch/x86/kernel/cpu/resctrl/core.c

   362	
   363	struct rdt_domain *get_domain_from_cpu(int cpu, struct rdt_resource *r)
   364	{
   365		struct rdt_domain *d;
   366	
   367		/*
   368		 * Walking r->domains, ensure it can't race with cpuhp.
   369		 * Because this is called via IPI by rdt_ctrl_update(), assertions
   370		 * about locks this thread holds will lead to false positives. Check
   371		 * someone is holding the CPUs lock.
   372		 */
   373		if (IS_ENABLED(CONFIG_LOCKDEP))
 > 374			lockdep_is_cpus_held();
   375	
   376		list_for_each_entry(d, &r->domains, list) {
   377			/* Find the domain that contains this CPU */
   378			if (cpumask_test_cpu(cpu, &d->cpu_mask))
   379				return d;
   380		}
   381	
   382		return NULL;
   383	}
   384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
