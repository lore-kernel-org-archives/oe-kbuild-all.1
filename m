Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C851E9B2A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 10:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754388208; cv=none; b=Ay/jMgIfxVsF0PWtHayD8MZpZ/oHCCn3YeYNjWJ+GtbMkXijOFNV+Bun8DeF/vJJJ3qSnmyhpBPzlqSyRDVRh2BwikIyWOL3dcv4ooRHvvnl7qJOZY93x4NetumjUetTa2AIvKcWEp5h9pcaIXtDiXuLI51KzuYH8dEDWAgi6XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754388208; c=relaxed/simple;
	bh=OAmlWqMNOrfkrdNbKbP93JLxXu/oXjJZqG7eWhTjezY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dpJFLa/9fw17v8lUfQvieu87FL62yFphabzNFOAU9FTyDxeCYaIMnXFb8StJCGcLPhdoxMSExfIO5KpL7LSGaa5LVXJ+OsEAafZ+IH67ya1j0yqDai3WjuzQYlUU7B++hnh05qSfcBK3KZAAQffjW+T+1uQROUXpplff5REwHkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKjjjqpk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKjjjqpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754388206; x=1785924206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OAmlWqMNOrfkrdNbKbP93JLxXu/oXjJZqG7eWhTjezY=;
  b=UKjjjqpk2H6IfQYAWFMy46UHzAcS3cXoixgm07hbm/uQQdLiDa9c22Jq
   KCt13QbFWjapZn6uMn634AbkT6FxA+XSPuDbgBCVxeMZFzsXPuzhnT9Nl
   UoyAeXvAlw0J90Q6uZl27h1Cp7CSJNjwt02M8kzRbV+Xsh9WfInRWOi9f
   cPBohd6Kh/kRUoA2XjrW803TfJNuY5V0Oh4FpJF7oJyPrfKBwZhL4QhKa
   /4AkE0+iFx8k8YIDMsxckjuWNQie1Pr/RRMS90qcaizM096/v9XZ4C/XD
   bsDaEocG857LCt9ft7xNj6Xzfm6VM1WmkXVyLF5PycFzT3tIaGtzwWosl
   g==;
X-CSE-ConnectionGUID: WQnFBq9eQh6zw8U1tAaJgg==
X-CSE-MsgGUID: 0X+5+UhRQNK6IhObk9GM2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56814824"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="56814824"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 03:03:26 -0700
X-CSE-ConnectionGUID: WLWYRi6IThGMqwBlh9w0WA==
X-CSE-MsgGUID: hjAUUkq5TGazkvF7k79CTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="169720724"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 05 Aug 2025 03:03:24 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujEVt-0001yb-0s;
	Tue, 05 Aug 2025 10:03:21 +0000
Date: Tue, 5 Aug 2025 12:02:58 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743]
 arch/x86/events/intel/core.c:4617:22: warning: this statement may fall
 through
Message-ID: <202508051244.NjazUwXf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3c7bbbad8e4b8331c0db8c827bcd03a54741d7fa
commit: f6e576cf95e27f9a16f46739ae895bd9eaeb9476 [1743/1743] Intel: perf/x86/intel: Add more Icelake CPUIDs
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250805/202508051244.NjazUwXf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508051244.NjazUwXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508051244.NjazUwXf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/events/intel/core.c:22:
   arch/x86/events/intel/core.c: In function 'intel_pmu_init':
   arch/x86/events/intel/../perf_event.h:719:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
     719 |         x86_pmu.quirks = &__quirk;                                      \
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~
   arch/x86/events/intel/core.c:4250:17: note: in expansion of macro 'x86_add_quirk'
    4250 |                 x86_add_quirk(intel_clovertown_quirk);
         |                 ^~~~~~~~~~~~~
   arch/x86/events/intel/core.c:4251:9: note: here
    4251 |         case INTEL_FAM6_CORE2_MEROM_L:
         |         ^~~~
>> arch/x86/events/intel/core.c:4617:22: warning: this statement may fall through [-Wimplicit-fallthrough=]
    4617 |                 pmem = true;
         |                 ~~~~~^~~~~~
   arch/x86/events/intel/core.c:4618:9: note: here
    4618 |         case INTEL_FAM6_SKYLAKE_MOBILE:
         |         ^~~~
   arch/x86/events/intel/core.c:4665:22: warning: this statement may fall through [-Wimplicit-fallthrough=]
    4665 |                 pmem = true;
         |                 ~~~~~^~~~~~
   arch/x86/events/intel/core.c:4666:9: note: here
    4666 |         case INTEL_FAM6_ICELAKE_MOBILE:
         |         ^~~~


