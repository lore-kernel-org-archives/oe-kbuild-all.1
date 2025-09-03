Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10A4362086
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756924130; cv=none; b=G8SKuobub6nI7AZN1ILIrqP6SznYQrjvlqVqP49/Nr9lynfqPmByf29D4dc079nLWhn44ZWkCRHuApOI2jx9CHSWI3LLSYygG8o7nO0dmvqc7BVr5oCGFtFzxKQFuyYXovLrZUrEWNAJSiG6EzriOnBNCAWdz46wtIzCG48CMlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756924130; c=relaxed/simple;
	bh=EPzKLmOr9kxuYWUZYfVSMwYp+OupZNRo7wblRaV81mE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rOgGhviM/uRSc2tmK3EpVLa+dx803/JDNhvfQ9eYQP026bpCEURDdHNBvPCQUSFy1aPpkH/xcZiFjdhVcZl0+//KMNpnkHOCkBaqvpyGo+FcislW1Zhkx82rWZSdJpoMfIqbbZcjyze0YBjbIY1lgrnfY6zxGJz/JHtfgRcxWiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmUtvVQV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmUtvVQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756924128; x=1788460128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EPzKLmOr9kxuYWUZYfVSMwYp+OupZNRo7wblRaV81mE=;
  b=YmUtvVQV+PhLa4/x7GTBQuxKcfVZ50eAOSO9tMQPRQ0ue+dDE5/dvho+
   E44ukannULF17op8Ek262jL0xcdYKC/OnlMD4drUvQbR/iIZZX89SKXW2
   sXTZ37WE4bT/QL1pkgwUVXOtniz5ECynfWPAKkrxEKuFspt9Z8/2U5oyt
   gq3y0nm6Y7NKH51u+ixJSQc1k1Ymf1eJAauNQ70TPPYFzqLXFiHsKV4FG
   6+Tg2fYKhwLL0/Cv21lDE//lXkZ3LM9P71PjdPVp1eO4fkA2ZLizZA9Ax
   1PPyfXrlhdnEkmopzmR4G4FmgncZxecnvH90zJE46V9ZBmklqSntp8zZR
   Q==;
X-CSE-ConnectionGUID: SzWweF6ITlq+oKbii27plg==
X-CSE-MsgGUID: mvx1ylLBQQC/+b5Xf3q9oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69860980"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="69860980"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 11:28:48 -0700
X-CSE-ConnectionGUID: eb2BJKC5Ru2p6j/P8OrFNQ==
X-CSE-MsgGUID: hh6TZBWDRLyC1Y46J+RVUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="170918377"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Sep 2025 11:28:47 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utsDs-0004If-1h;
	Wed, 03 Sep 2025 18:28:44 +0000
Date: Thu, 4 Sep 2025 02:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-hier-prototype 9/14] kernel/exit.c:965:24: error:
 passing argument 1 of 'sched_ext_exit' from incompatible pointer type
