Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFAC1D432D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 10:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775903665; cv=none; b=DKUfEdZh0QzeRh0TOzcIMJxxslxzWfnVOi+afOSYC6C7h9H/t/BevyhQJPZbJbRMZF3KbBSWDjtHmQXSeN06cv5NS33cRcbFbt0WazndPFgxXuRHsxinUuXbyaq5hXZS4jI+XjB7rTIWM47SiJSHEZNebrpc0Nk0XSeXd0eU29g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775903665; c=relaxed/simple;
	bh=tnD7IvlLZjHgIjTgG0+xnI1uz6f0KodGztuedDzfcC8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XGk+aeJOoeG7dF0oUXf/43vqvlCQ2y9lZnmt+oxq7iIZR2vI6u0V31oqmjMp0EJmvZlq3PhGtRf2NLLLL8xdRap2sQSO6kImHLAYiWxgSali7VPg8xEaj7Kutz3cnBm4vFgM68v6URjQS5CNlP1925il9pz7OGCt5a7puyOIz8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cjo/h9Bh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cjo/h9Bh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775903663; x=1807439663;
  h=date:from:to:cc:subject:message-id;
  bh=tnD7IvlLZjHgIjTgG0+xnI1uz6f0KodGztuedDzfcC8=;
  b=Cjo/h9BhMFvoZilWlQkK/s1JyhdMGB40wdLCKLY5Y9Zfx33/tqObskq0
   nEpWK5c03bVAc/v8CdFa82rCGRWPg+tK2Rnon8qlfT3MdU4T32akGK2FH
   r+Rkuu+x/WPtlObYL9+0FCAOi9GZvhUWIBsrxZmFxVUSROrLVod0mdznD
   ForYRGRw/85jyDnN199bPYF+QdhVCYTOtKnHSdR663vg6wRgY0EpPmIYV
   uBa4hOmq+kXDmaN14C37CCvtpilogQ0GNdpXt8XS8Uw6PjOk5zF2Hq9g6
   v/HPXl4kbzpxF5fPcs2s/ju4qpGPsMHkxiUcT/ixmXYNxitE9Q3UVwLK5
   A==;
X-CSE-ConnectionGUID: v3JZfof0QUKqBbL1hDiGeg==
X-CSE-MsgGUID: 2ZFxJMxARpSWcIs1kyahNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="77024485"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="77024485"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 03:34:22 -0700
X-CSE-ConnectionGUID: uL9lEfCoSQSqFUsY8dQQ6A==
X-CSE-MsgGUID: r/It2mF3RZyY5jAQrNt5Zw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Apr 2026 03:34:20 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBVfO-0000000014f-1Tsp;
	Sat, 11 Apr 2026 10:34:18 +0000
Date: Sat, 11 Apr 2026 18:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 28/38]
 arch/mips/generic/board-ingenic.c:191:13: error: implicit declaration of
 function 'boot_cpu_type'; did you mean 'boot_cpu_data'?
Message-ID: <202604111837.WeuK9y0l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   4f7b68811bb6be347b794010429e839e7a23b9d8
commit: 91aaf890c89bd170e4f18306dd59c993c7eb0821 [28/38] mips: Select ARCH_HAS_RANDOM_ENTROPY
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260411/202604111837.WeuK9y0l-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111837.WeuK9y0l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111837.WeuK9y0l-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/generic/board-ingenic.c: In function 'ingenic_pm_init':
>> arch/mips/generic/board-ingenic.c:191:13: error: implicit declaration of function 'boot_cpu_type'; did you mean 'boot_cpu_data'? [-Wimplicit-function-declaration]
     191 |         if (boot_cpu_type() == CPU_XBURST) {
         |             ^~~~~~~~~~~~~
         |             boot_cpu_data
--
   arch/mips/kernel/perf_event_mipsxx.c: In function 'get_loongson3_pmu_type':
>> arch/mips/kernel/perf_event_mipsxx.c:172:13: error: implicit declaration of function 'boot_cpu_type'; did you mean 'boot_cpu_init'? [-Wimplicit-function-declaration]
     172 |         if (boot_cpu_type() != CPU_LOONGSON64)
         |             ^~~~~~~~~~~~~
         |             boot_cpu_init
   arch/mips/kernel/perf_event_mipsxx.c: In function 'n_counters':
>> arch/mips/kernel/perf_event_mipsxx.c:816:17: error: implicit declaration of function 'current_cpu_type'; did you mean 'current_cpu_data'? [-Wimplicit-function-declaration]
     816 |         switch (current_cpu_type()) {
         |                 ^~~~~~~~~~~~~~~~
         |                 current_cpu_data


vim +191 arch/mips/generic/board-ingenic.c

f0f4a753079c63 Paul Cercueil 2020-09-06  188  
f0f4a753079c63 Paul Cercueil 2020-09-06  189  static int __init ingenic_pm_init(void)
f0f4a753079c63 Paul Cercueil 2020-09-06  190  {
f0f4a753079c63 Paul Cercueil 2020-09-06 @191  	if (boot_cpu_type() == CPU_XBURST) {
f0f4a753079c63 Paul Cercueil 2020-09-06  192  		if (IS_ENABLED(CONFIG_PM_SLEEP))
f0f4a753079c63 Paul Cercueil 2020-09-06  193  			suspend_set_ops(&ingenic_pm_ops);
f0f4a753079c63 Paul Cercueil 2020-09-06  194  		_machine_halt = ingenic_halt;
f0f4a753079c63 Paul Cercueil 2020-09-06  195  	}
f0f4a753079c63 Paul Cercueil 2020-09-06  196  
f0f4a753079c63 Paul Cercueil 2020-09-06  197  	return 0;
f0f4a753079c63 Paul Cercueil 2020-09-06  198  

:::::: The code at line 191 was first introduced by commit
:::::: f0f4a753079c636d5d43a102edbde0dad1e7de51 MIPS: generic: Add support for Ingenic SoCs

:::::: TO: Paul Cercueil <paul@crapouillou.net>
:::::: CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