vim +4617 arch/x86/events/intel/core.c

  4167	
  4168	__init int intel_pmu_init(void)
  4169	{
  4170		struct attribute **extra_attr = NULL;
  4171		struct attribute **to_free = NULL;
  4172		union cpuid10_edx edx;
  4173		union cpuid10_eax eax;
  4174		union cpuid10_ebx ebx;
  4175		struct event_constraint *c;
  4176		unsigned int unused;
  4177		struct extra_reg *er;
  4178		bool pmem = false;
  4179		int version, i;
  4180		char *name;
  4181	
  4182		if (!cpu_has(&boot_cpu_data, X86_FEATURE_ARCH_PERFMON)) {
  4183			switch (boot_cpu_data.x86) {
  4184			case 0x6:
  4185				return p6_pmu_init();
  4186			case 0xb:
  4187				return knc_pmu_init();
  4188			case 0xf:
  4189				return p4_pmu_init();
  4190			}
  4191			return -ENODEV;
  4192		}
  4193	
  4194		/*
  4195		 * Check whether the Architectural PerfMon supports
  4196		 * Branch Misses Retired hw_event or not.
  4197		 */
  4198		cpuid(10, &eax.full, &ebx.full, &unused, &edx.full);
  4199		if (eax.split.mask_length < ARCH_PERFMON_EVENTS_COUNT)
  4200			return -ENODEV;
  4201	
  4202		version = eax.split.version_id;
  4203		if (version < 2)
  4204			x86_pmu = core_pmu;
  4205		else
  4206			x86_pmu = intel_pmu;
  4207	
  4208		x86_pmu.version			= version;
  4209		x86_pmu.num_counters		= eax.split.num_counters;
  4210		x86_pmu.cntval_bits		= eax.split.bit_width;
  4211		x86_pmu.cntval_mask		= (1ULL << eax.split.bit_width) - 1;
  4212	
  4213		x86_pmu.events_maskl		= ebx.full;
  4214		x86_pmu.events_mask_len		= eax.split.mask_length;
  4215	
  4216		x86_pmu.max_pebs_events		= min_t(unsigned, MAX_PEBS_EVENTS, x86_pmu.num_counters);
  4217	
  4218		/*
  4219		 * Quirk: v2 perfmon does not report fixed-purpose events, so
  4220		 * assume at least 3 events, when not running in a hypervisor:
  4221		 */
  4222		if (version > 1) {
  4223			int assume = 3 * !boot_cpu_has(X86_FEATURE_HYPERVISOR);
  4224	
  4225			x86_pmu.num_counters_fixed =
  4226				max((int)edx.split.num_counters_fixed, assume);
  4227		}
  4228	
  4229		if (boot_cpu_has(X86_FEATURE_PDCM)) {
  4230			u64 capabilities;
  4231	
  4232			rdmsrl(MSR_IA32_PERF_CAPABILITIES, capabilities);
  4233			x86_pmu.intel_cap.capabilities = capabilities;
  4234		}
  4235	
  4236		intel_ds_init();
  4237	
  4238		x86_add_quirk(intel_arch_events_quirk); /* Install first, so it runs last */
  4239	
  4240		/*
  4241		 * Install the hw-cache-events table:
  4242		 */
  4243		switch (boot_cpu_data.x86_model) {
  4244		case INTEL_FAM6_CORE_YONAH:
  4245			pr_cont("Core events, ");
  4246			name = "core";
  4247			break;
  4248	
  4249		case INTEL_FAM6_CORE2_MEROM:
  4250			x86_add_quirk(intel_clovertown_quirk);
  4251		case INTEL_FAM6_CORE2_MEROM_L:
  4252		case INTEL_FAM6_CORE2_PENRYN:
  4253		case INTEL_FAM6_CORE2_DUNNINGTON:
  4254			memcpy(hw_cache_event_ids, core2_hw_cache_event_ids,
  4255			       sizeof(hw_cache_event_ids));
  4256	
  4257			intel_pmu_lbr_init_core();
  4258	
  4259			x86_pmu.event_constraints = intel_core2_event_constraints;
  4260			x86_pmu.pebs_constraints = intel_core2_pebs_event_constraints;
  4261			pr_cont("Core2 events, ");
  4262			name = "core2";
  4263			break;
  4264	
  4265		case INTEL_FAM6_NEHALEM:
  4266		case INTEL_FAM6_NEHALEM_EP:
  4267		case INTEL_FAM6_NEHALEM_EX:
  4268			memcpy(hw_cache_event_ids, nehalem_hw_cache_event_ids,
  4269			       sizeof(hw_cache_event_ids));
  4270			memcpy(hw_cache_extra_regs, nehalem_hw_cache_extra_regs,
  4271			       sizeof(hw_cache_extra_regs));
  4272	
  4273			intel_pmu_lbr_init_nhm();
  4274	
  4275			x86_pmu.event_constraints = intel_nehalem_event_constraints;
  4276			x86_pmu.pebs_constraints = intel_nehalem_pebs_event_constraints;
  4277			x86_pmu.enable_all = intel_pmu_nhm_enable_all;
  4278			x86_pmu.extra_regs = intel_nehalem_extra_regs;
  4279			x86_pmu.limit_period = nhm_limit_period;
  4280	
  4281			x86_pmu.cpu_events = nhm_events_attrs;
  4282	
  4283			/* UOPS_ISSUED.STALLED_CYCLES */
  4284			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] =
  4285				X86_CONFIG(.event=0x0e, .umask=0x01, .inv=1, .cmask=1);
  4286			/* UOPS_EXECUTED.CORE_ACTIVE_CYCLES,c=1,i=1 */
  4287			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_BACKEND] =
  4288				X86_CONFIG(.event=0xb1, .umask=0x3f, .inv=1, .cmask=1);
  4289	
  4290			intel_pmu_pebs_data_source_nhm();
  4291			x86_add_quirk(intel_nehalem_quirk);
  4292			x86_pmu.pebs_no_tlb = 1;
  4293			extra_attr = nhm_format_attr;
  4294	
  4295			pr_cont("Nehalem events, ");
  4296			name = "nehalem";
  4297			break;
  4298	
  4299		case INTEL_FAM6_ATOM_BONNELL:
  4300		case INTEL_FAM6_ATOM_BONNELL_MID:
  4301		case INTEL_FAM6_ATOM_SALTWELL:
  4302		case INTEL_FAM6_ATOM_SALTWELL_MID:
  4303		case INTEL_FAM6_ATOM_SALTWELL_TABLET:
  4304			memcpy(hw_cache_event_ids, atom_hw_cache_event_ids,
  4305			       sizeof(hw_cache_event_ids));
  4306	
  4307			intel_pmu_lbr_init_atom();
  4308	
  4309			x86_pmu.event_constraints = intel_gen_event_constraints;
  4310			x86_pmu.pebs_constraints = intel_atom_pebs_event_constraints;
  4311			x86_pmu.pebs_aliases = intel_pebs_aliases_core2;
  4312			pr_cont("Atom events, ");
  4313			name = "bonnell";
  4314			break;
  4315	
  4316		case INTEL_FAM6_ATOM_SILVERMONT:
  4317		case INTEL_FAM6_ATOM_SILVERMONT_X:
  4318		case INTEL_FAM6_ATOM_SILVERMONT_MID:
  4319		case INTEL_FAM6_ATOM_AIRMONT:
  4320		case INTEL_FAM6_ATOM_AIRMONT_MID:
  4321			memcpy(hw_cache_event_ids, slm_hw_cache_event_ids,
  4322				sizeof(hw_cache_event_ids));
  4323			memcpy(hw_cache_extra_regs, slm_hw_cache_extra_regs,
  4324			       sizeof(hw_cache_extra_regs));
  4325	
  4326			intel_pmu_lbr_init_slm();
  4327	
  4328			x86_pmu.event_constraints = intel_slm_event_constraints;
  4329			x86_pmu.pebs_constraints = intel_slm_pebs_event_constraints;
  4330			x86_pmu.extra_regs = intel_slm_extra_regs;
  4331			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  4332			x86_pmu.cpu_events = slm_events_attrs;
  4333			extra_attr = slm_format_attr;
  4334			pr_cont("Silvermont events, ");
  4335			name = "silvermont";
  4336			break;
  4337	
  4338		case INTEL_FAM6_ATOM_GOLDMONT:
  4339		case INTEL_FAM6_ATOM_GOLDMONT_X:
  4340			memcpy(hw_cache_event_ids, glm_hw_cache_event_ids,
  4341			       sizeof(hw_cache_event_ids));
  4342			memcpy(hw_cache_extra_regs, glm_hw_cache_extra_regs,
  4343			       sizeof(hw_cache_extra_regs));
  4344	
  4345			intel_pmu_lbr_init_skl();
  4346	
  4347			x86_pmu.event_constraints = intel_slm_event_constraints;
  4348			x86_pmu.pebs_constraints = intel_glm_pebs_event_constraints;
  4349			x86_pmu.extra_regs = intel_glm_extra_regs;
  4350			/*
  4351			 * It's recommended to use CPU_CLK_UNHALTED.CORE_P + NPEBS
  4352			 * for precise cycles.
  4353			 * :pp is identical to :ppp
  4354			 */
  4355			x86_pmu.pebs_aliases = NULL;
  4356			x86_pmu.pebs_prec_dist = true;
  4357			x86_pmu.lbr_pt_coexist = true;
  4358			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  4359			x86_pmu.cpu_events = glm_events_attrs;
  4360			extra_attr = slm_format_attr;
  4361			pr_cont("Goldmont events, ");
  4362			name = "goldmont";
  4363			break;
  4364	
  4365		case INTEL_FAM6_ATOM_GOLDMONT_PLUS:
  4366			memcpy(hw_cache_event_ids, glp_hw_cache_event_ids,
  4367			       sizeof(hw_cache_event_ids));
  4368			memcpy(hw_cache_extra_regs, glp_hw_cache_extra_regs,
  4369			       sizeof(hw_cache_extra_regs));
  4370	
  4371			intel_pmu_lbr_init_skl();
  4372	
  4373			x86_pmu.event_constraints = intel_slm_event_constraints;
  4374			x86_pmu.extra_regs = intel_glm_extra_regs;
  4375			/*
  4376			 * It's recommended to use CPU_CLK_UNHALTED.CORE_P + NPEBS
  4377			 * for precise cycles.
  4378			 */
  4379			x86_pmu.pebs_aliases = NULL;
  4380			x86_pmu.pebs_prec_dist = true;
  4381			x86_pmu.lbr_pt_coexist = true;
  4382			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  4383			x86_pmu.flags |= PMU_FL_PEBS_ALL;
  4384			x86_pmu.get_event_constraints = glp_get_event_constraints;
  4385			x86_pmu.cpu_events = glm_events_attrs;
  4386			/* Goldmont Plus has 4-wide pipeline */
  4387			event_attr_td_total_slots_scale_glm.event_str = "4";
  4388			extra_attr = slm_format_attr;
  4389			pr_cont("Goldmont plus events, ");
  4390			name = "goldmont_plus";
  4391			break;
  4392	
  4393		case INTEL_FAM6_ATOM_TREMONT_X:
  4394			x86_pmu.late_ack = true;
  4395			memcpy(hw_cache_event_ids, glp_hw_cache_event_ids,
  4396			       sizeof(hw_cache_event_ids));
  4397			memcpy(hw_cache_extra_regs, tnt_hw_cache_extra_regs,
  4398			       sizeof(hw_cache_extra_regs));
  4399			hw_cache_event_ids[C(ITLB)][C(OP_READ)][C(RESULT_ACCESS)] = -1;
  4400	
  4401			intel_pmu_lbr_init_skl();
  4402	
  4403			x86_pmu.event_constraints = intel_slm_event_constraints;
  4404			x86_pmu.extra_regs = intel_tnt_extra_regs;
  4405			/*
  4406			 * It's recommended to use CPU_CLK_UNHALTED.CORE_P + NPEBS
  4407			 * for precise cycles.
  4408			 */
  4409			x86_pmu.pebs_aliases = NULL;
  4410			x86_pmu.pebs_prec_dist = true;
  4411			x86_pmu.lbr_pt_coexist = true;
  4412			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  4413			x86_pmu.get_event_constraints = tnt_get_event_constraints;
  4414			extra_attr = slm_format_attr;
  4415			pr_cont("Tremont events, ");
  4416			name = "Tremont";
  4417			break;
  4418	
  4419		case INTEL_FAM6_WESTMERE:
  4420		case INTEL_FAM6_WESTMERE_EP:
  4421		case INTEL_FAM6_WESTMERE_EX:
  4422			memcpy(hw_cache_event_ids, westmere_hw_cache_event_ids,
  4423			       sizeof(hw_cache_event_ids));
  4424			memcpy(hw_cache_extra_regs, nehalem_hw_cache_extra_regs,
  4425			       sizeof(hw_cache_extra_regs));
  4426	
  4427			intel_pmu_lbr_init_nhm();
  4428	
  4429			x86_pmu.event_constraints = intel_westmere_event_constraints;
  4430			x86_pmu.enable_all = intel_pmu_nhm_enable_all;
  4431			x86_pmu.pebs_constraints = intel_westmere_pebs_event_constraints;
  4432			x86_pmu.extra_regs = intel_westmere_extra_regs;
  4433			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  4434	
  4435			x86_pmu.cpu_events = nhm_events_attrs;
  4436	
  4437			/* UOPS_ISSUED.STALLED_CYCLES */
  4438			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] =
  4439				X86_CONFIG(.event=0x0e, .umask=0x01, .inv=1, .cmask=1);
  4440			/* UOPS_EXECUTED.CORE_ACTIVE_CYCLES,c=1,i=1 */
  4441			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_BACKEND] =
  4442				X86_CONFIG(.event=0xb1, .umask=0x3f, .inv=1, .cmask=1);
  4443	
  4444			intel_pmu_pebs_data_source_nhm();
  4445			extra_attr = nhm_format_attr;
  4446			pr_cont("Westmere events, ");
  4447			name = "westmere";
  4448			break;
  4449	
  4450		case INTEL_FAM6_SANDYBRIDGE:
  4451		case INTEL_FAM6_SANDYBRIDGE_X:
  4452			x86_add_quirk(intel_sandybridge_quirk);
  4453			x86_add_quirk(intel_ht_bug);
  4454			memcpy(hw_cache_event_ids, snb_hw_cache_event_ids,
  4455			       sizeof(hw_cache_event_ids));
  4456			memcpy(hw_cache_extra_regs, snb_hw_cache_extra_regs,
  4457			       sizeof(hw_cache_extra_regs));
  4458	
  4459			intel_pmu_lbr_init_snb();
  4460	
  4461			x86_pmu.event_constraints = intel_snb_event_constraints;
  4462			x86_pmu.pebs_constraints = intel_snb_pebs_event_constraints;
  4463			x86_pmu.pebs_aliases = intel_pebs_aliases_snb;
  4464			if (boot_cpu_data.x86_model == INTEL_FAM6_SANDYBRIDGE_X)
  4465				x86_pmu.extra_regs = intel_snbep_extra_regs;
  4466			else
  4467				x86_pmu.extra_regs = intel_snb_extra_regs;
  4468	
  4469	
  4470			/* all extra regs are per-cpu when HT is on */
  4471			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  4472			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  4473	
  4474			x86_pmu.cpu_events = snb_events_attrs;
  4475	
  4476			/* UOPS_ISSUED.ANY,c=1,i=1 to count stall cycles */
  4477			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] =
  4478				X86_CONFIG(.event=0x0e, .umask=0x01, .inv=1, .cmask=1);
  4479			/* UOPS_DISPATCHED.THREAD,c=1,i=1 to count stall cycles*/
  4480			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_BACKEND] =
  4481				X86_CONFIG(.event=0xb1, .umask=0x01, .inv=1, .cmask=1);
  4482	
  4483			extra_attr = nhm_format_attr;
  4484	
  4485			pr_cont("SandyBridge events, ");
  4486			name = "sandybridge";
  4487			break;
  4488	
  4489		case INTEL_FAM6_IVYBRIDGE:
  4490		case INTEL_FAM6_IVYBRIDGE_X:
  4491			x86_add_quirk(intel_ht_bug);
  4492			memcpy(hw_cache_event_ids, snb_hw_cache_event_ids,
  4493			       sizeof(hw_cache_event_ids));
  4494			/* dTLB-load-misses on IVB is different than SNB */
  4495			hw_cache_event_ids[C(DTLB)][C(OP_READ)][C(RESULT_MISS)] = 0x8108; /* DTLB_LOAD_MISSES.DEMAND_LD_MISS_CAUSES_A_WALK */
  4496	
  4497			memcpy(hw_cache_extra_regs, snb_hw_cache_extra_regs,
  4498			       sizeof(hw_cache_extra_regs));
  4499	
  4500			intel_pmu_lbr_init_snb();
  4501	
  4502			x86_pmu.event_constraints = intel_ivb_event_constraints;
  4503			x86_pmu.pebs_constraints = intel_ivb_pebs_event_constraints;
  4504			x86_pmu.pebs_aliases = intel_pebs_aliases_ivb;
  4505			x86_pmu.pebs_prec_dist = true;
  4506			if (boot_cpu_data.x86_model == INTEL_FAM6_IVYBRIDGE_X)
  4507				x86_pmu.extra_regs = intel_snbep_extra_regs;
  4508			else
  4509				x86_pmu.extra_regs = intel_snb_extra_regs;
  4510			/* all extra regs are per-cpu when HT is on */
  4511			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  4512			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  4513	
  4514			x86_pmu.cpu_events = snb_events_attrs;
  4515	
  4516			/* UOPS_ISSUED.ANY,c=1,i=1 to count stall cycles */
  4517			intel_perfmon_event_map[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] =
  4518				X86_CONFIG(.event=0x0e, .umask=0x01, .inv=1, .cmask=1);
  4519	
  4520			extra_attr = nhm_format_attr;
  4521	
  4522			pr_cont("IvyBridge events, ");
  4523			name = "ivybridge";
  4524			break;
  4525	
  4526	
  4527		case INTEL_FAM6_HASWELL_CORE:
  4528		case INTEL_FAM6_HASWELL_X:
  4529		case INTEL_FAM6_HASWELL_ULT:
  4530		case INTEL_FAM6_HASWELL_GT3E:
  4531			x86_add_quirk(intel_ht_bug);
  4532			x86_pmu.late_ack = true;
  4533			memcpy(hw_cache_event_ids, hsw_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  4534			memcpy(hw_cache_extra_regs, hsw_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  4535	
  4536			intel_pmu_lbr_init_hsw();
  4537	
  4538			x86_pmu.event_constraints = intel_hsw_event_constraints;
  4539			x86_pmu.pebs_constraints = intel_hsw_pebs_event_constraints;
  4540			x86_pmu.extra_regs = intel_snbep_extra_regs;
  4541			x86_pmu.pebs_aliases = intel_pebs_aliases_ivb;
  4542			x86_pmu.pebs_prec_dist = true;
  4543			/* all extra regs are per-cpu when HT is on */
  4544			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  4545			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  4546	
  4547			x86_pmu.hw_config = hsw_hw_config;
  4548			x86_pmu.get_event_constraints = hsw_get_event_constraints;
  4549			x86_pmu.cpu_events = get_hsw_events_attrs();
  4550			x86_pmu.lbr_double_abort = true;
  4551			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  4552				hsw_format_attr : nhm_format_attr;
  4553			pr_cont("Haswell events, ");
  4554			name = "haswell";
  4555			break;
  4556	
  4557		case INTEL_FAM6_BROADWELL_CORE:
  4558		case INTEL_FAM6_BROADWELL_XEON_D:
  4559		case INTEL_FAM6_BROADWELL_GT3E:
  4560		case INTEL_FAM6_BROADWELL_X:
  4561			x86_pmu.late_ack = true;
  4562			memcpy(hw_cache_event_ids, hsw_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  4563			memcpy(hw_cache_extra_regs, hsw_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  4564	
  4565			/* L3_MISS_LOCAL_DRAM is BIT(26) in Broadwell */
  4566			hw_cache_extra_regs[C(LL)][C(OP_READ)][C(RESULT_MISS)] = HSW_DEMAND_READ |
  4567										 BDW_L3_MISS|HSW_SNOOP_DRAM;
  4568			hw_cache_extra_regs[C(LL)][C(OP_WRITE)][C(RESULT_MISS)] = HSW_DEMAND_WRITE|BDW_L3_MISS|
  4569										  HSW_SNOOP_DRAM;
  4570			hw_cache_extra_regs[C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = HSW_DEMAND_READ|
  4571										     BDW_L3_MISS_LOCAL|HSW_SNOOP_DRAM;
  4572			hw_cache_extra_regs[C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = HSW_DEMAND_WRITE|
  4573										      BDW_L3_MISS_LOCAL|HSW_SNOOP_DRAM;
  4574	
  4575			intel_pmu_lbr_init_hsw();
  4576	
  4577			x86_pmu.event_constraints = intel_bdw_event_constraints;
  4578			x86_pmu.pebs_constraints = intel_bdw_pebs_event_constraints;
  4579			x86_pmu.extra_regs = intel_snbep_extra_regs;
  4580			x86_pmu.pebs_aliases = intel_pebs_aliases_ivb;
  4581			x86_pmu.pebs_prec_dist = true;
  4582			/* all extra regs are per-cpu when HT is on */
  4583			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  4584			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  4585	
  4586			x86_pmu.hw_config = hsw_hw_config;
  4587			x86_pmu.get_event_constraints = hsw_get_event_constraints;
  4588			x86_pmu.cpu_events = get_hsw_events_attrs();
  4589			x86_pmu.limit_period = bdw_limit_period;
  4590			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  4591				hsw_format_attr : nhm_format_attr;
  4592			pr_cont("Broadwell events, ");
  4593			name = "broadwell";
  4594			break;
  4595	
  4596		case INTEL_FAM6_XEON_PHI_KNL:
  4597		case INTEL_FAM6_XEON_PHI_KNM:
  4598			memcpy(hw_cache_event_ids,
  4599			       slm_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  4600			memcpy(hw_cache_extra_regs,
  4601			       knl_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  4602			intel_pmu_lbr_init_knl();
  4603	
  4604			x86_pmu.event_constraints = intel_slm_event_constraints;
  4605			x86_pmu.pebs_constraints = intel_slm_pebs_event_constraints;
  4606			x86_pmu.extra_regs = intel_knl_extra_regs;
  4607	
  4608			/* all extra regs are per-cpu when HT is on */
  4609			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  4610			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  4611			extra_attr = slm_format_attr;
  4612			pr_cont("Knights Landing/Mill events, ");
  4613			name = "knights-landing";
  4614			break;
  4615	
  4616		case INTEL_FAM6_SKYLAKE_X:
> 4617			pmem = true;
  4618		case INTEL_FAM6_SKYLAKE_MOBILE:
  4619		case INTEL_FAM6_SKYLAKE_DESKTOP:
  4620		case INTEL_FAM6_KABYLAKE_MOBILE:
  4621		case INTEL_FAM6_KABYLAKE_DESKTOP:
  4622			x86_pmu.late_ack = true;
  4623			memcpy(hw_cache_event_ids, skl_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  4624			memcpy(hw_cache_extra_regs, skl_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  4625			intel_pmu_lbr_init_skl();
  4626	
  4627			/* INT_MISC.RECOVERY_CYCLES has umask 1 in Skylake */
  4628			event_attr_td_recovery_bubbles.event_str_noht =
  4629				"event=0xd,umask=0x1,cmask=1";
  4630			event_attr_td_recovery_bubbles.event_str_ht =
  4631				"event=0xd,umask=0x1,cmask=1,any=1";
  4632	
  4633			x86_pmu.event_constraints = intel_skl_event_constraints;
  4634			x86_pmu.pebs_constraints = intel_skl_pebs_event_constraints;
  4635			x86_pmu.extra_regs = intel_skl_extra_regs;
  4636			x86_pmu.pebs_aliases = intel_pebs_aliases_skl;
  4637			x86_pmu.pebs_prec_dist = true;
  4638			/* all extra regs are per-cpu when HT is on */
  4639			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  4640			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  4641	
  4642			x86_pmu.hw_config = hsw_hw_config;
  4643			x86_pmu.get_event_constraints = hsw_get_event_constraints;
  4644			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  4645				hsw_format_attr : nhm_format_attr;
  4646			extra_attr = merge_attr(extra_attr, skl_format_attr);
  4647			to_free = extra_attr;
  4648			x86_pmu.cpu_events = get_hsw_events_attrs();
  4649			intel_pmu_pebs_data_source_skl(pmem);
  4650	
  4651			if (boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)) {
  4652				x86_pmu.flags |= PMU_FL_TFA;
  4653				x86_pmu.get_event_constraints = tfa_get_event_constraints;
  4654				x86_pmu.enable_all = intel_tfa_pmu_enable_all;
  4655				x86_pmu.commit_scheduling = intel_tfa_commit_scheduling;
  4656				intel_pmu_attrs[1] = &dev_attr_allow_tsx_force_abort.attr.attr;
  4657			}
  4658	
  4659			pr_cont("Skylake events, ");
  4660			name = "skylake";
  4661			break;
  4662	
  4663		case INTEL_FAM6_ICELAKE_X:
  4664		case INTEL_FAM6_ICELAKE_XEON_D:
  4665			pmem = true;
  4666		case INTEL_FAM6_ICELAKE_MOBILE:
  4667		case INTEL_FAM6_ICELAKE_DESKTOP:
  4668			x86_pmu.late_ack = true;
  4669			memcpy(hw_cache_event_ids, skl_hw_cache_event_ids, sizeof(hw_cache_event_ids));
  4670			memcpy(hw_cache_extra_regs, skl_hw_cache_extra_regs, sizeof(hw_cache_extra_regs));
  4671			hw_cache_event_ids[C(ITLB)][C(OP_READ)][C(RESULT_ACCESS)] = -1;
  4672			intel_pmu_lbr_init_skl();
  4673	
  4674			x86_pmu.event_constraints = intel_icl_event_constraints;
  4675			x86_pmu.pebs_constraints = intel_icl_pebs_event_constraints;
  4676			x86_pmu.extra_regs = intel_icl_extra_regs;
  4677			x86_pmu.pebs_aliases = NULL;
  4678			x86_pmu.pebs_prec_dist = true;
  4679			x86_pmu.flags |= PMU_FL_HAS_RSP_1;
  4680			x86_pmu.flags |= PMU_FL_NO_HT_SHARING;
  4681	
  4682			x86_pmu.hw_config = hsw_hw_config;
  4683			x86_pmu.get_event_constraints = icl_get_event_constraints;
  4684			extra_attr = boot_cpu_has(X86_FEATURE_RTM) ?
  4685				hsw_format_attr : nhm_format_attr;
  4686			extra_attr = merge_attr(extra_attr, skl_format_attr);
  4687			x86_pmu.cpu_events = get_icl_events_attrs();
  4688			x86_pmu.lbr_pt_coexist = true;
  4689			intel_pmu_pebs_data_source_skl(pmem);
  4690			pr_cont("Icelake events, ");
  4691			name = "icelake";
  4692			break;
  4693	
  4694		default:
  4695			switch (x86_pmu.version) {
  4696			case 1:
  4697				x86_pmu.event_constraints = intel_v1_event_constraints;
  4698				pr_cont("generic architected perfmon v1, ");
  4699				name = "generic_arch_v1";
  4700				break;
  4701			default:
  4702				/*
  4703				 * default constraints for v2 and up
  4704				 */
  4705				x86_pmu.event_constraints = intel_gen_event_constraints;
  4706				pr_cont("generic architected perfmon, ");
  4707				name = "generic_arch_v2+";
  4708				break;
  4709			}
  4710		}
  4711	
  4712		snprintf(pmu_name_str, sizeof pmu_name_str, "%s", name);
  4713	
  4714		if (version >= 2 && extra_attr) {
  4715			x86_pmu.format_attrs = merge_attr(intel_arch3_formats_attr,
  4716							  extra_attr);
  4717			WARN_ON(!x86_pmu.format_attrs);
  4718		}
  4719	
  4720		if (x86_pmu.num_counters > INTEL_PMC_MAX_GENERIC) {
  4721			WARN(1, KERN_ERR "hw perf events %d > max(%d), clipping!",
  4722			     x86_pmu.num_counters, INTEL_PMC_MAX_GENERIC);
  4723			x86_pmu.num_counters = INTEL_PMC_MAX_GENERIC;
  4724		}
  4725		x86_pmu.intel_ctrl = (1ULL << x86_pmu.num_counters) - 1;
  4726	
  4727		if (x86_pmu.num_counters_fixed > INTEL_PMC_MAX_FIXED) {
  4728			WARN(1, KERN_ERR "hw perf events fixed %d > max(%d), clipping!",
  4729			     x86_pmu.num_counters_fixed, INTEL_PMC_MAX_FIXED);
  4730			x86_pmu.num_counters_fixed = INTEL_PMC_MAX_FIXED;
  4731		}
  4732	
  4733		x86_pmu.intel_ctrl |=
  4734			((1LL << x86_pmu.num_counters_fixed)-1) << INTEL_PMC_IDX_FIXED;
  4735	
  4736		if (x86_pmu.event_constraints) {
  4737			/*
  4738			 * event on fixed counter2 (REF_CYCLES) only works on this
  4739			 * counter, so do not extend mask to generic counters
  4740			 */
  4741			for_each_event_constraint(c, x86_pmu.event_constraints) {
  4742				if (c->cmask == FIXED_EVENT_FLAGS
  4743				    && c->idxmsk64 != INTEL_PMC_MSK_FIXED_REF_CYCLES) {
  4744					c->idxmsk64 |= (1ULL << x86_pmu.num_counters) - 1;
  4745				}
  4746				c->idxmsk64 &=
  4747					~(~0ULL << (INTEL_PMC_IDX_FIXED + x86_pmu.num_counters_fixed));
  4748				c->weight = hweight64(c->idxmsk64);
  4749			}
  4750		}
  4751	
  4752		/*
  4753		 * Access LBR MSR may cause #GP under certain circumstances.
  4754		 * E.g. KVM doesn't support LBR MSR
  4755		 * Check all LBT MSR here.
  4756		 * Disable LBR access if any LBR MSRs can not be accessed.
  4757		 */
  4758		if (x86_pmu.lbr_nr && !check_msr(x86_pmu.lbr_tos, 0x3UL))
  4759			x86_pmu.lbr_nr = 0;
  4760		for (i = 0; i < x86_pmu.lbr_nr; i++) {
  4761			if (!(check_msr(x86_pmu.lbr_from + i, 0xffffUL) &&
  4762			      check_msr(x86_pmu.lbr_to + i, 0xffffUL)))
  4763				x86_pmu.lbr_nr = 0;
  4764		}
  4765	
  4766		x86_pmu.caps_attrs = intel_pmu_caps_attrs;
  4767	
  4768		if (x86_pmu.lbr_nr) {
  4769			x86_pmu.caps_attrs = merge_attr(x86_pmu.caps_attrs, lbr_attrs);
  4770			pr_cont("%d-deep LBR, ", x86_pmu.lbr_nr);
  4771		}
  4772	
  4773		/*
  4774		 * Access extra MSR may cause #GP under certain circumstances.
  4775		 * E.g. KVM doesn't support offcore event
  4776		 * Check all extra_regs here.
  4777		 */
  4778		if (x86_pmu.extra_regs) {
  4779			for (er = x86_pmu.extra_regs; er->msr; er++) {
  4780				er->extra_msr_access = check_msr(er->msr, 0x11UL);
  4781				/* Disable LBR select mapping */
  4782				if ((er->idx == EXTRA_REG_LBR) && !er->extra_msr_access)
  4783					x86_pmu.lbr_sel_map = NULL;
  4784			}
  4785		}
  4786	
  4787		/* Support full width counters using alternative MSR range */
  4788		if (x86_pmu.intel_cap.full_width_write) {
  4789			x86_pmu.max_period = x86_pmu.cntval_mask >> 1;
  4790			x86_pmu.perfctr = MSR_IA32_PMC0;
  4791			pr_cont("full-width counters, ");
  4792		}
  4793	
  4794		kfree(to_free);
  4795		return 0;
  4796	}
  4797	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
