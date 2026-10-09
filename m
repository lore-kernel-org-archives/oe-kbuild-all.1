Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1966C4F30E2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 18:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569063; cv=none; b=Z2oBHfpKx3zCEAZGx+W9YYTSI6UcwrklWDR4h1I+EpJ4nNpQqQGlnl95eF+LPJZ47zO/b6U4uB3R1Z/WBDkGsJIVHx/n+a3VyACQoREqX1IrscvGTIx1z5Si1O738ppT9btI2jRpkeDUXWAblL5NItKr4SpRnPWxDSXxdiywDio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569063; c=relaxed/simple;
	bh=xTFaFV8ee6BXhhXUS4b31wrTdafRTO03EMai1PstVTw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fG6rq6TwPpQN1DqXeBwQYUYPFsWGeFOyy2BSmGnXMhmvT4xKZ0537bJZ6eFyXtcy/QI1cNBkFncfT3THutouNDBI9vySSKwyO8d2aTcA4tq8q2+2FAR2+YumNuY7Xag3DtSELiX6C7ZB+RulB3xIRNUCeWCPmh5ndrSNTsRmzQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAAfMqoY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAAfMqoY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791569053; x=1823105053;
  h=date:from:to:cc:subject:message-id;
  bh=xTFaFV8ee6BXhhXUS4b31wrTdafRTO03EMai1PstVTw=;
  b=FAAfMqoYMoD6HNlEdB1deZpmnYeKPj2O3mHz0M42c2olhwoOibg8in6+
   Eramf0hJsXrR/Kt34fQplpdyjED8dtlLg4Utgtr65D/TG9qSGL7vqVbT2
   T7iNo48swVhNUfgW1GPgkBneI72kuGNJjlDgyG91XfhQGlnJDObSfIHJw
   Ohxa44hsoGyPSko4WY2Ru4GMUKppFD9OVAkkJ+hgg6PGoFutqYVBWUSch
   2auNuLWog6SDJKHngTYzHfduYhdhjSZPcLYWj70exvfIBdwvnFJDKdDWI
   6X9b2e1epYYu0AKMrnM1VjkytxpQy4vkCJKIbYxaBkxoJ6sp4aMlLrh66
   A==;
X-CSE-ConnectionGUID: aWUt3yYWRMeIKNzZPBPSHw==
X-CSE-MsgGUID: kxZWrZaaQMCLdjCZu1xCGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="253642"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="253642"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 11:04:12 -0700
X-CSE-ConnectionGUID: Xiv4/LtEQsikdligvp69VA==
X-CSE-MsgGUID: G9BNpYK5RRGoAtHHMjhAIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="694612"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 09 Oct 2026 11:04:11 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFEwy-000000007Ch-3Ol9;
	Fri, 09 Oct 2026 18:04:08 +0000
Date: Fri, 09 Oct 2026 20:03:38 +0200
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 1/2]
 arch/xtensa/kernel/jump_label.c:63:58: error: passing argument 3 of
 'stop_machine_cpuslocked' from incompatible pointer type
Message-ID: <202610091912.aqscJ7uV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git core/hotplug
head:   ef852f3cb44950ae7ca8efd1eb384c8a36367a38
commit: 370a49ead30e94bf8e92ed3415ba86be14b8b292 [1/2] stop_machine: Add post function to execute while other CPUs can exit
config: xtensa-randconfig-2001-20261009 (https://download.01.org/0day-ci/archive/20261009/202610091912.aqscJ7uV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091912.aqscJ7uV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091912.aqscJ7uV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/xtensa/kernel/jump_label.c: In function 'patch_text':
>> arch/xtensa/kernel/jump_label.c:63:58: error: passing argument 3 of 'stop_machine_cpuslocked' from incompatible pointer type [-Werror=incompatible-pointer-types]
      stop_machine_cpuslocked(patch_text_stop_machine, NULL, &patch,
                                                             ^~~~~~
   In file included from arch/xtensa/kernel/jump_label.c:8:
   include/linux/stop_machine.h:167:30: note: expected 'const struct cpumask *' but argument is of type 'struct patch *'
           const struct cpumask *cpus)
           ~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/xtensa/kernel/jump_label.c:63:3: error: too many arguments to function 'stop_machine_cpuslocked'
      stop_machine_cpuslocked(patch_text_stop_machine, NULL, &patch,
      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/xtensa/kernel/jump_label.c:8:
   include/linux/stop_machine.h:166:28: note: declared here
    static __always_inline int stop_machine_cpuslocked(cpu_stop_fn_t fn, void *data,
                               ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]


vim +/stop_machine_cpuslocked +63 arch/xtensa/kernel/jump_label.c

    53	
    54	static void patch_text(unsigned long addr, const void *data, size_t sz)
    55	{
    56		if (IS_ENABLED(CONFIG_SMP)) {
    57			struct patch patch = {
    58				.cpu_count = ATOMIC_INIT(0),
    59				.addr = addr,
    60				.sz = sz,
    61				.data = data,
    62			};
  > 63			stop_machine_cpuslocked(patch_text_stop_machine, NULL, &patch,
    64						cpu_online_mask);
    65		} else {
    66			unsigned long flags;
    67	
    68			local_irq_save(flags);
    69			local_patch_text(addr, data, sz);
    70			local_irq_restore(flags);
    71		}
    72	}
    73	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
