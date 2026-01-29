Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFFB318B81
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 06:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769669741; cv=none; b=hqyBTDAkE2voYcIqZhCQllMTrzUs5y2Khbpb0UX9ovo9d5WOLr7YMO4Icy+ZsGg6w/dPDjx/JLozmbiHwFCP8KtE3NrgpjuR3sEGN2s+cqlaKkPXLrBsl6ySBvc1lc9CXthiOAjGxtK9vbyQkJkekCuJymHT6ZJRpVh7QMekvpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769669741; c=relaxed/simple;
	bh=Wlwmqv1tQhaUuL2DEKc7ECyRhik/djZPjccb/HB7ZqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UskqAmaDII2sz8xEk9Iom7sEE2uRSx27GZEP9C34M4akQlIsIwRTu5s7QqVgAEg1zcGzkRzAbwaArR3unjSxr5TVrsg1glvoKB4SkKAC88SUytnHnYBE3EOILJrQ+9NOjZD6vDVgYkGYBd7Xz1hnzsIH0J/T87wussa1gh3KKwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXlRldPS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXlRldPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769669740; x=1801205740;
  h=date:from:to:cc:subject:message-id;
  bh=Wlwmqv1tQhaUuL2DEKc7ECyRhik/djZPjccb/HB7ZqA=;
  b=YXlRldPS+PpTeG5TiZj/AH7G0pbMJFXJaXtVcmxHw7aG7n4P0Rv4Xmlc
   A5aObh8qLDTJ/OyXfHM+y5OkgBAKPHLdTBtRkzqf25O4CEefY50sHacUG
   ckGJjxhvpUbFAtVno1y8JXGYFcZlF1vJTgUGMEHyM6GtL5llga9hB4sbK
   I2CDyHdP8lHdtpKuVHf+qcBNiZ0NaDQ9kjwPPjp/YGa+sbuSBX9pOUfsW
   R6y5s46fIFAhOc4I519IkLXxE7K7Cn2MlZVyG8BbWGH4zd52WX8bkyXe2
   na9+6a1kN/tZV/aW/9kB12xna3aTHY0pm3h1eXsBmqm4at0LXM5+4CpAb
   g==;
X-CSE-ConnectionGUID: RkfzRSpRROCCPqmH5KGJ8Q==
X-CSE-MsgGUID: PJpn04IBTyO4ELz2Z4QyFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74521373"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="74521373"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 22:55:39 -0800
X-CSE-ConnectionGUID: twuoVQbeQnuY440HfxAYQA==
X-CSE-MsgGUID: sp2aVdLjR425Qge3/omBWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208273328"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Jan 2026 22:55:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlLwE-00000000bBQ-0nty;
	Thu, 29 Jan 2026 06:55:34 +0000
Date: Thu, 29 Jan 2026 14:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 23/27] kernel/rcu/repro.c:307:17: error:
 implicit declaration of function 'kfree'
Message-ID: <202601291429.wqaGOHbY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux dev
head:   9dc8cf1e0badf4e0d8dbda42710d3224db4ca499
commit: 3b6710441b0d0413aeddfe6637bf50dbdabc0297 [23/27] EXP rcu/repro: Add generic reproducer torture-test module
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260129/202601291429.wqaGOHbY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291429.wqaGOHbY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291429.wqaGOHbY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/rcu/repro.c: In function 'repro_cleanup':
>> kernel/rcu/repro.c:307:17: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     307 |                 kfree(reader_tasks);
         |                 ^~~~~
   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:18,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from kernel/rcu/repro.c:14:
   kernel/rcu/repro.c: In function 'repro_shutdown':
