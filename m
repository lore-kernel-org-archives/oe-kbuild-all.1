Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F84256C87
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 23:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754610641; cv=none; b=i5ElDJwk85KNxIad8/Fb1buMq42MzyXuFFuPbyn/ujE/JjhoRe+k4ltgiJIEaaiSYUoGuzg6rj7k6/xmehP3+dH+tnkl0fSFYI2fcqi+DTqirHSlCjsaNY4iBrX6A0miI8pbFAsEQ21cpuZyX4J++lh4rO3y4HsJjU1O4cPJBms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754610641; c=relaxed/simple;
	bh=mek/AH27IScN7VRrPavHETSnFcLTuUZefgUFb82Ww3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHhz4HJDdSt8L6fkgBjVWt3UfpJoEf3+vaszjZlYGgVm6DAVK34uldymN7KnjM+rebcGaUiKzJTfmB8eqV0hthamigC0KcPFtC0C2LGQi9UOsnWvB1PFEnTXjnJRwovoerig8MH0lmH/vqJBokgB1Eqih8Yyd8K47HnZ3RueJEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjiErTMv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjiErTMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754610638; x=1786146638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mek/AH27IScN7VRrPavHETSnFcLTuUZefgUFb82Ww3M=;
  b=QjiErTMv2ZJb85fvAa4aYl7cKonxjZMNNpJoENSNkh131zVAbqrUq85E
   NYrFXaBCMW5c78tyy5F+gy+hcDzSlnJG4xweLXMT3sR4w8PLFPkpGJgo2
   S98HeIo5Syn7tSN8mdZN4BhyXanO3LIxhXPrdiYAM5X9tkYelWJQ0wEuP
   Tt3esUB6XXAw2vYUCCrhxHcNgc3BeorBe+yR9WjSzaO6RIb6VUKG0SEG4
   V4+cxh6m2FgqwFcx4YYnU8jlysfCKCybt1jyJNEP6j+0OjDniYIcoW3Zo
   XY5AnanSLAmhzTxF8lfUB4UtnK3Ze+LF09aY1453TQW05s20AO+oODe7H
   Q==;
X-CSE-ConnectionGUID: 0XXFGzrcTfKDef2uuB1ubg==
X-CSE-MsgGUID: qab4aPkET9i9bxT/mG0B4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68330853"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="68330853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 16:50:37 -0700
X-CSE-ConnectionGUID: P7Pvv+SmTE2ZyunrkGLOJg==
X-CSE-MsgGUID: UbSsi7lcRR2uT54Hbkt9yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165574136"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Aug 2025 16:50:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukANW-0003Mk-1F;
	Thu, 07 Aug 2025 23:50:34 +0000
Date: Fri, 8 Aug 2025 07:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 4/9] freezer: Set default freeze priority for
 userspace tasks
Message-ID: <202508080703.B19gmsMH-lkp@intel.com>
References: <20250807121418.139765-5-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807121418.139765-5-zhangzihuan@kylinos.cn>

