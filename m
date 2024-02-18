Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEDE1E534
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708266871; cv=none; b=aJ6ptLTfUL055tXXGt/niCKZLuHs/uQJC7ckaZQzJClizc4Ts/mwx5ZQKVaJ6p6Lz9Qxd9VauEDgAxMziGQSNUeD4S+agpUoflAnVsZSilff5hUppFDdUy3umFEiO3rKQ+foMUjAWFPeECpTW7dhKHz1b47UnMaaGtfY9Slq/Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708266871; c=relaxed/simple;
	bh=ESS02Ja6+hmRfX50FzmEdkyh7jeFMdjzILFq4KlL16Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uUG2T+/w6365n0DqGM8ftmdhj4s1Uq/wXXnk3VdtB+C04OFE2tWL592z5m9sVgl4n5G/xZCS0dSUs0VxiBo95layn68PgYUFbbUNdGT3AtOBCEn4DB1D7WK2+/Io5l4wAce707/QbsRdpfWlwAjy2yjnfH+Y41knx/QXbM+Ws3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Leir9FjU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Leir9FjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708266869; x=1739802869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ESS02Ja6+hmRfX50FzmEdkyh7jeFMdjzILFq4KlL16Q=;
  b=Leir9FjUc95Cx/rYrK2sVfV7nrWiTFaefcDEywY4DG9Q+BsC5RrggLqk
   OsyPta3DvIEyXEKMAdGCjZqAnxnaVd6ogsAlU/uMMYtVA1gBXQNFBAdDN
   CAEGq/Ngfeiu1ESdqsUu1uYJ+uACVb/+Wovqn7dM6aje+8rIcPrv1pVnE
   m3XdPSslAjesx7wiXYx+oufXd/H17mHTUpHvLTrf0WnBIO8hLDLYHfk2F
   3mU25K6khKFqto8p+HOr2oYcaSsJjfmMRUjVreqkXQhKD4uBxwza7PiUF
   zYw2UpqR6A1ckhPdip5Qi6oYNE8aK+yxrZv9hF+LMHtqd7juFZv8lutA1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="19873098"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="19873098"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 06:34:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="27433518"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Feb 2024 06:34:27 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbiEz-00034c-2n;
	Sun, 18 Feb 2024 14:34:14 +0000
Date: Sun, 18 Feb 2024 22:33:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7528/7658] init/main.c:1069:(.init.text+0xfe4):
 relocation truncated to fit: R_ARC_S25W_PCREL against `no symbol'
Message-ID: <202402182224.wjkCzJWf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d37e1e4c52bc60578969f391fb81f947c3e83118
commit: acf5baf445bdd535dc71dc43b168e8098243792c [7528/7658] Merge branch 'for-next' of https://evilpiepirate.org/git/bcachefs.git
config: arc-buildonly-randconfig-r002-20220115 (https://download.01.org/0day-ci/archive/20240218/202402182224.wjkCzJWf-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402182224.wjkCzJWf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402182224.wjkCzJWf-lkp@intel.com/

All errors (new ones prefixed by >>):

   init/main.o: in function `start_kernel':
