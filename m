Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D951474BD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706891872; cv=none; b=XW2fvwgLXmSPTaBDFyWOpg0T3b9VFpucbRX96LN83bgT21N2n2MmCYzr544Ai2moRBZpUFb4N26qOmHlc/Nzc0Q1cTTQVpqUN9odcNuwdYS3B53nwC6/DjEF6efUAiZFqWT95vsboGijGZrs3Fh5DswbG1UP/4tMaMXp15PAuKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706891872; c=relaxed/simple;
	bh=wgGe92EA8VCYUx/iK0/KkOXaSKSdpD8lir20KbMo1k4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vFI/Ylz6VQOqixEDIRJCyghs2cM40iowkm25XTp0l63n8xcO6MiYZz+5NoxdWRNDGioy5/NlEpr2Ryt2KmzcT2gQe8aBsHmXXJezbNJnooS/0Ilt/cuBb7/hqTh50l9EFaH72zQTSEs/VzwYfIOZY7f3JANiCzyweLDcIRcvO7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HuGifv+q; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HuGifv+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706891870; x=1738427870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wgGe92EA8VCYUx/iK0/KkOXaSKSdpD8lir20KbMo1k4=;
  b=HuGifv+qgMDQ5OdH78SuZHhqtajnTRvRNMU2mcydSsblkm6Q+OhYtC05
   FaHyHDJddFcF6cx9bXhacHhfatJyhVtQbmxD1HJ+6o+xpUco5pTADkqsr
   WgByLJlvIguGC95Y9ZC3YWRM/2hAqPh9xdOFQGXns3QRtLF6piHFIn2A+
   hnpObPP4yRDSsLBonVbR33XpWpSzzoZeYxJZxTyWXSkxERQIChPAmTS4v
   6trGMZZclS5Dfo9zgR9vrPcp4gbRddFQ9lzlYBNL0lZ/koXTzhW087PPK
   zurbhBwivQht1jfeBbQsuvCKDPk2brUeUeUNmV6Ir1BTkfNdfIkJ+J0XA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="22674091"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="22674091"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 08:37:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4716039"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Feb 2024 08:37:48 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVwXx-00044I-0E;
	Fri, 02 Feb 2024 16:37:45 +0000
Date: Sat, 3 Feb 2024 00:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 12/59] kernel/trace/trace_osnoise.c:438:6:
 warning: no previous prototype for 'osnoise_trace_irq_entry'
