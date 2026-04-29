Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF527345750
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 21:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777496454; cv=none; b=rvpmGU2kFJKREWuv4yp4UhHUoJSqZtoNAkPU9omOxVG8cEKGGnLHrcYELi0zDfGd/OiQfov3Lan4Tz/Xi6XkMjQTUmevXPjjy2T1n/3ODdbj09EaD9vcCCzVlRwib1w8VCRPpV5oOf/F3AzzaDHFCM74CSTzklN6NiGFgsIgqJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777496454; c=relaxed/simple;
	bh=fD1olYopKzJVoN/isM8QXbPjb4FIvE/u3IzwQv91xsc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rXrbhGr5xKE4v2zShGMU3QWxQmuouA/vPvB2NTJg0BnZOItaIp8dbkSVJqeopE5GLHI2u0CL4P6wCAgqwaZN8/tuz++6FLfxLM8EKhjZbfq6z6rrLzJyRcYakxH7r0lL+HKBHuG/gWafZI45PDdAYHgruYTmFGUQUHqv9ZQ6RmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8cYeW44; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8cYeW44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777496453; x=1809032453;
  h=date:from:to:cc:subject:message-id;
  bh=fD1olYopKzJVoN/isM8QXbPjb4FIvE/u3IzwQv91xsc=;
  b=Y8cYeW44ehhwffUJBsRIZeXVvFnlCJpnKe5+U7C6rdGmhS6p6+voBI8t
   zY3ea0hKvV8WrKfbytY5yrF2eKAPcK7De9xZXoTy7AbMwh2/Aab2ZAF7s
   IghTvCw7pTosTmrkxXoTreWjPbu+Y17q4V1B3zXBmAuIpXUttkmdtlcfd
   qIw+uL1WKesgcOLssoHyeWyVI2sYVFQzyo25ZACWB8KJjhtUQx0YEzrbU
   ydirkPvP3NoWqpr/8+wDttdYPPurVbAzYwJmRp6f+3tWD5Tme7ylQnBBI
   9rEKVMFR8jkSTPCYvXgPRHVpGabbQ+c0oqhLJOTZ3oCy8Xn7DjJF27mt4
   Q==;
X-CSE-ConnectionGUID: AVFxbDewSCGGvRu6obFV3Q==
X-CSE-MsgGUID: ILUtiPaiTtKCEcxxOwyzPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82301071"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="82301071"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 14:00:53 -0700
X-CSE-ConnectionGUID: jnUJSywvROGOetpfSJDmtA==
X-CSE-MsgGUID: HLjwjHpCQmu9OEZPbMjwTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="229779629"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2026 14:00:51 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIC1Z-00000000BXW-0HTY;
	Wed, 29 Apr 2026 21:00:49 +0000
Date: Thu, 30 Apr 2026 05:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:perf/spe-fixes 4/4]
 drivers/perf/arm_spe_pmu.c:1295:12: warning: 'cpu_pm_spe_notify' defined but
 not used
Message-ID: <202604300414.eDvsGHf2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git perf/spe-fixes
head:   49f6890ebd9f4439d6f09ddeca19dea974cc41a9
commit: 49f6890ebd9f4439d6f09ddeca19dea974cc41a9 [4/4] WIP: perf: arm_spe: Add CPU PM infrastructure
config: arm64-randconfig-001-20260430 (https://download.01.org/0day-ci/archive/20260430/202604300414.eDvsGHf2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300414.eDvsGHf2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300414.eDvsGHf2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/arm_spe_pmu.c:1295:12: warning: 'cpu_pm_spe_notify' defined but not used [-Wunused-function]
    static int cpu_pm_spe_notify(struct notifier_block *b, unsigned long cmd, void *v)
               ^~~~~~~~~~~~~~~~~


vim +/cpu_pm_spe_notify +1295 drivers/perf/arm_spe_pmu.c

  1282	
  1283	static int arm_spe_pmu_cpu_teardown(unsigned int cpu, struct hlist_node *node)
  1284	{
  1285		struct arm_spe_pmu *spe_pmu;
  1286	
  1287		spe_pmu = hlist_entry_safe(node, struct arm_spe_pmu, hotplug_node);
  1288		if (!cpumask_test_cpu(cpu, &spe_pmu->supported_cpus))
  1289			return 0;
  1290	
  1291		__arm_spe_pmu_stop_one(spe_pmu);
  1292		return 0;
  1293	}
  1294	#ifdef CONFIG_CPU_PM
> 1295	static int cpu_pm_spe_notify(struct notifier_block *b, unsigned long cmd, void *v)
  1296	{
  1297		return 0;
  1298	}
  1299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
