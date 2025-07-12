Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DFC320F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Jul 2025 13:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752326746; cv=none; b=kyT9dQy0wCQmJs0/tpWk1FWN+2lNBu+sCc37sfNnx6f5CUSmqvahnSPVSV+zZdBOKojqqRCNC3TkEeV78OYoqP/lnSh7SSZpuc8o8XbDzH50nIVA7MsWZRvsiAImuScmuK0qz8ZWwo+OpVJyugNKLv3N5GzcU60p+0CjQjZ9Djs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752326746; c=relaxed/simple;
	bh=k475Lf0WUuvjgUNRnejBaHJzQ0HvqCldFfsAygl3Cjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KurBOP3sJ4fiZNcHngvbDe25s6cFTvlN0wdI0alkBtXZHYVQDt7tjRSG3RICkyqwXqxd/sny6p2rr2wZBEZDnX98D1m7RyinWYt7VOqKp2solYa1W723/ebz7Eg2X1cAJHPEV3FI/wxnBEOsEbeEXbZwujazUT/9JLfn+01k8jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAhcYh++; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAhcYh++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752326744; x=1783862744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k475Lf0WUuvjgUNRnejBaHJzQ0HvqCldFfsAygl3Cjc=;
  b=DAhcYh++bB7RXZcyjskmEcBfGC3+JEwRfLZoWwF69xadlK3+7uJEm/dJ
   DP5EwKmbTAU6DRV1Q9q7QtJKH1f95W0yWicbHgGbd9rw7XjOsp31tZSMY
   gbiyBKmAxIpk4VVSjWMkBV2a9qxnP52c3qDj3rSyBupFq07ZkPMWGafMj
   f9MXWZDD4aAOKhyRUSjlXuAX+S8gddksFE32EwuFq8uB5XFfNs2ml6DDC
   qTqnvi2Lwd3BQTQffiV4F1w53D4gHEAnqyBDStDk4Eq813pjFtNSvl8c5
   0H+0wcR6Au+gn5xLZiUWQs5gt09K8JLsZRMfd74VMxG4ho8uK0eZi3Nqk
   w==;
X-CSE-ConnectionGUID: FM9agpaGQRSAyl5KH4jFtQ==
X-CSE-MsgGUID: rRyLb+enTQW2ylUurECPXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53813958"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="53813958"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 06:25:43 -0700
X-CSE-ConnectionGUID: J1/dg7HwSdyXQBYtOBCGTw==
X-CSE-MsgGUID: DL+E22UuR0OP6UtkerU0Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="156658046"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2025 06:25:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaaEW-0007MH-1F;
	Sat, 12 Jul 2025 13:25:40 +0000
Date: Sat, 12 Jul 2025 21:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mediated_pmu 24/60] arch/x86/kernel/irq.c:197:40:
 error: 'irq_cpustat_t' has no member named 'perf_guest_mediated_pmis'
Message-ID: <202507122118.NK3k9mHE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mediated_pmu
head:   43649074b89d7f3877012d15010e9aef70bf4faf
commit: 25cacbdec1d069c12e105f100bd01db312ae2560 [24/60] perf: core/x86: Register a new vector for handling mediated guest PMIs
config: x86_64-buildonly-randconfig-005-20250712 (https://download.01.org/0day-ci/archive/20250712/202507122118.NK3k9mHE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507122118.NK3k9mHE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507122118.NK3k9mHE-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/irq.c: In function 'arch_show_interrupts':
>> arch/x86/kernel/irq.c:197:40: error: 'irq_cpustat_t' has no member named 'perf_guest_mediated_pmis'
     197 |                            irq_stats(j)->perf_guest_mediated_pmis);
         |                                        ^~


