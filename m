Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71BDE545
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Dec 2023 21:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUjfyvdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703453061; x=1734989061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NpJQTM5EIuDA772XxLIbyhDM03NiY6M2vsjFuIQ5LC8=;
  b=bUjfyvdG5/+8KrJzGAipdHR6qGegTD+7+eukL0kU1rfAdfMNGEbmAhyT
   wTu8+BbH9h93Hpe1oBsIcmdWmtYIGgQAlQvTQrEi8AekRggsoedwW4xHV
   HNqM8N1/UuKHEZGJjD2NRsHiNKUJqL0PSnWvKrbiyOULJGSM1xtMmCh4Q
   pdNxAUkPsHtCyCk0bD/3u6U6j3V+Ep8myLPO1NMOXYncyuVxcQHxALXo2
   2GHXn7lyj8+YSy1+IkO1UyDkCOYblwwdZuWZWbADIYf8KbAPM10x+W5lh
   nRtmsAN+yDc65B6tSejR2fOiUA9uaba8HcUKi6VZlI4PLo3eRSG/qugJT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="427417883"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="427417883"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 13:24:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="19302825"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Dec 2023 13:24:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHVxF-000Cf9-2A;
	Sun, 24 Dec 2023 21:24:14 +0000
Date: Mon, 25 Dec 2023 05:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [soc:soc/arm 5/5] arch/arm/kernel/perf_event_v6.c:144:23: warning:
 unused variable 'armv6mpcore_perf_map'
