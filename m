Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25AE215F6B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762788184; cv=none; b=CUAnQ538xuyBJNn95Dq/D4Gu+tvFRfu2IimOjOSc+gzK243gYw7dIr8+fkUpOiAwk9yfVeUS+1THgfqNdF0tMq4hPLPbroZKwpavzFyzIMBURT85eAkdQlY0I4ayjPnJMeyhbIbLlkhoG1ZtlneKuoSW6w+cVB/aMwQD6tKV0xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762788184; c=relaxed/simple;
	bh=k1wt1xkTgAHwQVB3PvjLj4AkZZ5E6z1wfxuAneE6bfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kme106L4nwvZ4ZAV7juYKx/m5US8o4tGsBYX0Z8sBfE7bf7WOq890s58gAuwRTn8O5IkOY+EM6AaMkQSqIhqZK3K/0tLDQBz7/AdY+57C81iwrArKOBRW34/H539X+qJjOXNoO6AJuGzNXaBnO/dA93rYmOPUmS4xqysmPt+VQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7jrX4lt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7jrX4lt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762788182; x=1794324182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k1wt1xkTgAHwQVB3PvjLj4AkZZ5E6z1wfxuAneE6bfI=;
  b=L7jrX4ltBHcYbYZ80DzwzhZ9OuUVYlU8hLJ0DnYWW9QBtzms4x26CJNy
   Xdnhk/lD5jv1sVQU0fyrtyfHIrX3G+k5s1Tpj/c0pj5kMhhxsZGv5wm3Y
   3JvmARw/zfb8adEhXrZRg+CNKaLqITV5PZTYOAznco49rP9lyF6zFQWr9
   PH6kcmWjPRSUHhSIrz1CkZ6bo+LEFtWK63z2ksN6fg088GMkYABx7/x6S
   rb0k5VrJYv3Ta+N9aMkz0DdgfUl23McDkULrBsZqPGjuwGI5ovt04AKQN
   JlX2z1lEx5uEC4oz+U6NEbP0dgU3R8PLluVFKIjTDhGP8Uup5xO6VWCVC
   Q==;
X-CSE-ConnectionGUID: 35qU17n7TverGCZ0IfmHtw==
X-CSE-MsgGUID: FsS895YUQ2OCX5bNN10F2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68697384"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="68697384"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:23:01 -0800
X-CSE-ConnectionGUID: Vqp7duR4SMq0MK7QR8W4DQ==
X-CSE-MsgGUID: UPddYVCxRhe1SDboyKMhwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="225956951"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Nov 2025 07:23:00 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vITjN-0000ax-03;
	Mon, 10 Nov 2025 15:22:57 +0000
Date: Mon, 10 Nov 2025 23:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3278/3278] arch/x86/events/intel/core.c:6765:7:
 warning: variable 'name' is used uninitialized whenever switch case is taken
Message-ID: <202511102332.qUTQH99w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f7d17f5d9c13869cef204e25f552fbac501824dc
commit: 6f5c7e20d8ef1bffa7b1ed906689e5a2e52e7dd2 [3278/3278] perf/x86/intel: Add common intel_pmu_init_hybrid()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251110/202511102332.qUTQH99w-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511102332.qUTQH99w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511102332.qUTQH99w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/intel/core.c:6765:7: warning: variable 'name' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
    6765 |         case INTEL_FAM6_METEORLAKE:
         |              ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/intel-family.h:120:32: note: expanded from macro 'INTEL_FAM6_METEORLAKE'
     120 | #define INTEL_FAM6_METEORLAKE           0xAC
         |                                         ^~~~
   arch/x86/events/intel/core.c:6819:53: note: uninitialized use occurs here
    6819 |         snprintf(pmu_name_str, sizeof(pmu_name_str), "%s", name);
         |                                                            ^~~~
   arch/x86/events/intel/core.c:6766:7: warning: variable 'name' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
    6766 |         case INTEL_FAM6_METEORLAKE_L:
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/intel-family.h:121:34: note: expanded from macro 'INTEL_FAM6_METEORLAKE_L'
     121 | #define INTEL_FAM6_METEORLAKE_L         0xAA
         |                                         ^~~~
   arch/x86/events/intel/core.c:6819:53: note: uninitialized use occurs here
    6819 |         snprintf(pmu_name_str, sizeof(pmu_name_str), "%s", name);
         |                                                            ^~~~
   arch/x86/events/intel/core.c:6083:12: note: initialize the variable 'name' to silence this warning
    6083 |         char *name;
         |                   ^
         |                    = NULL
   2 warnings generated.


