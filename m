Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C294F84A35
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754568100; cv=none; b=EnS5a4kjEi8OPW5M66VdSbH+BcEB3nL3SCiQlqH5GjERU15Y7RhDBUSHQJLfGsrxihMbwfpEeqWOGQcvJuXlXskmFnfkfJdRuT2k4Dsswt14WriHiynWFvf7o3dUt+ymuI0sMkrS4svvuCOf5M4UuTXumYIb7Dyhrdc4h0l2UII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754568100; c=relaxed/simple;
	bh=Y9N2iUc1B8OWUO3Ty1lwe5dfsgSYHsbWilE2SagIXVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9W9oGc7d2QPqfgf11PMIeu6BqqkF8MQgl40rC9BFLRQn8OMCfGIGRFONGPKKkFrgUj3xQDRbX/04shk56jI1uJivy6GxsiR47Hf0eyApJkIpbd7wqeuhzNu5Q6CZa37tOMcLMiaaGAgzLOQgYAOVDjj8Rf2qPUXIrY1ARmAi3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxiDRLiv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxiDRLiv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754568098; x=1786104098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y9N2iUc1B8OWUO3Ty1lwe5dfsgSYHsbWilE2SagIXVQ=;
  b=VxiDRLiv9HOVbmpM1ShMLBLeVKCdyAu89jaCkxmj6fDCVTaSQ88fAx5m
   /BsmwBa2TGv7kqBHvA3JteUP5O7yFKHpXSugdJMvBtCOIN09/9OrGtsXS
   ES/M+SPR4JBHPRL18D/aG8EmuTCc6NtfiX6TN0ONxaZjrpwgsGmCqo9Aw
   mw3pJvFWBkTio5aIXnFBOVgk1FndTIRryOvyMSFrSWFhbF6rdjO0e62wm
   WVhlDG7MgkrftQZkuIIsiJyVTKmQNYaAA3t+WaadlUhbKh9JZYpjCq86e
   z8l4IreWb7IktrtPNWzpAsaxCZxHsudm9wvk1jQjX1XSAC7nTnTThwTQY
   Q==;
X-CSE-ConnectionGUID: 0q6JyxfWTjqCVBILx79bqw==
X-CSE-MsgGUID: 1F1v7CilSJ60eimlt5ergg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56978130"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56978130"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 05:01:36 -0700
X-CSE-ConnectionGUID: NJ/pQ1YlTtK6dZznkqcuLQ==
X-CSE-MsgGUID: R3Bq+mZTTA6jF1J8od+SOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169250072"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Aug 2025 05:01:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujzJM-0002kX-0r;
	Thu, 07 Aug 2025 12:01:32 +0000
Date: Thu, 7 Aug 2025 20:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-perf-core-ANBZ23411 2/2]
 arch/x86/events/intel/core.c:6594:17: error: implicit declaration of
 function 'intel_pmu_init_skt'; did you mean 'intel_pmu_init_grt'?
Message-ID: <202508071928.BkI6mrOD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-perf-core-ANBZ23411
head:   30b511400744ea5caad66f7e3d928df1baf80193
commit: 30b511400744ea5caad66f7e3d928df1baf80193 [2/2] perf/x86/intel: Add PMU support for Clearwater Forest
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250807/202508071928.BkI6mrOD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071928.BkI6mrOD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071928.BkI6mrOD-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/events/intel/core.c: In function 'intel_pmu_init':
>> arch/x86/events/intel/core.c:6594:17: error: implicit declaration of function 'intel_pmu_init_skt'; did you mean 'intel_pmu_init_grt'? [-Werror=implicit-function-declaration]
    6594 |                 intel_pmu_init_skt(NULL);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 intel_pmu_init_grt
