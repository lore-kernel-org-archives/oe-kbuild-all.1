Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A0D3559C9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 17:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708992; cv=none; b=BPHMvUblssGfXIxtcWGx0y3JU2CG3SYfha7aXZ/5fulBYADRG7Ctn0P5pw6f6MNkQ2Hfs5Rj0uOgT9XYV/ADy/97/i9ZVEvfWRaLIf4bS4h5ogmPH+G3lgHS7sGbAFKWy8/7nBTa01pkYl/xMbWaPXdRMbGY5rDhc/+xA1QKB4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708992; c=relaxed/simple;
	bh=mbhwSWWVu56Hh6WnDcqivSW4Np1Lss9DCaa5ZBxqC2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJRanq/7Z7MtxQpB7pBdMcXWk8tGH8MCxjHAlXljc7o78IZ3UqTff1Gery/321hApmpm86eB6eAfzeyW9/Aetby0SsTBSLsV49Lgt/gOFpB7T5lLXs4ydTDAtdvNh+ljE2/X/MVh8NFyPCdh5oejQRwA8fTwSoELpYJhCMnu+9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQdnvEvz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQdnvEvz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707AAC4CEF7;
	Thu, 29 Jan 2026 17:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769708992;
	bh=mbhwSWWVu56Hh6WnDcqivSW4Np1Lss9DCaa5ZBxqC2g=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=BQdnvEvzsD/LpbFVXOuxHiENoll/vfHsA/D1oSzKC4kgApv/lH/bqT6osmgRW+kM0
	 CjP/DaTNLtW9H4YaV0RgdOIHv9GDsTl9tmlBPxAnyPN5KyfbPwZrFsPzlCf04wNgZy
	 yw3B+sloUzaizTcJ1O9y2tVtWefh2AwgD/0omdh8IVYVB1UWEEj0p0WnkM+T2YFI1e
	 QZBLiHxN+7RUBJnij/2DSHS+4uo8UDPbcd2JFWj6gJVqnWDYC097Jios6l7vJ9tucL
	 0S2muNEBGIvLxipQFAmQ7rh2NPLrPVgSr8JnHFdO63ESG4e3fIhMXeyDS/8gdH0lt+
	 1K6vE3+FZ5Vgg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 087DCCE0D17; Thu, 29 Jan 2026 09:49:52 -0800 (PST)
Date: Thu, 29 Jan 2026 09:49:51 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 23/27] kernel/rcu/repro.c:307:17: error:
 implicit declaration of function 'kfree'
Message-ID: <69aeff6b-77e3-41a1-a378-1c9a4c447c2f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202601291429.wqaGOHbY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601291429.wqaGOHbY-lkp@intel.com>

On Thu, Jan 29, 2026 at 02:54:55PM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev
> head:   9dc8cf1e0badf4e0d8dbda42710d3224db4ca499
> commit: 3b6710441b0d0413aeddfe6637bf50dbdabc0297 [23/27] EXP rcu/repro: Add generic reproducer torture-test module
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260129/202601291429.wqaGOHbY-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291429.wqaGOHbY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601291429.wqaGOHbY-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):

Good catches, thank you!  I will fix with attribution.

I guess I needed that slab.h #include after all.  And the __func__
as well.  ;-)

							Thanx, Paul

