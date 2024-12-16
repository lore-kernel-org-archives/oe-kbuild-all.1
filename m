Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00931804E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 04:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734323131; cv=none; b=B1Wv7CFpC5yf4OWi/qRRawO4fo2T04YH8fSUfrtLByfMp6PMg3RcYeZ/aDtHtsq2vUPSsUXbyl2l69jr9w8O85PkwHZ1LFJ4t2/GQdNSGuVb8c+OZj/HC/Yb/DqFDa+em1ebl27V4y2//Dw0Je+kfdl4xzRYncU+Q9BVJq5gsyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734323131; c=relaxed/simple;
	bh=4MP2c6gFPcfl7FDCX2tYmP3yAbXYfZ0ByTIKP32xt80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L6PaqL6CgDBqw4FfsN8+RiSGu2uPSKpkbAkUut4GjVv6mSPUEEmksSrjAPyJlaNVTRm5z0QG7obA9faIkOnIB+N+ait8AHizJHFOyfQ2dnNMcBjk0D9YHwtn5i3izVrLp6X+ohM0SSh+gfbAZ7k4DgGAsFV4A2NIpZFTvfpb8X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKW+1nrl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKW+1nrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734323129; x=1765859129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4MP2c6gFPcfl7FDCX2tYmP3yAbXYfZ0ByTIKP32xt80=;
  b=UKW+1nrlnXz2RrbUwOBRJ41XdsTpSRRzdV5bxFd+6JdcVYPw01UXUSST
   3V0yQ+K/SaPyNDhjJojBnoasccfyYdXfzLxnwTxJIBs8HaMayT8dmw+aC
   qaQjo3U8Wdn2e6DWW++WBph0ZXrwiT/sAt9IXLXTYgbEBqWy/WAii/XEQ
   HuHQV1oJVmHBdZEc3hXQ+jl0LTeeBcs9w5fH38DUA53mKQ1WOVv2ESFYB
   2BO587iVZkjovzPslOpy+7Yw/rB3kQEB4u5BCdXrWZTmb2LsVK53H0MbH
   NFrnsCWfd92UymVRrsV3QWY+eXhglUxZK5ft4BQ9SBQb3eA43x5aSCc80
   Q==;
X-CSE-ConnectionGUID: qYx96xSHT86IwR8PbAFYAA==
X-CSE-MsgGUID: gkCn8kusTeGI3LC2fosjLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45181005"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45181005"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 20:25:26 -0800
X-CSE-ConnectionGUID: XUDcE6L+T82aLlSCKUDAPg==
X-CSE-MsgGUID: Xm3ZbOd2R0mgXpBstZJBGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="97133436"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Dec 2024 20:25:25 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN2fZ-000E14-3A;
	Mon, 16 Dec 2024 04:25:21 +0000
Date: Mon, 16 Dec 2024 12:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:b4/pmu_event_info_v2 15/20]
 drivers/perf/riscv_pmu_sbi.c:304:74: warning: arithmetic between different
 enumeration types ('enum perf_hw_cache_id' and 'enum perf_hw_cache_op_id')
Message-ID: <202412161257.K7pWUEuO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux b4/pmu_event_info_v2
head:   0ac2a079de54645df5512161730e2f44964c6a5f
commit: 13431ba3bc15adfb3c82e508dfd5877d9d08c435 [15/20] drivers/perf: riscv: Implement PMU event info function
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20241216/202412161257.K7pWUEuO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412161257.K7pWUEuO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161257.K7pWUEuO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/perf/riscv_pmu_sbi.c:14:
   In file included from include/linux/perf/riscv_pmu.h:12:
   In file included from include/linux/perf_event.h:50:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/perf/riscv_pmu_sbi.c:304:74: warning: arithmetic between different enumeration types ('enum perf_hw_cache_id' and 'enum perf_hw_cache_op_id') [-Wenum-enum-conversion]
     304 |         int num_events = ARRAY_SIZE(pmu_hw_event_map) + PERF_COUNT_HW_CACHE_MAX *
         |                                                         ~~~~~~~~~~~~~~~~~~~~~~~ ^
     305 |                          PERF_COUNT_HW_CACHE_OP_MAX * PERF_COUNT_HW_CACHE_RESULT_MAX;
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +304 drivers/perf/riscv_pmu_sbi.c

   301	
   302	static int pmu_sbi_check_event_info(void)
   303	{
 > 304		int num_events = ARRAY_SIZE(pmu_hw_event_map) + PERF_COUNT_HW_CACHE_MAX *
   305				 PERF_COUNT_HW_CACHE_OP_MAX * PERF_COUNT_HW_CACHE_RESULT_MAX;
   306		struct riscv_pmu_event_info *event_info_shmem;
   307		phys_addr_t base_addr;
   308		int i, j, k, result = 0, count = 0;
   309		struct sbiret ret;
   310	
   311		event_info_shmem = kcalloc(num_events, sizeof(*event_info_shmem), GFP_KERNEL);
   312		if (!event_info_shmem)
   313			return -ENOMEM;
   314	
   315		for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
   316			event_info_shmem[count++].event_idx = pmu_hw_event_map[i].event_idx;
   317	
   318		for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
   319			for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
   320				for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
   321					event_info_shmem[count++].event_idx =
   322								pmu_cache_event_map[i][j][k].event_idx;
   323			}
   324		}
   325	
   326		base_addr = __pa(event_info_shmem);
   327		if (IS_ENABLED(CONFIG_32BIT))
   328			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, lower_32_bits(base_addr),
   329					upper_32_bits(base_addr), count, 0, 0, 0);
   330		else
   331			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, base_addr, 0,
   332					count, 0, 0, 0);
   333		if (ret.error) {
   334			result = -EOPNOTSUPP;
   335			goto free_mem;
   336		}
   337	
   338		for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
   339			if (!(event_info_shmem[i].output & RISCV_PMU_EVENT_INFO_OUTPUT_MASK))
   340				pmu_hw_event_map[i].event_idx = -ENOENT;
   341		}
   342	
   343		count = ARRAY_SIZE(pmu_hw_event_map);
   344	
   345		for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
   346			for (j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
   347				for (k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++) {
   348					if (!(event_info_shmem[count].output &
   349					      RISCV_PMU_EVENT_INFO_OUTPUT_MASK))
   350						pmu_cache_event_map[i][j][k].event_idx = -ENOENT;
   351					count++;
   352				}
   353			}
   354		}
   355	
   356	free_mem:
   357		kfree(event_info_shmem);
   358	
   359		return result;
   360	}
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
