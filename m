Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4654140E38
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 19:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732736405; cv=none; b=n99HtA7WwrdFw4dklLFzHpFeVsRTKHUlUXd+denGHjDLTNL1gB7ZgXogjfl2zxjSgEAdach3JjuxbJ1zo9DroWDWV50oEAlJXPvHp0F5Pt3xFH2+v5HA+ccubvbLD/QNBuvgnBMWqEiWwx/M6VHe6xXs4HxF0ez+YgNORnvp++c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732736405; c=relaxed/simple;
	bh=cCKIHQrMDJ/pXUMuJ6eqyJidHYA/9nxuxHXf+V/EIzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ThMiAqHQOhZ6Is/gf631tV3+fHMmIuYpDkUTd8Adr7VAqXv6ITh0tb2fMpegXzj6K93GnqempD9lhEYDXASynxUZHaWJlDCVOnxMOo3ZzAVUoBr6CTmkB1HmCuvhDZg9lON1HFzO64i8r7A19L6WtHAjJ5Zj0gMGTMzWXxml57A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwdO6BKw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwdO6BKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732736404; x=1764272404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cCKIHQrMDJ/pXUMuJ6eqyJidHYA/9nxuxHXf+V/EIzw=;
  b=TwdO6BKwhSxYHUekkNKhcaFGKX3MMtM9qHmTtByaKo6pgMMSw28OU+D9
   Cjr/Y9jIuTPqfNPZ/D6XsoCepk24YtSJ7cMcF4sUk6TI9ToDAYBzpNvbG
   MZ73KG68vCad95WtNLW4FcLmGl32ZQD7Cji7o+qmjVCD/jUamiOVQA6xF
   Mmu6YPfiElcOMHtSbVpXa393Upe7664PC6biHMyhPsyALKxQ7VpEzk5B+
   CQse/w0JjY3G9OV6L43zgNoJwyVJBAjml65nXSj+3j306EYg8/L0xz97y
   H8ka51bMzl/7iCHD+Cr/qWWhh0csA2E1l5j9iKkNAV79Hcx5NdtCV7WcC
   Q==;
X-CSE-ConnectionGUID: hGxdAU4rSiu2MK4wMMpwpQ==
X-CSE-MsgGUID: 0mRtVg+uSC6VrVPxmYG7Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32891979"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="32891979"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 11:40:03 -0800
X-CSE-ConnectionGUID: zmhunJb5Sp+dJdxXMBaWoA==
X-CSE-MsgGUID: hkF6NyqXRVmFM60b993+eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="92349343"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Nov 2024 11:40:01 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGNtH-0008J9-0L;
	Wed, 27 Nov 2024 19:39:59 +0000
Date: Thu, 28 Nov 2024 03:39:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Junhao He <hejunhao3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1532/1532] drivers/perf/arm_pmuv3.c:902:20:
 warning: stack frame size (2112) exceeds limit (2048) in
 'armv8pmu_handle_irq'
Message-ID: <202411280328.NxDLQwcX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e64d5ad244c9a8a62e31ee8e6e2e02e01226aa4d
commit: 6c6848e7e00cdff4e22650bd2d5658a9e5c23b1d [1532/1532] drivers: perf: arm_pmuv3: Enable branch stack sampling via FEAT_BRBE
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241128/202411280328.NxDLQwcX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280328.NxDLQwcX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280328.NxDLQwcX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/perf/arm_pmuv3.c:17:
   In file included from include/linux/acpi.h:37:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2243:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/perf/arm_pmuv3.c:902:20: warning: stack frame size (2112) exceeds limit (2048) in 'armv8pmu_handle_irq' [-Wframe-larger-than]
     902 | static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
         |                    ^
   6 warnings generated.


vim +/armv8pmu_handle_irq +902 drivers/perf/arm_pmuv3.c

