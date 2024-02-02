Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8390146918
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706890610; cv=none; b=qGWHYHx8R8s3BYi8vtdC4awDhBArJZknsl0arxuOF25jvrTL2VRlFQF3oOlT2PqXI1VMtdE4+M3tdA7weN1CllIAHdUjG3S5eBBIu1rnzIIYSJ3AHf18VwFdpm2Gxn/0Y/FoJhAYpSiyHyggnUxqMplpBP+2ecPphC01nbnbA2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706890610; c=relaxed/simple;
	bh=rqtSQVV45kLsQjZrKN+v4Cp67exEewF80nqdsB0AwIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LOuCDLejFlYczEoqxcLh3bVRb9VviotZZIHEABKO5xFMAiwigCMq/HxJGQlBRcBDSAyzofj2BZPi/uNZ7D5bOFab9talKGK48DrdrxpSD1D/tygXKtteY+UYFSHd14hW/KZ9NGKGZgsr0Vw69xYQ0rQ4a9oPX8Dpa02vtQz5JNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhcdAdgr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhcdAdgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706890608; x=1738426608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rqtSQVV45kLsQjZrKN+v4Cp67exEewF80nqdsB0AwIY=;
  b=nhcdAdgrMK3x1vNmZp8JsZHnvKljifpi/RIOlZASA3PdVXlXGMXlgsym
   WSrrTtWg9KJaMKLjzmL7vPI+UKkD91GpV89fgqWafjAgHDG31qljyPYkD
   ttlA6qKWdu5LB8whaCgCSQYA/OXZmiVFkz9AY8vGN/jmMW31w0u4iB5+N
   oMXkYS86DGCzrtn0oK8TtyVMP6RCTM93UCYxUUQ4UVpZnOtKNpidyOyM/
   IAb6Bz6poGoAZK3zWcHigPwtOfKb2hx05QGdL7RdD7ztF6NH0Bx1SmTZ3
   3WkqZWNhTylhvwakXrc2D/TK8flE4knn2pbFdZCB7TjQ7CQjmxwhgcUSB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="102958"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="102958"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 08:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="396190"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Feb 2024 08:16:46 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVwDb-00042I-0V;
	Fri, 02 Feb 2024 16:16:43 +0000
Date: Sat, 3 Feb 2024 00:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 12/59] kernel/trace/trace_osnoise.c:438:6:
 warning: no previous prototype for function 'osnoise_trace_irq_entry'
Message-ID: <202402030006.4CD5Iks3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   9aebbffff7f8ec1963c7ab277c3cbc75c4fd2c19
commit: 45b80aaf51c5a5cf48bd828095b1e8f7462c5905 [12/59] UPSTREAM: trace: Add osnoise tracer
config: i386-buildonly-randconfig-005-20240202 (https://download.01.org/0day-ci/archive/20240203/202402030006.4CD5Iks3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030006.4CD5Iks3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030006.4CD5Iks3-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      77 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      78 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      79 |                              PARAMS(assign),                   \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      80 |                              PARAMS(print));                   \
         |                              ~~~~~~~^~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:367:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
     367 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   In file included from kernel/trace/trace_osnoise.c:37:
   In file included from include/trace/events/osnoise.h:142:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:401:
   include/trace/events/osnoise.h:133:3: error: call to undeclared function '__print_ns_to_secs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     133 |                 __print_ns_to_secs(__entry->start),
         |                 ^
   include/trace/events/osnoise.h:134:3: error: call to undeclared function '__print_ns_without_secs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     134 |                 __print_ns_without_secs(__entry->start),
         |                 ^
   include/trace/events/osnoise.h:133:3: warning: format specifies type 'unsigned long long' but the argument has type 'int' [-Wformat]
     114 |                 __field(        u64,            duration)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     115 |                 __field(        u64,            interference)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     116 |         ),
         |         ~~
     117 | 
     118 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
     119 |                 __entry->start = start;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~
     120 |                 __entry->duration = duration;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     121 |                 __entry->interference = interference;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     122 |         ),
         |         ~~
     123 | 
     124 |         TP_printk("start %llu.%09u duration %llu ns interferences %llu",
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          %d
     125 |                 __print_ns_to_secs(__entry->start),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     126 |                 __print_ns_without_secs(__entry->start),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     127 |                 __entry->duration,
         |                 ~~~~~~~~~~~~~~~~~~
     128 |                 __entry->interference)
         |                 ~~~~~~~~~~~~~~~~~~~~~~
     129 | );
         | ~
   include/trace/trace_events.h:266:43: note: expanded from macro 'TP_printk'
     266 | #define TP_printk(fmt, args...) fmt "\n", args
         |                                 ~~~       ^
   include/trace/trace_events.h:80:16: note: expanded from macro 'TRACE_EVENT'
      75 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      76 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      77 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      78 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      79 |                              PARAMS(assign),                   \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      80 |                              PARAMS(print));                   \
         |                              ~~~~~~~^~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:367:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
     367 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   kernel/trace/trace_osnoise.c:232:8: error: call to undeclared function 'tracing_gen_ctx'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     232 |                                           tracing_gen_ctx());
         |                                           ^
   kernel/trace/trace_osnoise.c:232:25: error: too few arguments to function call, expected 6, have 4
     231 |         event = trace_buffer_lock_reserve(buffer, TRACE_OSNOISE, sizeof(*entry),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~
     232 |                                           tracing_gen_ctx());
         |                                                            ^
   kernel/trace/trace.h:757:1: note: 'trace_buffer_lock_reserve' declared here
     757 | trace_buffer_lock_reserve(struct trace_buffer *buffer,
         | ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     758 |                           int type,
         |                           ~~~~~~~~~
     759 |                           unsigned long len,
         |                           ~~~~~~~~~~~~~~~~~~
     760 |                           unsigned long irq_flags,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~
     761 |                           unsigned long trace_flags,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~
     762 |                           int pc);
         |                           ~~~~~~
