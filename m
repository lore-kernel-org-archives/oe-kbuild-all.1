Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E72351C10
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 03:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790392504; cv=none; b=KWL/bQKwEXMMUNorBkb061qnGl9zqNhuIZZ0C1QQF2O4MOC12Xb5OqYF9LRsprqSYA3P569OogddiDE1qUtDrOPZhNZDqawrVps1uY2a0/zf9OifNFyfn7aDDhdib2PcTQcqVCsJOh5B4XeWi/26Q9a6qKeV+N8+DgXJkgruO+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790392504; c=relaxed/simple;
	bh=9ZsGB9ijk9R897jAMPwl5lfMNL0zRoga8pi6bx76TVw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BfBrtOFp+RiSqWCo0BuSu/AHUKoEpgslOuaU+M4FMPoCI8z8dlkGawwWo+rCw4fKNCLXnM0us/ErTubFV7/N7dKAyIrB0weYNp6TzghOdmmJsvubJ8DiV+UF+SXp/kEPLweL1Dz2kynZQ/OWyBHjtrkvcWtnLQHClmzYc4Z7rGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPoMLv6N; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPoMLv6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790392502; x=1821928502;
  h=date:from:to:cc:subject:message-id;
  bh=9ZsGB9ijk9R897jAMPwl5lfMNL0zRoga8pi6bx76TVw=;
  b=DPoMLv6N6S8D3YgobGh1h0u/QeW1a+pzS5BJsaNRI8QsTtGu5nwa9eyc
   dW4T6IWeLxwI0DSwoKyVq+ggJuCQ2xU7egtG4DO2FyTjRhZaQfzWNQXpp
   GF1Zzenv1QxPSQIWH4m2ai8JUG/u6SEiqt+33DmXDTDGIWTtXXdAYeNXA
   10LzY+3toWrMWQWam6VHOXRioUksU7iQR3pUl2qi82GJ4FERNqMgs6wju
   v1BYOB9Ghm/FSEXYfTDHx1xTl+G08E+X1KrLvS5JrjO0E0FcLPuYtkemU
   mJzJWlfhoUkOqXPKDTt9LPBFKeiO0plicq3lPUoTaR6qqg0ExfQElSRXF
   g==;
X-CSE-ConnectionGUID: Xlqz2JtrSuiauI6zLu1alA==
X-CSE-MsgGUID: aF+lPJFITcGBQfHIGYQI/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="101350454"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="101350454"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 20:15:02 -0700
X-CSE-ConnectionGUID: ohiucpONSsamJBJv2sFYKg==
X-CSE-MsgGUID: Y8fGcgCST8GzEBUNAK3VoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="278291603"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 25 Sep 2026 20:15:01 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAIsM-000000000Bn-0FAk;
	Sat, 26 Sep 2026 03:14:58 +0000
Date: Sat, 26 Sep 2026 05:14:17 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 558/673]
 init/main.c:1129 start_kernel() warn: inconsistent indenting
Message-ID: <202609260511.lkAuNXUZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 54621fea448e88bce62edfc26ddf1a2c45313240 [558/673] testing arm64 gc-sections
config: i386-randconfig-2200-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260511.lkAuNXUZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260511.lkAuNXUZ-lkp@intel.com/

New smatch warnings:
init/main.c:1129 start_kernel() warn: inconsistent indenting
kernel/printk/printk.c:4394 console_init() warn: inconsistent indenting

Old smatch warnings:
init/main.c:1131 start_kernel() warn: inconsistent indenting
init/main.c:1136 start_kernel() warn: inconsistent indenting
init/main.c:1138 start_kernel() warn: inconsistent indenting
init/main.c:1147 start_kernel() warn: inconsistent indenting
init/main.c:1162 start_kernel() warn: inconsistent indenting
init/main.c:1164 start_kernel() warn: inconsistent indenting
init/main.c:1167 start_kernel() warn: inconsistent indenting
init/main.c:1169 start_kernel() warn: inconsistent indenting