Message-ID: <202509040232.DiSHLs6x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[community] /zdci/src/lkp/sbin/sync-produce --item /zdci/kbuild/indicators/9c/9c899613efcfc4e07c3b6a57e45ad3f95e637bdb-first_error_kconfig --flag create-dir

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-hier-prototype
head:   7443f4ccb9e360cd50e991db81d27e3514f1be65
commit: 9c899613efcfc4e07c3b6a57e45ad3f95e637bdb [9/14] sched_ext: Keep dying tasks on a separate list
config: csky-randconfig-001-20250904 (https://download.01.org/0day-ci/archive/20250904/202509040232.DiSHLs6x-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509040232.DiSHLs6x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509040232.DiSHLs6x-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/sched.h:88,
                    from arch/csky/kernel/asm-offsets.c:4:
>> include/linux/sched/ext.h:214:42: warning: 'struct task_sturct' declared inside parameter list will not be visible outside of this definition or declaration
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^~~~~~~~~~~
--
   In file included from include/linux/sched.h:88,
                    from include/linux/percpu.h:12,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from kernel/exit.c:8:
>> include/linux/sched/ext.h:214:42: warning: 'struct task_sturct' declared inside parameter list will not be visible outside of this definition or declaration
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^~~~~~~~~~~
   kernel/exit.c: In function 'do_exit':
>> kernel/exit.c:965:24: error: passing argument 1 of 'sched_ext_exit' from incompatible pointer type [-Wincompatible-pointer-types]
     965 |         sched_ext_exit(tsk);
         |                        ^~~
         |                        |
         |                        struct task_struct *
   include/linux/sched/ext.h:214:55: note: expected 'struct task_sturct *' but argument is of type 'struct task_struct *'
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                   ~~~~~~~~~~~~~~~~~~~~^
--
   In file included from include/linux/sched.h:88,
                    from include/linux/percpu.h:12,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/input/joystick/a3d.c:11:
>> include/linux/sched/ext.h:214:42: warning: 'struct task_sturct' declared inside parameter list will not be visible outside of this definition or declaration
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^~~~~~~~~~~
   drivers/input/joystick/a3d.c: In function 'a3d_connect':
   drivers/input/joystick/a3d.c:287:51: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     287 |         snprintf(a3d->phys, sizeof(a3d->phys), "%s/input0", gameport->phys);
         |                                                   ^~~~~~~
   drivers/input/joystick/a3d.c:287:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     287 |         snprintf(a3d->phys, sizeof(a3d->phys), "%s/input0", gameport->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/sched.h:88,
                    from include/linux/delay.h:13,
                    from drivers/input/joystick/tmdc.c:13:
>> include/linux/sched/ext.h:214:42: warning: 'struct task_sturct' declared inside parameter list will not be visible outside of this definition or declaration
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^~~~~~~~~~~
   drivers/input/joystick/tmdc.c: In function 'tmdc_setup_port':
   drivers/input/joystick/tmdc.c:297:53: warning: '/input' directive output may be truncated writing 6 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     297 |         snprintf(port->phys, sizeof(port->phys), "%s/input%d", tmdc->gameport->phys, i);
         |                                                     ^~~~~~
   drivers/input/joystick/tmdc.c:297:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     297 |         snprintf(port->phys, sizeof(port->phys), "%s/input%d", tmdc->gameport->phys, i);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/sched.h:88,
                    from include/linux/percpu.h:12,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from drivers/input/joystick/spaceorb.c:14:
>> include/linux/sched/ext.h:214:42: warning: 'struct task_sturct' declared inside parameter list will not be visible outside of this definition or declaration
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^~~~~~~~~~~
   drivers/input/joystick/spaceorb.c: In function 'spaceorb_connect':
   drivers/input/joystick/spaceorb.c:156:61: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     156 |         snprintf(spaceorb->phys, sizeof(spaceorb->phys), "%s/input0", serio->phys);
         |                                                             ^~~~~~~
   drivers/input/joystick/spaceorb.c:156:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     156 |         snprintf(spaceorb->phys, sizeof(spaceorb->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/sched.h:88,
                    from include/linux/percpu.h:12,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/input/joystick/magellan.c:11:
>> include/linux/sched/ext.h:214:42: warning: 'struct task_sturct' declared inside parameter list will not be visible outside of this definition or declaration
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^~~~~~~~~~~
   drivers/input/joystick/magellan.c: In function 'magellan_connect':
   drivers/input/joystick/magellan.c:141:61: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     141 |         snprintf(magellan->phys, sizeof(magellan->phys), "%s/input0", serio->phys);
         |                                                             ^~~~~~~
   drivers/input/joystick/magellan.c:141:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     141 |         snprintf(magellan->phys, sizeof(magellan->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/sched.h:88,
                    from include/linux/delay.h:13,
                    from drivers/input/joystick/sidewinder.c:10:
>> include/linux/sched/ext.h:214:42: warning: 'struct task_sturct' declared inside parameter list will not be visible outside of this definition or declaration
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^~~~~~~~~~~
   drivers/input/joystick/sidewinder.c: In function 'sw_connect':
   drivers/input/joystick/sidewinder.c:538:58: warning: '%s' directive output may be truncated writing up to 8 bytes into a region of size between 5 and 21 [-Wformat-truncation=]
     538 |         snprintf(comment, size, " [PnP %d.%02d id %s rev %s]",
         |                                                          ^~
   ......
     543 |                  pnp, rev);
         |                       ~~~                                 
   In function 'sw_3dp_id',
       inlined from 'sw_connect' at drivers/input/joystick/sidewinder.c:694:7:
   drivers/input/joystick/sidewinder.c:538:9: note: 'snprintf' output between 21 and 45 bytes into a destination of size 40
     538 |         snprintf(comment, size, " [PnP %d.%02d id %s rev %s]",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     539 |                 (int) ((sw_get_bits(buf, 8, 6, 1) << 6) |               /* Two 6-bit values */
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     540 |                         sw_get_bits(buf, 16, 6, 1)) / 100,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     541 |                 (int) ((sw_get_bits(buf, 8, 6, 1) << 6) |
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     542 |                         sw_get_bits(buf, 16, 6, 1)) % 100,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     543 |                  pnp, rev);
         |                  ~~~~~~~~~
   drivers/input/joystick/sidewinder.c: In function 'sw_connect':
   drivers/input/joystick/sidewinder.c:727:29: warning: '/input' directive output may be truncated writing 6 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     727 |                          "%s/input%d", gameport->phys, i);
         |                             ^~~~~~
   drivers/input/joystick/sidewinder.c:727:26: note: directive argument in the range [0, 4]
     727 |                          "%s/input%d", gameport->phys, i);
         |                          ^~~~~~~~~~~~
   drivers/input/joystick/sidewinder.c:726:17: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     726 |                 snprintf(sw->phys[i], sizeof(sw->phys[i]),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     727 |                          "%s/input%d", gameport->phys, i);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/sched.h:88,
                    from include/linux/percpu.h:12,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/input/joystick/stinger.c:12:
>> include/linux/sched/ext.h:214:42: warning: 'struct task_sturct' declared inside parameter list will not be visible outside of this definition or declaration
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^~~~~~~~~~~
   drivers/input/joystick/stinger.c: In function 'stinger_connect':
   drivers/input/joystick/stinger.c:127:59: warning: '/serio0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     127 |         snprintf(stinger->phys, sizeof(stinger->phys), "%s/serio0", serio->phys);
         |                                                           ^~~~~~~
   drivers/input/joystick/stinger.c:127:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     127 |         snprintf(stinger->phys, sizeof(stinger->phys), "%s/serio0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/sched.h:88,
                    from include/linux/percpu.h:12,
                    from include/linux/bpf.h:12,
                    from kernel/bpf/helpers.c:4:
>> include/linux/sched/ext.h:214:42: warning: 'struct task_sturct' declared inside parameter list will not be visible outside of this definition or declaration
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^~~~~~~~~~~
   kernel/bpf/helpers.c: In function '____bpf_snprintf':
   kernel/bpf/helpers.c:1069:9: warning: function '____bpf_snprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1069 |         err = bstr_printf(str, str_size, fmt, data.bin_args);
         |         ^~~
--
   In file included from include/linux/sched.h:88,
                    from include/linux/percpu.h:12,
                    from include/linux/bpf.h:12,
                    from kernel/bpf/stream.c:4:
>> include/linux/sched/ext.h:214:42: warning: 'struct task_sturct' declared inside parameter list will not be visible outside of this definition or declaration
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^~~~~~~~~~~
   kernel/bpf/stream.c: In function 'bpf_stream_vprintk':
   kernel/bpf/stream.c:383:9: warning: function 'bpf_stream_vprintk' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     383 |         ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt__str, data.bin_args);
         |         ^~~
--
   In file included from include/linux/sched.h:88,
                    from include/linux/percpu.h:12,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from magellan.c:11:
>> include/linux/sched/ext.h:214:42: warning: 'struct task_sturct' declared inside parameter list will not be visible outside of this definition or declaration
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^~~~~~~~~~~
   magellan.c: In function 'magellan_connect':
   magellan.c:141:61: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     141 |         snprintf(magellan->phys, sizeof(magellan->phys), "%s/input0", serio->phys);
         |                                                             ^~~~~~~
   magellan.c:141:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     141 |         snprintf(magellan->phys, sizeof(magellan->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
..


vim +/sched_ext_exit +965 kernel/exit.c

   891	
   892	void __noreturn do_exit(long code)
   893	{
   894		struct task_struct *tsk = current;
   895		int group_dead;
   896	
   897		WARN_ON(irqs_disabled());
   898		WARN_ON(tsk->plug);
   899	
   900		kcov_task_exit(tsk);
   901		kmsan_task_exit(tsk);
   902	
   903		synchronize_group_exit(tsk, code);
   904		ptrace_event(PTRACE_EVENT_EXIT, code);
   905		user_events_exit(tsk);
   906	
   907		io_uring_files_cancel();
   908		exit_signals(tsk);  /* sets PF_EXITING */
   909	
   910		seccomp_filter_release(tsk);
   911	
   912		acct_update_integrals(tsk);
   913		group_dead = atomic_dec_and_test(&tsk->signal->live);
   914		if (group_dead) {
   915			/*
   916			 * If the last thread of global init has exited, panic
   917			 * immediately to get a useable coredump.
   918			 */
   919			if (unlikely(is_global_init(tsk)))
   920				panic("Attempted to kill init! exitcode=0x%08x\n",
   921					tsk->signal->group_exit_code ?: (int)code);
   922	
   923	#ifdef CONFIG_POSIX_TIMERS
   924			hrtimer_cancel(&tsk->signal->real_timer);
   925			exit_itimers(tsk);
   926	#endif
   927			if (tsk->mm)
   928				setmax_mm_hiwater_rss(&tsk->signal->maxrss, tsk->mm);
   929		}
   930		acct_collect(code, group_dead);
   931		if (group_dead)
   932			tty_audit_exit();
   933		audit_free(tsk);
   934	
   935		tsk->exit_code = code;
   936		taskstats_exit(tsk, group_dead);
   937		unwind_deferred_task_exit(tsk);
   938		trace_sched_process_exit(tsk, group_dead);
   939	
   940		/*
   941		 * Since sampling can touch ->mm, make sure to stop everything before we
   942		 * tear it down.
   943		 *
   944		 * Also flushes inherited counters to the parent - before the parent
   945		 * gets woken up by child-exit notifications.
   946		 */
   947		perf_event_exit_task(tsk);
   948	
   949		exit_mm();
   950	
   951		if (group_dead)
   952			acct_process();
   953	
   954		exit_sem(tsk);
   955		exit_shm(tsk);
   956		exit_files(tsk);
   957		exit_fs(tsk);
   958		if (group_dead)
   959			disassociate_ctty(1);
   960		exit_task_namespaces(tsk);
   961		exit_task_work(tsk);
   962		exit_thread(tsk);
   963	
   964		sched_autogroup_exit_task(tsk);
 > 965		sched_ext_exit(tsk);
   966		cgroup_exit(tsk);
   967	
   968		/*
   969		 * FIXME: do that only when needed, using sched_exit tracepoint
   970		 */
   971		flush_ptrace_hw_breakpoint(tsk);
   972	
   973		exit_tasks_rcu_start();
   974		exit_notify(tsk, group_dead);
   975		proc_exit_connector(tsk);
   976		mpol_put_task_policy(tsk);
   977	#ifdef CONFIG_FUTEX
   978		if (unlikely(current->pi_state_cache))
   979			kfree(current->pi_state_cache);
   980	#endif
   981		/*
   982		 * Make sure we are holding no locks:
   983		 */
   984		debug_check_no_locks_held();
   985	
   986		if (tsk->io_context)
   987			exit_io_context(tsk);
   988	
   989		if (tsk->splice_pipe)
   990			free_pipe_info(tsk->splice_pipe);
   991	
   992		if (tsk->task_frag.page)
   993			put_page(tsk->task_frag.page);
   994	
   995		exit_task_stack_account(tsk);
   996	
   997		check_stack_usage();
   998		preempt_disable();
   999		if (tsk->nr_dirtied)
  1000			__this_cpu_add(dirty_throttle_leaks, tsk->nr_dirtied);
  1001		exit_rcu();
  1002		exit_tasks_rcu_finish();
  1003	
  1004		lockdep_free_task(tsk);
  1005		do_task_dead();
  1006	}
  1007	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