6c6848e7e00cdff drivers/perf/arm_pmuv3.c       Anshuman Khandual 2024-06-13  901  
0788f1e97324d83 arch/arm64/kernel/perf_event.c Mark Rutland      2018-05-10 @902  static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  903  {
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  904  	u32 pmovsr;
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  905  	struct perf_sample_data data;
6475b2d846176e3 arch/arm64/kernel/perf_event.c Mark Rutland      2015-10-02  906  	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  907  	struct pt_regs *regs;
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  908  	int idx;
6c6848e7e00cdff drivers/perf/arm_pmuv3.c       Anshuman Khandual 2024-06-13  909  	bool branch_captured = false;
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  910  
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  911  	/*
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  912  	 * Get and reset the IRQ flags
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  913  	 */
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  914  	pmovsr = armv8pmu_getreset_flags();
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  915  
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  916  	/*
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  917  	 * Did an overflow occur?
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  918  	 */
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  919  	if (!armv8pmu_has_overflowed(pmovsr))
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  920  		return IRQ_NONE;
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  921  
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  922  	/*
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  923  	 * Handle the counter(s) overflow(s)
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  924  	 */
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  925  	regs = get_irq_regs();
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  926  
3cce50dfec4a5b0 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  927  	/*
3cce50dfec4a5b0 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  928  	 * Stop the PMU while processing the counter overflows
3cce50dfec4a5b0 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  929  	 * to prevent skews in group events.
3cce50dfec4a5b0 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  930  	 */
3cce50dfec4a5b0 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  931  	armv8pmu_stop(cpu_pmu);
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  932  	for (idx = 0; idx < cpu_pmu->num_events; ++idx) {
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  933  		struct perf_event *event = cpuc->events[idx];
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  934  		struct hw_perf_event *hwc;
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  935  
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  936  		/* Ignore if we don't have an event. */
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  937  		if (!event)
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  938  			continue;
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  939  
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  940  		/*
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  941  		 * We have a single interrupt for all counters. Check that
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  942  		 * each counter has overflowed before we process it.
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  943  		 */
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  944  		if (!armv8pmu_counter_has_overflowed(pmovsr, idx))
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  945  			continue;
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  946  
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  947  		hwc = &event->hw;
6475b2d846176e3 arch/arm64/kernel/perf_event.c Mark Rutland      2015-10-02  948  		armpmu_event_update(event);
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  949  		perf_sample_data_init(&data, 0, hwc->last_period);
6475b2d846176e3 arch/arm64/kernel/perf_event.c Mark Rutland      2015-10-02  950  		if (!armpmu_event_set_period(event))
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  951  			continue;
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  952  
6c6848e7e00cdff drivers/perf/arm_pmuv3.c       Anshuman Khandual 2024-06-13  953  		/*
6c6848e7e00cdff drivers/perf/arm_pmuv3.c       Anshuman Khandual 2024-06-13  954  		 * PMU IRQ should remain asserted until all branch records
6c6848e7e00cdff drivers/perf/arm_pmuv3.c       Anshuman Khandual 2024-06-13  955  		 * are captured and processed into struct perf_sample_data.
6c6848e7e00cdff drivers/perf/arm_pmuv3.c       Anshuman Khandual 2024-06-13  956  		 */
6c6848e7e00cdff drivers/perf/arm_pmuv3.c       Anshuman Khandual 2024-06-13  957  		if (has_branch_stack(event) && cpu_pmu->has_branch_stack)
6c6848e7e00cdff drivers/perf/arm_pmuv3.c       Anshuman Khandual 2024-06-13  958  			read_branch_records(cpuc, event, &data, &branch_captured);
6c6848e7e00cdff drivers/perf/arm_pmuv3.c       Anshuman Khandual 2024-06-13  959  
05ab72813340d11 arch/arm64/kernel/perf_event.c Julien Thierry    2020-09-24  960  		/*
05ab72813340d11 arch/arm64/kernel/perf_event.c Julien Thierry    2020-09-24  961  		 * Perf event overflow will queue the processing of the event as
05ab72813340d11 arch/arm64/kernel/perf_event.c Julien Thierry    2020-09-24  962  		 * an irq_work which will be taken care of in the handling of
05ab72813340d11 arch/arm64/kernel/perf_event.c Julien Thierry    2020-09-24  963  		 * IPI_IRQ_WORK.
05ab72813340d11 arch/arm64/kernel/perf_event.c Julien Thierry    2020-09-24  964  		 */
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  965  		if (perf_event_overflow(event, &data, regs))
6475b2d846176e3 arch/arm64/kernel/perf_event.c Mark Rutland      2015-10-02  966  			cpu_pmu->disable(event);
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  967  	}
3cce50dfec4a5b0 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  968  	armv8pmu_start(cpu_pmu);
6c6848e7e00cdff drivers/perf/arm_pmuv3.c       Anshuman Khandual 2024-06-13  969  	if (cpu_pmu->has_branch_stack)
6c6848e7e00cdff drivers/perf/arm_pmuv3.c       Anshuman Khandual 2024-06-13  970  		armv8pmu_branch_stack_reset();
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  971  
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  972  	return IRQ_HANDLED;
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  973  }
030896885ade0a1 arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  974  

:::::: The code at line 902 was first introduced by commit
:::::: 0788f1e97324d8378e860dc2560699ddc6f3aef9 arm_pmu: simplify arm_pmu::handle_irq

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