vim +/name +6765 arch/x86/events/intel/core.c

  6069	
  6070	__init int intel_pmu_init(void)
  6071	{
  6072		struct attribute **extra_skl_attr = &empty_attrs;
  6073		struct attribute **extra_attr = &empty_attrs;
  6074		struct attribute **td_attr    = &empty_attrs;
  6075		struct attribute **mem_attr   = &empty_attrs;
  6076		struct attribute **tsx_attr   = &empty_attrs;
  6077		union cpuid10_edx edx;
  6078		union cpuid10_eax eax;
  6079		union cpuid10_ebx ebx;
  6080		unsigned int fixed_mask;
  6081		bool pmem = false;
  6082		int version, i;
  6083		char *name;
  6084		struct x86_hybrid_pmu *pmu;
  6085	
  6086		if (!cpu_has(&boot_cpu_data, X86_FEATURE_ARCH_PERFMON)) {
  6087			switch (boot_cpu_data.x86) {
  6088			case 0x6:
  6089				return p6_pmu_init();
  6090			case 0xb:
  6091				return knc_pmu_init();
  6092			case 0xf:
  6093				return p4_pmu_init();
  6094			}
  6095			return -ENODEV;
  6096		}
  6097	
  6098		/*
  6099		 * Check whether the Architectural PerfMon supports
  6100		 * Branch Misses Retired hw_event or not.
  6101		 */
  6102		cpuid(10, &eax.full, &ebx.full, &fixed_mask, &edx.full);
  6103		if (eax.split.mask_length < ARCH_PERFMON_EVENTS_COUNT)
  6104			return -ENODEV;
  6105	
  6106		version = eax.split.version_id;
  6107		if (version < 2)
  6108			x86_pmu = core_pmu;
  6109		else
  6110			x86_pmu = intel_pmu;
  6111	
  6112		x86_pmu.version			= version;
  6113		x86_pmu.num_counters		= eax.split.num_counters;
  6114		x86_pmu.cntval_bits		= eax.split.bit_width;
  6115		x86_pmu.cntval_mask		= (1ULL << eax.split.bit_width) - 1;
  6116	
  6117		x86_pmu.events_maskl		= ebx.full;
  6118		x86_pmu.events_mask_len		= eax.split.mask_length;
  6119	
  6120		x86_pmu.max_pebs_events		= min_t(unsigned, MAX_PEBS_EVENTS, x86_pmu.num_counters);
  6121	
  6122		/*
  6123		 * Quirk: v2 perfmon does not report fixed-purpose events, so
  6124		 * assume at least 3 events, when not running in a hypervisor:
  6125		 */
  6126		if (version > 1 && version < 5) {
  6127			int assume = 3 * !boot_cpu_has(X86_FEATURE_HYPERVISOR);
  6128	
  6129			x86_pmu.num_counters_fixed =
  6130				max((int)edx.split.num_counters_fixed, assume);
  6131	
  6132			fixed_mask = (1L << x86_pmu.num_counters_fixed) - 1;
  6133		} else if (version >= 5)
  6134			x86_pmu.num_counters_fixed = fls(fixed_mask);
  6135	
  6136		if (version >= 4)
  6137			x86_pmu.counter_freezing = !disable_counter_freezing;
  6138	
  6139		if (boot_cpu_has(X86_FEATURE_PDCM)) {
  6140			u64 capabilities;
  6141	
  6142			rdmsrl(MSR_IA32_PERF_CAPABILITIES, capabilities);
  6143			x86_pmu.intel_cap.capabilities = capabilities;
  6144		}
  6145	
  6146		if (x86_pmu.intel_cap.lbr_format == LBR_FORMAT_32) {
  6147			x86_pmu.lbr_reset = intel_pmu_lbr_reset_32;
  6148			x86_pmu.lbr_read = intel_pmu_lbr_read_32;
  6149		}
  6150	
  6151		if (boot_cpu_has(X86_FEATURE_ARCH_LBR))
  6152			intel_pmu_arch_lbr_init();
  6153	
  6154		intel_ds_init();
  6155	
  6156		x86_add_quirk(intel_arch_events_quirk); /* Install first, so it runs last */
  6157	
  6158		if (version >= 5) {
  6159			x86_pmu.intel_cap.anythread_deprecated = edx.split.anythread_deprecated;
  6160			if (x86_pmu.intel_cap.anythread_deprecated)
  6161				pr_cont(" AnyThread deprecated, ");
  6162		}
  6163	
  6164		/*
  6165		 * Install the hw-cache-events table:
  6166		 */
  6167		switch (boot_cpu_data.x86_model) {
  6168		case INTEL_FAM6_CORE_YONAH:
  6169			pr_cont("Core events, ");
  6170			name = "core";
  6171			break;
  6172	
  6173		case INTEL_FAM6_CORE2_MEROM:
  6174			x86_add_quirk(intel_clovertown_quirk);
  6175			fallthrough;
  6176	
  6177		case INTEL_FAM6_CORE2_MEROM_L:
  6178		case INTEL_FAM6_CORE2_PENRYN:
  6179		case INTEL_FAM6_CORE2_DUNNINGTON:
  6180			memcpy(hw_cache_event_ids, core2_hw_cache_event_ids,
  6181			       sizeof(hw_cache_event_ids));
  6182	
  6183			intel_pmu_lbr_init_core();
  6184	
  6185			x86_pmu.event_constraints = intel_core2_event_constraints;
  6186			x86_pmu.pebs_constraints = intel_core2_pebs_event_constraints;
  6187			pr_cont("Core2 events, ");
  6188			name = "core2";
  6189			break;
  6190	
  6191		case INTEL_FAM6_NEHALEM:
  6192		case INTEL_FAM6_NEHALEM_EP:
  6193		case INTEL_FAM6_NEHALEM_EX:
  6194			memcpy(hw_cache_event_ids, nehalem_hw_cache_event_ids,
  6195			       sizeof(hw_cache_event_ids));
  6196			memcpy(hw_cache_extra_regs, nehalem_hw_cache_extra_regs,
  6197			       sizeof(hw_cache_extra_regs));
  6198	
  6199			intel_pmu_lbr_init_nhm();
  6200	
  6201			x86_pmu.event_constraints = intel_nehalem_event_constraints;
  6202			x86_pmu.pebs_constraints = intel_nehalem_pebs_event_constraints;
  6203			x86_pmu.enable_all = intel_pmu_nhm_enable_all;
  6204			x86_pmu.extra_regs = intel_nehalem_extra_regs;
  6205			x86_pmu.limit_period = nhm_limit_period;
  6206	
  6207			mem_attr = nhm_mem_events_attrs;
  6208	
  6209			/* UOPS_ISSUED.STALLED_CYCLES */
  6210			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] =
  6211				X86_CONFIG(.event=0x0e, .umask=0x01, .inv=1, .cmask=1);
  6212			/* UOPS_EXECUTED.CORE_ACTIVE_CYCLES,c=1,i=1 */
  6213			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_BACKEND] =
  6214				X86_CONFIG(.event=0xb1, .umask=0x3f, .inv=1, .cmask=1);
  6215	
  6216			intel_pmu_pebs_data_source_nhm();
  6217			x86_add_quirk(intel_nehalem_quirk);
  6218			x86_pmu.pebs_no_tlb = 1;
  6219			extra_attr = nhm_format_attr;
  6220	
  6221			pr_cont("Nehalem events, ");
  6222			name = "nehalem";
  6223			break;
  6224	
  6225		case INTEL_FAM6_ATOM_BONNELL:
  6226		case INTEL_FAM6_ATOM_BONNELL_MID:
  6227		case INTEL_FAM6_ATOM_SALTWELL:
  6228		case INTEL_FAM6_ATOM_SALTWELL_MID:
  6229		case INTEL_FAM6_ATOM_SALTWELL_TABLET:
  6230			memcpy(hw_cache_event_ids, atom_hw_cache_event_ids,
  6231			       sizeof(hw_cache_event_ids));
  6232	
  6233			intel_pmu_lbr_init_atom();
  6234	
  6235			x86_pmu.event_constraints = intel_gen_event_constraints;
  6236			x86_pmu.pebs_constraints = intel_atom_pebs_event_constraints;
  6237			x86_pmu.pebs_aliases = intel_pebs_aliases_core2;
  6238			pr_cont("Atom events, ");
  6239			name = "bonnell";
  6240			break;
  6241	
  6242		case INTEL_FAM6_ATOM_SILVERMONT:
  6243		case INTEL_FAM6_ATOM_SILVERMONT_D:
  6244		case INTEL_FAM6_ATOM_SILVERMONT_MID:
  6245		case INTEL_FAM6_ATOM_AIRMONT:
  6246		case INTEL_FAM6_ATOM_AIRMONT_MID:
  6247			memcpy(hw_cache_event_ids, slm_hw_cache_event_ids,
  6248				sizeof(hw_cache_event_ids));
  6249			memcpy(hw_cache_extra_regs, slm_hw_cache_extra_regs,
  6250			       sizeof(hw_cache_extra_regs));
  6251	
  6252			intel_pmu_lbr_init_slm();
  6253	
  6254			x86_pmu.event_constraints = intel_slm_event_constraints;
  6255			x86_pmu.pebs_constraints = intel_slm_pebs_event_constraints;
  6256			x86_pmu.extra_regs = intel_slm_extra_regs;
  6257			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6258			td_attr = slm_events_attrs;
  6259			extra_attr = slm_format_attr;
  6260			pr_cont("Silvermont events, ");
  6261			name = "silvermont";
  6262			break;
  6263	
  6264		case INTEL_FAM6_ATOM_GOLDMONT:
  6265		case INTEL_FAM6_ATOM_GOLDMONT_D:
  6266			x86_add_quirk(intel_counter_freezing_quirk);
  6267			memcpy(hw_cache_event_ids, glm_hw_cache_event_ids,
  6268			       sizeof(hw_cache_event_ids));
  6269			memcpy(hw_cache_extra_regs, glm_hw_cache_extra_regs,
  6270			       sizeof(hw_cache_extra_regs));
  6271	
  6272			intel_pmu_lbr_init_skl();
  6273	
  6274			x86_pmu.event_constraints = intel_slm_event_constraints;
  6275			x86_pmu.pebs_constraints = intel_glm_pebs_event_constraints;
  6276			x86_pmu.extra_regs = intel_glm_extra_regs;
  6277			/*
  6278			 * It's recommended to use CPU_CLK_UNHALTED.CORE_P + NPEBS
  6279			 * for precise cycles.
  6280			 * :pp is identical to :ppp
  6281			 */
  6282			x86_pmu.pebs_aliases = NULL;
  6283			x86_pmu.pebs_prec_dist = true;
  6284			x86_pmu.lbr_pt_coexist = true;
  6285			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6286			td_attr = glm_events_attrs;
  6287			extra_attr = slm_format_attr;
  6288			pr_cont("Goldmont events, ");
  6289			name = "goldmont";
  6290			break;
  6291	
  6292		case INTEL_FAM6_ATOM_GOLDMONT_PLUS:
  6293			x86_add_quirk(intel_counter_freezing_quirk);
  6294			memcpy(hw_cache_event_ids, glp_hw_cache_event_ids,
  6295			       sizeof(hw_cache_event_ids));
  6296			memcpy(hw_cache_extra_regs, glp_hw_cache_extra_regs,
  6297			       sizeof(hw_cache_extra_regs));
  6298	
  6299			intel_pmu_lbr_init_skl();
  6300	
  6301			x86_pmu.event_constraints = intel_slm_event_constraints;
  6302			x86_pmu.extra_regs = intel_glm_extra_regs;
  6303			/*
  6304			 * It's recommended to use CPU_CLK_UNHALTED.CORE_P + NPEBS
  6305			 * for precise cycles.
  6306			 */
  6307			x86_pmu.pebs_aliases = NULL;
  6308			x86_pmu.pebs_prec_dist = true;
  6309			x86_pmu.lbr_pt_coexist = true;
  6310			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6311			x86_pmu.flags |= PMU_FL_PEBS_ALL;
  6312			x86_pmu.get_event_constraints = glp_get_event_constraints;
  6313			td_attr = glm_events_attrs;
  6314			/* Goldmont Plus has 4-wide pipeline */
  6315			event_attr_td_total_slots_scale_glm.event_str = "4";
  6316			extra_attr = slm_format_attr;
  6317			pr_cont("Goldmont plus events, ");
  6318			name = "goldmont_plus";
  6319			break;
  6320	
  6321		case INTEL_FAM6_ATOM_TREMONT_D:
  6322		case INTEL_FAM6_ATOM_TREMONT:
  6323		case INTEL_FAM6_ATOM_TREMONT_L:
  6324			x86_pmu.late_ack = true;
  6325			memcpy(hw_cache_event_ids, glp_hw_cache_event_ids,
  6326			       sizeof(hw_cache_event_ids));
  6327			memcpy(hw_cache_extra_regs, tnt_hw_cache_extra_regs,
  6328			       sizeof(hw_cache_extra_regs));
  6329			hw_cache_event_ids[C(ITLB)][C(OP_READ)][C(RESULT_ACCESS)] = -1;
  6330	
  6331			intel_pmu_lbr_init_skl();
  6332	
  6333			x86_pmu.event_constraints = intel_slm_event_constraints;
  6334			x86_pmu.extra_regs = intel_tnt_extra_regs;
  6335			/*
  6336			 * It's recommended to use CPU_CLK_UNHALTED.CORE_P + NPEBS
  6337			 * for precise cycles.
  6338			 */
  6339			x86_pmu.pebs_aliases = NULL;
  6340			x86_pmu.pebs_prec_dist = true;
  6341			x86_pmu.lbr_pt_coexist = true;
  6342			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6343			x86_pmu.get_event_constraints = tnt_get_event_constraints;
  6344			td_attr = tnt_events_attrs;
  6345			extra_attr = slm_format_attr;
  6346			pr_cont("Tremont events, ");
  6347			name = "Tremont";
  6348			break;
  6349	
  6350		case INTEL_FAM6_ATOM_GRACEMONT:
  6351			intel_pmu_init_grt(NULL);
  6352			intel_pmu_pebs_data_source_grt();
  6353			x86_pmu.pebs_latency_data = adl_latency_data_small;
  6354			x86_pmu.get_event_constraints = tnt_get_event_constraints;
  6355			td_attr = tnt_events_attrs;
  6356			mem_attr = grt_mem_attrs;
  6357			extra_attr = nhm_format_attr;
  6358			pr_cont("Gracemont events, ");
  6359			name = "gracemont";
  6360			break;
  6361	
  6362		case INTEL_FAM6_ATOM_CRESTMONT:
  6363		case INTEL_FAM6_ATOM_CRESTMONT_X:
  6364			intel_pmu_init_grt(NULL);
  6365			x86_pmu.extra_regs = intel_cmt_extra_regs;
  6366			intel_pmu_pebs_data_source_cmt();
  6367			x86_pmu.pebs_latency_data = mtl_latency_data_small;
  6368			x86_pmu.get_event_constraints = cmt_get_event_constraints;
  6369			td_attr = cmt_events_attrs;
  6370			mem_attr = grt_mem_attrs;
  6371			extra_attr = cmt_format_attr;
  6372			pr_cont("Crestmont events, ");
  6373			name = "crestmont";
  6374			break;
  6375	
  6376		case INTEL_FAM6_WESTMERE:
  6377		case INTEL_FAM6_WESTMERE_EP:
  6378		case INTEL_FAM6_WESTMERE_EX:
  6379			memcpy(hw_cache_event_ids, westmere_hw_cache_event_ids,
  6380			       sizeof(hw_cache_event_ids));
  6381			memcpy(hw_cache_extra_regs, nehalem_hw_cache_extra_regs,
  6382			       sizeof(hw_cache_extra_regs));
  6383	
  6384			intel_pmu_lbr_init_nhm();
  6385	
  6386			x86_pmu.event_constraints = intel_westmere_event_constraints;
  6387			x86_pmu.enable_all = intel_pmu_nhm_enable_all;
  6388			x86_pmu.pebs_constraints = intel_westmere_pebs_event_constraints;
  6389			x86_pmu.extra_regs = intel_westmere_extra_regs;
  6390			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6391	
  6392			mem_attr = nhm_mem_events_attrs;
  6393	
  6394			/* UOPS_ISSUED.STALLED_CYCLES */
  6395			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] =
  6396				X86_CONFIG(.event=0x0e, .umask=0x01, .inv=1, .cmask=1);
  6397			/* UOPS_EXECUTED.CORE_ACTIVE_CYCLES,c=1,i=1 */
  6398			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_BACKEND] =
  6399				X86_CONFIG(.event=0xb1, .umask=0x3f, .inv=1, .cmask=1);
  6400	
  6401			intel_pmu_pebs_data_source_nhm();
  6402			extra_attr = nhm_format_attr;
  6403			pr_cont("Westmere events, ");
  6404			name = "westmere";
  6405			break;
  6406	
  6407		case INTEL_FAM6_SANDYBRIDGE:
  6408		case INTEL_FAM6_SANDYBRIDGE_X:
  6409			x86_add_quirk(intel_sandybridge_quirk);
  6410			x86_add_quirk(intel_ht_bug);
  6411			memcpy(hw_cache_event_ids, snb_hw_cache_event_ids,
  6412			       sizeof(hw_cache_event_ids));
  6413			memcpy(hw_cache_extra_regs, snb_hw_cache_extra_regs,
  6414			       sizeof(hw_cache_extra_regs));
  6415	
  6416			intel_pmu_lbr_init_snb();
  6417	
  6418			x86_pmu.event_constraints = intel_snb_event_constraints;
  6419			x86_pmu.pebs_constraints = intel_snb_pebs_event_constraints;
  6420			x86_pmu.pebs_aliases = intel_pebs_aliases_snb;
  6421			if (boot_cpu_data.x86_model == INTEL_FAM6_SANDYBRIDGE_X)
  6422				x86_pmu.extra_regs = intel_snbep_extra_regs;
  6423			else
  6424				x86_pmu.extra_regs = intel_snb_extra_regs;
  6425	
  6426	
  6427			/* all extra regs are per-cpu when HT is on */
  6428			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6429			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6430	
  6431			td_attr  = snb_events_attrs;
  6432			mem_attr = snb_mem_events_attrs;
  6433	
  6434			/* UOPS_ISSUED.ANY,c=1,i=1 to count stall cycles */
  6435			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] =
  6436				X86_CONFIG(.event=0x0e, .umask=0x01, .inv=1, .cmask=1);
  6437			/* UOPS_DISPATCHED.THREAD,c=1,i=1 to count stall cycles*/
  6438			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_BACKEND] =
  6439				X86_CONFIG(.event=0xb1, .umask=0x01, .inv=1, .cmask=1);
  6440	
  6441			extra_attr = nhm_format_attr;
  6442	
  6443			pr_cont("SandyBridge events, ");
  6444			name = "sandybridge";
  6445			break;
  6446	
  6447		case INTEL_FAM6_IVYBRIDGE:
  6448		case INTEL_FAM6_IVYBRIDGE_X:
  6449			x86_add_quirk(intel_ht_bug);
  6450			memcpy(hw_cache_event_ids, snb_hw_cache_event_ids,
  6451			       sizeof(hw_cache_event_ids));
  6452			/* dTLB-load-misses on IVB is different than SNB */
  6453			hw_cache_event_ids[C(DTLB)][C(OP_READ)][C(RESULT_MISS)] = 0x8108; /* DTLB_LOAD_MISSES.DEMAND_LD_MISS_CAUSES_A_WALK */
  6454	
  6455			memcpy(hw_cache_extra_regs, snb_hw_cache_extra_regs,
  6456			       sizeof(hw_cache_extra_regs));
  6457	
  6458			intel_pmu_lbr_init_snb();
  6459	
  6460			x86_pmu.event_constraints = intel_ivb_event_constraints;
  6461			x86_pmu.pebs_constraints = intel_ivb_pebs_event_constraints;
  6462			x86_pmu.pebs_aliases = intel_pebs_aliases_ivb;
  6463			x86_pmu.pebs_prec_dist = true;
  6464			if (boot_cpu_data.x86_model == INTEL_FAM6_IVYBRIDGE_X)
  6465				x86_pmu.extra_regs = intel_snbep_extra_regs;
  6466			else
  6467				x86_pmu.extra_regs = intel_snb_extra_regs;
  6468			/* all extra regs are per-cpu when HT is on */
  6469			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6470			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6471	
  6472			td_attr  = snb_events_attrs;
  6473			mem_attr = snb_mem_events_attrs;
  6474	
  6475			/* UOPS_ISSUED.ANY,c=1,i=1 to count stall cycles */
  6476			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] =
  6477				X86_CONFIG(.event=0x0e, .umask=0x01, .inv=1, .cmask=1);
  6478	
  6479			extra_attr = nhm_format_attr;
  6480	
  6481			pr_cont("IvyBridge events, ");
  6482			name = "ivybridge";
  6483			break;
  6484	
  6485	
  6486		case INTEL_FAM6_HASWELL:
  6487		case INTEL_FAM6_HASWELL_X:
  6488		case INTEL_FAM6_HASWELL_L:
  6489		case INTEL_FAM6_HASWELL_G:
  6490			x86_add_quirk(intel_ht_bug);
  6491			x86_add_quirk(intel_pebs_isolation_quirk);
  6492			x86_pmu.late_ack = true;
  6493			memcpy(hw_cache_event_ids, hsw_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  6494			memcpy(hw_cache_extra_regs, hsw_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  6495	
  6496			intel_pmu_lbr_init_hsw();
  6497	
  6498			x86_pmu.event_constraints = intel_hsw_event_constraints;
  6499			x86_pmu.pebs_constraints = intel_hsw_pebs_event_constraints;
  6500			x86_pmu.extra_regs = intel_snbep_extra_regs;
  6501			x86_pmu.pebs_aliases = intel_pebs_aliases_ivb;
  6502			x86_pmu.pebs_prec_dist = true;
  6503			/* all extra regs are per-cpu when HT is on */
  6504			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6505			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6506	
  6507			x86_pmu.hw_config = hsw_hw_config;
  6508			x86_pmu.get_event_constraints = hsw_get_event_constraints;
  6509			x86_pmu.limit_period = hsw_limit_period;
  6510			x86_pmu.lbr_double_abort = true;
  6511			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  6512				hsw_format_attr : nhm_format_attr;
  6513			td_attr  = hsw_events_attrs;
  6514			mem_attr = hsw_mem_events_attrs;
  6515			tsx_attr = hsw_tsx_events_attrs;
  6516			pr_cont("Haswell events, ");
  6517			name = "haswell";
  6518			break;
  6519	
  6520		case INTEL_FAM6_BROADWELL:
  6521		case INTEL_FAM6_BROADWELL_D:
  6522		case INTEL_FAM6_BROADWELL_G:
  6523		case INTEL_FAM6_BROADWELL_X:
  6524			x86_add_quirk(intel_pebs_isolation_quirk);
  6525			x86_pmu.late_ack = true;
  6526			memcpy(hw_cache_event_ids, hsw_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  6527			memcpy(hw_cache_extra_regs, hsw_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  6528	
  6529			/* L3_MISS_LOCAL_DRAM is BIT(26) in Broadwell */
  6530			hw_cache_extra_regs[C(LL)][C(OP_READ)][C(RESULT_MISS)] = HSW_DEMAND_READ |
  6531										 BDW_L3_MISS|HSW_SNOOP_DRAM;
  6532			hw_cache_extra_regs[C(LL)][C(OP_WRITE)][C(RESULT_MISS)] = HSW_DEMAND_WRITE|BDW_L3_MISS|
  6533										  HSW_SNOOP_DRAM;
  6534			hw_cache_extra_regs[C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = HSW_DEMAND_READ|
  6535										     BDW_L3_MISS_LOCAL|HSW_SNOOP_DRAM;
  6536			hw_cache_extra_regs[C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = HSW_DEMAND_WRITE|
  6537										      BDW_L3_MISS_LOCAL|HSW_SNOOP_DRAM;
  6538	
  6539			intel_pmu_lbr_init_hsw();
  6540	
  6541			x86_pmu.event_constraints = intel_bdw_event_constraints;
  6542			x86_pmu.pebs_constraints = intel_bdw_pebs_event_constraints;
  6543			x86_pmu.extra_regs = intel_snbep_extra_regs;
  6544			x86_pmu.pebs_aliases = intel_pebs_aliases_ivb;
  6545			x86_pmu.pebs_prec_dist = true;
  6546			/* all extra regs are per-cpu when HT is on */
  6547			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6548			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6549	
  6550			x86_pmu.hw_config = hsw_hw_config;
  6551			x86_pmu.get_event_constraints = hsw_get_event_constraints;
  6552			x86_pmu.limit_period = bdw_limit_period;
  6553			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  6554				hsw_format_attr : nhm_format_attr;
  6555			td_attr  = hsw_events_attrs;
  6556			mem_attr = hsw_mem_events_attrs;
  6557			tsx_attr = hsw_tsx_events_attrs;
  6558			pr_cont("Broadwell events, ");
  6559			name = "broadwell";
  6560			break;
  6561	
  6562		case INTEL_FAM6_XEON_PHI_KNL:
  6563		case INTEL_FAM6_XEON_PHI_KNM:
  6564			memcpy(hw_cache_event_ids,
  6565			       slm_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  6566			memcpy(hw_cache_extra_regs,
  6567			       knl_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  6568			intel_pmu_lbr_init_knl();
  6569	
  6570			x86_pmu.event_constraints = intel_slm_event_constraints;
  6571			x86_pmu.pebs_constraints = intel_slm_pebs_event_constraints;
  6572			x86_pmu.extra_regs = intel_knl_extra_regs;
  6573	
  6574			/* all extra regs are per-cpu when HT is on */
  6575			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6576			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6577			extra_attr = slm_format_attr;
  6578			pr_cont("Knights Landing/Mill events, ");
  6579			name = "knights-landing";
  6580			break;
  6581	
  6582		case INTEL_FAM6_SKYLAKE_X:
  6583			pmem = true;
  6584			fallthrough;
  6585		case INTEL_FAM6_SKYLAKE_L:
  6586		case INTEL_FAM6_SKYLAKE:
  6587		case INTEL_FAM6_KABYLAKE_L:
  6588		case INTEL_FAM6_KABYLAKE:
  6589		case INTEL_FAM6_COMETLAKE_L:
  6590		case INTEL_FAM6_COMETLAKE:
  6591			x86_add_quirk(intel_pebs_isolation_quirk);
  6592			x86_pmu.late_ack = true;
  6593			memcpy(hw_cache_event_ids, skl_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  6594			memcpy(hw_cache_extra_regs, skl_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  6595			intel_pmu_lbr_init_skl();
  6596	
  6597			/* INT_MISC.RECOVERY_CYCLES has umask 1 in Skylake */
  6598			event_attr_td_recovery_bubbles.event_str_noht =
  6599				"event=0xd,umask=0x1,cmask=1";
  6600			event_attr_td_recovery_bubbles.event_str_ht =
  6601				"event=0xd,umask=0x1,cmask=1,any=1";
  6602	
  6603			x86_pmu.event_constraints = intel_skl_event_constraints;
  6604			x86_pmu.pebs_constraints = intel_skl_pebs_event_constraints;
  6605			x86_pmu.extra_regs = intel_skl_extra_regs;
  6606			x86_pmu.pebs_aliases = intel_pebs_aliases_skl;
  6607			x86_pmu.pebs_prec_dist = true;
  6608			/* all extra regs are per-cpu when HT is on */
  6609			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6610			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6611	
  6612			x86_pmu.hw_config = hsw_hw_config;
  6613			x86_pmu.get_event_constraints = hsw_get_event_constraints;
  6614			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  6615				hsw_format_attr : nhm_format_attr;
  6616			extra_skl_attr = skl_format_attr;
  6617			td_attr  = hsw_events_attrs;
  6618			mem_attr = hsw_mem_events_attrs;
  6619			tsx_attr = hsw_tsx_events_attrs;
  6620			intel_pmu_pebs_data_source_skl(pmem);
  6621	
  6622			if (boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)) {
  6623				x86_pmu.flags |= PMU_FL_TFA;
  6624				x86_pmu.get_event_constraints = tfa_get_event_constraints;
  6625				x86_pmu.enable_all = intel_tfa_pmu_enable_all;
  6626				x86_pmu.commit_scheduling = intel_tfa_commit_scheduling;
  6627			}
  6628	
  6629			pr_cont("Skylake events, ");
  6630			name = "skylake";
  6631			break;
  6632	
  6633		case INTEL_FAM6_ICELAKE_X:
  6634		case INTEL_FAM6_ICELAKE_D:
  6635			pmem = true;
  6636			fallthrough;
  6637		case INTEL_FAM6_ICELAKE_L:
  6638		case INTEL_FAM6_ICELAKE:
  6639		case INTEL_FAM6_TIGERLAKE_L:
  6640		case INTEL_FAM6_TIGERLAKE:
  6641			x86_pmu.late_ack = true;
  6642			memcpy(hw_cache_event_ids, skl_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  6643			memcpy(hw_cache_extra_regs, skl_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  6644			hw_cache_event_ids[C(ITLB)][C(OP_READ)][C(RESULT_ACCESS)] = -1;
  6645			intel_pmu_lbr_init_skl();
  6646	
  6647			x86_pmu.event_constraints = intel_icl_event_constraints;
  6648			x86_pmu.pebs_constraints = intel_icl_pebs_event_constraints;
  6649			x86_pmu.extra_regs = intel_icl_extra_regs;
  6650			x86_pmu.pebs_aliases = NULL;
  6651			x86_pmu.pebs_prec_dist = true;
  6652			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  6653			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  6654	
  6655			x86_pmu.hw_config = hsw_hw_config;
  6656			x86_pmu.get_event_constraints = icl_get_event_constraints;
  6657			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  6658				hsw_format_attr : nhm_format_attr;
  6659			extra_skl_attr = skl_format_attr;
  6660			mem_attr = icl_events_attrs;
  6661			td_attr = icl_td_events_attrs;
  6662			tsx_attr = icl_tsx_events_attrs;
  6663			x86_pmu.rtm_abort_event = X86_CONFIG(.event=0xc9, .umask=0x04);
  6664			x86_pmu.lbr_pt_coexist = true;
  6665			intel_pmu_pebs_data_source_skl(pmem);
  6666			x86_pmu.num_topdown_events = 4;
  6667			x86_pmu.update_topdown_event = icl_update_topdown_event;
  6668			x86_pmu.set_topdown_event_period = icl_set_topdown_event_period;
  6669			pr_cont("Icelake events, ");
  6670			name = "icelake";
  6671			break;
  6672	
  6673		case INTEL_FAM6_SAPPHIRERAPIDS_X:
  6674		case INTEL_FAM6_EMERALDRAPIDS_X:
  6675			x86_pmu.flags |= PMU_FL_MEM_LOADS_AUX;
  6676			x86_pmu.extra_regs = intel_glc_extra_regs;
  6677			pr_cont("Sapphire Rapids events, ");
  6678			name = "sapphire_rapids";
  6679			goto glc_common;
  6680	
  6681		case INTEL_FAM6_GRANITERAPIDS_X:
  6682		case INTEL_FAM6_GRANITERAPIDS_D:
  6683			if (!x86_pmu.extra_regs)
  6684				x86_pmu.extra_regs = intel_rwc_extra_regs;
  6685			pr_cont("Granite Rapids events, ");
  6686			name = "granite_rapids";
  6687	
  6688		glc_common:
  6689			intel_pmu_init_glc(NULL);
  6690	
  6691			x86_pmu.hw_config = hsw_hw_config;
  6692			x86_pmu.get_event_constraints = glc_get_event_constraints;
  6693			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  6694				hsw_format_attr : nhm_format_attr;
  6695			extra_skl_attr = skl_format_attr;
  6696			mem_attr = glc_events_attrs;
  6697			td_attr = glc_td_events_attrs;
  6698			tsx_attr = glc_tsx_events_attrs;
  6699			intel_pmu_pebs_data_source_skl(true);
  6700			break;
  6701	
  6702		case INTEL_FAM6_ALDERLAKE:
  6703		case INTEL_FAM6_ALDERLAKE_L:
  6704		case INTEL_FAM6_RAPTORLAKE:
  6705		case INTEL_FAM6_RAPTORLAKE_P:
  6706			/*
  6707			 * Alder Lake has 2 types of CPU, core and atom.
  6708			 *
  6709			 * Initialize the common PerfMon capabilities here.
  6710			 */
  6711			intel_pmu_init_hybrid(hybrid_big_small);
  6712	
  6713			x86_pmu.pebs_latency_data = adl_latency_data_small;
  6714	
  6715			x86_pmu.get_event_constraints = adl_get_event_constraints;
  6716			x86_pmu.hw_config = adl_hw_config;
  6717			x86_pmu.get_hybrid_cpu_type = adl_get_hybrid_cpu_type;
  6718	
  6719			td_attr = adl_hybrid_events_attrs;
  6720			mem_attr = adl_hybrid_mem_attrs;
  6721			tsx_attr = adl_hybrid_tsx_attrs;
  6722			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  6723				adl_hybrid_extra_attr_rtm : adl_hybrid_extra_attr;
  6724	
  6725			/* Initialize big core specific PerfMon capabilities.*/
  6726			pmu = &x86_pmu.hybrid_pmu[X86_HYBRID_PMU_CORE_IDX];
  6727			intel_pmu_init_glc(&pmu->pmu);
  6728			if (cpu_feature_enabled(X86_FEATURE_HYBRID_CPU)) {
  6729				pmu->num_counters = x86_pmu.num_counters + 2;
  6730				pmu->num_counters_fixed = x86_pmu.num_counters_fixed + 1;
  6731			} else {
  6732				pmu->num_counters = x86_pmu.num_counters;
  6733				pmu->num_counters_fixed = x86_pmu.num_counters_fixed;
  6734			}
  6735	
  6736			/*
  6737			 * Quirk: For some Alder Lake machine, when all E-cores are disabled in
  6738			 * a BIOS, the leaf 0xA will enumerate all counters of P-cores. However,
  6739			 * the X86_FEATURE_HYBRID_CPU is still set. The above codes will
  6740			 * mistakenly add extra counters for P-cores. Correct the number of
  6741			 * counters here.
  6742			 */
  6743			if ((pmu->num_counters > 8) || (pmu->num_counters_fixed > 4)) {
  6744				pmu->num_counters = x86_pmu.num_counters;
  6745				pmu->num_counters_fixed = x86_pmu.num_counters_fixed;
  6746			}
  6747	
  6748			pmu->max_pebs_events = min_t(unsigned, MAX_PEBS_EVENTS, pmu->num_counters);
  6749			pmu->unconstrained = (struct event_constraint)
  6750						__EVENT_CONSTRAINT(0, (1ULL << pmu->num_counters) - 1,
  6751								   0, pmu->num_counters, 0, 0);
  6752	
  6753			pmu->extra_regs = intel_glc_extra_regs;
  6754	
  6755			/* Initialize Atom core specific PerfMon capabilities.*/
  6756			pmu = &x86_pmu.hybrid_pmu[X86_HYBRID_PMU_ATOM_IDX];
  6757			intel_pmu_init_grt(&pmu->pmu);
  6758	
  6759			x86_pmu.flags |= PMU_FL_MEM_LOADS_AUX;
  6760			intel_pmu_pebs_data_source_adl();
  6761			pr_cont("Alderlake Hybrid events, ");
  6762			name = "alderlake_hybrid";
  6763			break;
  6764	
> 6765		case INTEL_FAM6_METEORLAKE:
  6766		case INTEL_FAM6_METEORLAKE_L:
  6767			intel_pmu_init_hybrid(hybrid_big_small);
  6768	
  6769			x86_pmu.pebs_latency_data = mtl_latency_data_small;
  6770			x86_pmu.get_event_constraints = mtl_get_event_constraints;
  6771			x86_pmu.hw_config = adl_hw_config;
  6772	
  6773			td_attr = adl_hybrid_events_attrs;
  6774			mem_attr = mtl_hybrid_mem_attrs;
  6775			tsx_attr = adl_hybrid_tsx_attrs;
  6776			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  6777				mtl_hybrid_extra_attr_rtm : mtl_hybrid_extra_attr;
  6778	
  6779			/* Initialize big core specific PerfMon capabilities.*/
  6780			pmu = &x86_pmu.hybrid_pmu[X86_HYBRID_PMU_CORE_IDX];
  6781			intel_pmu_init_glc(&pmu->pmu);
  6782			break;
  6783	
  6784		default:
  6785			switch (x86_pmu.version) {
  6786			case 1:
  6787				x86_pmu.event_constraints = intel_v1_event_constraints;
  6788				pr_cont("generic architected perfmon v1, ");
  6789				name = "generic_arch_v1";
  6790				break;
  6791			case 2:
  6792			case 3:
  6793			case 4:
  6794				/*
  6795				 * default constraints for v2 and up
  6796				 */
  6797				x86_pmu.event_constraints = intel_gen_event_constraints;
  6798				pr_cont("generic architected perfmon, ");
  6799				name = "generic_arch_v2+";
  6800				break;
  6801			default:
  6802				/*
  6803				 * The default constraints for v5 and up can support up to
  6804				 * 16 fixed counters. For the fixed counters 4 and later,
  6805				 * the pseudo-encoding is applied.
  6806				 * The constraints may be cut according to the CPUID enumeration
  6807				 * by inserting the EVENT_CONSTRAINT_END.
  6808				 */
  6809				if (x86_pmu.num_counters_fixed > INTEL_PMC_MAX_FIXED)
  6810					x86_pmu.num_counters_fixed = INTEL_PMC_MAX_FIXED;
  6811				intel_v5_gen_event_constraints[x86_pmu.num_counters_fixed].weight = -1;
  6812				x86_pmu.event_constraints = intel_v5_gen_event_constraints;
  6813				pr_cont("generic architected perfmon, ");
  6814				name = "generic_arch_v5+";
  6815				break;
  6816			}
  6817		}
  6818	
  6819		snprintf(pmu_name_str, sizeof(pmu_name_str), "%s", name);
  6820	
  6821		if (!is_hybrid()) {
  6822			group_events_td.attrs  = td_attr;
  6823			group_events_mem.attrs = mem_attr;
  6824			group_events_tsx.attrs = tsx_attr;
  6825			group_format_extra.attrs = extra_attr;
  6826			group_format_extra_skl.attrs = extra_skl_attr;
  6827	
  6828			x86_pmu.attr_update = attr_update;
  6829		} else {
  6830			hybrid_group_events_td.attrs  = td_attr;
  6831			hybrid_group_events_mem.attrs = mem_attr;
  6832			hybrid_group_events_tsx.attrs = tsx_attr;
  6833			hybrid_group_format_extra.attrs = extra_attr;
  6834	
  6835			x86_pmu.attr_update = hybrid_attr_update;
  6836		}
  6837	
  6838		intel_pmu_check_num_counters(&x86_pmu.num_counters,
  6839					     &x86_pmu.num_counters_fixed,
  6840					     &x86_pmu.intel_ctrl,
  6841					     (u64)fixed_mask);
  6842	
  6843		/* AnyThread may be deprecated on arch perfmon v5 or later */
  6844		if (x86_pmu.intel_cap.anythread_deprecated)
  6845			x86_pmu.format_attrs = intel_arch_formats_attr;
  6846	
  6847		intel_pmu_check_event_constraints(x86_pmu.event_constraints,
  6848						  x86_pmu.num_counters,
  6849						  x86_pmu.num_counters_fixed,
  6850						  x86_pmu.intel_ctrl);
  6851		/*
  6852		 * Access LBR MSR may cause #GP under certain circumstances.
  6853		 * E.g. KVM doesn't support LBR MSR
  6854		 * Check all LBT MSR here.
  6855		 * Disable LBR access if any LBR MSRs can not be accessed.
  6856		 */
  6857		if (x86_pmu.lbr_tos && !check_msr(x86_pmu.lbr_tos, 0x3UL))
  6858			x86_pmu.lbr_nr = 0;
  6859		for (i = 0; i < x86_pmu.lbr_nr; i++) {
  6860			if (!(check_msr(x86_pmu.lbr_from + i, 0xffffUL) &&
  6861			      check_msr(x86_pmu.lbr_to + i, 0xffffUL)))
  6862				x86_pmu.lbr_nr = 0;
  6863		}
  6864	
  6865		if (x86_pmu.lbr_nr)
  6866			pr_cont("%d-deep LBR, ", x86_pmu.lbr_nr);
  6867	
  6868		intel_pmu_check_extra_regs(x86_pmu.extra_regs);
  6869	
  6870		/* Support full width counters using alternative MSR range */
  6871		if (x86_pmu.intel_cap.full_width_write) {
  6872			x86_pmu.max_period = x86_pmu.cntval_mask >> 1;
  6873			x86_pmu.perfctr = MSR_IA32_PMC0;
  6874			pr_cont("full-width counters, ");
  6875		}
  6876	
  6877		/*
  6878		 * For arch perfmon 4 use counter freezing to avoid
  6879		 * several MSR accesses in the PMI.
  6880		 */
  6881		if (x86_pmu.counter_freezing)
  6882			x86_pmu.handle_irq = intel_pmu_handle_irq_v4;
  6883	
  6884		if (!is_hybrid() && x86_pmu.intel_cap.perf_metrics)
  6885			x86_pmu.intel_ctrl |= 1ULL << GLOBAL_CTRL_EN_PERF_METRICS;
  6886	
  6887		if (is_hybrid() && !boot_cpu_has(X86_FEATURE_ARCH_PERFMON_EXT))
  6888			intel_pmu_check_hybrid_pmus((u64)fixed_mask);
  6889	
  6890		if (x86_pmu.intel_cap.pebs_timing_info)
  6891			x86_pmu.flags |= PMU_FL_RETIRE_LATENCY;
  6892	
  6893		return 0;
  6894	}
  6895	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
