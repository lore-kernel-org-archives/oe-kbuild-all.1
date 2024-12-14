Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECD118BC1D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734207030; cv=none; b=aPJNmcIvtmu8VO3DKrlvUJ/In/mR0FdKKbEvenya9Y1tGa5YgbnE+KCgrh4hyRXGxHFjUG6+wpX6bxeg6r66lUMJpyu9vIhSr2eIpV5xtNR/RGX7kCyOzaANu1EA0/Q7bWIU2eHX0wwin6U4Br7FEPWUQmMXhkUBqhALuP6pjOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734207030; c=relaxed/simple;
	bh=7wRh44lEbOsNAGpgKHXFd0LWwMlXYocpApIs0XtS/gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y2npm6aGM+8b/7cSbgBtxTZzDLcXstTBQ99wdCmjM5bukyz7DBlGGr6iPkuQ4mWB2wGIT+GDlm8vTHhYQVtuHfEPXCun3YeP3mMIAUrRWW1uGR4cp+YtUqB72f0OLghx8vKu5SJOE+UsSBPoJI0kEWetHvA8LItY163yOu+BOXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esCXl2if; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esCXl2if"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734207028; x=1765743028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wRh44lEbOsNAGpgKHXFd0LWwMlXYocpApIs0XtS/gc=;
  b=esCXl2if2z8ZuJ2WWmepyESgS0n8WnhUuK1x8tr63aXxQOeoEqQgHQ3J
   HYX/g9PY1W66LIcduicec5hkAaZhW9HMjC8UoR0DiSVDwrRSVGWcDeKKB
   LCRaoNczZnvHPbK/3ox2QYpta5PUNBGqqxUmpjr0UquvQsp5bbHv3GEND
   42NqVpqEjAVLJw4gA3FJDBuF20VmuumP1LDGclsC8MNIoYd+L2MTxn/ix
   iON45EnNhkhSOStCOVnAfJ6A1+7bD2tzxC4bf/5zfob/5UbuMXtsNbmSS
   +/zaNmttfNi09D1IwErk7oqeESRDCJYgGthR4whdrEJlXBdpgkVlxdDQ3
   A==;
X-CSE-ConnectionGUID: 1t4mP2I7TCmjMqa50dvsHw==
X-CSE-MsgGUID: s652xKiLQKmYSmkq0b6Jkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="45241523"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="45241523"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 12:10:26 -0800
X-CSE-ConnectionGUID: R4udeh9HSZGi9iLW60zB2w==
X-CSE-MsgGUID: LE+MhUZSTKm4zFIufw6oXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="96705753"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Dec 2024 12:10:25 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMYT0-000DC3-2r;
	Sat, 14 Dec 2024 20:10:22 +0000
Date: Sun, 15 Dec 2024 04:09:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7224/7241]
 kernel/sched/core.c:7098:18: error: implicit declaration of function
 'is_cpu_allowed'; did you mean 'cpuset_cpus_allowed'?
