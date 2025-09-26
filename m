Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF5110E3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 12:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758889351; cv=none; b=sHoy1Tbr9w0td6vYzPzJNAsvz1NOKCv377QEbcqMfYNUGvRxzk5W83eysTgqHTijvCVsRjUbyNQgVctgTNJoDcuXbrvITQ3ATrrQ0xvKbBoNSADuB0KkWjCvE/99QbylfsThGab5HRyQDiSPLUswVMnM7vkdWwslf1Tbn32f2nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758889351; c=relaxed/simple;
	bh=St7pUO2Q+FaJmLgpg/n6pYcfBWdElDJKHOWZuQwFxfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OJiu3538ymHn+zdtQCxqaukkJq7ArSDwE9nCSPDDvGjBF2BXGYfRtGa40YP5t4bkcF3xowqTuPlHbAiXjvj9VZEpAgMDhPusbgb2QnLRFpB7EYodgjAHaUwGfj4cT29l4H8cU3KPrUe3K2jrGHTe5OGEAHIo0HoH/wxgIPym++0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YV3i7WLU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YV3i7WLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758889350; x=1790425350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=St7pUO2Q+FaJmLgpg/n6pYcfBWdElDJKHOWZuQwFxfU=;
  b=YV3i7WLUI+4QEXc6C9PUfJWsjEK9fVMBOd6/UfQ2bTcqbSuFUHO1szHp
   pJ7VqKOnjgghyl26MPwxDx7Gj+iW/APfA6kb9ZoYRayXPQPswAPZuggKR
   n5WylIoUqI52lkRdqC5t7L+7P/Bsa8A7ni0u/tLqVOxg6Aw69sqq/yRka
   GMyY9quYtJfpCwMy2656sv39qpcWWEoAWQ3jYjcKbm1RE2dMIU9Hd2XSO
   KNiVOAeXfZJDVnlkNChyIIg+HfvAXPEsz/qe7j3lX8WX031V7X05Fat/Q
   Q+rJeDhZU3ZGxszNVXgplb/lnTiTdWWtYnDWuagQwld18Udo6b/UcE40w
   Q==;
X-CSE-ConnectionGUID: QNdBT4lsQ4iWBdRQqBZEZQ==
X-CSE-MsgGUID: knLsKdydSa67ltq1leUcMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61329973"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="61329973"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 05:22:29 -0700
X-CSE-ConnectionGUID: olwFu/YbRAGKiYvAaduetw==
X-CSE-MsgGUID: C6XtEt4+T2e/XBBQ/c29dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="201294857"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Sep 2025 05:22:28 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v27T0-0006Cf-1n;
	Fri, 26 Sep 2025 12:22:26 +0000
Date: Fri, 26 Sep 2025 20:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v1 91/114]
 drivers/perf/riscv_pmu_sbi.c:1156:52: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202509262056.EDd4J3iU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   6d6c8937e82a189e32ec845b0db3bbeae3788def
