Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69B1AB52F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 19:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734205753; cv=none; b=q9t6WwZF8HwPOM6QxE1oC+RJG69RMqQpnUyMP1d/DZC1pWZbDk3oBjG80Fgxsq5pbK95ILpdiRBD1WLiX0/quJG6PAMzt7hYO4smcE9XumBI2Bg9dLDVSXdfApQpdQAWFOl0rqIJO/vepIhbNlOFWaQjFuN+x0qVto5m9JITGrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734205753; c=relaxed/simple;
	bh=DO54tKgS/xr7qXNmo3NSsmhnK0o9dObJ3wgF5YAdPbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sOkstV/GzGGXanHncghLJ4z0AGgXEj8XoRRScNAZhP5ceRtviacLhB+PSkBQliivSVP7n5nlWlzD0dSqKIAqJHwrQDGSYh9oURqTWLAKayLqIT+9Cs1/nRsnr3qnIzmsa8j+4ZCGtK4Ya4XaHIKljaLxHgj3mhj3yMbNFM1prro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3bz3r2S; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3bz3r2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734205751; x=1765741751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DO54tKgS/xr7qXNmo3NSsmhnK0o9dObJ3wgF5YAdPbg=;
  b=Q3bz3r2S1a/fzqAsgfgQvszGnYplkYU3B9CtA8QGpJeIztNslP7Mq1Gh
   DN3HtyqKiVdBkHSVjuytd6rWVkLoIZrcP1ZdWtLBo7NRJI6ndzngr5eQe
   KS9ShXtkyTJv2hiawyTLW6Trkv1vrETGs0DMMzUbLLT5kwHxCjMF+7iLu
   hmd3gPpuz1IQ4YUzRx7SdDzDfJPBhWVFRFSpVmctSl1ZhAbjZ/1kPrxKl
   1Ti/xwzW7+LCdc//mGPRpMB9vsXVRc9KsCtQr704l0eY1/8LEHlhekKbS
   RNPG/PI/AKdOuEg+zZVQwPRDZC2/g6/1JIPxgt/smDAIYeRdBMMwpiRNm
   Q==;
X-CSE-ConnectionGUID: J2FXPUpiQk+35+OSB8qgTQ==
X-CSE-MsgGUID: drtCjKRVTJaK8DO+5C6BlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="33965420"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="33965420"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 11:49:09 -0800
X-CSE-ConnectionGUID: rE2u5D0iSOOP379ywjrt4w==
X-CSE-MsgGUID: SO5p7X76TRKgosM49KGPVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="96582196"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Dec 2024 11:49:07 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMY8P-000DBR-2D;
	Sat, 14 Dec 2024 19:49:05 +0000
Date: Sun, 15 Dec 2024 03:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7344/7391]
 kernel/sched/core.c:7098:11: error: call to undeclared function
 'is_cpu_allowed'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202412150358.ZcEXCTac-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   979e6f6aa3c78b92ad965d072eddc53477a84fb6
commit: e4239ea599c633d8a2bc0440ffd64f96a7bfac1c [7344/7391] ANDROID: sched: Handle blocked-waiter migration (and return migration)
config: i386-randconfig-141-20241215 (https://download.01.org/0day-ci/archive/20241215/202412150358.ZcEXCTac-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150358.ZcEXCTac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150358.ZcEXCTac-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/sched/core.c:7098:11: error: call to undeclared function 'is_cpu_allowed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7098 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                  ^
   kernel/sched/core.c:7098:32: error: no member named 'wake_cpu' in 'struct task_struct'
    7098 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                                    ~  ^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7099:9: error: no member named 'wake_cpu' in 'struct task_struct'
    7099 |         if (p->wake_cpu == this_cpu) {
         |             ~  ^
   kernel/sched/core.c:7112:35: error: no member named 'wake_cpu' in 'struct task_struct'
    7112 |         proxy_migrate_task(rq, rf, p, p->wake_cpu);
         |                                       ~  ^
   kernel/sched/core.c:7267:4: error: call to undeclared function 'zap_balance_callbacks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7267 |                         zap_balance_callbacks(rq);
         |                         ^
   kernel/sched/core.c:7267:4: note: did you mean '__balance_callbacks'?
   kernel/sched/core.c:5288:20: note: '__balance_callbacks' declared here
    5288 | static inline void __balance_callbacks(struct rq *rq)
         |                    ^
   1 warning and 5 errors generated.


vim +/is_cpu_allowed +7098 kernel/sched/core.c

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