Message-ID: <202312250521.K3pNHbty-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/arm
head:   2560cffd2134c2e070dee369b37f6e55438087f9
commit: 2560cffd2134c2e070dee369b37f6e55438087f9 [5/5] ARM: Delete ARM11MPCore (ARM11 ARMv6K SMP) support
config: arm-randconfig-r111-20231224 (https://download.01.org/0day-ci/archive/20231225/202312250521.K3pNHbty-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231225/202312250521.K3pNHbty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312250521.K3pNHbty-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/kernel/perf_event_v6.c:144:23: warning: unused variable 'armv6mpcore_perf_map' [-Wunused-const-variable]
   static const unsigned armv6mpcore_perf_map[PERF_COUNT_HW_MAX] = {
                         ^
>> arch/arm/kernel/perf_event_v6.c:154:23: warning: unused variable 'armv6mpcore_perf_cache_map' [-Wunused-const-variable]
   static const unsigned armv6mpcore_perf_cache_map[PERF_COUNT_HW_CACHE_MAX]
                         ^
   arch/arm/kernel/perf_event_v6.c:455:13: warning: unused function 'armv6mpcore_pmu_disable_event' [-Wunused-function]
   static void armv6mpcore_pmu_disable_event(struct perf_event *event)
               ^
   3 warnings generated.


vim +/armv6mpcore_perf_map +144 arch/arm/kernel/perf_event_v6.c

43eab87828fee6 Will Deacon  2010-11-13  138  
43eab87828fee6 Will Deacon  2010-11-13  139  /*
43eab87828fee6 Will Deacon  2010-11-13  140   * The hardware events that we support. We do support cache operations but
43eab87828fee6 Will Deacon  2010-11-13  141   * we have harvard caches and no way to combine instruction and data
43eab87828fee6 Will Deacon  2010-11-13  142   * accesses/misses in hardware.
43eab87828fee6 Will Deacon  2010-11-13  143   */
43eab87828fee6 Will Deacon  2010-11-13 @144  static const unsigned armv6mpcore_perf_map[PERF_COUNT_HW_MAX] = {
cf20ae8cfcb3ab Mark Rutland 2014-05-30  145  	PERF_MAP_ALL_UNSUPPORTED,
43eab87828fee6 Will Deacon  2010-11-13  146  	[PERF_COUNT_HW_CPU_CYCLES]		= ARMV6MPCORE_PERFCTR_CPU_CYCLES,
43eab87828fee6 Will Deacon  2010-11-13  147  	[PERF_COUNT_HW_INSTRUCTIONS]		= ARMV6MPCORE_PERFCTR_INSTR_EXEC,
43eab87828fee6 Will Deacon  2010-11-13  148  	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS]	= ARMV6MPCORE_PERFCTR_BR_EXEC,
43eab87828fee6 Will Deacon  2010-11-13  149  	[PERF_COUNT_HW_BRANCH_MISSES]		= ARMV6MPCORE_PERFCTR_BR_MISPREDICT,
0445e7a58e794d Will Deacon  2011-09-29  150  	[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND]	= ARMV6MPCORE_PERFCTR_IBUF_STALL,
0445e7a58e794d Will Deacon  2011-09-29  151  	[PERF_COUNT_HW_STALLED_CYCLES_BACKEND]	= ARMV6MPCORE_PERFCTR_LSU_FULL_STALL,
43eab87828fee6 Will Deacon  2010-11-13  152  };
43eab87828fee6 Will Deacon  2010-11-13  153  
43eab87828fee6 Will Deacon  2010-11-13 @154  static const unsigned armv6mpcore_perf_cache_map[PERF_COUNT_HW_CACHE_MAX]
43eab87828fee6 Will Deacon  2010-11-13  155  					[PERF_COUNT_HW_CACHE_OP_MAX]
43eab87828fee6 Will Deacon  2010-11-13  156  					[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
cf20ae8cfcb3ab Mark Rutland 2014-05-30  157  	PERF_CACHE_MAP_ALL_UNSUPPORTED,
cf20ae8cfcb3ab Mark Rutland 2014-05-30  158  
cf20ae8cfcb3ab Mark Rutland 2014-05-30  159  	[C(L1D)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV6MPCORE_PERFCTR_DCACHE_RDACCESS,
cf20ae8cfcb3ab Mark Rutland 2014-05-30  160  	[C(L1D)][C(OP_READ)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_DCACHE_RDMISS,
cf20ae8cfcb3ab Mark Rutland 2014-05-30  161  	[C(L1D)][C(OP_WRITE)][C(RESULT_ACCESS)]	= ARMV6MPCORE_PERFCTR_DCACHE_WRACCESS,
cf20ae8cfcb3ab Mark Rutland 2014-05-30  162  	[C(L1D)][C(OP_WRITE)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_DCACHE_WRMISS,
cf20ae8cfcb3ab Mark Rutland 2014-05-30  163  
cf20ae8cfcb3ab Mark Rutland 2014-05-30  164  	[C(L1I)][C(OP_READ)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_ICACHE_MISS,
cf20ae8cfcb3ab Mark Rutland 2014-05-30  165  
43eab87828fee6 Will Deacon  2010-11-13  166  	/*
cf20ae8cfcb3ab Mark Rutland 2014-05-30  167  	 * The ARM performance counters can count micro DTLB misses, micro ITLB
cf20ae8cfcb3ab Mark Rutland 2014-05-30  168  	 * misses and main TLB misses. There isn't an event for TLB misses, so
cf20ae8cfcb3ab Mark Rutland 2014-05-30  169  	 * use the micro misses here and if users want the main TLB misses they
cf20ae8cfcb3ab Mark Rutland 2014-05-30  170  	 * can use a raw counter.
43eab87828fee6 Will Deacon  2010-11-13  171  	 */
cf20ae8cfcb3ab Mark Rutland 2014-05-30  172  	[C(DTLB)][C(OP_READ)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_DTLB_MISS,
cf20ae8cfcb3ab Mark Rutland 2014-05-30  173  	[C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_DTLB_MISS,
cf20ae8cfcb3ab Mark Rutland 2014-05-30  174  
cf20ae8cfcb3ab Mark Rutland 2014-05-30  175  	[C(ITLB)][C(OP_READ)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_ITLB_MISS,
cf20ae8cfcb3ab Mark Rutland 2014-05-30  176  	[C(ITLB)][C(OP_WRITE)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_ITLB_MISS,
43eab87828fee6 Will Deacon  2010-11-13  177  };
43eab87828fee6 Will Deacon  2010-11-13  178  

:::::: The code at line 144 was first introduced by commit
:::::: 43eab87828fee65f89f4088736b2b7a187390a2f ARM: perf: separate PMU backends into multiple files

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
