Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E7C346E6A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772178045; cv=none; b=KFqh7r3PtTb9XkHid+aDsAB24500ToNZDqWLqMGal1fPrN0DRmv8jTY9KzP3NGmdV0asXDV1tq1rG9FeQ7zF5DaHlsOsyd3j4PZDf5Y+HTiXr5FC9dnMVatH+cQcQL12Yzf3kfclTF4l1ly33cgbJkWRlM7wZb3K26fYN1lM9lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772178045; c=relaxed/simple;
	bh=ciJEDmN1nzAOuOj+SIIO0fEnC0QxiBhEB+dTHMB/2hc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k4M2Uc/Eev2h5bJiQfaZy9nubGta67fsuo0bnCXnBuKitA0ZOxCAu0TEv2vUansAoyF4MyifSw4OAd2/LOpinBHliRq6H1u7vjjx2U/F4FGpav0Aq2cHIuxTWXVovtX6GJkThXh/MHHi8nQwB0P+ISpqrHuKpIE0t+Mhnuc8dS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eg4zEaNp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eg4zEaNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772178043; x=1803714043;
  h=date:from:to:cc:subject:message-id;
  bh=ciJEDmN1nzAOuOj+SIIO0fEnC0QxiBhEB+dTHMB/2hc=;
  b=Eg4zEaNp/eLUlybqDQuzuzJjCYXhdayB8UVCwCAvk+l0zW1DhMzInwGV
   HdiXKvFoy+NSRQR44RwtTJ1u9vwBaqKbbeVjZtGqp7ylF2FuV3H/+aGIp
   hkZXPf+cJp1zOsDmpI+5YOf6DGfWTzaPCj5G7FVl5F4cNo2CDed5KA6Xi
   0H/z/qF/zKzznHcKCrjXxWMTE6bJYvstjfMud6RS8ifplN2EJGwda376B
   9tO1UW0DZW3ySWlcr/XSTyQMf7i3jUV5mFJBe7PsfmJArbcVj3T5wS+L6
   pNl0lYfvP6d1WHNETtxRQcM7uQ8RViDUOVM4GJlRiJzSR4+f2NCiogUqF
   A==;
X-CSE-ConnectionGUID: ojwVW8X7QByWtn2vg3AIXQ==
X-CSE-MsgGUID: F1QCf0+GRLKjQfzvnhRb6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83589022"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="83589022"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 23:40:42 -0800
X-CSE-ConnectionGUID: aiTFxb4aRjavciylOACufw==
X-CSE-MsgGUID: /roUFu4wRxiO86fmU/jFtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="216932927"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Feb 2026 23:40:42 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvsRt-00000000AKZ-1xr0;
	Fri, 27 Feb 2026 07:40:05 +0000
Date: Fri, 27 Feb 2026 15:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Lili Li <lili.li@intel.com>
Subject: [acrn:6.17/linux 51/3102]
 arch/x86/events/intel/ds.c:2881:24: warning: cast from pointer to integer of
 different size
Message-ID: <202602271552.8NPMraId-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dapeng,

FYI, the error/warning still remains.

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   eac6d3b7a20ffb9d3102dbdc152241a7184a63cd
commit: 67977912bebfec14bf4c0ced6c01df309725fc8d [51/3102] perf/x86/intel: Process arch-PEBS records or record fragments
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260227/202602271552.8NPMraId-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271552.8NPMraId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271552.8NPMraId-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/events/intel/ds.c: In function 'intel_pmu_drain_arch_pebs':
>> arch/x86/events/intel/ds.c:2881:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    2881 |         top = (void *)((u64)cpuc->ds_pebs_vaddr +
         |                        ^
>> arch/x86/events/intel/ds.c:2881:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2881 |         top = (void *)((u64)cpuc->ds_pebs_vaddr +
         |               ^


vim +2881 arch/x86/events/intel/ds.c

  2860	
  2861	static void intel_pmu_drain_arch_pebs(struct pt_regs *iregs,
  2862					      struct perf_sample_data *data)
  2863	{
  2864		short counts[INTEL_PMC_IDX_FIXED + MAX_FIXED_PEBS_EVENTS] = {};
  2865		void *last[INTEL_PMC_IDX_FIXED + MAX_FIXED_PEBS_EVENTS];
  2866		struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
  2867		union arch_pebs_index index;
  2868		struct x86_perf_regs perf_regs;
  2869		struct pt_regs *regs = &perf_regs.regs;
  2870		void *base, *at, *top;
  2871		u64 mask;
  2872	
  2873		rdmsrq(MSR_IA32_PEBS_INDEX, index.full);
  2874	
  2875		if (unlikely(!index.split.wr)) {
  2876			intel_pmu_pebs_event_update_no_drain(cpuc, X86_PMC_IDX_MAX);
  2877			return;
  2878		}
  2879	
  2880		base = cpuc->ds_pebs_vaddr;
> 2881		top = (void *)((u64)cpuc->ds_pebs_vaddr +
  2882			       (index.split.wr << ARCH_PEBS_INDEX_WR_SHIFT));
  2883	
  2884		mask = hybrid(cpuc->pmu, arch_pebs_cap).counters & cpuc->pebs_enabled;
  2885	
  2886		if (!iregs)
  2887			iregs = &dummy_iregs;
  2888	
  2889		/* Process all but the last event for each counter. */
  2890		for (at = base; at < top;) {
  2891			struct arch_pebs_header *header;
  2892			struct arch_pebs_basic *basic;
  2893			u64 pebs_status;
  2894	
  2895			header = at;
  2896	
  2897			if (WARN_ON_ONCE(!header->size))
  2898				break;
  2899	
  2900			/* 1st fragment or single record must have basic group */
  2901			if (!header->basic) {
  2902				at += header->size;
  2903				continue;
  2904			}
  2905	
  2906			basic = at + sizeof(struct arch_pebs_header);
  2907			pebs_status = mask & basic->applicable_counters;
  2908			__intel_pmu_handle_pebs_record(iregs, regs, data, at,
  2909						       pebs_status, counts, last,
  2910						       setup_arch_pebs_sample_data);
  2911	
  2912			/* Skip non-last fragments */
  2913			while (arch_pebs_record_continued(header)) {
  2914				if (!header->size)
  2915					break;
  2916				at += header->size;
  2917				header = at;
  2918			}
  2919	
  2920			/* Skip last fragment or the single record */
  2921			at += header->size;
  2922		}
  2923	
  2924		__intel_pmu_handle_last_pebs_record(iregs, regs, data, mask, counts,
  2925						    last, setup_arch_pebs_sample_data);
  2926	
  2927		index.split.wr = 0;
  2928		index.split.full = 0;
  2929		wrmsrq(MSR_IA32_PEBS_INDEX, index.full);
  2930	}
  2931	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