Hi Zihuan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on brauner-vfs/vfs.all linus/master v6.16 next-20250807]
[cannot apply to tip/sched/core kees/for-next/execve]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zihuan-Zhang/freezer-Introduce-freeze_priority-field-in-task_struct/20250807-201611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250807121418.139765-5-zhangzihuan%40kylinos.cn
patch subject: [RFC PATCH v1 4/9] freezer: Set default freeze priority for userspace tasks
config: arm-randconfig-002-20250808 (https://download.01.org/0day-ci/archive/20250808/202508080703.B19gmsMH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080703.B19gmsMH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080703.B19gmsMH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:77:
   include/linux/freezer.h: In function 'freeze_set_default_priority':
   include/linux/freezer.h:95:55: warning: no return statement in function returning non-void [-Wreturn-type]
      95 | static inline bool freeze_set_default_priority(struct task_struct *p, unsigned int prio) {}
         |                                                       ^~~~~~~~~~~
   kernel/fork.c: In function 'copy_process':
>> kernel/fork.c:2428:33: error: 'FREEZE_PRIORITY_NORMAL' undeclared (first use in this function)
    2428 |  freeze_set_default_priority(p, FREEZE_PRIORITY_NORMAL);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:2428:33: note: each undeclared identifier is reported only once for each function it appears in


vim +/FREEZE_PRIORITY_NORMAL +2428 kernel/fork.c

  2267	
  2268		/*
  2269		 * Ensure that the cgroup subsystem policies allow the new process to be
  2270		 * forked. It should be noted that the new process's css_set can be changed
  2271		 * between here and cgroup_post_fork() if an organisation operation is in
  2272		 * progress.
  2273		 */
  2274		retval = cgroup_can_fork(p, args);
  2275		if (retval)
  2276			goto bad_fork_put_pidfd;
  2277	
  2278		/*
  2279		 * Now that the cgroups are pinned, re-clone the parent cgroup and put
  2280		 * the new task on the correct runqueue. All this *before* the task
  2281		 * becomes visible.
  2282		 *
  2283		 * This isn't part of ->can_fork() because while the re-cloning is
  2284		 * cgroup specific, it unconditionally needs to place the task on a
  2285		 * runqueue.
  2286		 */
  2287		retval = sched_cgroup_fork(p, args);
  2288		if (retval)
  2289			goto bad_fork_cancel_cgroup;
  2290	
  2291		/*
  2292		 * Allocate a default futex hash for the user process once the first
  2293		 * thread spawns.
  2294		 */
  2295		if (need_futex_hash_allocate_default(clone_flags)) {
  2296			retval = futex_hash_allocate_default();
  2297			if (retval)
  2298				goto bad_fork_core_free;
  2299			/*
  2300			 * If we fail beyond this point we don't free the allocated
  2301			 * futex hash map. We assume that another thread will be created
  2302			 * and makes use of it. The hash map will be freed once the main
  2303			 * thread terminates.
  2304			 */
  2305		}
  2306		/*
  2307		 * From this point on we must avoid any synchronous user-space
  2308		 * communication until we take the tasklist-lock. In particular, we do
  2309		 * not want user-space to be able to predict the process start-time by
  2310		 * stalling fork(2) after we recorded the start_time but before it is
  2311		 * visible to the system.
  2312		 */
  2313	
  2314		p->start_time = ktime_get_ns();
  2315		p->start_boottime = ktime_get_boottime_ns();
  2316	
  2317		/*
  2318		 * Make it visible to the rest of the system, but dont wake it up yet.
  2319		 * Need tasklist lock for parent etc handling!
  2320		 */
  2321		write_lock_irq(&tasklist_lock);
  2322	
  2323		/* CLONE_PARENT re-uses the old parent */
  2324		if (clone_flags & (CLONE_PARENT|CLONE_THREAD)) {
  2325			p->real_parent = current->real_parent;
  2326			p->parent_exec_id = current->parent_exec_id;
  2327			if (clone_flags & CLONE_THREAD)
  2328				p->exit_signal = -1;
  2329			else
  2330				p->exit_signal = current->group_leader->exit_signal;
  2331		} else {
  2332			p->real_parent = current;
  2333			p->parent_exec_id = current->self_exec_id;
  2334			p->exit_signal = args->exit_signal;
  2335		}
  2336	
  2337		klp_copy_process(p);
  2338	
  2339		sched_core_fork(p);
  2340	
  2341		spin_lock(&current->sighand->siglock);
  2342	
  2343		rv_task_fork(p);
  2344	
  2345		rseq_fork(p, clone_flags);
  2346	
  2347		/* Don't start children in a dying pid namespace */
  2348		if (unlikely(!(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
  2349			retval = -ENOMEM;
  2350			goto bad_fork_core_free;
  2351		}
  2352	
  2353		/* Let kill terminate clone/fork in the middle */
  2354		if (fatal_signal_pending(current)) {
  2355			retval = -EINTR;
  2356			goto bad_fork_core_free;
  2357		}
  2358	
  2359		/* No more failure paths after this point. */
  2360	
  2361		/*
  2362		 * Copy seccomp details explicitly here, in case they were changed
  2363		 * before holding sighand lock.
  2364		 */
  2365		copy_seccomp(p);
  2366	
  2367		init_task_pid_links(p);
  2368		if (likely(p->pid)) {
  2369			ptrace_init_task(p, (clone_flags & CLONE_PTRACE) || trace);
  2370	
  2371			init_task_pid(p, PIDTYPE_PID, pid);
  2372			if (thread_group_leader(p)) {
  2373				init_task_pid(p, PIDTYPE_TGID, pid);
  2374				init_task_pid(p, PIDTYPE_PGID, task_pgrp(current));
  2375				init_task_pid(p, PIDTYPE_SID, task_session(current));
  2376	
  2377				if (is_child_reaper(pid)) {
  2378					ns_of_pid(pid)->child_reaper = p;
  2379					p->signal->flags |= SIGNAL_UNKILLABLE;
  2380				}
  2381				p->signal->shared_pending.signal = delayed.signal;
  2382				p->signal->tty = tty_kref_get(current->signal->tty);
  2383				/*
  2384				 * Inherit has_child_subreaper flag under the same
  2385				 * tasklist_lock with adding child to the process tree
  2386				 * for propagate_has_child_subreaper optimization.
  2387				 */
  2388				p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
  2389								 p->real_parent->signal->is_child_subreaper;
  2390				list_add_tail(&p->sibling, &p->real_parent->children);
  2391				list_add_tail_rcu(&p->tasks, &init_task.tasks);
  2392				attach_pid(p, PIDTYPE_TGID);
  2393				attach_pid(p, PIDTYPE_PGID);
  2394				attach_pid(p, PIDTYPE_SID);
  2395				__this_cpu_inc(process_counts);
  2396			} else {
  2397				current->signal->nr_threads++;
  2398				current->signal->quick_threads++;
  2399				atomic_inc(&current->signal->live);
  2400				refcount_inc(&current->signal->sigcnt);
  2401				task_join_group_stop(p);
  2402				list_add_tail_rcu(&p->thread_node,
  2403						  &p->signal->thread_head);
  2404			}
  2405			attach_pid(p, PIDTYPE_PID);
  2406			nr_threads++;
  2407		}
  2408		total_forks++;
  2409		hlist_del_init(&delayed.node);
  2410		spin_unlock(&current->sighand->siglock);
  2411		syscall_tracepoint_update(p);
  2412		write_unlock_irq(&tasklist_lock);
  2413	
  2414		if (pidfile)
  2415			fd_install(pidfd, pidfile);
  2416	
  2417		proc_fork_connector(p);
  2418		sched_post_fork(p);
  2419		cgroup_post_fork(p, args);
  2420		perf_event_fork(p);
  2421	
  2422		trace_task_newtask(p, clone_flags);
  2423		uprobe_copy_process(p, clone_flags);
  2424		user_events_fork(p, clone_flags);
  2425	
  2426		copy_oom_score_adj(clone_flags, p);
  2427	
> 2428		freeze_set_default_priority(p, FREEZE_PRIORITY_NORMAL);
  2429		return p;
  2430	
  2431	bad_fork_core_free:
  2432		sched_core_free(p);
  2433		spin_unlock(&current->sighand->siglock);
  2434		write_unlock_irq(&tasklist_lock);
  2435	bad_fork_cancel_cgroup:
  2436		cgroup_cancel_fork(p, args);
  2437	bad_fork_put_pidfd:
  2438		if (clone_flags & CLONE_PIDFD) {
  2439			fput(pidfile);
  2440			put_unused_fd(pidfd);
  2441		}
  2442	bad_fork_free_pid:
  2443		if (pid != &init_struct_pid)
  2444			free_pid(pid);
  2445	bad_fork_cleanup_thread:
  2446		exit_thread(p);
  2447	bad_fork_cleanup_io:
  2448		if (p->io_context)
  2449			exit_io_context(p);
  2450	bad_fork_cleanup_namespaces:
  2451		exit_task_namespaces(p);
  2452	bad_fork_cleanup_mm:
  2453		if (p->mm) {
  2454			mm_clear_owner(p->mm, p);
  2455			mmput(p->mm);
  2456		}
  2457	bad_fork_cleanup_signal:
  2458		if (!(clone_flags & CLONE_THREAD))
  2459			free_signal_struct(p->signal);
  2460	bad_fork_cleanup_sighand:
  2461		__cleanup_sighand(p->sighand);
  2462	bad_fork_cleanup_fs:
  2463		exit_fs(p); /* blocking */
  2464	bad_fork_cleanup_files:
  2465		exit_files(p); /* blocking */
  2466	bad_fork_cleanup_semundo:
  2467		exit_sem(p);
  2468	bad_fork_cleanup_security:
  2469		security_task_free(p);
  2470	bad_fork_cleanup_audit:
  2471		audit_free(p);
  2472	bad_fork_cleanup_perf:
  2473		perf_event_free_task(p);
  2474	bad_fork_sched_cancel_fork:
  2475		sched_cancel_fork(p);
  2476	bad_fork_cleanup_policy:
  2477		lockdep_free_task(p);
  2478	#ifdef CONFIG_NUMA
  2479		mpol_put(p->mempolicy);
  2480	#endif
  2481	bad_fork_cleanup_delayacct:
  2482		delayacct_tsk_free(p);
  2483	bad_fork_cleanup_count:
  2484		dec_rlimit_ucounts(task_ucounts(p), UCOUNT_RLIMIT_NPROC, 1);
  2485		exit_creds(p);
  2486	bad_fork_free:
  2487		WRITE_ONCE(p->__state, TASK_DEAD);
  2488		exit_task_stack_account(p);
  2489		put_task_stack(p);
  2490		delayed_free_task(p);
  2491	fork_out:
  2492		spin_lock_irq(&current->sighand->siglock);
  2493		hlist_del_init(&delayed.node);
  2494		spin_unlock_irq(&current->sighand->siglock);
  2495		return ERR_PTR(retval);
  2496	}
  2497	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