>> kernel/rcu/repro.c:353:14: warning: format '%s' expects argument of type 'char *', but argument 5 has type 'int' [-Wformat=]
     353 |              "%s: Initialization incomplete, %d of %d readers and %d of %d writers",
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     354 |              atomic_read(&n_repro_writer_started), nrealwriters,
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              |
         |              int
   include/asm-generic/bug.h:142:62: note: in definition of macro '__WARN_printf'
     142 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   kernel/rcu/repro.c:350:9: note: in expansion of macro 'WARN'
     350 |         WARN(atomic_read(&n_repro_writer_started) < nrealwriters ||
         |         ^~~~
   kernel/rcu/repro.c:353:16: note: format string is defined here
     353 |              "%s: Initialization incomplete, %d of %d readers and %d of %d writers",
         |               ~^
         |                |
         |                char *
         |               %d
>> kernel/rcu/repro.c:353:14: warning: format '%d' expects a matching 'int' argument [-Wformat=]
     353 |              "%s: Initialization incomplete, %d of %d readers and %d of %d writers",
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:142:62: note: in definition of macro '__WARN_printf'
     142 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   kernel/rcu/repro.c:350:9: note: in expansion of macro 'WARN'
     350 |         WARN(atomic_read(&n_repro_writer_started) < nrealwriters ||
         |         ^~~~
   kernel/rcu/repro.c:353:74: note: format string is defined here
     353 |              "%s: Initialization incomplete, %d of %d readers and %d of %d writers",
         |                                                                         ~^
         |                                                                          |
         |                                                                          int
   kernel/rcu/repro.c: In function 'repro_init':
>> kernel/rcu/repro.c:418:24: error: implicit declaration of function 'kcalloc' [-Wimplicit-function-declaration]
     418 |         reader_tasks = kcalloc(nrealreaders, sizeof(reader_tasks[0]), GFP_KERNEL);
         |                        ^~~~~~~
>> kernel/rcu/repro.c:418:22: error: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     418 |         reader_tasks = kcalloc(nrealreaders, sizeof(reader_tasks[0]), GFP_KERNEL);
         |                      ^
   kernel/rcu/repro.c:431:22: error: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     431 |         writer_tasks = kcalloc(nrealwriters, sizeof(writer_tasks[0]), GFP_KERNEL);
         |                      ^
   kernel/rcu/repro.c:444:22: error: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     444 |         writer_tasks = kcalloc(nrealwriters, sizeof(writer_tasks[0]), GFP_KERNEL);
         |                      ^
   kernel/rcu/repro.c:447:23: error: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     447 |         spinner_tasks = kcalloc(nrealspinners, sizeof(spinner_tasks[0]), GFP_KERNEL);
         |                       ^


vim +/kfree +307 kernel/rcu/repro.c

   289	
   290	static void
   291	repro_cleanup(void)
   292	{
   293		int i;
   294	
   295		// If built-in, just report all of the GP kthread's CPU time.
   296	
   297		if (torture_cleanup_begin())
   298			return;
   299		if (!cur_ops) {
   300			torture_cleanup_end();
   301			return;
   302		}
   303	
   304		if (reader_tasks) {
   305			for (i = 0; i < nrealreaders; i++)
   306				torture_stop_kthread(repro_reader, reader_tasks[i]);
 > 307			kfree(reader_tasks);
   308			reader_tasks = NULL;
   309		}
   310	
   311		if (writer_tasks) {
   312			for (i = 0; i < nrealwriters; i++)
   313				torture_stop_kthread(repro_writer, writer_tasks[i]);
   314			kfree(writer_tasks);
   315			writer_tasks = NULL;
   316		}
   317	
   318		if (spinner_tasks) {
   319			if (spinner_nice < -20 || spinner_nice > 19) {
   320				WARN_ON(!IS_MODULE(CONFIG_REPRO_TEST));
   321				spinner_nice = 0;
   322			}
   323			for (i = 0; i < nrealspinners; i++) {
   324				WARN_ON_ONCE(task_nice(spinner_tasks[i]) != spinner_nice);
   325				torture_stop_kthread(repro_spinner, spinner_tasks[i]);
   326			}
   327			kfree(spinner_tasks);
   328			spinner_tasks = NULL;
   329		}
   330	
   331		/* Do torture-type-specific cleanup operations.  */
   332		if (cur_ops->cleanup != NULL)
   333			cur_ops->cleanup();
   334	
   335		repro_print_module_parms(cur_ops, "End of test: SUCCESS");
   336	
   337		torture_cleanup_end();
   338	}
   339	
   340	/*
   341	 * Reproducer shutdown kthread.  Just waits to be awakened, then shuts
   342	 * down system.
   343	 */
   344	static int
   345	repro_shutdown(void *arg)
   346	{
   347		REPROOUT_STRING("Invoked repro_shutdown.");
   348		schedule_timeout_idle(shutdown_secs * HZ);
   349		REPROOUT_STRING("Reached shutdown_secs in repro_shutdown.");
   350		WARN(atomic_read(&n_repro_writer_started) < nrealwriters ||
   351		     atomic_read(&n_repro_spinner_started) < nrealspinners ||
   352		     atomic_read(&n_repro_reader_started) < nrealreaders,
 > 353		     "%s: Initialization incomplete, %d of %d readers and %d of %d writers",
   354		     atomic_read(&n_repro_writer_started), nrealwriters,
   355		     atomic_read(&n_repro_reader_started), nrealreaders);
   356		repro_cleanup();
   357		kernel_power_off();
   358		return -EINVAL;
   359	}
   360	
   361	static int __init
   362	repro_init(void)
   363	{
   364		int firsterr = 0;
   365		long i;
   366		static struct repro_ops *scale_ops[] = {
   367			&rwsem_ops,
   368		};
   369	
   370		if (!torture_init_begin(scale_type, verbose))
   371			return -EBUSY;
   372	
   373		/* Process args and announce that the alleged reproducer is on the job. */
   374		for (i = 0; i < ARRAY_SIZE(scale_ops); i++) {
   375			cur_ops = scale_ops[i];
   376			if (strcmp(scale_type, cur_ops->name) == 0)
   377				break;
   378		}
   379		if (i == ARRAY_SIZE(scale_ops)) {
   380			pr_alert("torture-repro: invalid repro type: \"%s\"\n", scale_type);
   381			pr_alert("torture-repro types:");
   382			for (i = 0; i < ARRAY_SIZE(scale_ops); i++)
   383				pr_cont(" %s", scale_ops[i]->name);
   384			pr_cont("\n");
   385			firsterr = -EINVAL;
   386			cur_ops = NULL;
   387			goto unwind;
   388		}
   389		if (cur_ops->init)
   390			cur_ops->init();
   391	
   392	
   393		if (nwriters == -1) {
   394			nrealwriters = 1;
   395		} else {
   396			nrealwriters = compute_real(nwriters);
   397		}
   398		nrealspinners = compute_real(nspinners);
   399		nrealreaders = compute_real(nreaders);
   400		atomic_set(&n_repro_reader_started, 0);
   401		atomic_set(&n_repro_spinner_started, 0);
   402		atomic_set(&n_repro_writer_started, 0);
   403		atomic_set(&n_repro_writer_finished, 0);
   404		atomic_set(&n_repro_spinner_finished, 0);
   405		atomic_set(&n_repro_reader_finished, 0);
   406		atomic_long_set(&n_repro_writer_jmax, 0);
   407		repro_print_module_parms(cur_ops, "Start of test");
   408	
   409		/* Start up the kthreads. */
   410	
   411		if (shutdown_secs > 0) {
   412			firsterr = torture_create_kthread(repro_shutdown, NULL,
   413							  shutdown_task);
   414			if (torture_init_error(firsterr))
   415				goto unwind;
   416			schedule_timeout_uninterruptible(1);
   417		}
 > 418		reader_tasks = kcalloc(nrealreaders, sizeof(reader_tasks[0]), GFP_KERNEL);
   419		if (!reader_tasks) {
   420			REPROOUT_ERRSTRING("out of memory");
   421			firsterr = -ENOMEM;
   422			goto unwind;
   423		}
   424		for (i = 0; i < nrealreaders; i++) {
   425			firsterr = torture_create_kthread(repro_reader, (void *)i, reader_tasks[i]);
   426			if (torture_init_error(firsterr))
   427				goto unwind;
   428		}
   429		while (atomic_read(&n_repro_reader_started) < nrealreaders)
   430			schedule_timeout_uninterruptible(1);
   431		writer_tasks = kcalloc(nrealwriters, sizeof(writer_tasks[0]), GFP_KERNEL);
   432		if (!writer_tasks) {
   433			REPROOUT_ERRSTRING("out of memory");
   434			firsterr = -ENOMEM;
   435			goto unwind;
   436		}
   437		for (i = 0; i < nrealwriters; i++) {
   438			firsterr = torture_create_kthread(repro_writer, (void *)i, writer_tasks[i]);
   439			if (torture_init_error(firsterr))
   440				goto unwind;
   441		}
   442		while (atomic_read(&n_repro_writer_started) < nrealwriters)
   443			schedule_timeout_uninterruptible(1);
   444		writer_tasks = kcalloc(nrealwriters, sizeof(writer_tasks[0]), GFP_KERNEL);
   445	
   446		// Spinners last!  They might prevent others from getting started.
   447		spinner_tasks = kcalloc(nrealspinners, sizeof(spinner_tasks[0]), GFP_KERNEL);
   448		if (!spinner_tasks) {
   449			REPROOUT_ERRSTRING("out of memory");
   450			firsterr = -ENOMEM;
   451			goto unwind;
   452		}
   453		for (i = 0; i < nrealspinners; i++) {
   454			firsterr = torture_create_kthread(repro_spinner, (void *)i, spinner_tasks[i]);
   455			if (torture_init_error(firsterr))
   456				goto unwind;
   457		}
   458		while (atomic_read(&n_repro_spinner_started) < nrealspinners)
   459			schedule_timeout_uninterruptible(1);
   460		torture_init_end();
   461		return 0;
   462	
   463	unwind:
   464		torture_init_end();
   465		repro_cleanup();
   466		if (shutdown_secs > 0) {
   467			WARN_ON(!IS_MODULE(CONFIG_REPRO_TEST));
   468			kernel_power_off();
   469		}
   470		return firsterr;
   471	}
   472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