vim +197 arch/x86/kernel/irq.c

    63	
    64	#define irq_stats(x)		(&per_cpu(irq_stat, x))
    65	/*
    66	 * /proc/interrupts printing for arch specific interrupts
    67	 */
    68	int arch_show_interrupts(struct seq_file *p, int prec)
    69	{
    70		int j;
    71	
    72		seq_printf(p, "%*s: ", prec, "NMI");
    73		for_each_online_cpu(j)
    74			seq_printf(p, "%10u ", irq_stats(j)->__nmi_count);
    75		seq_puts(p, "  Non-maskable interrupts\n");
    76	#ifdef CONFIG_X86_LOCAL_APIC
    77		seq_printf(p, "%*s: ", prec, "LOC");
    78		for_each_online_cpu(j)
    79			seq_printf(p, "%10u ", irq_stats(j)->apic_timer_irqs);
    80		seq_puts(p, "  Local timer interrupts\n");
    81	
    82		seq_printf(p, "%*s: ", prec, "SPU");
    83		for_each_online_cpu(j)
    84			seq_printf(p, "%10u ", irq_stats(j)->irq_spurious_count);
    85		seq_puts(p, "  Spurious interrupts\n");
    86		seq_printf(p, "%*s: ", prec, "PMI");
    87		for_each_online_cpu(j)
    88			seq_printf(p, "%10u ", irq_stats(j)->apic_perf_irqs);
    89		seq_puts(p, "  Performance monitoring interrupts\n");
    90		seq_printf(p, "%*s: ", prec, "IWI");
    91		for_each_online_cpu(j)
    92			seq_printf(p, "%10u ", irq_stats(j)->apic_irq_work_irqs);
    93		seq_puts(p, "  IRQ work interrupts\n");
    94		seq_printf(p, "%*s: ", prec, "RTR");
    95		for_each_online_cpu(j)
    96			seq_printf(p, "%10u ", irq_stats(j)->icr_read_retry_count);
    97		seq_puts(p, "  APIC ICR read retries\n");
    98		if (x86_platform_ipi_callback) {
    99			seq_printf(p, "%*s: ", prec, "PLT");
   100			for_each_online_cpu(j)
   101				seq_printf(p, "%10u ", irq_stats(j)->x86_platform_ipis);
   102			seq_puts(p, "  Platform interrupts\n");
   103		}
   104	#endif
   105	#ifdef CONFIG_SMP
   106		seq_printf(p, "%*s: ", prec, "RES");
   107		for_each_online_cpu(j)
   108			seq_printf(p, "%10u ", irq_stats(j)->irq_resched_count);
   109		seq_puts(p, "  Rescheduling interrupts\n");
   110		seq_printf(p, "%*s: ", prec, "CAL");
   111		for_each_online_cpu(j)
   112			seq_printf(p, "%10u ", irq_stats(j)->irq_call_count);
   113		seq_puts(p, "  Function call interrupts\n");
   114		seq_printf(p, "%*s: ", prec, "TLB");
   115		for_each_online_cpu(j)
   116			seq_printf(p, "%10u ", irq_stats(j)->irq_tlb_count);
   117		seq_puts(p, "  TLB shootdowns\n");
   118	#endif
   119	#ifdef CONFIG_X86_THERMAL_VECTOR
   120		seq_printf(p, "%*s: ", prec, "TRM");
   121		for_each_online_cpu(j)
   122			seq_printf(p, "%10u ", irq_stats(j)->irq_thermal_count);
   123		seq_puts(p, "  Thermal event interrupts\n");
   124	#endif
   125	#ifdef CONFIG_X86_MCE_THRESHOLD
   126		seq_printf(p, "%*s: ", prec, "THR");
   127		for_each_online_cpu(j)
   128			seq_printf(p, "%10u ", irq_stats(j)->irq_threshold_count);
   129		seq_puts(p, "  Threshold APIC interrupts\n");
   130	#endif
   131	#ifdef CONFIG_X86_MCE_AMD
   132		seq_printf(p, "%*s: ", prec, "DFR");
   133		for_each_online_cpu(j)
   134			seq_printf(p, "%10u ", irq_stats(j)->irq_deferred_error_count);
   135		seq_puts(p, "  Deferred Error APIC interrupts\n");
   136	#endif
   137	#ifdef CONFIG_X86_MCE
   138		seq_printf(p, "%*s: ", prec, "MCE");
   139		for_each_online_cpu(j)
   140			seq_printf(p, "%10u ", per_cpu(mce_exception_count, j));
   141		seq_puts(p, "  Machine check exceptions\n");
   142		seq_printf(p, "%*s: ", prec, "MCP");
   143		for_each_online_cpu(j)
   144			seq_printf(p, "%10u ", per_cpu(mce_poll_count, j));
   145		seq_puts(p, "  Machine check polls\n");
   146	#endif
   147	#ifdef CONFIG_X86_HV_CALLBACK_VECTOR
   148		if (test_bit(HYPERVISOR_CALLBACK_VECTOR, system_vectors)) {
   149			seq_printf(p, "%*s: ", prec, "HYP");
   150			for_each_online_cpu(j)
   151				seq_printf(p, "%10u ",
   152					   irq_stats(j)->irq_hv_callback_count);
   153			seq_puts(p, "  Hypervisor callback interrupts\n");
   154		}
   155	#endif
   156	#if IS_ENABLED(CONFIG_HYPERV)
   157		if (test_bit(HYPERV_REENLIGHTENMENT_VECTOR, system_vectors)) {
   158			seq_printf(p, "%*s: ", prec, "HRE");
   159			for_each_online_cpu(j)
   160				seq_printf(p, "%10u ",
   161					   irq_stats(j)->irq_hv_reenlightenment_count);
   162			seq_puts(p, "  Hyper-V reenlightenment interrupts\n");
   163		}
   164		if (test_bit(HYPERV_STIMER0_VECTOR, system_vectors)) {
   165			seq_printf(p, "%*s: ", prec, "HVS");
   166			for_each_online_cpu(j)
   167				seq_printf(p, "%10u ",
   168					   irq_stats(j)->hyperv_stimer0_count);
   169			seq_puts(p, "  Hyper-V stimer0 interrupts\n");
   170		}
   171	#endif
   172		seq_printf(p, "%*s: %10u\n", prec, "ERR", atomic_read(&irq_err_count));
   173	#if defined(CONFIG_X86_IO_APIC)
   174		seq_printf(p, "%*s: %10u\n", prec, "MIS", atomic_read(&irq_mis_count));
   175	#endif
   176	#if IS_ENABLED(CONFIG_KVM)
   177		seq_printf(p, "%*s: ", prec, "PIN");
   178		for_each_online_cpu(j)
   179			seq_printf(p, "%10u ", irq_stats(j)->kvm_posted_intr_ipis);
   180		seq_puts(p, "  Posted-interrupt notification event\n");
   181	
   182		seq_printf(p, "%*s: ", prec, "NPI");
   183		for_each_online_cpu(j)
   184			seq_printf(p, "%10u ",
   185				   irq_stats(j)->kvm_posted_intr_nested_ipis);
   186		seq_puts(p, "  Nested posted-interrupt event\n");
   187	
   188		seq_printf(p, "%*s: ", prec, "PIW");
   189		for_each_online_cpu(j)
   190			seq_printf(p, "%10u ",
   191				   irq_stats(j)->kvm_posted_intr_wakeup_ipis);
   192		seq_puts(p, "  Posted-interrupt wakeup event\n");
   193	
   194		seq_printf(p, "%*s: ", prec, "VPMI");
   195		for_each_online_cpu(j)
   196			seq_printf(p, "%10u ",
 > 197				   irq_stats(j)->perf_guest_mediated_pmis);
   198		seq_puts(p, " Perf Guest Mediated PMI\n");
   199	#endif
   200	#ifdef CONFIG_X86_POSTED_MSI
   201		seq_printf(p, "%*s: ", prec, "PMN");
   202		for_each_online_cpu(j)
   203			seq_printf(p, "%10u ",
   204				   irq_stats(j)->posted_msi_notification_count);
   205		seq_puts(p, "  Posted MSI notification event\n");
   206	#endif
   207		return 0;
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