Message-ID: <202412150413.aqf70Wts-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   39fc9c68b13a226d44263bb908cccf8783e34d6e
commit: e4239ea599c633d8a2bc0440ffd64f96a7bfac1c [7224/7241] ANDROID: sched: Handle blocked-waiter migration (and return migration)
config: x86_64-randconfig-161-20241215 (https://download.01.org/0day-ci/archive/20241215/202412150413.aqf70Wts-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150413.aqf70Wts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150413.aqf70Wts-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:280,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:10:
   kernel/sched/core.c: In function 'find_proxy_task':
>> kernel/sched/core.c:7098:18: error: implicit declaration of function 'is_cpu_allowed'; did you mean 'cpuset_cpus_allowed'? [-Werror=implicit-function-declaration]
    7098 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                  ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7098:39: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7098 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                                       ^~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7099:16: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7099 |         if (p->wake_cpu == this_cpu) {
         |                ^~~~~~~~
         |                wake_q
   kernel/sched/core.c:7112:42: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7112 |         proxy_migrate_task(rq, rf, p, p->wake_cpu);
         |                                          ^~~~~~~~
         |                                          wake_q
   kernel/sched/core.c: In function '__schedule':
   kernel/sched/core.c:7267:25: error: implicit declaration of function 'zap_balance_callbacks'; did you mean 'balance_callbacks'? [-Werror=implicit-function-declaration]
    7267 |                         zap_balance_callbacks(rq);
         |                         ^~~~~~~~~~~~~~~~~~~~~
         |                         balance_callbacks
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]


vim +7098 kernel/sched/core.c

  6913	
  6914	/*
  6915	 * Find runnable lock owner to proxy for mutex blocked donor
  6916	 *
  6917	 * Follow the blocked-on relation:
  6918	 *   task->blocked_on -> mutex->owner -> task...
  6919	 *
  6920	 * Lock order:
  6921	 *
  6922	 *   p->pi_lock
  6923	 *     rq->lock
  6924	 *       mutex->wait_lock
  6925	 *         p->blocked_lock
  6926	 *
  6927	 * Returns the task that is going to be used as execution context (the one
  6928	 * that is actually going to be run on cpu_of(rq)).
  6929	 */
  6930	static struct task_struct *
  6931	find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
  6932	{
  6933		struct task_struct *owner = NULL;
  6934		struct task_struct *ret = NULL;
  6935		bool curr_in_chain = false;
  6936		int this_cpu = cpu_of(rq);
  6937		struct task_struct *p;
  6938		struct mutex *mutex;
  6939		int owner_cpu;
  6940	
  6941		/* Follow blocked_on chain. */
  6942		for (p = donor; task_is_blocked(p); p = owner) {
  6943			mutex = p->blocked_on;
  6944			/* Something changed in the chain, so pick again */
  6945			if (!mutex)
  6946				return NULL;
  6947			/*
  6948			 * By taking mutex->wait_lock we hold off concurrent mutex_unlock()
  6949			 * and ensure @owner sticks around.
  6950			 */
  6951			raw_spin_lock(&mutex->wait_lock);
  6952			raw_spin_lock(&p->blocked_lock);
  6953	
  6954			/* Check again that p is blocked with blocked_lock held */
  6955			if (mutex != get_task_blocked_on(p)) {
  6956				/*
  6957				 * Something changed in the blocked_on chain and
  6958				 * we don't know if only at this level. So, let's
  6959				 * just bail out completely and let __schedule
  6960				 * figure things out (pick_again loop).
  6961				 */
  6962				goto out;
  6963			}
  6964	
  6965			if (task_current(rq, p))
  6966				curr_in_chain = true;
  6967	
  6968			owner = __mutex_owner(mutex);
  6969			if (!owner) {
  6970				/* If the owner is null, we may have some work to do */
  6971	
  6972				/* First if p is no longer blocked, just return it to run */
  6973				if (!task_is_blocked(p)) {
  6974					ret = p;
  6975					goto out;
  6976				}
  6977	
  6978				goto needs_return;
  6979			}
  6980	
  6981			owner_cpu = task_cpu(owner);
  6982			if (owner_cpu != this_cpu) {
  6983				/*
  6984				 * @owner can disappear, simply migrate to @owner_cpu and leave that CPU
  6985				 * to sort things out.
  6986				 */
  6987				raw_spin_unlock(&p->blocked_lock);
  6988				raw_spin_unlock(&mutex->wait_lock);
  6989				if (curr_in_chain)
  6990					return proxy_resched_idle(rq);
  6991	
  6992				proxy_migrate_task(rq, rf, p, owner_cpu);
  6993				return NULL;
  6994			}
  6995	
  6996			if (task_on_rq_migrating(owner)) {
  6997				/*
  6998				 * One of the chain of mutex owners is currently migrating to this
  6999				 * CPU, but has not yet been enqueued because we are holding the
  7000				 * rq lock. As a simple solution, just schedule rq->idle to give
  7001				 * the migration a chance to complete. Much like the migrate_task
  7002				 * case we should end up back in find_proxy_task(), this time
  7003				 * hopefully with all relevant tasks already enqueued.
  7004				 */
  7005				raw_spin_unlock(&p->blocked_lock);
  7006				raw_spin_unlock(&mutex->wait_lock);
  7007				return proxy_resched_idle(rq);
  7008			}
  7009	
  7010			if (!owner->on_rq) {
  7011				/* XXX Don't handle blocked owners yet */
  7012				if (!proxy_deactivate(rq, donor))
  7013					goto needs_return;
  7014				goto out;
  7015			}
  7016	
  7017			if (owner->se.sched_delayed) {
  7018				/* XXX Don't handle delayed dequeue yet */
  7019				if (!proxy_deactivate(rq, donor))
  7020					goto needs_return;
  7021				goto out;
  7022			}
  7023	
  7024			/*
  7025			 * We could race with ttwu's return migration, so holding the
  7026			 * rq lock, double check owner is both on_rq & on this cpu, as
  7027			 * it might not even be on our RQ still
  7028			 */
  7029			if (!(task_on_rq_queued(owner) && task_cpu(owner) == this_cpu))
  7030				goto out;
  7031	
  7032			if (owner == p) {
  7033				/*
  7034				 * It's possible we interleave with mutex_unlock like:
  7035				 *
  7036				 *				lock(&rq->lock);
  7037				 *				  find_proxy_task()
  7038				 * mutex_unlock()
  7039				 *   lock(&wait_lock);
  7040				 *   donor(owner) = current->blocked_donor;
  7041				 *   unlock(&wait_lock);
  7042				 *
  7043				 *   wake_up_q();
  7044				 *     ...
  7045				 *       ttwu_runnable()
  7046				 *         __task_rq_lock()
  7047				 *				  lock(&wait_lock);
  7048				 *				  owner == p
  7049				 *
  7050				 * Which leaves us to finish the ttwu_runnable() and make it go.
  7051				 *
  7052				 * So schedule rq->idle so that ttwu_runnable can get the rq lock
  7053				 * and mark owner as running.
  7054				 */
  7055				if (p->blocked_on_state == BO_WAKING)
  7056					goto needs_return;
  7057	
  7058				raw_spin_unlock(&p->blocked_lock);
  7059				raw_spin_unlock(&mutex->wait_lock);
  7060				return proxy_resched_idle(rq);
  7061			}
  7062			/*
  7063			 * If a ww_mutex hits the die/wound case, it marks the task as
  7064			 * BO_WAKING and calls try_to_wake_up(), so that the mutex
  7065			 * cycle can be broken and we avoid a deadlock.
  7066			 *
  7067			 * However, if at that moment, we are here on the cpu which the
  7068			 * die/wounded task is enqueued, we might loop on the cycle as
  7069			 * BO_WAKING still causes task_is_blocked() to return true
  7070			 * (since we want return migration to occur before we run the
  7071			 * task).
  7072			 *
  7073			 * Unfortunately since we hold the rq lock, it will block
  7074			 * try_to_wake_up from completing and doing the return
  7075			 * migration.
  7076			 *
  7077			 * So when we hit a BO_WAKING task that has a valid mutex, and
  7078			 * that mutex has an owner, we're hitting a  mid-chain wakeup,
  7079			 * so we can briefly schedule idle so we release the rq and
  7080			 * let the wakeup complete.
  7081			 */
  7082			if (p->blocked_on_state == BO_WAKING)
  7083				goto needs_return;
  7084	
  7085			/*
  7086			 * OK, now we're absolutely sure @owner is on this
  7087			 * rq, therefore holding @rq->lock is sufficient to
  7088			 * guarantee its existence, as per ttwu_remote().
  7089			 */
  7090			raw_spin_unlock(&p->blocked_lock);
  7091			raw_spin_unlock(&mutex->wait_lock);
  7092		}
  7093	
  7094		WARN_ON_ONCE(owner && !owner->on_rq);
  7095		return owner;
  7096	
  7097	needs_return:
> 7098		WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
  7099		if (p->wake_cpu == this_cpu) {
  7100			/* We can actually run here fine */
  7101			p->blocked_on_state = BO_RUNNABLE;
  7102			ret = p;
  7103			goto out;
  7104		}
  7105		raw_spin_unlock(&p->blocked_lock);
  7106		raw_spin_unlock(&mutex->wait_lock);
  7107	
  7108		if (curr_in_chain)
  7109			return proxy_resched_idle(rq);
  7110	
  7111		p->blocked_on_state = BO_RUNNABLE;
  7112		proxy_migrate_task(rq, rf, p, p->wake_cpu);
  7113		return NULL;
  7114	
  7115	out:
  7116		raw_spin_unlock(&p->blocked_lock);
  7117		raw_spin_unlock(&mutex->wait_lock);
  7118		return ret;
  7119	}
  7120	#else /* SCHED_PROXY_EXEC */
  7121	static struct task_struct *
  7122	find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
  7123	{
  7124		WARN_ONCE(1, "This should never be called in the !SCHED_PROXY_EXEC case\n");
  7125		return donor;
  7126	}
  7127	#endif /* SCHED_PROXY_EXEC */
  7128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