Message-ID: <202402030026.CCYjlvVh-lkp@intel.com>
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
config: i386-buildonly-randconfig-003-20240202 (https://download.01.org/0day-ci/archive/20240203/202402030026.CCYjlvVh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030026.CCYjlvVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030026.CCYjlvVh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/trace/events/osnoise.h:55:9: note: in expansion of macro 'TP_printk'
      55 |         TP_printk("%8s:%d start %llu.%09u duration %llu ns",
         |         ^~~~~~~~~
   include/trace/events/osnoise.h:55:36: note: format string is defined here
      55 |         TP_printk("%8s:%d start %llu.%09u duration %llu ns",
         |                                 ~~~^
         |                                    |
         |                                    long long unsigned int
         |                                 %u
   include/trace/events/osnoise.h: In function 'trace_raw_output_irq_noise':
   include/trace/events/osnoise.h:84:19: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 5 has type 'int' [-Wformat=]
      84 |         TP_printk("%s:%d start %llu.%09u duration %llu ns",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ......
      87 |                 __print_ns_to_secs(__entry->start),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 |
         |                 int
   include/trace/trace_events.h:367:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     367 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:80:30: note: in expansion of macro 'PARAMS'
      80 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/osnoise.h:63:1: note: in expansion of macro 'TRACE_EVENT'
      63 | TRACE_EVENT(irq_noise,
         | ^~~~~~~~~~~
   include/trace/events/osnoise.h:84:9: note: in expansion of macro 'TP_printk'
      84 |         TP_printk("%s:%d start %llu.%09u duration %llu ns",
         |         ^~~~~~~~~
   include/trace/events/osnoise.h:84:35: note: format string is defined here
      84 |         TP_printk("%s:%d start %llu.%09u duration %llu ns",
         |                                ~~~^
         |                                   |
         |                                   long long unsigned int
         |                                %u
   include/trace/events/osnoise.h: In function 'trace_raw_output_nmi_noise':
   include/trace/events/osnoise.h:108:19: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'int' [-Wformat=]
     108 |         TP_printk("start %llu.%09u duration %llu ns",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     109 |                 __print_ns_to_secs(__entry->start),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 |
         |                 int
   include/trace/trace_events.h:367:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     367 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:80:30: note: in expansion of macro 'PARAMS'
      80 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/osnoise.h:92:1: note: in expansion of macro 'TRACE_EVENT'
      92 | TRACE_EVENT(nmi_noise,
         | ^~~~~~~~~~~
   include/trace/events/osnoise.h:108:9: note: in expansion of macro 'TP_printk'
     108 |         TP_printk("start %llu.%09u duration %llu ns",
         |         ^~~~~~~~~
   include/trace/events/osnoise.h:108:29: note: format string is defined here
     108 |         TP_printk("start %llu.%09u duration %llu ns",
         |                          ~~~^
         |                             |
         |                             long long unsigned int
         |                          %u
   include/trace/events/osnoise.h: In function 'trace_raw_output_sample_threshold':
   include/trace/events/osnoise.h:132:19: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'int' [-Wformat=]
     132 |         TP_printk("start %llu.%09u duration %llu ns interferences %llu",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     133 |                 __print_ns_to_secs(__entry->start),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 |
         |                 int
   include/trace/trace_events.h:367:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     367 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:80:30: note: in expansion of macro 'PARAMS'
      80 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/osnoise.h:114:1: note: in expansion of macro 'TRACE_EVENT'
     114 | TRACE_EVENT(sample_threshold,
         | ^~~~~~~~~~~
   include/trace/events/osnoise.h:132:9: note: in expansion of macro 'TP_printk'
     132 |         TP_printk("start %llu.%09u duration %llu ns interferences %llu",
         |         ^~~~~~~~~
   include/trace/events/osnoise.h:132:29: note: format string is defined here
     132 |         TP_printk("start %llu.%09u duration %llu ns interferences %llu",
         |                          ~~~^
         |                             |
         |                             long long unsigned int
         |                          %u
   kernel/trace/trace_osnoise.c: In function 'trace_osnoise_sample':
   kernel/trace/trace_osnoise.c:232:43: error: implicit declaration of function 'tracing_gen_ctx' [-Werror=implicit-function-declaration]
     232 |                                           tracing_gen_ctx());
         |                                           ^~~~~~~~~~~~~~~
   kernel/trace/trace_osnoise.c:231:17: error: too few arguments to function 'trace_buffer_lock_reserve'
     231 |         event = trace_buffer_lock_reserve(buffer, TRACE_OSNOISE, sizeof(*entry),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/trace_osnoise.c:25:
   kernel/trace/trace.h:757:1: note: declared here
     757 | trace_buffer_lock_reserve(struct trace_buffer *buffer,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_osnoise.c: At top level:
>> kernel/trace/trace_osnoise.c:438:6: warning: no previous prototype for 'osnoise_trace_irq_entry' [-Wmissing-prototypes]
     438 | void osnoise_trace_irq_entry(int id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_osnoise.c:461:6: warning: no previous prototype for 'osnoise_trace_irq_exit' [-Wmissing-prototypes]
     461 | void osnoise_trace_irq_exit(int id, const char *desc)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_osnoise.c:520:5: warning: no previous prototype for 'hook_irq_events' [-Wmissing-prototypes]
     520 | int hook_irq_events(void)
         |     ^~~~~~~~~~~~~~~
>> kernel/trace/trace_osnoise.c:552:6: warning: no previous prototype for 'unhook_irq_events' [-Wmissing-prototypes]
     552 | void unhook_irq_events(void)
         |      ^~~~~~~~~~~~~~~~~
>> kernel/trace/trace_osnoise.c:569:6: warning: no previous prototype for 'trace_softirq_entry_callback' [-Wmissing-prototypes]
     569 | void trace_softirq_entry_callback(void *data, unsigned int vec_nr)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_osnoise.c:592:6: warning: no previous prototype for 'trace_softirq_exit_callback' [-Wmissing-prototypes]
     592 | void trace_softirq_exit_callback(void *data, unsigned int vec_nr)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_osnoise.c:706:1: warning: no previous prototype for 'trace_sched_switch_callback' [-Wmissing-prototypes]
     706 | trace_sched_switch_callback(void *data, bool preempt, struct task_struct *p,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_osnoise.c:724:5: warning: no previous prototype for 'hook_thread_events' [-Wmissing-prototypes]
     724 | int hook_thread_events(void)
         |     ^~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_osnoise.c:741:6: warning: no previous prototype for 'unhook_thread_events' [-Wmissing-prototypes]
     741 | void unhook_thread_events(void)
         |      ^~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_osnoise.c:753:6: warning: no previous prototype for 'save_osn_sample_stats' [-Wmissing-prototypes]
     753 | void save_osn_sample_stats(struct osnoise_variables *osn_var, struct osnoise_sample *s)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_osnoise.c:768:6: warning: no previous prototype for 'diff_osn_sample_stats' [-Wmissing-prototypes]
     768 | void diff_osn_sample_stats(struct osnoise_variables *osn_var, struct osnoise_sample *s)
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_osnoise.c:1160:15: error: variable 'osnoise_runtime' has initializer but incomplete type
    1160 | static struct trace_min_max_param osnoise_runtime = {
         |               ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_osnoise.c:1161:10: error: 'struct trace_min_max_param' has no member named 'lock'
    1161 |         .lock   = &interface_lock,
         |          ^~~~
   kernel/trace/trace_osnoise.c:1161:19: warning: excess elements in struct initializer
    1161 |         .lock   = &interface_lock,
         |                   ^
   kernel/trace/trace_osnoise.c:1161:19: note: (near initialization for 'osnoise_runtime')
   kernel/trace/trace_osnoise.c:1162:10: error: 'struct trace_min_max_param' has no member named 'val'
    1162 |         .val    = &osnoise_data.sample_runtime,
         |          ^~~
   kernel/trace/trace_osnoise.c:1162:19: warning: excess elements in struct initializer
    1162 |         .val    = &osnoise_data.sample_runtime,
         |                   ^
   kernel/trace/trace_osnoise.c:1162:19: note: (near initialization for 'osnoise_runtime')
   kernel/trace/trace_osnoise.c:1163:10: error: 'struct trace_min_max_param' has no member named 'max'
    1163 |         .max    = &osnoise_data.sample_period,
         |          ^~~
   kernel/trace/trace_osnoise.c:1163:19: warning: excess elements in struct initializer
    1163 |         .max    = &osnoise_data.sample_period,
         |                   ^
   kernel/trace/trace_osnoise.c:1163:19: note: (near initialization for 'osnoise_runtime')
   kernel/trace/trace_osnoise.c:1164:10: error: 'struct trace_min_max_param' has no member named 'min'
    1164 |         .min    = NULL,
         |          ^~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:254,
                    from include/linux/err.h:5,
                    from include/linux/kthread.h:5,
                    from kernel/trace/trace_osnoise.c:18:
   include/linux/stddef.h:8:14: warning: excess elements in struct initializer
       8 | #define NULL ((void *)0)
         |              ^
   kernel/trace/trace_osnoise.c:1164:19: note: in expansion of macro 'NULL'
    1164 |         .min    = NULL,
         |                   ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'osnoise_runtime')
       8 | #define NULL ((void *)0)
         |              ^
   kernel/trace/trace_osnoise.c:1164:19: note: in expansion of macro 'NULL'
    1164 |         .min    = NULL,
         |                   ^~~~
   kernel/trace/trace_osnoise.c:1170:15: error: variable 'osnoise_period' has initializer but incomplete type
    1170 | static struct trace_min_max_param osnoise_period = {
         |               ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_osnoise.c:1171:10: error: 'struct trace_min_max_param' has no member named 'lock'
    1171 |         .lock   = &interface_lock,
         |          ^~~~
   kernel/trace/trace_osnoise.c:1171:19: warning: excess elements in struct initializer
    1171 |         .lock   = &interface_lock,
         |                   ^
   kernel/trace/trace_osnoise.c:1171:19: note: (near initialization for 'osnoise_period')
   kernel/trace/trace_osnoise.c:1172:10: error: 'struct trace_min_max_param' has no member named 'val'
    1172 |         .val    = &osnoise_data.sample_period,
         |          ^~~
   kernel/trace/trace_osnoise.c:1172:19: warning: excess elements in struct initializer
    1172 |         .val    = &osnoise_data.sample_period,
         |                   ^
   kernel/trace/trace_osnoise.c:1172:19: note: (near initialization for 'osnoise_period')
   kernel/trace/trace_osnoise.c:1173:10: error: 'struct trace_min_max_param' has no member named 'max'
    1173 |         .max    = NULL,
         |          ^~~
   include/linux/stddef.h:8:14: warning: excess elements in struct initializer
       8 | #define NULL ((void *)0)
         |              ^
   kernel/trace/trace_osnoise.c:1173:19: note: in expansion of macro 'NULL'
    1173 |         .max    = NULL,
         |                   ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'osnoise_period')
       8 | #define NULL ((void *)0)
         |              ^
   kernel/trace/trace_osnoise.c:1173:19: note: in expansion of macro 'NULL'
    1173 |         .max    = NULL,
         |                   ^~~~
   kernel/trace/trace_osnoise.c:1174:10: error: 'struct trace_min_max_param' has no member named 'min'
    1174 |         .min    = &osnoise_data.sample_runtime,
         |          ^~~
   kernel/trace/trace_osnoise.c:1174:19: warning: excess elements in struct initializer
    1174 |         .min    = &osnoise_data.sample_runtime,
         |                   ^
   kernel/trace/trace_osnoise.c:1174:19: note: (near initialization for 'osnoise_period')
   kernel/trace/trace_osnoise.c:1180:15: error: variable 'osnoise_stop_tracing_in' has initializer but incomplete type
    1180 | static struct trace_min_max_param osnoise_stop_tracing_in = {
         |               ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_osnoise.c:1181:10: error: 'struct trace_min_max_param' has no member named 'lock'
    1181 |         .lock   = &interface_lock,
         |          ^~~~
   kernel/trace/trace_osnoise.c:1181:19: warning: excess elements in struct initializer
    1181 |         .lock   = &interface_lock,
         |                   ^
   kernel/trace/trace_osnoise.c:1181:19: note: (near initialization for 'osnoise_stop_tracing_in')


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