>> arch/x86/events/intel/core.c:6596:45: error: 'cmt_latency_data' undeclared (first use in this function); did you mean 'mtl_latency_data_small'?
    6596 |                 x86_pmu.pebs_latency_data = cmt_latency_data;
         |                                             ^~~~~~~~~~~~~~~~
         |                                             mtl_latency_data_small
   arch/x86/events/intel/core.c:6596:45: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +6594 arch/x86/events/intel/core.c

  6289	
  6290	__init int intel_pmu_init(void)
  6291	{
  6292		struct attribute **extra_skl_attr = &empty_attrs;
  6293		struct attribute **extra_attr = &empty_attrs;
  6294		struct attribute **td_attr    = &empty_attrs;
  6295		struct attribute **mem_attr   = &empty_attrs;
  6296		struct attribute **tsx_attr   = &empty_attrs;
  6297		union cpuid10_edx edx;
  6298		union cpuid10_eax eax;
  6299		union cpuid10_ebx ebx;
  6300		unsigned int fixed_mask;
  6301		bool pmem = false;
  6302		int version, i;
  6303		char *name;
  6304		struct x86_hybrid_pmu *pmu;
  6305	
  6306		if (!cpu_has(&boot_cpu_data, X86_FEATURE_ARCH_PERFMON)) {
  6307			switch (boot_cpu_data.x86) {
  6308			case 0x6:
  6309				return p6_pmu_init();
  6310			case 0xb:
  6311				return knc_pmu_init();
  6312			case 0xf:
  6313				return p4_pmu_init();
  6314			}
  6315			return -ENODEV;
  6316		}
  6317	
  6318		/*
  6319		 * Check whether the Architectural PerfMon supports
  6320		 * Branch Misses Retired hw_event or not.
  6321		 */
  6322		cpuid(10, &eax.full, &ebx.full, &fixed_mask, &edx.full);
  6323		if (eax.split.mask_length < ARCH_PERFMON_EVENTS_COUNT)
  6324			return -ENODEV;
  6325	
  6326		version = eax.split.version_id;
  6327		if (version < 2)
  6328			x86_pmu = core_pmu;
  6329		else
  6330			x86_pmu = intel_pmu;
  6331	
  6332		x86_pmu.version			= version;
  6333		x86_pmu.num_counters		= eax.split.num_counters;
  6334		x86_pmu.cntval_bits		= eax.split.bit_width;
  6335		x86_pmu.cntval_mask		= (1ULL << eax.split.bit_width) - 1;
  6336	
  6337		x86_pmu.events_maskl		= ebx.full;
  6338		x86_pmu.events_mask_len		= eax.split.mask_length;
  6339	
  6340		x86_pmu.max_pebs_events		= min_t(unsigned, MAX_PEBS_EVENTS, x86_pmu.num_counters);
  6341		x86_pmu.pebs_capable		= PEBS_COUNTER_MASK;
  6342	
  6343		/*
  6344		 * Quirk: v2 perfmon does not report fixed-purpose events, so
  6345		 * assume at least 3 events, when not running in a hypervisor:
  6346		 */
  6347		if (version > 1 && version < 5) {
  6348			int assume = 3 * !boot_cpu_has(X86_FEATURE_HYPERVISOR);
  6349	
  6350			x86_pmu.num_counters_fixed =
  6351				max((int)edx.split.num_counters_fixed, assume);
  6352	
  6353			fixed_mask = (1L << x86_pmu.num_counters_fixed) - 1;
  6354		} else if (version >= 5)
  6355			x86_pmu.num_counters_fixed = fls(fixed_mask);
  6356	
  6357		if (boot_cpu_has(X86_FEATURE_PDCM)) {
  6358			u64 capabilities;
  6359	
  6360			rdmsrl(MSR_IA32_PERF_CAPABILITIES, capabilities);
  6361			x86_pmu.intel_cap.capabilities = capabilities;
  6362		}
  6363	
  6364		if (x86_pmu.intel_cap.lbr_format == LBR_FORMAT_32) {
  6365			x86_pmu.lbr_reset = intel_pmu_lbr_reset_32;
  6366			x86_pmu.lbr_read = intel_pmu_lbr_read_32;
  6367		}
  6368	
  6369		if (boot_cpu_has(X86_FEATURE_ARCH_LBR))
  6370			intel_pmu_arch_lbr_init();
  6371	
  6372		intel_ds_init();
  6373	
  6374		x86_add_quirk(intel_arch_events_quirk); /* Install first, so it runs last */
  6375	
  6376		if (version >= 5) {
  6377			x86_pmu.intel_cap.anythread_deprecated = edx.split.anythread_deprecated;
  6378			if (x86_pmu.intel_cap.anythread_deprecated)
  6379				pr_cont(" AnyThread deprecated, ");
  6380		}
  6381	
  6382		/*
  6383		 * Install the hw-cache-events table:
  6384		 */
  6385		switch (boot_cpu_data.x86_vfm) {
  6386		case INTEL_CORE_YONAH:
  6387			pr_cont("Core events, ");
  6388			name = "core";
  6389			break;
  6390	
  6391		case INTEL_CORE2_MEROM:
  6392			x86_add_quirk(intel_clovertown_quirk);
  6393			fallthrough;
  6394	
  6395		case INTEL_CORE2_MEROM_L:
  6396		case INTEL_CORE2_PENRYN:
  6397		case INTEL_CORE2_DUNNINGTON:
  6398			memcpy(hw_cache_event_ids, core2_hw_cache_event_ids,
  6399			       sizeof(hw_cache_event_ids));
  6400	
  6401			intel_pmu_lbr_init_core();
  6402	
  6403			x86_pmu.event_constraints = intel_core2_event_constraints;
  6404			x86_pmu.pebs_constraints = intel_core2_pebs_event_constraints;
  6405			pr_cont("Core2 events, ");
  6406			name = "core2";
  6407			break;
  6408	
  6409		case INTEL_NEHALEM:
  6410		case INTEL_NEHALEM_EP:
  6411		case INTEL_NEHALEM_EX:
  6412			memcpy(hw_cache_event_ids, nehalem_hw_cache_event_ids,
  6413			       sizeof(hw_cache_event_ids));
  6414			memcpy(hw_cache_extra_regs, nehalem_hw_cache_extra_regs,
  6415			       sizeof(hw_cache_extra_regs));
  6416	
  6417			intel_pmu_lbr_init_nhm();
  6418	
  6419			x86_pmu.event_constraints = intel_nehalem_event_constraints;
  6420			x86_pmu.pebs_constraints = intel_nehalem_pebs_event_constraints;
  6421			x86_pmu.enable_all = intel_pmu_nhm_enable_all;
  6422			x86_pmu.extra_regs = intel_nehalem_extra_regs;
  6423			x86_pmu.limit_period = nhm_limit_period;
  6424	
  6425			mem_attr = nhm_mem_events_attrs;
  6426	
  6427			/* UOPS_ISSUED.STALLED_CYCLES */
  6428			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] =
  6429				X86_CONFIG(.event=0x0e, .umask=0x01, .inv=1, .cmask=1);
  6430			/* UOPS_EXECUTED.CORE_ACTIVE_CYCLES,c=1,i=1 */
  6431			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_BACKEND] =
  6432				X86_CONFIG(.event=0xb1, .umask=0x3f, .inv=1, .cmask=1);
  6433	
  6434			intel_pmu_pebs_data_source_nhm();
  6435			x86_add_quirk(intel_nehalem_quirk);
  6436			x86_pmu.pebs_no_tlb = 1;
  6437			extra_attr = nhm_format_attr;
  6438	
  6439			pr_cont("Nehalem events, ");
  6440			name = "nehalem";
  6441			break;
  6442	
  6443		case INTEL_ATOM_BONNELL:
  6444		case INTEL_ATOM_BONNELL_MID:
  6445		case INTEL_ATOM_SALTWELL:
  6446		case INTEL_ATOM_SALTWELL_MID:
  6447		case INTEL_ATOM_SALTWELL_TABLET:
  6448			memcpy(hw_cache_event_ids, atom_hw_cache_event_ids,
  6449			       sizeof(hw_cache_event_ids));
  6450	
  6451			intel_pmu_lbr_init_atom();
  6452	
  6453			x86_pmu.event_constraints = intel_gen_event_constraints;
  6454			x86_pmu.pebs_constraints = intel_atom_pebs_event_constraints;
  6455			x86_pmu.pebs_aliases = intel_pebs_aliases_core2;
  6456			pr_cont("Atom events, ");
  6457			name = "bonnell";
  6458			break;
  6459	
  6460		case INTEL_ATOM_SILVERMONT:
  6461		case INTEL_ATOM_SILVERMONT_D:
  6462		case INTEL_ATOM_SILVERMONT_MID:
  6463		case INTEL_ATOM_AIRMONT:
  6464		case INTEL_ATOM_AIRMONT_MID:
  6465			memcpy(hw_cache_event_ids, slm_hw_cache_event_ids,
  6466				sizeof(hw_cache_event_ids));
  6467			memcpy(hw_cache_extra_regs, slm_hw_cache_extra_regs,
  6468			       sizeof(hw_cache_extra_regs));
  6469	
  6470			intel_pmu_lbr_init_slm();
  6471	
  6472			x86_pmu.event_constraints = intel_slm_event_constraints;
  6473			x86_pmu.pebs_constraints = intel_slm_pebs_event_constraints;
  6474			x86_pmu.extra_regs = intel_slm_extra_regs;
  6475			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6476			td_attr = slm_events_attrs;
  6477			extra_attr = slm_format_attr;
  6478			pr_cont("Silvermont events, ");
  6479			name = "silvermont";
  6480			break;
  6481	
  6482		case INTEL_ATOM_GOLDMONT:
  6483		case INTEL_ATOM_GOLDMONT_D:
  6484			memcpy(hw_cache_event_ids, glm_hw_cache_event_ids,
  6485			       sizeof(hw_cache_event_ids));
  6486			memcpy(hw_cache_extra_regs, glm_hw_cache_extra_regs,
  6487			       sizeof(hw_cache_extra_regs));
  6488	
  6489			intel_pmu_lbr_init_skl();
  6490	
  6491			x86_pmu.event_constraints = intel_slm_event_constraints;
  6492			x86_pmu.pebs_constraints = intel_glm_pebs_event_constraints;
  6493			x86_pmu.extra_regs = intel_glm_extra_regs;
  6494			/*
  6495			 * It's recommended to use CPU_CLK_UNHALTED.CORE_P + NPEBS
  6496			 * for precise cycles.
  6497			 * :pp is identical to :ppp
  6498			 */
  6499			x86_pmu.pebs_aliases = NULL;
  6500			x86_pmu.pebs_prec_dist = true;
  6501			x86_pmu.lbr_pt_coexist = true;
  6502			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6503			td_attr = glm_events_attrs;
  6504			extra_attr = slm_format_attr;
  6505			pr_cont("Goldmont events, ");
  6506			name = "goldmont";
  6507			break;
  6508	
  6509		case INTEL_ATOM_GOLDMONT_PLUS:
  6510			memcpy(hw_cache_event_ids, glp_hw_cache_event_ids,
  6511			       sizeof(hw_cache_event_ids));
  6512			memcpy(hw_cache_extra_regs, glp_hw_cache_extra_regs,
  6513			       sizeof(hw_cache_extra_regs));
  6514	
  6515			intel_pmu_lbr_init_skl();
  6516	
  6517			x86_pmu.event_constraints = intel_slm_event_constraints;
  6518			x86_pmu.extra_regs = intel_glm_extra_regs;
  6519			/*
  6520			 * It's recommended to use CPU_CLK_UNHALTED.CORE_P + NPEBS
  6521			 * for precise cycles.
  6522			 */
  6523			x86_pmu.pebs_aliases = NULL;
  6524			x86_pmu.pebs_prec_dist = true;
  6525			x86_pmu.lbr_pt_coexist = true;
  6526			x86_pmu.pebs_capable = ~0ULL;
  6527			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6528			x86_pmu.flags |= PMU_FL_PEBS_ALL;
  6529			x86_pmu.get_event_constraints = glp_get_event_constraints;
  6530			td_attr = glm_events_attrs;
  6531			/* Goldmont Plus has 4-wide pipeline */
  6532			event_attr_td_total_slots_scale_glm.event_str = "4";
  6533			extra_attr = slm_format_attr;
  6534			pr_cont("Goldmont plus events, ");
  6535			name = "goldmont_plus";
  6536			break;
  6537	
  6538		case INTEL_ATOM_TREMONT_D:
  6539		case INTEL_ATOM_TREMONT:
  6540		case INTEL_ATOM_TREMONT_L:
  6541			x86_pmu.late_ack = true;
  6542			memcpy(hw_cache_event_ids, glp_hw_cache_event_ids,
  6543			       sizeof(hw_cache_event_ids));
  6544			memcpy(hw_cache_extra_regs, tnt_hw_cache_extra_regs,
  6545			       sizeof(hw_cache_extra_regs));
  6546			hw_cache_event_ids[C(ITLB)][C(OP_READ)][C(RESULT_ACCESS)] = -1;
  6547	
  6548			intel_pmu_lbr_init_skl();
  6549	
  6550			x86_pmu.event_constraints = intel_slm_event_constraints;
  6551			x86_pmu.extra_regs = intel_tnt_extra_regs;
  6552			/*
  6553			 * It's recommended to use CPU_CLK_UNHALTED.CORE_P + NPEBS
  6554			 * for precise cycles.
  6555			 */
  6556			x86_pmu.pebs_aliases = NULL;
  6557			x86_pmu.pebs_prec_dist = true;
  6558			x86_pmu.lbr_pt_coexist = true;
  6559			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6560			x86_pmu.get_event_constraints = tnt_get_event_constraints;
  6561			td_attr = tnt_events_attrs;
  6562			extra_attr = slm_format_attr;
  6563			pr_cont("Tremont events, ");
  6564			name = "Tremont";
  6565			break;
  6566	
  6567		case INTEL_ATOM_GRACEMONT:
  6568			intel_pmu_init_grt(NULL);
  6569			intel_pmu_pebs_data_source_grt();
  6570			x86_pmu.pebs_latency_data = adl_latency_data_small;
  6571			x86_pmu.get_event_constraints = tnt_get_event_constraints;
  6572			td_attr = tnt_events_attrs;
  6573			mem_attr = grt_mem_attrs;
  6574			extra_attr = nhm_format_attr;
  6575			pr_cont("Gracemont events, ");
  6576			name = "gracemont";
  6577			break;
  6578	
  6579		case INTEL_ATOM_CRESTMONT:
  6580		case INTEL_ATOM_CRESTMONT_X:
  6581			intel_pmu_init_grt(NULL);
  6582			x86_pmu.extra_regs = intel_cmt_extra_regs;
  6583			intel_pmu_pebs_data_source_cmt();
  6584			x86_pmu.pebs_latency_data = mtl_latency_data_small;
  6585			x86_pmu.get_event_constraints = cmt_get_event_constraints;
  6586			td_attr = cmt_events_attrs;
  6587			mem_attr = grt_mem_attrs;
  6588			extra_attr = cmt_format_attr;
  6589			pr_cont("Crestmont events, ");
  6590			name = "crestmont";
  6591			break;
  6592	
  6593		case INTEL_ATOM_DARKMONT_X:
> 6594			intel_pmu_init_skt(NULL);
  6595			intel_pmu_pebs_data_source_cmt();
> 6596			x86_pmu.pebs_latency_data = cmt_latency_data;
  6597			x86_pmu.get_event_constraints = cmt_get_event_constraints;
  6598			td_attr = skt_events_attrs;
  6599			mem_attr = grt_mem_attrs;
  6600			extra_attr = cmt_format_attr;
  6601			pr_cont("Darkmont events, ");
  6602			name = "darkmont";
  6603			break;
  6604	
  6605		case INTEL_WESTMERE:
  6606		case INTEL_WESTMERE_EP:
  6607		case INTEL_WESTMERE_EX:
  6608			memcpy(hw_cache_event_ids, westmere_hw_cache_event_ids,
  6609			       sizeof(hw_cache_event_ids));
  6610			memcpy(hw_cache_extra_regs, nehalem_hw_cache_extra_regs,
  6611			       sizeof(hw_cache_extra_regs));
  6612	
  6613			intel_pmu_lbr_init_nhm();
  6614	
  6615			x86_pmu.event_constraints = intel_westmere_event_constraints;
  6616			x86_pmu.enable_all = intel_pmu_nhm_enable_all;
  6617			x86_pmu.pebs_constraints = intel_westmere_pebs_event_constraints;
  6618			x86_pmu.extra_regs = intel_westmere_extra_regs;
  6619			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6620	
  6621			mem_attr = nhm_mem_events_attrs;
  6622	
  6623			/* UOPS_ISSUED.STALLED_CYCLES */
  6624			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] =
  6625				X86_CONFIG(.event=0x0e, .umask=0x01, .inv=1, .cmask=1);
  6626			/* UOPS_EXECUTED.CORE_ACTIVE_CYCLES,c=1,i=1 */
  6627			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_BACKEND] =
  6628				X86_CONFIG(.event=0xb1, .umask=0x3f, .inv=1, .cmask=1);
  6629	
  6630			intel_pmu_pebs_data_source_nhm();
  6631			extra_attr = nhm_format_attr;
  6632			pr_cont("Westmere events, ");
  6633			name = "westmere";
  6634			break;
  6635	
  6636		case INTEL_SANDYBRIDGE:
  6637		case INTEL_SANDYBRIDGE_X:
  6638			x86_add_quirk(intel_sandybridge_quirk);
  6639			x86_add_quirk(intel_ht_bug);
  6640			memcpy(hw_cache_event_ids, snb_hw_cache_event_ids,
  6641			       sizeof(hw_cache_event_ids));
  6642			memcpy(hw_cache_extra_regs, snb_hw_cache_extra_regs,
  6643			       sizeof(hw_cache_extra_regs));
  6644	
  6645			intel_pmu_lbr_init_snb();
  6646	
  6647			x86_pmu.event_constraints = intel_snb_event_constraints;
  6648			x86_pmu.pebs_constraints = intel_snb_pebs_event_constraints;
  6649			x86_pmu.pebs_aliases = intel_pebs_aliases_snb;
  6650			if (boot_cpu_data.x86_vfm == INTEL_SANDYBRIDGE_X)
  6651				x86_pmu.extra_regs = intel_snbep_extra_regs;
  6652			else
  6653				x86_pmu.extra_regs = intel_snb_extra_regs;
  6654	
  6655	
  6656			/* all extra regs are per-cpu when HT is on */
  6657			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6658			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6659	
  6660			td_attr  = snb_events_attrs;
  6661			mem_attr = snb_mem_events_attrs;
  6662	
  6663			/* UOPS_ISSUED.ANY,c=1,i=1 to count stall cycles */
  6664			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] =
  6665				X86_CONFIG(.event=0x0e, .umask=0x01, .inv=1, .cmask=1);
  6666			/* UOPS_DISPATCHED.THREAD,c=1,i=1 to count stall cycles*/
  6667			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_BACKEND] =
  6668				X86_CONFIG(.event=0xb1, .umask=0x01, .inv=1, .cmask=1);
  6669	
  6670			extra_attr = nhm_format_attr;
  6671	
  6672			pr_cont("SandyBridge events, ");
  6673			name = "sandybridge";
  6674			break;
  6675	
  6676		case INTEL_IVYBRIDGE:
  6677		case INTEL_IVYBRIDGE_X:
  6678			x86_add_quirk(intel_ht_bug);
  6679			memcpy(hw_cache_event_ids, snb_hw_cache_event_ids,
  6680			       sizeof(hw_cache_event_ids));
  6681			/* dTLB-load-misses on IVB is different than SNB */
  6682			hw_cache_event_ids[C(DTLB)][C(OP_READ)][C(RESULT_MISS)] = 0x8108; /* DTLB_LOAD_MISSES.DEMAND_LD_MISS_CAUSES_A_WALK */
  6683	
  6684			memcpy(hw_cache_extra_regs, snb_hw_cache_extra_regs,
  6685			       sizeof(hw_cache_extra_regs));
  6686	
  6687			intel_pmu_lbr_init_snb();
  6688	
  6689			x86_pmu.event_constraints = intel_ivb_event_constraints;
  6690			x86_pmu.pebs_constraints = intel_ivb_pebs_event_constraints;
  6691			x86_pmu.pebs_aliases = intel_pebs_aliases_ivb;
  6692			x86_pmu.pebs_prec_dist = true;
  6693			if (boot_cpu_data.x86_vfm == INTEL_IVYBRIDGE_X)
  6694				x86_pmu.extra_regs = intel_snbep_extra_regs;
  6695			else
  6696				x86_pmu.extra_regs = intel_snb_extra_regs;
  6697			/* all extra regs are per-cpu when HT is on */
  6698			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6699			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6700	
  6701			td_attr  = snb_events_attrs;
  6702			mem_attr = snb_mem_events_attrs;
  6703	
  6704			/* UOPS_ISSUED.ANY,c=1,i=1 to count stall cycles */
  6705			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] =
  6706				X86_CONFIG(.event=0x0e, .umask=0x01, .inv=1, .cmask=1);
  6707	
  6708			extra_attr = nhm_format_attr;
  6709	
  6710			pr_cont("IvyBridge events, ");
  6711			name = "ivybridge";
  6712			break;
  6713	
  6714	
  6715		case INTEL_HASWELL:
  6716		case INTEL_HASWELL_X:
  6717		case INTEL_HASWELL_L:
  6718		case INTEL_HASWELL_G:
  6719			x86_add_quirk(intel_ht_bug);
  6720			x86_add_quirk(intel_pebs_isolation_quirk);
  6721			x86_pmu.late_ack = true;
  6722			memcpy(hw_cache_event_ids, hsw_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  6723			memcpy(hw_cache_extra_regs, hsw_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  6724	
  6725			intel_pmu_lbr_init_hsw();
  6726	
  6727			x86_pmu.event_constraints = intel_hsw_event_constraints;
  6728			x86_pmu.pebs_constraints = intel_hsw_pebs_event_constraints;
  6729			x86_pmu.extra_regs = intel_snbep_extra_regs;
  6730			x86_pmu.pebs_aliases = intel_pebs_aliases_ivb;
  6731			x86_pmu.pebs_prec_dist = true;
  6732			/* all extra regs are per-cpu when HT is on */
  6733			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6734			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6735	
  6736			x86_pmu.hw_config = hsw_hw_config;
  6737			x86_pmu.get_event_constraints = hsw_get_event_constraints;
  6738			x86_pmu.limit_period = hsw_limit_period;
  6739			x86_pmu.lbr_double_abort = true;
  6740			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  6741				hsw_format_attr : nhm_format_attr;
  6742			td_attr  = hsw_events_attrs;
  6743			mem_attr = hsw_mem_events_attrs;
  6744			tsx_attr = hsw_tsx_events_attrs;
  6745			pr_cont("Haswell events, ");
  6746			name = "haswell";
  6747			break;
  6748	
  6749		case INTEL_BROADWELL:
  6750		case INTEL_BROADWELL_D:
  6751		case INTEL_BROADWELL_G:
  6752		case INTEL_BROADWELL_X:
  6753			x86_add_quirk(intel_pebs_isolation_quirk);
  6754			x86_pmu.late_ack = true;
  6755			memcpy(hw_cache_event_ids, hsw_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  6756			memcpy(hw_cache_extra_regs, hsw_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  6757	
  6758			/* L3_MISS_LOCAL_DRAM is BIT(26) in Broadwell */
  6759			hw_cache_extra_regs[C(LL)][C(OP_READ)][C(RESULT_MISS)] = HSW_DEMAND_READ |
  6760										 BDW_L3_MISS|HSW_SNOOP_DRAM;
  6761			hw_cache_extra_regs[C(LL)][C(OP_WRITE)][C(RESULT_MISS)] = HSW_DEMAND_WRITE|BDW_L3_MISS|
  6762										  HSW_SNOOP_DRAM;
  6763			hw_cache_extra_regs[C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = HSW_DEMAND_READ|
  6764										     BDW_L3_MISS_LOCAL|HSW_SNOOP_DRAM;
  6765			hw_cache_extra_regs[C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = HSW_DEMAND_WRITE|
  6766										      BDW_L3_MISS_LOCAL|HSW_SNOOP_DRAM;
  6767	
  6768			intel_pmu_lbr_init_hsw();
  6769	
  6770			x86_pmu.event_constraints = intel_bdw_event_constraints;
  6771			x86_pmu.pebs_constraints = intel_bdw_pebs_event_constraints;
  6772			x86_pmu.extra_regs = intel_snbep_extra_regs;
  6773			x86_pmu.pebs_aliases = intel_pebs_aliases_ivb;
  6774			x86_pmu.pebs_prec_dist = true;
  6775			/* all extra regs are per-cpu when HT is on */
  6776			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6777			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6778	
  6779			x86_pmu.hw_config = hsw_hw_config;
  6780			x86_pmu.get_event_constraints = hsw_get_event_constraints;
  6781			x86_pmu.limit_period = bdw_limit_period;
  6782			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  6783				hsw_format_attr : nhm_format_attr;
  6784			td_attr  = hsw_events_attrs;
  6785			mem_attr = hsw_mem_events_attrs;
  6786			tsx_attr = hsw_tsx_events_attrs;
  6787			pr_cont("Broadwell events, ");
  6788			name = "broadwell";
  6789			break;
  6790	
  6791		case INTEL_XEON_PHI_KNL:
  6792		case INTEL_XEON_PHI_KNM:
  6793			memcpy(hw_cache_event_ids,
  6794			       slm_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  6795			memcpy(hw_cache_extra_regs,
  6796			       knl_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  6797			intel_pmu_lbr_init_knl();
  6798	
  6799			x86_pmu.event_constraints = intel_slm_event_constraints;
  6800			x86_pmu.pebs_constraints = intel_slm_pebs_event_constraints;
  6801			x86_pmu.extra_regs = intel_knl_extra_regs;
  6802	
  6803			/* all extra regs are per-cpu when HT is on */
  6804			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6805			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6806			extra_attr = slm_format_attr;
  6807			pr_cont("Knights Landing/Mill events, ");
  6808			name = "knights-landing";
  6809			break;
  6810	
  6811		case INTEL_SKYLAKE_X:
  6812			pmem = true;
  6813			fallthrough;
  6814		case INTEL_SKYLAKE_L:
  6815		case INTEL_SKYLAKE:
  6816		case INTEL_KABYLAKE_L:
  6817		case INTEL_KABYLAKE:
  6818		case INTEL_COMETLAKE_L:
  6819		case INTEL_COMETLAKE:
  6820			x86_add_quirk(intel_pebs_isolation_quirk);
  6821			x86_pmu.late_ack = true;
  6822			memcpy(hw_cache_event_ids, skl_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  6823			memcpy(hw_cache_extra_regs, skl_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  6824			intel_pmu_lbr_init_skl();
  6825	
  6826			/* INT_MISC.RECOVERY_CYCLES has umask 1 in Skylake */
  6827			event_attr_td_recovery_bubbles.event_str_noht =
  6828				"event=0xd,umask=0x1,cmask=1";
  6829			event_attr_td_recovery_bubbles.event_str_ht =
  6830				"event=0xd,umask=0x1,cmask=1,any=1";
  6831	
  6832			x86_pmu.event_constraints = intel_skl_event_constraints;
  6833			x86_pmu.pebs_constraints = intel_skl_pebs_event_constraints;
  6834			x86_pmu.extra_regs = intel_skl_extra_regs;
  6835			x86_pmu.pebs_aliases = intel_pebs_aliases_skl;
  6836			x86_pmu.pebs_prec_dist = true;
  6837			/* all extra regs are per-cpu when HT is on */
  6838			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6839			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6840	
  6841			x86_pmu.hw_config = hsw_hw_config;
  6842			x86_pmu.get_event_constraints = hsw_get_event_constraints;
  6843			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  6844				hsw_format_attr : nhm_format_attr;
  6845			extra_skl_attr = skl_format_attr;
  6846			td_attr  = hsw_events_attrs;
  6847			mem_attr = hsw_mem_events_attrs;
  6848			tsx_attr = hsw_tsx_events_attrs;
  6849			intel_pmu_pebs_data_source_skl(pmem);
  6850	
  6851			/*
  6852			 * Processors with CPUID.RTM_ALWAYS_ABORT have TSX deprecated by default.
  6853			 * TSX force abort hooks are not required on these systems. Only deploy
  6854			 * workaround when microcode has not enabled X86_FEATURE_RTM_ALWAYS_ABORT.
  6855			 */
  6856			if (boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT) &&
  6857			   !boot_cpu_has(X86_FEATURE_RTM_ALWAYS_ABORT)) {
  6858				x86_pmu.flags |= PMU_FL_TFA;
  6859				x86_pmu.get_event_constraints = tfa_get_event_constraints;
  6860				x86_pmu.enable_all = intel_tfa_pmu_enable_all;
  6861				x86_pmu.commit_scheduling = intel_tfa_commit_scheduling;
  6862			}
  6863	
  6864			pr_cont("Skylake events, ");
  6865			name = "skylake";
  6866			break;
  6867	
  6868		case INTEL_ICELAKE_X:
  6869		case INTEL_ICELAKE_D:
  6870			x86_pmu.pebs_ept = 1;
  6871			pmem = true;
  6872			fallthrough;
  6873		case INTEL_ICELAKE_L:
  6874		case INTEL_ICELAKE:
  6875		case INTEL_TIGERLAKE_L:
  6876		case INTEL_TIGERLAKE:
  6877		case INTEL_ROCKETLAKE:
  6878			x86_pmu.late_ack = true;
  6879			memcpy(hw_cache_event_ids, skl_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  6880			memcpy(hw_cache_extra_regs, skl_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  6881			hw_cache_event_ids[C(ITLB)][C(OP_READ)][C(RESULT_ACCESS)] = -1;
  6882			intel_pmu_lbr_init_skl();
  6883	
  6884			x86_pmu.event_constraints = intel_icl_event_constraints;
  6885			x86_pmu.pebs_constraints = intel_icl_pebs_event_constraints;
  6886			x86_pmu.extra_regs = intel_icl_extra_regs;
  6887			x86_pmu.pebs_aliases = NULL;
  6888			x86_pmu.pebs_prec_dist = true;
  6889			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6890			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6891	
  6892			x86_pmu.hw_config = hsw_hw_config;
  6893			x86_pmu.get_event_constraints = icl_get_event_constraints;
  6894			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  6895				hsw_format_attr : nhm_format_attr;
  6896			extra_skl_attr = skl_format_attr;
  6897			mem_attr = icl_events_attrs;
  6898			td_attr = icl_td_events_attrs;
  6899			tsx_attr = icl_tsx_events_attrs;
  6900			x86_pmu.rtm_abort_event = X86_CONFIG(.event=0xc9, .umask=0x04);
  6901			x86_pmu.lbr_pt_coexist = true;
  6902			intel_pmu_pebs_data_source_skl(pmem);
  6903			x86_pmu.num_topdown_events = 4;
  6904			static_call_update(intel_pmu_update_topdown_event,
  6905					   &icl_update_topdown_event);
  6906			static_call_update(intel_pmu_set_topdown_event_period,
  6907					   &icl_set_topdown_event_period);
  6908			pr_cont("Icelake events, ");
  6909			name = "icelake";
  6910			break;
  6911	
  6912		case INTEL_SAPPHIRERAPIDS_X:
  6913		case INTEL_EMERALDRAPIDS_X:
  6914			x86_pmu.flags |= PMU_FL_MEM_LOADS_AUX;
  6915			x86_pmu.extra_regs = intel_glc_extra_regs;
  6916			pr_cont("Sapphire Rapids events, ");
  6917			name = "sapphire_rapids";
  6918			goto glc_common;
  6919	
  6920		case INTEL_GRANITERAPIDS_X:
  6921		case INTEL_GRANITERAPIDS_D:
  6922			x86_pmu.extra_regs = intel_rwc_extra_regs;
  6923			pr_cont("Granite Rapids events, ");
  6924			name = "granite_rapids";
  6925	
  6926		glc_common:
  6927			intel_pmu_init_glc(NULL);
  6928			x86_pmu.pebs_ept = 1;
  6929			x86_pmu.hw_config = hsw_hw_config;
  6930			x86_pmu.get_event_constraints = glc_get_event_constraints;
  6931			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  6932				hsw_format_attr : nhm_format_attr;
  6933			extra_skl_attr = skl_format_attr;
  6934			mem_attr = glc_events_attrs;
  6935			td_attr = glc_td_events_attrs;
  6936			tsx_attr = glc_tsx_events_attrs;
  6937			intel_pmu_pebs_data_source_skl(true);
  6938			break;
  6939	
  6940		case INTEL_ALDERLAKE:
  6941		case INTEL_ALDERLAKE_L:
  6942		case INTEL_RAPTORLAKE:
  6943		case INTEL_RAPTORLAKE_P:
  6944		case INTEL_RAPTORLAKE_S:
  6945			/*
  6946			 * Alder Lake has 2 types of CPU, core and atom.
  6947			 *
  6948			 * Initialize the common PerfMon capabilities here.
  6949			 */
  6950			intel_pmu_init_hybrid(hybrid_big_small);
  6951	
  6952			x86_pmu.pebs_latency_data = adl_latency_data_small;
  6953			x86_pmu.get_event_constraints = adl_get_event_constraints;
  6954			x86_pmu.hw_config = adl_hw_config;
  6955			x86_pmu.get_hybrid_cpu_type = adl_get_hybrid_cpu_type;
  6956	
  6957			td_attr = adl_hybrid_events_attrs;
  6958			mem_attr = adl_hybrid_mem_attrs;
  6959			tsx_attr = adl_hybrid_tsx_attrs;
  6960			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  6961				adl_hybrid_extra_attr_rtm : adl_hybrid_extra_attr;
  6962	
  6963			/* Initialize big core specific PerfMon capabilities.*/
  6964			pmu = &x86_pmu.hybrid_pmu[X86_HYBRID_PMU_CORE_IDX];
  6965			intel_pmu_init_glc(&pmu->pmu);
  6966			if (cpu_feature_enabled(X86_FEATURE_HYBRID_CPU)) {
  6967				pmu->num_counters = x86_pmu.num_counters + 2;
  6968				pmu->num_counters_fixed = x86_pmu.num_counters_fixed + 1;
  6969			} else {
  6970				pmu->num_counters = x86_pmu.num_counters;
  6971				pmu->num_counters_fixed = x86_pmu.num_counters_fixed;
  6972			}
  6973	
  6974			/*
  6975			 * Quirk: For some Alder Lake machine, when all E-cores are disabled in
  6976			 * a BIOS, the leaf 0xA will enumerate all counters of P-cores. However,
  6977			 * the X86_FEATURE_HYBRID_CPU is still set. The above codes will
  6978			 * mistakenly add extra counters for P-cores. Correct the number of
  6979			 * counters here.
  6980			 */
  6981			if ((pmu->num_counters > 8) || (pmu->num_counters_fixed > 4)) {
  6982				pmu->num_counters = x86_pmu.num_counters;
  6983				pmu->num_counters_fixed = x86_pmu.num_counters_fixed;
  6984			}
  6985	
  6986			pmu->max_pebs_events = min_t(unsigned, MAX_PEBS_EVENTS, pmu->num_counters);
  6987			pmu->unconstrained = (struct event_constraint)
  6988						__EVENT_CONSTRAINT(0, (1ULL << pmu->num_counters) - 1,
  6989								   0, pmu->num_counters, 0, 0);
  6990			pmu->extra_regs = intel_glc_extra_regs;
  6991	
  6992			/* Initialize Atom core specific PerfMon capabilities.*/
  6993			pmu = &x86_pmu.hybrid_pmu[X86_HYBRID_PMU_ATOM_IDX];
  6994			intel_pmu_init_grt(&pmu->pmu);
  6995	
  6996			x86_pmu.flags |= PMU_FL_MEM_LOADS_AUX;
  6997			intel_pmu_pebs_data_source_adl();
  6998			pr_cont("Alderlake Hybrid events, ");
  6999			name = "alderlake_hybrid";
  7000			break;
  7001	
  7002		case INTEL_METEORLAKE:
  7003		case INTEL_METEORLAKE_L:
  7004			intel_pmu_init_hybrid(hybrid_big_small);
  7005	
  7006			x86_pmu.pebs_latency_data = mtl_latency_data_small;
  7007			x86_pmu.get_event_constraints = mtl_get_event_constraints;
  7008			x86_pmu.hw_config = adl_hw_config;
  7009	
  7010			td_attr = adl_hybrid_events_attrs;
  7011			mem_attr = mtl_hybrid_mem_attrs;
  7012			tsx_attr = adl_hybrid_tsx_attrs;
  7013			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  7014				mtl_hybrid_extra_attr_rtm : mtl_hybrid_extra_attr;
  7015	
  7016			/* Initialize big core specific PerfMon capabilities.*/
  7017			pmu = &x86_pmu.hybrid_pmu[X86_HYBRID_PMU_CORE_IDX];
  7018			intel_pmu_init_glc(&pmu->pmu);
  7019			pmu->extra_regs = intel_rwc_extra_regs;
  7020	
  7021			/* Initialize Atom core specific PerfMon capabilities.*/
  7022			pmu = &x86_pmu.hybrid_pmu[X86_HYBRID_PMU_ATOM_IDX];
  7023			intel_pmu_init_grt(&pmu->pmu);
  7024			pmu->extra_regs = intel_cmt_extra_regs;
  7025	
  7026			intel_pmu_pebs_data_source_mtl();
  7027			pr_cont("Meteorlake Hybrid events, ");
  7028			name = "meteorlake_hybrid";
  7029			break;
  7030	
  7031		default:
  7032			switch (x86_pmu.version) {
  7033			case 1:
  7034				x86_pmu.event_constraints = intel_v1_event_constraints;
  7035				pr_cont("generic architected perfmon v1, ");
  7036				name = "generic_arch_v1";
  7037				break;
  7038			case 2:
  7039			case 3:
  7040			case 4:
  7041				/*
  7042				 * default constraints for v2 and up
  7043				 */
  7044				x86_pmu.event_constraints = intel_gen_event_constraints;
  7045				pr_cont("generic architected perfmon, ");
  7046				name = "generic_arch_v2+";
  7047				break;
  7048			default:
  7049				/*
  7050				 * The default constraints for v5 and up can support up to
  7051				 * 16 fixed counters. For the fixed counters 4 and later,
  7052				 * the pseudo-encoding is applied.
  7053				 * The constraints may be cut according to the CPUID enumeration
  7054				 * by inserting the EVENT_CONSTRAINT_END.
  7055				 */
  7056				if (x86_pmu.num_counters_fixed > INTEL_PMC_MAX_FIXED)
  7057					x86_pmu.num_counters_fixed = INTEL_PMC_MAX_FIXED;
  7058				intel_v5_gen_event_constraints[x86_pmu.num_counters_fixed].weight = -1;
  7059				x86_pmu.event_constraints = intel_v5_gen_event_constraints;
  7060				pr_cont("generic architected perfmon, ");
  7061				name = "generic_arch_v5+";
  7062				break;
  7063			}
  7064		}
  7065	
  7066		snprintf(pmu_name_str, sizeof(pmu_name_str), "%s", name);
  7067	
  7068		if (!is_hybrid()) {
  7069			group_events_td.attrs  = td_attr;
  7070			group_events_mem.attrs = mem_attr;
  7071			group_events_tsx.attrs = tsx_attr;
  7072			group_format_extra.attrs = extra_attr;
  7073			group_format_extra_skl.attrs = extra_skl_attr;
  7074	
  7075			x86_pmu.attr_update = attr_update;
  7076		} else {
  7077			hybrid_group_events_td.attrs  = td_attr;
  7078			hybrid_group_events_mem.attrs = mem_attr;
  7079			hybrid_group_events_tsx.attrs = tsx_attr;
  7080			hybrid_group_format_extra.attrs = extra_attr;
  7081	
  7082			x86_pmu.attr_update = hybrid_attr_update;
  7083		}
  7084	
  7085		intel_pmu_check_num_counters(&x86_pmu.num_counters,
  7086					     &x86_pmu.num_counters_fixed,
  7087					     &x86_pmu.intel_ctrl,
  7088					     (u64)fixed_mask);
  7089	
  7090		/* AnyThread may be deprecated on arch perfmon v5 or later */
  7091		if (x86_pmu.intel_cap.anythread_deprecated)
  7092			x86_pmu.format_attrs = intel_arch_formats_attr;
  7093	
  7094		intel_pmu_check_event_constraints(x86_pmu.event_constraints,
  7095						  x86_pmu.num_counters,
  7096						  x86_pmu.num_counters_fixed,
  7097						  x86_pmu.intel_ctrl);
  7098		/*
  7099		 * Access LBR MSR may cause #GP under certain circumstances.
  7100		 * Check all LBR MSR here.
  7101		 * Disable LBR access if any LBR MSRs can not be accessed.
  7102		 */
  7103		if (x86_pmu.lbr_tos && !check_msr(x86_pmu.lbr_tos, 0x3UL))
  7104			x86_pmu.lbr_nr = 0;
  7105		for (i = 0; i < x86_pmu.lbr_nr; i++) {
  7106			if (!(check_msr(x86_pmu.lbr_from + i, 0xffffUL) &&
  7107			      check_msr(x86_pmu.lbr_to + i, 0xffffUL)))
  7108				x86_pmu.lbr_nr = 0;
  7109		}
  7110	
  7111		if (x86_pmu.lbr_nr) {
  7112			intel_pmu_lbr_init();
  7113	
  7114			pr_cont("%d-deep LBR, ", x86_pmu.lbr_nr);
  7115	
  7116			/* only support branch_stack snapshot for perfmon >= v2 */
  7117			if (x86_pmu.disable_all == intel_pmu_disable_all) {
  7118				if (boot_cpu_has(X86_FEATURE_ARCH_LBR)) {
  7119					static_call_update(perf_snapshot_branch_stack,
  7120							   intel_pmu_snapshot_arch_branch_stack);
  7121				} else {
  7122					static_call_update(perf_snapshot_branch_stack,
  7123							   intel_pmu_snapshot_branch_stack);
  7124				}
  7125			}
  7126		}
  7127	
  7128		intel_pmu_check_extra_regs(x86_pmu.extra_regs);
  7129	
  7130		/* Support full width counters using alternative MSR range */
  7131		if (x86_pmu.intel_cap.full_width_write) {
  7132			x86_pmu.max_period = x86_pmu.cntval_mask >> 1;
  7133			x86_pmu.perfctr = MSR_IA32_PMC0;
  7134			pr_cont("full-width counters, ");
  7135		}
  7136	
  7137		if (!is_hybrid() && x86_pmu.intel_cap.perf_metrics)
  7138			x86_pmu.intel_ctrl |= 1ULL << GLOBAL_CTRL_EN_PERF_METRICS;
  7139	
  7140		if (x86_pmu.intel_cap.pebs_timing_info)
  7141			x86_pmu.flags |= PMU_FL_RETIRE_LATENCY;
  7142	
  7143		intel_aux_output_init();
  7144	
  7145		return 0;
  7146	}
  7147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