commit: 2b19fac335920e448a43b2662e8b1e513e0ec380 [91/114] perf: RISC-V: add support for SSE event
config: riscv-randconfig-r123-20250926 (https://download.01.org/0day-ci/archive/20250926/202509262056.EDd4J3iU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509262056.EDd4J3iU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509262056.EDd4J3iU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/riscv_pmu_sbi.c:1156:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cpu_hw_events [noderef] __percpu *hw_events @@     got void *arg @@
   drivers/perf/riscv_pmu_sbi.c:1156:52: sparse:     expected struct cpu_hw_events [noderef] __percpu *hw_events
   drivers/perf/riscv_pmu_sbi.c:1156:52: sparse:     got void *arg
>> drivers/perf/riscv_pmu_sbi.c:1216:59: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void *arg @@     got struct cpu_hw_events [noderef] __percpu *hw_events @@
   drivers/perf/riscv_pmu_sbi.c:1216:59: sparse:     expected void *arg
   drivers/perf/riscv_pmu_sbi.c:1216:59: sparse:     got struct cpu_hw_events [noderef] __percpu *hw_events

vim +1156 drivers/perf/riscv_pmu_sbi.c

  1152	
  1153	static int pmu_sbi_ovf_sse_handler(uint32_t evt, void *arg,
  1154					   struct pt_regs *regs)
  1155	{
> 1156		struct cpu_hw_events __percpu *hw_events = arg;
  1157		struct cpu_hw_events *hw_event = raw_cpu_ptr(hw_events);
  1158	
  1159		pmu_sbi_ovf_handler(hw_event, regs, true);
  1160	
  1161		return 0;
  1162	}
  1163	
  1164	static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
  1165	{
  1166		struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
  1167		struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
  1168	
  1169		/*
  1170		 * We keep enabling userspace access to CYCLE, TIME and INSTRET via the
  1171		 * legacy option but that will be removed in the future.
  1172		 */
  1173		if (sysctl_perf_user_access == SYSCTL_LEGACY)
  1174			csr_write(CSR_SCOUNTEREN, 0x7);
  1175		else
  1176			csr_write(CSR_SCOUNTEREN, 0x2);
  1177	
  1178		/* Stop all the counters so that they can be enabled from perf */
  1179		pmu_sbi_stop_all(pmu);
  1180	
  1181		if (riscv_pmu_use_irq) {
  1182			cpu_hw_evt->irq = riscv_pmu_irq;
  1183			ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
  1184			enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
  1185		}
  1186	
  1187		if (sbi_pmu_snapshot_available())
  1188			return pmu_sbi_snapshot_setup(pmu, cpu);
  1189	
  1190		return 0;
  1191	}
  1192	
  1193	static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
  1194	{
  1195		if (riscv_pmu_use_irq) {
  1196			disable_percpu_irq(riscv_pmu_irq);
  1197		}
  1198	
  1199		/* Disable all counters access for user mode now */
  1200		csr_write(CSR_SCOUNTEREN, 0x0);
  1201	
  1202		if (sbi_pmu_snapshot_available())
  1203			return pmu_sbi_snapshot_disable();
  1204	
  1205		return 0;
  1206	}
  1207	
  1208	static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pdev)
  1209	{
  1210		int ret;
  1211		struct sse_event *evt;
  1212		struct cpu_hw_events __percpu *hw_events = pmu->hw_events;
  1213		struct irq_domain *domain = NULL;
  1214	
  1215		evt = sse_event_register(SBI_SSE_EVENT_LOCAL_PMU, 0,
> 1216					 pmu_sbi_ovf_sse_handler, hw_events);
  1217		if (!IS_ERR(evt)) {
  1218			ret = sse_event_enable(evt);
  1219			if (!ret) {
  1220				pr_info("using SSE for PMU event delivery\n");
  1221				return 0;
  1222			}
  1223	
  1224			sse_event_unregister(evt);
  1225		}
  1226	
  1227		if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
  1228			riscv_pmu_irq_num = RV_IRQ_PMU;
  1229			riscv_pmu_use_irq = true;
  1230		} else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
  1231			   riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
  1232			   riscv_cached_marchid(0) == 0 &&
  1233			   riscv_cached_mimpid(0) == 0) {
  1234			riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
  1235			riscv_pmu_use_irq = true;
  1236		} else if (riscv_has_vendor_extension_unlikely(ANDES_VENDOR_ID,
  1237							       RISCV_ISA_VENDOR_EXT_XANDESPMU) &&
  1238			   IS_ENABLED(CONFIG_ANDES_CUSTOM_PMU)) {
  1239			riscv_pmu_irq_num = ANDES_SLI_CAUSE_BASE + ANDES_RV_IRQ_PMOVI;
  1240			riscv_pmu_use_irq = true;
  1241		}
  1242	
  1243		riscv_pmu_irq_mask = BIT(riscv_pmu_irq_num % BITS_PER_LONG);
  1244	
  1245		if (!riscv_pmu_use_irq)
  1246			return -EOPNOTSUPP;
  1247	
  1248		domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(),
  1249						  DOMAIN_BUS_ANY);
  1250		if (!domain) {
  1251			pr_err("Failed to find INTC IRQ root domain\n");
  1252			return -ENODEV;
  1253		}
  1254	
  1255		riscv_pmu_irq = irq_create_mapping(domain, riscv_pmu_irq_num);
  1256		if (!riscv_pmu_irq) {
  1257			pr_err("Failed to map PMU interrupt for node\n");
  1258			return -ENODEV;
  1259		}
  1260	
  1261		ret = request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_irq_handler, "riscv-pmu", hw_events);
  1262		if (ret) {
  1263			pr_err("registering percpu irq failed [%d]\n", ret);
  1264			return ret;
  1265		}
  1266	
  1267		return 0;
  1268	}
  1269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
