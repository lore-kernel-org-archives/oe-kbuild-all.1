Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D318FDC5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738227071; cv=none; b=jv8An6SpTphyZkGMVbG9WdYqB5Oayr7QqCnCNtbi12/Pk43Uq1dBmsVlHRJ9RruAUIusb9nSnuNvOivziJy+a+lJLB67t3CSNSoShZOVeoix3ny3HCR7dA+B7o5ZItSWrxzyU6zsM9wtqVvM6tp3106PhWtg5O7jYWFEzQqtTB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738227071; c=relaxed/simple;
	bh=CUJcxBgGceNzhmv8vOHclPs8NL4vLrO55MPTD6lZTZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tBeSrVUcJxCaxre8fujXH4UXY29bv0t8IcH+LLQ6iaizwEMkZ+kBvVASmgf1j0t69anz1oIeY0U/lqJb8qWjR9OW09oAj+4PRlfzDlRmVgBpxv02ZVLpt4Rgfz1QbScl1f/9pQiaz21nKMHL7r9emmu6JTA8lTHFltpkZy8v+bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGXgvFEG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGXgvFEG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738227069; x=1769763069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CUJcxBgGceNzhmv8vOHclPs8NL4vLrO55MPTD6lZTZ0=;
  b=nGXgvFEGjWB/+u1Y6dy6EsdepsZ6J/nXJfTFdl90eJJtgWaByiW1v6lR
   0ooqOIIHQhzViHHwI27r7BhidaLAt3l7azFUb95UkLJA1GjnqVM4CC4HL
   fcTbgKbVZGcdwU9L46cMrqVWpAA46JbadozdGPaJBQEuFTHYQ1iohClsf
   DeM7/Y4hj/aZIsWmdmYELWNtoq7/WXjNGxjAqiZBXdjt1PCUqizT6PHPe
   zJLvz6t6+OEX/Y/1mAD1uyJx+QVkoSRIjTIYQO6fGD/Hacat+jFixK6hJ
   datK56RFe68kmEF2mSGV4MrZLSWRQFRcYIYYqy4w92BkXDoBb0c+iaCbf
   w==;
X-CSE-ConnectionGUID: vCCS+YXWQOmfVyOEetJJdA==
X-CSE-MsgGUID: VmTnRM2BSAO9yBpvlIbtBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38467162"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="38467162"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 00:51:08 -0800
X-CSE-ConnectionGUID: 6Sq5FBwbTnaBxc4K/+Smyg==
X-CSE-MsgGUID: 5mUPbaW9TryKTTU+ZKWmnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="109244217"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Jan 2025 00:51:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdQGP-000jrT-0L;
	Thu, 30 Jan 2025 08:51:05 +0000
Date: Thu, 30 Jan 2025 16:50:41 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <Atish.Patra@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [atishp04:b4/counter_delegation_v3 16/22]
 drivers/perf/riscv_pmu_dev.c:1194:45: warning: variable 'i' is uninitialized
 when used here
Message-ID: <202501301604.jDgQ7Vv2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux b4/counter_delegation_v3
head:   51fa9cf28f8d038310cb18174404f215950bd849
commit: d95e3d662675c69024bdc5f40f34e6418f16b264 [16/22] RISC-V: perf: Skip PMU SBI extension when not implemented
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250130/202501301604.jDgQ7Vv2-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301604.jDgQ7Vv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301604.jDgQ7Vv2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/perf/riscv_pmu_dev.c:14:
   In file included from include/linux/perf/riscv_pmu.h:12:
   In file included from include/linux/perf_event.h:50:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2224:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/perf/riscv_pmu_dev.c:1194:45: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
    1194 |                 ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
         |                                                           ^
   drivers/perf/riscv_pmu_dev.c:1182:16: note: initialize the variable 'i' to silence this warning
    1182 |         int idx = 0, i;
         |                       ^
         |                        = 0
   drivers/perf/riscv_pmu_dev.c:1528:6: warning: variable 'config1' set but not used [-Wunused-but-set-variable]
    1528 |         u64 config1;
         |             ^
   5 warnings generated.


vim +/i +1194 drivers/perf/riscv_pmu_dev.c

a8625217a054ca0 drivers/perf/riscv_pmu_sbi.c Atish Patra 2024-04-20  1173  
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1174  /*
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1175   * This function starts all the used counters in two step approach.
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1176   * Any counter that did not overflow can be start in a single step
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1177   * while the overflowed counters need to be started with updated initialization
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1178   * value.
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1179   */
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1180  static void rvpmu_start_overflow_mask(struct riscv_pmu *pmu, u64 ctr_ovf_mask)
a8625217a054ca0 drivers/perf/riscv_pmu_sbi.c Atish Patra 2024-04-20  1181  {
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1182  	int idx = 0, i;
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1183  	struct perf_event *event;
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1184  	unsigned long ctr_start_mask = 0;
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1185  	u64 max_period, init_val = 0;
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1186  	struct hw_perf_event *hwc;
a8625217a054ca0 drivers/perf/riscv_pmu_sbi.c Atish Patra 2024-04-20  1187  	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
a8625217a054ca0 drivers/perf/riscv_pmu_sbi.c Atish Patra 2024-04-20  1188  
a8625217a054ca0 drivers/perf/riscv_pmu_sbi.c Atish Patra 2024-04-20  1189  	if (sbi_pmu_snapshot_available())
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1190  		return rvpmu_sbi_start_ovf_ctrs_snapshot(cpu_hw_evt, ctr_ovf_mask);
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1191  
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1192  	/* Start all the counters that did not overflow */
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1193  	if (riscv_pmu_cdeleg_available()) {
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12 @1194  		ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1195  		rvpmu_deleg_ctr_start_mask(ctr_start_mask);
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1196  	} else {
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1197  		for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1198  			ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1199  			/* Start all the counters that did not overflow in a single shot */
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1200  			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG,
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1201  				  ctr_start_mask, 0, 0, 0, 0);
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1202  		}
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1203  	}
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1204  
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1205  	/* Reinitialize and start all the counter that overflowed */
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1206  	while (ctr_ovf_mask) {
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1207  		if (ctr_ovf_mask & 0x01) {
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1208  			event = cpu_hw_evt->events[idx];
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1209  			hwc = &event->hw;
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1210  			max_period = riscv_pmu_ctr_get_width_mask(event);
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1211  			init_val = local64_read(&hwc->prev_count) & max_period;
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1212  			if (riscv_pmu_cdeleg_available())
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1213  				rvpmu_deleg_ctr_start(event, init_val);
a8625217a054ca0 drivers/perf/riscv_pmu_sbi.c Atish Patra 2024-04-20  1214  			else
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1215  				rvpmu_sbi_ctr_start(event, init_val);
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1216  			perf_event_update_userpage(event);
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1217  		}
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1218  		ctr_ovf_mask = ctr_ovf_mask >> 1;
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1219  		idx++;
52c1ae45af56866 drivers/perf/riscv_pmu_dev.c Atish Patra 2023-10-12  1220  	}
a8625217a054ca0 drivers/perf/riscv_pmu_sbi.c Atish Patra 2024-04-20  1221  }
a8625217a054ca0 drivers/perf/riscv_pmu_sbi.c Atish Patra 2024-04-20  1222  

:::::: The code at line 1194 was first introduced by commit
:::::: 52c1ae45af56866443933e04f111ece0cce1273c RISC-V: perf: Implement supervisor counter delegation support

:::::: TO: Atish Patra <atishp@rivosinc.com>
:::::: CC: Atish Patra <atishp@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