>> kernel/trace/trace_osnoise.c:438:6: warning: no previous prototype for function 'osnoise_trace_irq_entry' [-Wmissing-prototypes]
     438 | void osnoise_trace_irq_entry(int id)
         |      ^
   kernel/trace/trace_osnoise.c:438:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     438 | void osnoise_trace_irq_entry(int id)
         | ^
         | static 
>> kernel/trace/trace_osnoise.c:461:6: warning: no previous prototype for function 'osnoise_trace_irq_exit' [-Wmissing-prototypes]
     461 | void osnoise_trace_irq_exit(int id, const char *desc)
         |      ^
   kernel/trace/trace_osnoise.c:461:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     461 | void osnoise_trace_irq_exit(int id, const char *desc)
         | ^
         | static 
>> kernel/trace/trace_osnoise.c:520:5: warning: no previous prototype for function 'hook_irq_events' [-Wmissing-prototypes]
     520 | int hook_irq_events(void)
         |     ^
   kernel/trace/trace_osnoise.c:520:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     520 | int hook_irq_events(void)
         | ^
         | static 
>> kernel/trace/trace_osnoise.c:552:6: warning: no previous prototype for function 'unhook_irq_events' [-Wmissing-prototypes]
     552 | void unhook_irq_events(void)
         |      ^
   kernel/trace/trace_osnoise.c:552:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     552 | void unhook_irq_events(void)
         | ^
         | static 
>> kernel/trace/trace_osnoise.c:569:6: warning: no previous prototype for function 'trace_softirq_entry_callback' [-Wmissing-prototypes]
     569 | void trace_softirq_entry_callback(void *data, unsigned int vec_nr)
         |      ^
   kernel/trace/trace_osnoise.c:569:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     569 | void trace_softirq_entry_callback(void *data, unsigned int vec_nr)
         | ^
         | static 
>> kernel/trace/trace_osnoise.c:592:6: warning: no previous prototype for function 'trace_softirq_exit_callback' [-Wmissing-prototypes]
     592 | void trace_softirq_exit_callback(void *data, unsigned int vec_nr)
         |      ^
   kernel/trace/trace_osnoise.c:592:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     592 | void trace_softirq_exit_callback(void *data, unsigned int vec_nr)
         | ^
         | static 