>    kernel/rcu/repro.c: In function 'repro_cleanup':
> >> kernel/rcu/repro.c:307:17: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
>      307 |                 kfree(reader_tasks);
>          |                 ^~~~~
>    In file included from arch/m68k/include/asm/bug.h:32,
>                     from include/linux/bug.h:5,
>                     from include/linux/thread_info.h:13,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/m68k/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:79,
>                     from arch/m68k/include/asm/irqflags.h:6,
>                     from include/linux/irqflags.h:18,
>                     from arch/m68k/include/asm/atomic.h:6,
>                     from include/linux/atomic.h:7,
>                     from kernel/rcu/repro.c:14:
>    kernel/rcu/repro.c: In function 'repro_shutdown':
> >> kernel/rcu/repro.c:353:14: warning: format '%s' expects argument of type 'char *', but argument 5 has type 'int' [-Wformat=]
>      353 |              "%s: Initialization incomplete, %d of %d readers and %d of %d writers",
>          |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      354 |              atomic_read(&n_repro_writer_started), nrealwriters,
>          |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |              |
>          |              int
>    include/asm-generic/bug.h:142:62: note: in definition of macro '__WARN_printf'
>      142 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
>          |                                                              ^~~
>    kernel/rcu/repro.c:350:9: note: in expansion of macro 'WARN'
>      350 |         WARN(atomic_read(&n_repro_writer_started) < nrealwriters ||
>          |         ^~~~
>    kernel/rcu/repro.c:353:16: note: format string is defined here
>      353 |              "%s: Initialization incomplete, %d of %d readers and %d of %d writers",
>          |               ~^
>          |                |
>          |                char *
>          |               %d
> >> kernel/rcu/repro.c:353:14: warning: format '%d' expects a matching 'int' argument [-Wformat=]
>      353 |              "%s: Initialization incomplete, %d of %d readers and %d of %d writers",
>          |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/asm-generic/bug.h:142:62: note: in definition of macro '__WARN_printf'
>      142 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
>          |                                                              ^~~
>    kernel/rcu/repro.c:350:9: note: in expansion of macro 'WARN'
>      350 |         WARN(atomic_read(&n_repro_writer_started) < nrealwriters ||
>          |         ^~~~
>    kernel/rcu/repro.c:353:74: note: format string is defined here
>      353 |              "%s: Initialization incomplete, %d of %d readers and %d of %d writers",
>          |                                                                         ~^
>          |                                                                          |
>          |                                                                          int
>    kernel/rcu/repro.c: In function 'repro_init':
> >> kernel/rcu/repro.c:418:24: error: implicit declaration of function 'kcalloc' [-Wimplicit-function-declaration]
>      418 |         reader_tasks = kcalloc(nrealreaders, sizeof(reader_tasks[0]), GFP_KERNEL);
>          |                        ^~~~~~~
> >> kernel/rcu/repro.c:418:22: error: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      418 |         reader_tasks = kcalloc(nrealreaders, sizeof(reader_tasks[0]), GFP_KERNEL);
>          |                      ^
>    kernel/rcu/repro.c:431:22: error: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      431 |         writer_tasks = kcalloc(nrealwriters, sizeof(writer_tasks[0]), GFP_KERNEL);
>          |                      ^
>    kernel/rcu/repro.c:444:22: error: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      444 |         writer_tasks = kcalloc(nrealwriters, sizeof(writer_tasks[0]), GFP_KERNEL);
>          |                      ^
>    kernel/rcu/repro.c:447:23: error: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      447 |         spinner_tasks = kcalloc(nrealspinners, sizeof(spinner_tasks[0]), GFP_KERNEL);
>          |                       ^
> 
> 
> vim +/kfree +307 kernel/rcu/repro.c
> 
>    289	
>    290	static void
>    291	repro_cleanup(void)
>    292	{
>    293		int i;
>    294	
>    295		// If built-in, just report all of the GP kthread's CPU time.
>    296	
>    297		if (torture_cleanup_begin())
>    298			return;
>    299		if (!cur_ops) {
>    300			torture_cleanup_end();
>    301			return;
>    302		}
>    303	
>    304		if (reader_tasks) {
>    305			for (i = 0; i < nrealreaders; i++)
>    306				torture_stop_kthread(repro_reader, reader_tasks[i]);
>  > 307			kfree(reader_tasks);
>    308			reader_tasks = NULL;
>    309		}
>    310	
>    311		if (writer_tasks) {
>    312			for (i = 0; i < nrealwriters; i++)
>    313				torture_stop_kthread(repro_writer, writer_tasks[i]);
>    314			kfree(writer_tasks);
>    315			writer_tasks = NULL;
>    316		}
>    317	
>    318		if (spinner_tasks) {
>    319			if (spinner_nice < -20 || spinner_nice > 19) {
>    320				WARN_ON(!IS_MODULE(CONFIG_REPRO_TEST));
>    321				spinner_nice = 0;
>    322			}
>    323			for (i = 0; i < nrealspinners; i++) {
>    324				WARN_ON_ONCE(task_nice(spinner_tasks[i]) != spinner_nice);
>    325				torture_stop_kthread(repro_spinner, spinner_tasks[i]);
>    326			}
>    327			kfree(spinner_tasks);
>    328			spinner_tasks = NULL;
>    329		}
>    330	
>    331		/* Do torture-type-specific cleanup operations.  */
>    332		if (cur_ops->cleanup != NULL)
>    333			cur_ops->cleanup();
>    334	
>    335		repro_print_module_parms(cur_ops, "End of test: SUCCESS");
>    336	
>    337		torture_cleanup_end();
>    338	}
>    339	
>    340	/*
>    341	 * Reproducer shutdown kthread.  Just waits to be awakened, then shuts
>    342	 * down system.
>    343	 */
>    344	static int
>    345	repro_shutdown(void *arg)
>    346	{
>    347		REPROOUT_STRING("Invoked repro_shutdown.");
>    348		schedule_timeout_idle(shutdown_secs * HZ);
>    349		REPROOUT_STRING("Reached shutdown_secs in repro_shutdown.");
>    350		WARN(atomic_read(&n_repro_writer_started) < nrealwriters ||
>    351		     atomic_read(&n_repro_spinner_started) < nrealspinners ||
>    352		     atomic_read(&n_repro_reader_started) < nrealreaders,
>  > 353		     "%s: Initialization incomplete, %d of %d readers and %d of %d writers",
>    354		     atomic_read(&n_repro_writer_started), nrealwriters,
>    355		     atomic_read(&n_repro_reader_started), nrealreaders);
>    356		repro_cleanup();
>    357		kernel_power_off();
>    358		return -EINVAL;
>    359	}
>    360	
>    361	static int __init
>    362	repro_init(void)
>    363	{
>    364		int firsterr = 0;
>    365		long i;
>    366		static struct repro_ops *scale_ops[] = {
>    367			&rwsem_ops,
>    368		};
>    369	
>    370		if (!torture_init_begin(scale_type, verbose))
>    371			return -EBUSY;
>    372	
>    373		/* Process args and announce that the alleged reproducer is on the job. */
>    374		for (i = 0; i < ARRAY_SIZE(scale_ops); i++) {
>    375			cur_ops = scale_ops[i];
>    376			if (strcmp(scale_type, cur_ops->name) == 0)
>    377				break;
>    378		}
>    379		if (i == ARRAY_SIZE(scale_ops)) {
>    380			pr_alert("torture-repro: invalid repro type: \"%s\"\n", scale_type);
>    381			pr_alert("torture-repro types:");
>    382			for (i = 0; i < ARRAY_SIZE(scale_ops); i++)
>    383				pr_cont(" %s", scale_ops[i]->name);
>    384			pr_cont("\n");
>    385			firsterr = -EINVAL;
>    386			cur_ops = NULL;
>    387			goto unwind;
>    388		}
>    389		if (cur_ops->init)
>    390			cur_ops->init();
>    391	
>    392	
>    393		if (nwriters == -1) {
>    394			nrealwriters = 1;
>    395		} else {
>    396			nrealwriters = compute_real(nwriters);
>    397		}
>    398		nrealspinners = compute_real(nspinners);
>    399		nrealreaders = compute_real(nreaders);
>    400		atomic_set(&n_repro_reader_started, 0);
>    401		atomic_set(&n_repro_spinner_started, 0);
>    402		atomic_set(&n_repro_writer_started, 0);
>    403		atomic_set(&n_repro_writer_finished, 0);
>    404		atomic_set(&n_repro_spinner_finished, 0);
>    405		atomic_set(&n_repro_reader_finished, 0);
>    406		atomic_long_set(&n_repro_writer_jmax, 0);
>    407		repro_print_module_parms(cur_ops, "Start of test");
>    408	
>    409		/* Start up the kthreads. */
>    410	
>    411		if (shutdown_secs > 0) {
>    412			firsterr = torture_create_kthread(repro_shutdown, NULL,
>    413							  shutdown_task);
>    414			if (torture_init_error(firsterr))
>    415				goto unwind;
>    416			schedule_timeout_uninterruptible(1);
>    417		}
>  > 418		reader_tasks = kcalloc(nrealreaders, sizeof(reader_tasks[0]), GFP_KERNEL);
>    419		if (!reader_tasks) {
>    420			REPROOUT_ERRSTRING("out of memory");
>    421			firsterr = -ENOMEM;
>    422			goto unwind;
>    423		}
>    424		for (i = 0; i < nrealreaders; i++) {
>    425			firsterr = torture_create_kthread(repro_reader, (void *)i, reader_tasks[i]);
>    426			if (torture_init_error(firsterr))
>    427				goto unwind;
>    428		}
>    429		while (atomic_read(&n_repro_reader_started) < nrealreaders)
>    430			schedule_timeout_uninterruptible(1);
>    431		writer_tasks = kcalloc(nrealwriters, sizeof(writer_tasks[0]), GFP_KERNEL);
>    432		if (!writer_tasks) {
>    433			REPROOUT_ERRSTRING("out of memory");
>    434			firsterr = -ENOMEM;
>    435			goto unwind;
>    436		}
>    437		for (i = 0; i < nrealwriters; i++) {
>    438			firsterr = torture_create_kthread(repro_writer, (void *)i, writer_tasks[i]);
>    439			if (torture_init_error(firsterr))
>    440				goto unwind;
>    441		}
>    442		while (atomic_read(&n_repro_writer_started) < nrealwriters)
>    443			schedule_timeout_uninterruptible(1);
>    444		writer_tasks = kcalloc(nrealwriters, sizeof(writer_tasks[0]), GFP_KERNEL);
>    445	
>    446		// Spinners last!  They might prevent others from getting started.
>    447		spinner_tasks = kcalloc(nrealspinners, sizeof(spinner_tasks[0]), GFP_KERNEL);
>    448		if (!spinner_tasks) {
>    449			REPROOUT_ERRSTRING("out of memory");
>    450			firsterr = -ENOMEM;
>    451			goto unwind;
>    452		}
>    453		for (i = 0; i < nrealspinners; i++) {
>    454			firsterr = torture_create_kthread(repro_spinner, (void *)i, spinner_tasks[i]);
>    455			if (torture_init_error(firsterr))
>    456				goto unwind;
>    457		}
>    458		while (atomic_read(&n_repro_spinner_started) < nrealspinners)
>    459			schedule_timeout_uninterruptible(1);
>    460		torture_init_end();
>    461		return 0;
>    462	
>    463	unwind:
>    464		torture_init_end();
>    465		repro_cleanup();
>    466		if (shutdown_secs > 0) {
>    467			WARN_ON(!IS_MODULE(CONFIG_REPRO_TEST));
>    468			kernel_power_off();
>    469		}
>    470		return firsterr;
>    471	}
>    472	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