vim +1129 init/main.c

   986	
   987	asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
   988	void start_kernel(void)
   989	{
   990		char *command_line;
   991		char *after_dashes;
   992	
   993		set_task_stack_end_magic(&init_task);
   994		smp_setup_processor_id();
   995		debug_objects_early_init();
   996		init_vmlinux_build_id();
   997	
   998		cgroup_init_early();
   999	
  1000		local_irq_disable();
  1001		early_boot_irqs_disabled = true;
  1002	
  1003		/*
  1004		 * Interrupts are still disabled. Do necessary setups, then
  1005		 * enable them.
  1006		 */
  1007		boot_cpu_init();
  1008		page_address_init();
  1009		pr_notice("%s", linux_banner);
  1010		setup_arch(&command_line);
  1011		mm_core_init_early();
  1012		/* Static keys and static calls are needed by LSMs */
  1013		jump_label_init();
  1014		static_call_init();
  1015		early_security_init();
  1016		setup_boot_config();
  1017		setup_command_line(command_line);
  1018		setup_nr_cpu_ids();
  1019		setup_per_cpu_areas();
  1020		smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
  1021		early_numa_node_init();
  1022		boot_cpu_hotplug_init();
  1023	
  1024		print_kernel_cmdline(saved_command_line);
  1025		/* parameters may set static keys */
  1026		parse_early_param();
  1027		after_dashes = parse_args("Booting kernel",
  1028					  static_command_line, __start___param,
  1029					  __stop___param - __start___param,
  1030					  -1, -1, NULL, &unknown_bootoption);
  1031		print_unknown_bootoptions();
  1032		if (!IS_ERR_OR_NULL(after_dashes))
  1033			parse_args("Setting init args", after_dashes, NULL, 0, -1, -1,
  1034				   NULL, set_init_arg);
  1035		if (extra_init_args)
  1036			parse_args("Setting extra init args", extra_init_args,
  1037				   NULL, 0, -1, -1, NULL, set_init_arg);
  1038	
  1039		/* Architectural and non-timekeeping rng init, before allocator init */
  1040		random_init_early(command_line);
  1041	
  1042		/*
  1043		 * These use large bootmem allocations and must precede
  1044		 * initalization of page allocator
  1045		 */
  1046		setup_log_buf(0);
  1047		vfs_caches_init_early();
  1048		sort_main_extable();
  1049		trap_init();
  1050		mm_core_init();
  1051		maple_tree_init();
  1052		poking_init();
  1053		ftrace_init();
  1054	
  1055		/* trace_printk can be enabled here */
  1056		early_trace_init();
  1057	
  1058		/*
  1059		 * Set up the scheduler prior starting any interrupts (such as the
  1060		 * timer interrupt). Full topology setup happens at smp_init()
  1061		 * time - but meanwhile we still have a functioning scheduler.
  1062		 */
  1063		sched_init();
  1064	
  1065		if (WARN(!irqs_disabled(),
  1066			 "Interrupts were enabled *very* early, fixing it\n"))
  1067			local_irq_disable();
  1068		radix_tree_init();
  1069	
  1070		/*
  1071		 * Set up housekeeping before setting up workqueues to allow the unbound
  1072		 * workqueue to take non-housekeeping into account.
  1073		 */
  1074		housekeeping_init();
  1075	
  1076		/*
  1077		 * Allow workqueue creation and work item queueing/cancelling
  1078		 * early.  Work item execution depends on kthreads and starts after
  1079		 * workqueue_init().
  1080		 */
  1081		workqueue_init_early();
  1082	
  1083		rcu_init();
  1084		hazptr_init();
  1085		kvfree_rcu_init();
  1086	
  1087		/* Trace events are available after this */
  1088		trace_init();
  1089	
  1090		if (initcall_debug)
  1091			initcall_debug_enable();
  1092	
  1093		context_tracking_init();
  1094		/* init some links before init_ISA_irqs() */
  1095		early_irq_init();
  1096		init_IRQ();
  1097		tick_init();
  1098		rcu_init_nohz();
  1099		timers_init();
  1100		srcu_init();
  1101		hrtimers_init();
  1102		softirq_init();
  1103		vdso_setup_data_pages();
  1104		timekeeping_init();
  1105		time_init();
  1106	
  1107		/* This must be after timekeeping is initialized */
  1108		random_init();
  1109	
  1110		/* These make use of the fully initialized rng */
  1111		kfence_init();
  1112		boot_init_stack_canary();
  1113	
  1114		perf_event_init();
  1115		profile_init();
  1116		call_function_init();
  1117		WARN(!irqs_disabled(), "Interrupts were enabled early\n");
  1118	
  1119		early_boot_irqs_disabled = false;
  1120		local_irq_enable();
  1121	
  1122		kmem_cache_init_late();
  1123	
  1124		/*
  1125		 * HACK ALERT! This is early. We're enabling the console before
  1126		 * we've done PCI setups etc, and console_init() must be aware of
  1127		 * this. But we do want output early, in case something goes wrong.
  1128		 */
> 1129	pr_err("%s:%d\n", __func__, __LINE__);
  1130		console_init();
  1131	pr_err("%s:%d\n", __func__, __LINE__);
  1132		if (panic_later)
  1133			panic("Too many boot %s vars at `%s'", panic_later,
  1134			      panic_param);
  1135	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