>> init/main.c:1069:(.init.text+0xfe4): relocation truncated to fit: R_ARC_S25W_PCREL against `no symbol'


vim +1069 init/main.c

86d1919a4fb0d9 Andrew Halaney           2021-06-30   869  
514ca14ed5444b ndesaulniers@google.com  2023-04-17   870  asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
514ca14ed5444b ndesaulniers@google.com  2023-04-17   871  void start_kernel(void)
^1da177e4c3f41 Linus Torvalds           2005-04-16   872  {
dd4d9fecbeba89 Fabian Frederick         2014-08-08   873  	char *command_line;
dd4d9fecbeba89 Fabian Frederick         2014-08-08   874  	char *after_dashes;
033ab7f8e5c655 Andrew Morton            2006-06-30   875  
d4311ff1a8da48 Aaron Tomlin             2014-09-12   876  	set_task_stack_end_magic(&init_task);
73839c5b2eacc1 Ming Lei                 2011-11-17   877  	smp_setup_processor_id();
3ac7fe5a4aab40 Thomas Gleixner          2008-04-30   878  	debug_objects_early_init();
83cc6fa0049d7c Stephen Boyd             2021-07-07   879  	init_vmlinux_build_id();
420594296838fd Ingo Molnar              2008-02-14   880  
ddbcc7e8e50aef Paul Menage              2007-10-18   881  	cgroup_init_early();
fbb9ce9530fd9b Ingo Molnar              2006-07-03   882  
fbb9ce9530fd9b Ingo Molnar              2006-07-03   883  	local_irq_disable();
2ce802f62ba32a Tejun Heo                2011-01-20   884  	early_boot_irqs_disabled = true;
fbb9ce9530fd9b Ingo Molnar              2006-07-03   885  
^1da177e4c3f41 Linus Torvalds           2005-04-16   886  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16   887  	 * Interrupts are still disabled. Do necessary setups, then
1b3b3b49b99614 Viresh Kumar             2017-03-23   888  	 * enable them.
^1da177e4c3f41 Linus Torvalds           2005-04-16   889  	 */
44fd22992cb76d Stas Sergeev             2006-03-23   890  	boot_cpu_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16   891  	page_address_init();
ea676e846a8171 Andrew Morton            2013-04-29   892  	pr_notice("%s", linux_banner);
e6b1db98cf4d54 Matthew Garrett          2019-08-19   893  	early_security_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16   894  	setup_arch(&command_line);
2b7d2fe76f9c84 Cao jin                  2021-03-11   895  	setup_boot_config();
30d7e0d466b3ac Alon Bar-Lev             2007-02-12   896  	setup_command_line(command_line);
e0982e90cd1ecf Mike Travis              2008-03-26   897  	setup_nr_cpu_ids();
d6647bdf98a0de Tejun Heo                2009-07-21   898  	setup_per_cpu_areas();
44fd22992cb76d Stas Sergeev             2006-03-23   899  	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
b5b1404d081589 Linus Torvalds           2018-08-12   900  	boot_cpu_hotplug_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16   901  
51887d03aca101 Masami Hiramatsu         2020-01-11   902  	pr_notice("Kernel command line: %s\n", saved_command_line);
6041186a32585f Dan Williams             2019-04-18   903  	/* parameters may set static keys */
6041186a32585f Dan Williams             2019-04-18   904  	jump_label_init();
83b519e8b9572c Pekka Enberg             2009-06-10   905  	parse_early_param();
51e158c12aca3c Rusty Russell            2014-04-28   906  	after_dashes = parse_args("Booting kernel",
51e158c12aca3c Rusty Russell            2014-04-28   907  				  static_command_line, __start___param,
83b519e8b9572c Pekka Enberg             2009-06-10   908  				  __stop___param - __start___param,
ecc8617053e0a9 Luis R. Rodriguez        2015-03-30   909  				  -1, -1, NULL, &unknown_bootoption);
86d1919a4fb0d9 Andrew Halaney           2021-06-30   910  	print_unknown_bootoptions();
3438cf549d2f3e Daniel Thompson          2014-11-11   911  	if (!IS_ERR_OR_NULL(after_dashes))
51e158c12aca3c Rusty Russell            2014-04-28   912  		parse_args("Setting init args", after_dashes, NULL, 0, -1, -1,
ecc8617053e0a9 Luis R. Rodriguez        2015-03-30   913  			   NULL, set_init_arg);
1319916209ce8f Masami Hiramatsu         2020-01-11   914  	if (extra_init_args)
1319916209ce8f Masami Hiramatsu         2020-01-11   915  		parse_args("Setting extra init args", extra_init_args,
1319916209ce8f Masami Hiramatsu         2020-01-11   916  			   NULL, 0, -1, -1, NULL, set_init_arg);
97ce2c88f9ad42 Jeremy Fitzhardinge      2011-10-12   917  
f62384995e4cb7 Jason A. Donenfeld       2022-09-26   918  	/* Architectural and non-timekeeping rng init, before allocator init */
f62384995e4cb7 Jason A. Donenfeld       2022-09-26   919  	random_init_early(command_line);
f62384995e4cb7 Jason A. Donenfeld       2022-09-26   920  
83b519e8b9572c Pekka Enberg             2009-06-10   921  	/*
83b519e8b9572c Pekka Enberg             2009-06-10   922  	 * These use large bootmem allocations and must precede
b7ec1bf3e7b9dd Mike Rapoport (IBM       2023-03-21   923) 	 * initalization of page allocator
83b519e8b9572c Pekka Enberg             2009-06-10   924  	 */
162a7e7500f966 Mike Travis              2011-05-24   925  	setup_log_buf(0);
83b519e8b9572c Pekka Enberg             2009-06-10   926  	vfs_caches_init_early();
83b519e8b9572c Pekka Enberg             2009-06-10   927  	sort_main_extable();
83b519e8b9572c Pekka Enberg             2009-06-10   928  	trap_init();
b7ec1bf3e7b9dd Mike Rapoport (IBM       2023-03-21   929) 	mm_core_init();
5b93a83649c7cb Peter Zijlstra           2022-10-25   930  	poking_init();
f631718de3ca24 Steven Rostedt (VMware   2017-03-03   931) 	ftrace_init();
f631718de3ca24 Steven Rostedt (VMware   2017-03-03   932) 
e725c731e3bb1e Steven Rostedt (VMware   2017-03-03   933) 	/* trace_printk can be enabled here */
e725c731e3bb1e Steven Rostedt (VMware   2017-03-03   934) 	early_trace_init();
e725c731e3bb1e Steven Rostedt (VMware   2017-03-03   935) 
^1da177e4c3f41 Linus Torvalds           2005-04-16   936  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16   937  	 * Set up the scheduler prior starting any interrupts (such as the
^1da177e4c3f41 Linus Torvalds           2005-04-16   938  	 * timer interrupt). Full topology setup happens at smp_init()
^1da177e4c3f41 Linus Torvalds           2005-04-16   939  	 * time - but meanwhile we still have a functioning scheduler.
^1da177e4c3f41 Linus Torvalds           2005-04-16   940  	 */
^1da177e4c3f41 Linus Torvalds           2005-04-16   941  	sched_init();
f1a0a376ca0c4e Valentin Schneider       2021-05-12   942  
dd4d9fecbeba89 Fabian Frederick         2014-08-08   943  	if (WARN(!irqs_disabled(),
dd4d9fecbeba89 Fabian Frederick         2014-08-08   944  		 "Interrupts were enabled *very* early, fixing it\n"))
c4a68306b9c093 Ard van Breemen          2007-01-05   945  		local_irq_disable();
0a835c4f090af2 Matthew Wilcox           2016-12-20   946  	radix_tree_init();
54a611b605901c Liam R. Howlett          2022-09-06   947  	maple_tree_init();
3347fa0928210d Tejun Heo                2016-09-16   948  
7d229c668a114e Tal Shorer               2017-11-03   949  	/*
7d229c668a114e Tal Shorer               2017-11-03   950  	 * Set up housekeeping before setting up workqueues to allow the unbound
7d229c668a114e Tal Shorer               2017-11-03   951  	 * workqueue to take non-housekeeping into account.
7d229c668a114e Tal Shorer               2017-11-03   952  	 */
7d229c668a114e Tal Shorer               2017-11-03   953  	housekeeping_init();
7d229c668a114e Tal Shorer               2017-11-03   954  
3347fa0928210d Tejun Heo                2016-09-16   955  	/*
3347fa0928210d Tejun Heo                2016-09-16   956  	 * Allow workqueue creation and work item queueing/cancelling
3347fa0928210d Tejun Heo                2016-09-16   957  	 * early.  Work item execution depends on kthreads and starts after
3347fa0928210d Tejun Heo                2016-09-16   958  	 * workqueue_init().
3347fa0928210d Tejun Heo                2016-09-16   959  	 */
3347fa0928210d Tejun Heo                2016-09-16   960  	workqueue_init_early();
3347fa0928210d Tejun Heo                2016-09-16   961  
^1da177e4c3f41 Linus Torvalds           2005-04-16   962  	rcu_init();
5f893b2639b21f Steven Rostedt (Red Hat  2014-12-12   963) 
e725c731e3bb1e Steven Rostedt (VMware   2017-03-03   964) 	/* Trace events are available after this */
5f893b2639b21f Steven Rostedt (Red Hat  2014-12-12   965) 	trace_init();
5f893b2639b21f Steven Rostedt (Red Hat  2014-12-12   966) 
4e37958d1288ce Steven Rostedt (VMware   2018-03-26   967) 	if (initcall_debug)
4e37958d1288ce Steven Rostedt (VMware   2018-03-26   968) 		initcall_debug_enable();
4e37958d1288ce Steven Rostedt (VMware   2018-03-26   969) 
65f382fd0c8fa4 Frederic Weisbecker      2013-07-11   970  	context_tracking_init();
0b8f1efad30bd5 Yinghai Lu               2008-12-05   971  	/* init some links before init_ISA_irqs() */
0b8f1efad30bd5 Yinghai Lu               2008-12-05   972  	early_irq_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16   973  	init_IRQ();
ad2b13536ace08 Thomas Gleixner          2013-03-05   974  	tick_init();
d6dd50e07c5bec Linus Torvalds           2014-10-13   975  	rcu_init_nohz();
^1da177e4c3f41 Linus Torvalds           2005-04-16   976  	init_timers();
8e9c01c717df7e Frederic Weisbecker      2021-04-09   977  	srcu_init();
c0a3132963db68 Thomas Gleixner          2006-01-09   978  	hrtimers_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16   979  	softirq_init();
ad596171ed635c John Stultz              2006-06-26   980  	timekeeping_init();
fe222a6ca2d53c Jason A. Donenfeld       2022-05-05   981  	time_init();
d55535232c3dbd Kees Cook                2019-04-19   982  
f62384995e4cb7 Jason A. Donenfeld       2022-09-26   983  	/* This must be after timekeeping is initialized */
f62384995e4cb7 Jason A. Donenfeld       2022-09-26   984  	random_init();
f62384995e4cb7 Jason A. Donenfeld       2022-09-26   985  
f62384995e4cb7 Jason A. Donenfeld       2022-09-26   986  	/* These make use of the fully initialized rng */
f62384995e4cb7 Jason A. Donenfeld       2022-09-26   987  	kfence_init();
d55535232c3dbd Kees Cook                2019-04-19   988  	boot_init_stack_canary();
d55535232c3dbd Kees Cook                2019-04-19   989  
9e6302056f8029 Stephane Eranian         2013-04-03   990  	perf_event_init();
93e028148fce0b Heiko Carstens           2006-07-03   991  	profile_init();
d8ad7d1123a960 Takao Indoh              2011-03-29   992  	call_function_init();
f91eb62f71b31e Steven Rostedt           2013-04-29   993  	WARN(!irqs_disabled(), "Interrupts were enabled early\n");
c3bc8fd637a962 Joel Fernandes (Google   2018-07-30   994) 
2ce802f62ba32a Tejun Heo                2011-01-20   995  	early_boot_irqs_disabled = false;
93e028148fce0b Heiko Carstens           2006-07-03   996  	local_irq_enable();
dcce284a259373 Benjamin Herrenschmidt   2009-06-18   997  
7e85ee0c1d15ca Pekka Enberg             2009-06-12   998  	kmem_cache_init_late();
^1da177e4c3f41 Linus Torvalds           2005-04-16   999  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1000  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1001  	 * HACK ALERT! This is early. We're enabling the console before
^1da177e4c3f41 Linus Torvalds           2005-04-16  1002  	 * we've done PCI setups etc, and console_init() must be aware of
^1da177e4c3f41 Linus Torvalds           2005-04-16  1003  	 * this. But we do want output early, in case something goes wrong.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1004  	 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1005  	console_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1006  	if (panic_later)
499a4584d7f817 Tetsuo Handa             2014-01-23  1007  		panic("Too many boot %s vars at `%s'", panic_later,
499a4584d7f817 Tetsuo Handa             2014-01-23  1008  		      panic_param);
fbb9ce9530fd9b Ingo Molnar              2006-07-03  1009  
c3bc8fd637a962 Joel Fernandes (Google   2018-07-30  1010) 	lockdep_init();
fbb9ce9530fd9b Ingo Molnar              2006-07-03  1011  
9a11b49a805665 Ingo Molnar              2006-07-03  1012  	/*
9a11b49a805665 Ingo Molnar              2006-07-03  1013  	 * Need to run this when irqs are enabled, because it wants
9a11b49a805665 Ingo Molnar              2006-07-03  1014  	 * to self-test [hard/soft]-irqs on/off lock inversion bugs
9a11b49a805665 Ingo Molnar              2006-07-03  1015  	 * too:
9a11b49a805665 Ingo Molnar              2006-07-03  1016  	 */
9a11b49a805665 Ingo Molnar              2006-07-03  1017  	locking_selftest();
9a11b49a805665 Ingo Molnar              2006-07-03  1018  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1019  #ifdef CONFIG_BLK_DEV_INITRD
^1da177e4c3f41 Linus Torvalds           2005-04-16  1020  	if (initrd_start && !initrd_below_start_ok &&
bd673c7c3b1681 Geert Uytterhoeven       2008-07-29  1021  	    page_to_pfn(virt_to_page((void *)initrd_start)) < min_low_pfn) {
ea676e846a8171 Andrew Morton            2013-04-29  1022  		pr_crit("initrd overwritten (0x%08lx < 0x%08lx) - disabling it.\n",
bd673c7c3b1681 Geert Uytterhoeven       2008-07-29  1023  		    page_to_pfn(virt_to_page((void *)initrd_start)),
bd673c7c3b1681 Geert Uytterhoeven       2008-07-29  1024  		    min_low_pfn);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1025  		initrd_start = 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1026  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1027  #endif
e7c8d5c9955a4d Christoph Lameter        2005-06-21  1028  	setup_per_cpu_pageset();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1029  	numa_policy_init();
9c71206d060d4e Dou Liyang               2017-09-13  1030  	acpi_early_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1031  	if (late_time_init)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1032  		late_time_init();
857baa87b6422b Pavel Tatashin           2018-07-19  1033  	sched_clock_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1034  	calibrate_delay();
e45e761b77bc07 Michael Kelley           2023-03-08  1035  
9df9d2f0471b4c Thomas Gleixner          2023-06-14  1036  	arch_cpu_finalize_init();
9df9d2f0471b4c Thomas Gleixner          2023-06-14  1037  
95846ecf9dac50 Gargi Sharma             2017-11-17  1038  	pid_idr_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1039  	anon_vma_init();
11520e5e7c1855 Linus Torvalds           2012-12-15  1040  #ifdef CONFIG_X86
83e68189745ad9 Matt Fleming             2012-11-14  1041  	if (efi_enabled(EFI_RUNTIME_SERVICES))
11520e5e7c1855 Linus Torvalds           2012-12-15  1042  		efi_enter_virtual_mode();
11520e5e7c1855 Linus Torvalds           2012-12-15  1043  #endif
b235beea9e996a Linus Torvalds           2016-06-24  1044  	thread_stack_cache_init();
d84f4f992cbd76 David Howells            2008-11-14  1045  	cred_init();
ff691f6e03815d Heinrich Schuchardt      2015-04-16  1046  	fork_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1047  	proc_caches_init();
3ea056c50476f8 Alexey Dobriyan          2018-04-10  1048  	uts_ns_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1049  	key_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1050  	security_init();
0b4b3827db386e Jason Wessel             2010-05-20  1051  	dbg_late_init();
9c1be1935fb68b Eric Dumazet             2022-02-05  1052  	net_ns_init();
4248b0da460839 Mel Gorman               2015-08-06  1053  	vfs_caches_init();
62906027091f1d Nicholas Piggin          2016-12-25  1054  	pagecache_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1055  	signals_init();
0965232035cfa5 Alexey Dobriyan          2018-04-10  1056  	seq_file_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1057  	proc_root_init();
e149ed2b805fef Al Viro                  2014-11-01  1058  	nsfs_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1059  	cpuset_init();
695df2132cfe37 Zefan Li                 2015-03-04  1060  	cgroup_init();
c757249af152c5 Shailabh Nagar           2006-07-14  1061  	taskstats_init_early();
ca74e92b469827 Shailabh Nagar           2006-07-14  1062  	delayacct_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1063  
b064a8fa77dfea Rafael J. Wysocki        2015-06-10  1064  	acpi_subsystem_init();
e7ff3a47630d95 Thomas Gleixner          2016-12-09  1065  	arch_post_acpi_subsys_init();
dfd402a4c4baae Marco Elver              2019-11-14  1066  	kcsan_init();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1067  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1068  	/* Do the rest non-__init'ed, we're now alive */
3caa9c675b70b0 Geert Uytterhoeven       2024-01-24 @1069  	rest_init();
a9a3ed1eff3601 Borislav Petkov          2020-04-22  1070  
dc1d05536f44ce ndesaulniers@google.com  2023-04-17  1071  	/*
dc1d05536f44ce ndesaulniers@google.com  2023-04-17  1072  	 * Avoid stack canaries in callers of boot_init_stack_canary for gcc-10
dc1d05536f44ce ndesaulniers@google.com  2023-04-17  1073  	 * and older.
dc1d05536f44ce ndesaulniers@google.com  2023-04-17  1074  	 */
dc1d05536f44ce ndesaulniers@google.com  2023-04-17  1075  #if !__has_attribute(__no_stack_protector__)
a9a3ed1eff3601 Borislav Petkov          2020-04-22  1076  	prevent_tail_call_optimization();
dc1d05536f44ce ndesaulniers@google.com  2023-04-17  1077  #endif
^1da177e4c3f41 Linus Torvalds           2005-04-16  1078  }
^1da177e4c3f41 Linus Torvalds           2005-04-16  1079  

:::::: The code at line 1069 was first introduced by commit
:::::: 3caa9c675b70b01d38fd09758e80b0de6342ee9a init: remove obsolete arch_call_rest_init() wrapper

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