>> kernel/trace/trace_osnoise.c:706:1: warning: no previous prototype for function 'trace_sched_switch_callback' [-Wmissing-prototypes]
     706 | trace_sched_switch_callback(void *data, bool preempt, struct task_struct *p,
         | ^
   kernel/trace/trace_osnoise.c:705:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     705 | void
         | ^
         | static 
>> kernel/trace/trace_osnoise.c:724:5: warning: no previous prototype for function 'hook_thread_events' [-Wmissing-prototypes]
     724 | int hook_thread_events(void)
         |     ^
   kernel/trace/trace_osnoise.c:724:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     724 | int hook_thread_events(void)
         | ^
         | static 
>> kernel/trace/trace_osnoise.c:741:6: warning: no previous prototype for function 'unhook_thread_events' [-Wmissing-prototypes]
     741 | void unhook_thread_events(void)
         |      ^
   kernel/trace/trace_osnoise.c:741:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     741 | void unhook_thread_events(void)
         | ^
         | static 
>> kernel/trace/trace_osnoise.c:753:6: warning: no previous prototype for function 'save_osn_sample_stats' [-Wmissing-prototypes]
     753 | void save_osn_sample_stats(struct osnoise_variables *osn_var, struct osnoise_sample *s)
         |      ^
   kernel/trace/trace_osnoise.c:753:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     753 | void save_osn_sample_stats(struct osnoise_variables *osn_var, struct osnoise_sample *s)
         | ^
         | static 
>> kernel/trace/trace_osnoise.c:768:6: warning: no previous prototype for function 'diff_osn_sample_stats' [-Wmissing-prototypes]
     768 | void diff_osn_sample_stats(struct osnoise_variables *osn_var, struct osnoise_sample *s)
         |      ^
   kernel/trace/trace_osnoise.c:768:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     768 | void diff_osn_sample_stats(struct osnoise_variables *osn_var, struct osnoise_sample *s)
         | ^
         | static 
   kernel/trace/trace_osnoise.c:1160:35: error: variable has incomplete type 'struct trace_min_max_param'
    1160 | static struct trace_min_max_param osnoise_runtime = {
         |                                   ^
   kernel/trace/trace_osnoise.c:1160:15: note: forward declaration of 'struct trace_min_max_param'
    1160 | static struct trace_min_max_param osnoise_runtime = {
         |               ^
   kernel/trace/trace_osnoise.c:1170:35: error: variable has incomplete type 'struct trace_min_max_param'
    1170 | static struct trace_min_max_param osnoise_period = {
         |                                   ^
   kernel/trace/trace_osnoise.c:1160:15: note: forward declaration of 'struct trace_min_max_param'
    1160 | static struct trace_min_max_param osnoise_runtime = {
         |               ^
   kernel/trace/trace_osnoise.c:1180:35: error: variable has incomplete type 'struct trace_min_max_param'
    1180 | static struct trace_min_max_param osnoise_stop_tracing_in = {
         |                                   ^
   kernel/trace/trace_osnoise.c:1160:15: note: forward declaration of 'struct trace_min_max_param'
    1160 | static struct trace_min_max_param osnoise_runtime = {
         |               ^
   kernel/trace/trace_osnoise.c:1190:35: error: variable has incomplete type 'struct trace_min_max_param'
    1190 | static struct trace_min_max_param osnoise_stop_tracing_total = {
         |                                   ^
   kernel/trace/trace_osnoise.c:1160:15: note: forward declaration of 'struct trace_min_max_param'
    1160 | static struct trace_min_max_param osnoise_runtime = {
         |               ^
   kernel/trace/trace_osnoise.c:1227:25: error: use of undeclared identifier 'trace_min_max_fops'
    1227 |                                   &osnoise_period, &trace_min_max_fops);
         |                                                     ^
   kernel/trace/trace_osnoise.c:1232:26: error: use of undeclared identifier 'trace_min_max_fops'
    1232 |                                   &osnoise_runtime, &trace_min_max_fops);
         |                                                      ^
   kernel/trace/trace_osnoise.c:1237:34: error: use of undeclared identifier 'trace_min_max_fops'
    1237 |                                   &osnoise_stop_tracing_in, &trace_min_max_fops);
         |                                                              ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   16 warnings and 20 errors generated.


vim +/osnoise_trace_irq_entry +438 kernel/trace/trace_osnoise.c

   428	
   429	/*
   430	 * osnoise_trace_irq_entry - Note the starting of an IRQ
   431	 *
   432	 * Save the starting time of an IRQ. As IRQs are non-preemptive to other IRQs,
   433	 * it is safe to use a single variable (ons_var->irq) to save the statistics.
   434	 * The arrival_time is used to report... the arrival time. The delta_start
   435	 * is used to compute the duration at the IRQ exit handler. See
   436	 * cond_move_irq_delta_start().
   437	 */
 > 438	void osnoise_trace_irq_entry(int id)
   439	{
   440		struct osnoise_variables *osn_var = this_cpu_osn_var();
   441	
   442		if (!osn_var->sampling)
   443			return;
   444		/*
   445		 * This value will be used in the report, but not to compute
   446		 * the execution time, so it is safe to get it unsafe.
   447		 */
   448		osn_var->irq.arrival_time = time_get();
   449		set_int_safe_time(osn_var, &osn_var->irq.delta_start);
   450		osn_var->irq.count++;
   451	
   452		local_inc(&osn_var->int_counter);
   453	}
   454	
   455	/*
   456	 * osnoise_irq_exit - Note the end of an IRQ, sava data and trace
   457	 *
   458	 * Computes the duration of the IRQ noise, and trace it. Also discounts the
   459	 * interference from other sources of noise could be currently being accounted.
   460	 */
 > 461	void osnoise_trace_irq_exit(int id, const char *desc)
   462	{
   463		struct osnoise_variables *osn_var = this_cpu_osn_var();
   464		int duration;
   465	
   466		if (!osn_var->sampling)
   467			return;
   468	
   469		duration = get_int_safe_duration(osn_var, &osn_var->irq.delta_start);
   470		trace_irq_noise(id, desc, osn_var->irq.arrival_time, duration);
   471		osn_var->irq.arrival_time = 0;
   472		cond_move_softirq_delta_start(osn_var, duration);
   473		cond_move_thread_delta_start(osn_var, duration);
   474	}
   475	
   476	/*
   477	 * trace_irqentry_callback - Callback to the irq:irq_entry traceevent
   478	 *
   479	 * Used to note the starting of an IRQ occurece.
   480	 */
   481	static void trace_irqentry_callback(void *data, int irq,
   482					    struct irqaction *action)
   483	{
   484		osnoise_trace_irq_entry(irq);
   485	}
   486	
   487	/*
   488	 * trace_irqexit_callback - Callback to the irq:irq_exit traceevent
   489	 *
   490	 * Used to note the end of an IRQ occurece.
   491	 */
   492	static void trace_irqexit_callback(void *data, int irq,
   493					   struct irqaction *action, int ret)
   494	{
   495		osnoise_trace_irq_exit(irq, action->name);
   496	}
   497	
   498	/*
   499	 * arch specific register function.
   500	 */
   501	int __weak osnoise_arch_register(void)
   502	{
   503		return 0;
   504	}
   505	
   506	/*
   507	 * arch specific unregister function.
   508	 */
   509	void __weak osnoise_arch_unregister(void)
   510	{
   511		return;
   512	}
   513	
   514	/*
   515	 * hook_irq_events - Hook IRQ handling events
   516	 *
   517	 * This function hooks the IRQ related callbacks to the respective trace
   518	 * events.
   519	 */
 > 520	int hook_irq_events(void)
   521	{
   522		int ret;
   523	
   524		ret = register_trace_irq_handler_entry(trace_irqentry_callback, NULL);
   525		if (ret)
   526			goto out_err;
   527	
   528		ret = register_trace_irq_handler_exit(trace_irqexit_callback, NULL);
   529		if (ret)
   530			goto out_unregister_entry;
   531	
   532		ret = osnoise_arch_register();
   533		if (ret)
   534			goto out_irq_exit;
   535	
   536		return 0;
   537	
   538	out_irq_exit:
   539		unregister_trace_irq_handler_exit(trace_irqexit_callback, NULL);
   540	out_unregister_entry:
   541		unregister_trace_irq_handler_entry(trace_irqentry_callback, NULL);
   542	out_err:
   543		return -EINVAL;
   544	}
   545	
   546	/*
   547	 * unhook_irq_events - Unhook IRQ handling events
   548	 *
   549	 * This function unhooks the IRQ related callbacks to the respective trace
   550	 * events.
   551	 */
 > 552	void unhook_irq_events(void)
   553	{
   554		osnoise_arch_unregister();
   555		unregister_trace_irq_handler_exit(trace_irqexit_callback, NULL);
   556		unregister_trace_irq_handler_entry(trace_irqentry_callback, NULL);
   557	}
   558	
   559	#ifndef CONFIG_PREEMPT_RT
   560	/*
   561	 * trace_softirq_entry_callback - Note the starting of a softirq
   562	 *
   563	 * Save the starting time of a softirq. As softirqs are non-preemptive to
   564	 * other softirqs, it is safe to use a single variable (ons_var->softirq)
   565	 * to save the statistics. The arrival_time is used to report... the
   566	 * arrival time. The delta_start is used to compute the duration at the
   567	 * softirq exit handler. See cond_move_softirq_delta_start().
   568	 */
 > 569	void trace_softirq_entry_callback(void *data, unsigned int vec_nr)
   570	{
   571		struct osnoise_variables *osn_var = this_cpu_osn_var();
   572	
   573		if (!osn_var->sampling)
   574			return;
   575		/*
   576		 * This value will be used in the report, but not to compute
   577		 * the execution time, so it is safe to get it unsafe.
   578		 */
   579		osn_var->softirq.arrival_time = time_get();
   580		set_int_safe_time(osn_var, &osn_var->softirq.delta_start);
   581		osn_var->softirq.count++;
   582	
   583		local_inc(&osn_var->int_counter);
   584	}
   585	
   586	/*
   587	 * trace_softirq_exit_callback - Note the end of an softirq
   588	 *
   589	 * Computes the duration of the softirq noise, and trace it. Also discounts the
   590	 * interference from other sources of noise could be currently being accounted.
   591	 */
 > 592	void trace_softirq_exit_callback(void *data, unsigned int vec_nr)
   593	{
   594		struct osnoise_variables *osn_var = this_cpu_osn_var();
   595		int duration;
   596	
   597		if (!osn_var->sampling)
   598			return;
   599	
   600		duration = get_int_safe_duration(osn_var, &osn_var->softirq.delta_start);
   601		trace_softirq_noise(vec_nr, osn_var->softirq.arrival_time, duration);
   602		cond_move_thread_delta_start(osn_var, duration);
   603		osn_var->softirq.arrival_time = 0;
   604	}
   605	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
