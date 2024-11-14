Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A981318132F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 16:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731601460; cv=none; b=Brxo5DUarIMKXMQKXOSpD5f2XpDipPdma4+fEaD6VgVaRPbThCYRta8+yCiOiuHhnHQp1gQ7141HBJ5cHRAKNTLxVzf5Q3YhTPNyAx5aqh0Kh2gUEyjUQNN80g+UcY2dm5uYb0jm3vAvAYF0HYNWX0jwKyD2TGkKkqdEHyK5qR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731601460; c=relaxed/simple;
	bh=XcIzHffi+3MAJOclQIUfOKH6gKJrT52MhSC8y8klhPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XU1i+PhluNkcdmhCDpVd3tUinvxqzFSu6XIzbBPOgYRYRt6wEs4nj88b1VwFR2p31Jk2Bnu7aJxcQJu3cDgTwRB84piQuMDNvGMOxT6XylXnyQsj2S8KYIVJi0EKt6KRy8ePE/H++cmnLfDJxrKhg4JUTbYSX5hkius0g3B4dbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNuip7wK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNuip7wK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731601458; x=1763137458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XcIzHffi+3MAJOclQIUfOKH6gKJrT52MhSC8y8klhPw=;
  b=HNuip7wKkt04omVT956aojNiaP6bIu2Eg4hdKeNgFVC9JCR9EFYn06/A
   /kLlqlZJqEZ5S/NWSCXzXgG4f6X8YCleo9wmBgnIclorI+hd49eebRz1u
   tNeLw28pTfOcXxoe7yl8MsqxEJBIOBsAASQZCWliCzGrUEaRyqAIZu3KY
   LHAqGU+SYca+oSUjTTAbJNYd4fpNAfHWnwKb6YKJkVm2wdZbohtKKYBLJ
   c9Fp0pcHXcD9bY2rIi2QOeyGS2vrKBMDjKkIY2sTY1NvLAFC11R5j3bOo
   kCxnVzdQHgCcdvS2EAsx87jLpljf3/C3WIezJOISZO4NmXB+pRGIJU4zf
   A==;
X-CSE-ConnectionGUID: cKMs2sFPTsSGqBMw3gktDw==
X-CSE-MsgGUID: 8NGQywdwS7y31rOvQdwkDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="54097690"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="54097690"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 08:24:13 -0800
X-CSE-ConnectionGUID: CHziwfncSiuiL1pLiMQsSQ==
X-CSE-MsgGUID: cdflLxgRTmu3bKyF2T9zpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="88666041"
Received: from lkp-server01.sh.intel.com (HELO c7bc087bbc55) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Nov 2024 08:24:11 -0800
Received: from kbuild by c7bc087bbc55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBcdd-0000A4-05;
	Thu, 14 Nov 2024 16:24:09 +0000
Date: Fri, 15 Nov 2024 00:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:b4/pmu_event_info 63/66]
 drivers/perf/riscv_pmu_sbi.c:305:74: warning: arithmetic between different
 enumeration types ('enum perf_hw_cache_id' and 'enum perf_hw_cache_op_id')
Message-ID: <202411150030.LfME9FL5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux b4/pmu_event_info
head:   30789b82e05f60c9c1a5cfd7b1fb3e51460169a9
commit: ff95fdf2b45981994b06f059cabb981c3b22d4ed [63/66] drivers/perf: riscv: Implement PMU event info function
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20241115/202411150030.LfME9FL5-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411150030.LfME9FL5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411150030.LfME9FL5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/perf/riscv_pmu_sbi.c:14:
   In file included from include/linux/perf/riscv_pmu.h:12:
   In file included from include/linux/perf_event.h:50:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
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
>> drivers/perf/riscv_pmu_sbi.c:305:74: warning: arithmetic between different enumeration types ('enum perf_hw_cache_id' and 'enum perf_hw_cache_op_id') [-Wenum-enum-conversion]
     305 |         int num_events = ARRAY_SIZE(pmu_hw_event_map) + PERF_COUNT_HW_CACHE_MAX *
         |                                                         ~~~~~~~~~~~~~~~~~~~~~~~ ^
     306 |                          PERF_COUNT_HW_CACHE_OP_MAX * PERF_COUNT_HW_CACHE_RESULT_MAX;
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +305 drivers/perf/riscv_pmu_sbi.c

   302	
   303	static int pmu_sbi_check_event_info(void)
   304	{
 > 305		int num_events = ARRAY_SIZE(pmu_hw_event_map) + PERF_COUNT_HW_CACHE_MAX *
   306				 PERF_COUNT_HW_CACHE_OP_MAX * PERF_COUNT_HW_CACHE_RESULT_MAX;
   307		struct riscv_pmu_event_info *event_info_shmem;
   308		phys_addr_t base_addr;
   309		int i, j, k, result = 0, count = 0;
   310		struct sbiret ret;
   311	
   312		event_info_shmem = (struct riscv_pmu_event_info *)
   313				   kcalloc(num_events, sizeof(*event_info_shmem), GFP_KERNEL);
   314		if (!event_info_shmem) {
   315			pr_err("Can not allocate memory for event info query\n");
   316			return -ENOMEM;
   317		}
   318	
   319		for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
   320			event_info_shmem[count++].event_idx = pmu_hw_event_map[i].event_idx;
   321	
   322		for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
   323			for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
   324				for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
   325					event_info_shmem[count++].event_idx =
   326								pmu_cache_event_map[i][j][k].event_idx;
   327			}
   328		}
   329	
   330		base_addr = __pa(event_info_shmem);
   331		if (IS_ENABLED(CONFIG_32BIT))
   332			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, lower_32_bits(base_addr),
   333					upper_32_bits(base_addr), count, 0, 0, 0);
   334		else
   335			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, base_addr, 0,
   336					count, 0, 0, 0);
   337		if (ret.error) {
   338			result = -EOPNOTSUPP;
   339			goto free_mem;
   340		}
   341		/* Do we need some barriers here or priv mode transition will ensure that */
   342		for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
   343			if (!(event_info_shmem[i].output & 0x01))
   344				pmu_hw_event_map[i].event_idx = -ENOENT;
   345		}
   346	
   347		count = ARRAY_SIZE(pmu_hw_event_map);
   348	
   349		for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
   350			for (j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
   351				for (k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++) {
   352					if (!(event_info_shmem[count].output & 0x01))
   353						pmu_cache_event_map[i][j][k].event_idx = -ENOENT;
   354					count++;
   355				}
   356			}
   357		}
   358	
   359	free_mem:
   360		kfree(event_info_shmem);
   361	
   362		return result;
   363	}
   364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
