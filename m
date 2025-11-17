Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10BD1A9FB5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 20:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763412293; cv=none; b=MRpesV+hhFW7eNqkjkPLJpcVnFrfTbgqOfhPeQPMwGgwX1Eoz9u/6RYs/UiZ9W3nvSYxLR0BANFUWeQuBSH1aoZBgK1TyKVOdRPljbRvYH84aFNMIOCdoaQRXrv7CX0iF5rVwaC86kyKbdls/lhjZcag6F21pcMFFTTBBpVl+xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763412293; c=relaxed/simple;
	bh=nkyHN5d/m7tLFL7bDgwcmi4D6/7rFdNcqwQLoqeQKrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nq6Pks5kVLo3IYSEKyZqIv1dJpEYVOyvUqCI6tDZvl8PsfsYGJg6lGwqgXK2uPfS38i9Yoizodvbe/Xa2TFe8ZRmUE7/CxGmvQTN7yZrINuXr9ULRLGIJvPasuao9Zd65F5G0h1LDynlMNZP4eweYjlvQA6R+jKA11d86uWyVJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFLElvGR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFLElvGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763412291; x=1794948291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nkyHN5d/m7tLFL7bDgwcmi4D6/7rFdNcqwQLoqeQKrA=;
  b=gFLElvGRkTJBoKWvQIxn1beOk5ZmAyB7MjIRaT5srLs/SPLtzKPnZPnc
   gZzvF9ewyPkwutne+EKGyRerJ41kWjdRqyzu2254IaOnM2bwoNHhIXmFp
   0nFF24io4nqGQkmR/6vDRptIS81sYDqwTxtn+agLOKU8DTEYWgPUX9yJ3
   /cN/jcqD194N5juMTEqKzjwHTV4YPeCYdP0GcTwGU2mtlzoAD64CwSKVn
   Yi0OYFEk9m9P6n0MCzekbX4PvI7Dhs+XmyhCRYIdcR2AIrZs5/nVoHtyE
   vtNJxEo7Hd+D6L+z1FcS+57P+3hRuGRfODOEvnT+kHoV4hR6Of5/cKlmm
   g==;
X-CSE-ConnectionGUID: 5Ozub3hbRyCshdiGGG8GhQ==
X-CSE-MsgGUID: L4FlYqh0TueMVwGKrFZIOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76884538"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="76884538"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 12:44:50 -0800
X-CSE-ConnectionGUID: ApJbuXoqRem5s0amDEUXjQ==
X-CSE-MsgGUID: 4g7W6jOpTFejb+uGoo+kNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="189849388"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2025 12:44:50 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL65e-000131-2C;
	Mon, 17 Nov 2025 20:44:46 +0000
Date: Tue, 18 Nov 2025 04:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/5] sched/core: Track blocked tasks retained on rq
 for proxy
Message-ID: <202511180452.4hbbjwkB-lkp@intel.com>
References: <20251117185550.365156-4-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117185550.365156-4-kprateek.nayak@amd.com>

Hi Prateek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 33cf66d88306663d16e4759e9d24766b0aaa2e17]

url:    https://github.com/intel-lab-lkp/linux/commits/K-Prateek-Nayak/sched-psi-Make-psi-stubs-consistent-for-CONFIG_PSI/20251118-030832
base:   33cf66d88306663d16e4759e9d24766b0aaa2e17
patch link:    https://lore.kernel.org/r/20251117185550.365156-4-kprateek.nayak%40amd.com
patch subject: [RFC PATCH 3/5] sched/core: Track blocked tasks retained on rq for proxy
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20251118/202511180452.4hbbjwkB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180452.4hbbjwkB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180452.4hbbjwkB-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'clear_task_proxy':
>> kernel/sched/core.c:6681:20: error: type of 'p' defaults to 'int' [-Werror=implicit-int]
    6681 | static inline void clear_task_proxy(p) { }
         |                    ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +6681 kernel/sched/core.c

  6557	
  6558	/*
  6559	 * Find runnable lock owner to proxy for mutex blocked donor
  6560	 *
  6561	 * Follow the blocked-on relation:
  6562	 *   task->blocked_on -> mutex->owner -> task...
  6563	 *
  6564	 * Lock order:
  6565	 *
  6566	 *   p->pi_lock
  6567	 *     rq->lock
  6568	 *       mutex->wait_lock
  6569	 *
  6570	 * Returns the task that is going to be used as execution context (the one
  6571	 * that is actually going to be run on cpu_of(rq)).
  6572	 */
  6573	static struct task_struct *
  6574	find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
  6575	{
  6576		struct task_struct *owner = NULL;
  6577		int this_cpu = cpu_of(rq);
  6578		struct task_struct *p;
  6579		struct mutex *mutex;
  6580	
  6581		/* Follow blocked_on chain. */
  6582		for (p = donor; task_is_blocked(p); p = owner) {
  6583			mutex = p->blocked_on;
  6584			/* Something changed in the chain, so pick again */
  6585			if (!mutex)
  6586				return NULL;
  6587			/*
  6588			 * By taking mutex->wait_lock we hold off concurrent mutex_unlock()
  6589			 * and ensure @owner sticks around.
  6590			 */
  6591			guard(raw_spinlock)(&mutex->wait_lock);
  6592	
  6593			/* Check again that p is blocked with wait_lock held */
  6594			if (mutex != __get_task_blocked_on(p)) {
  6595				/*
  6596				 * Something changed in the blocked_on chain and
  6597				 * we don't know if only at this level. So, let's
  6598				 * just bail out completely and let __schedule()
  6599				 * figure things out (pick_again loop).
  6600				 */
  6601				return NULL;
  6602			}
  6603	
  6604			owner = __mutex_owner(mutex);
  6605			if (!owner) {
  6606				__clear_task_blocked_on(p, mutex);
  6607				return p;
  6608			}
  6609	
  6610			if (!READ_ONCE(owner->on_rq) || owner->se.sched_delayed) {
  6611				/* XXX Don't handle blocked owners/delayed dequeue yet */
  6612				return proxy_deactivate(rq, donor);
  6613			}
  6614	
  6615			if (task_cpu(owner) != this_cpu) {
  6616				/* XXX Don't handle migrations yet */
  6617				return proxy_deactivate(rq, donor);
  6618			}
  6619	
  6620			if (task_on_rq_migrating(owner)) {
  6621				/*
  6622				 * One of the chain of mutex owners is currently migrating to this
  6623				 * CPU, but has not yet been enqueued because we are holding the
  6624				 * rq lock. As a simple solution, just schedule rq->idle to give
  6625				 * the migration a chance to complete. Much like the migrate_task
  6626				 * case we should end up back in find_proxy_task(), this time
  6627				 * hopefully with all relevant tasks already enqueued.
  6628				 */
  6629				return proxy_resched_idle(rq);
  6630			}
  6631	
  6632			/*
  6633			 * Its possible to race where after we check owner->on_rq
  6634			 * but before we check (owner_cpu != this_cpu) that the
  6635			 * task on another cpu was migrated back to this cpu. In
  6636			 * that case it could slip by our  checks. So double check
  6637			 * we are still on this cpu and not migrating. If we get
  6638			 * inconsistent results, try again.
  6639			 */
  6640			if (!task_on_rq_queued(owner) || task_cpu(owner) != this_cpu)
  6641				return NULL;
  6642	
  6643			if (owner == p) {
  6644				/*
  6645				 * It's possible we interleave with mutex_unlock like:
  6646				 *
  6647				 *				lock(&rq->lock);
  6648				 *				  find_proxy_task()
  6649				 * mutex_unlock()
  6650				 *   lock(&wait_lock);
  6651				 *   donor(owner) = current->blocked_donor;
  6652				 *   unlock(&wait_lock);
  6653				 *
  6654				 *   wake_up_q();
  6655				 *     ...
  6656				 *       ttwu_runnable()
  6657				 *         __task_rq_lock()
  6658				 *				  lock(&wait_lock);
  6659				 *				  owner == p
  6660				 *
  6661				 * Which leaves us to finish the ttwu_runnable() and make it go.
  6662				 *
  6663				 * So schedule rq->idle so that ttwu_runnable() can get the rq
  6664				 * lock and mark owner as running.
  6665				 */
  6666				return proxy_resched_idle(rq);
  6667			}
  6668			/*
  6669			 * OK, now we're absolutely sure @owner is on this
  6670			 * rq, therefore holding @rq->lock is sufficient to
  6671			 * guarantee its existence, as per ttwu_remote().
  6672			 */
  6673		}
  6674	
  6675		WARN_ON_ONCE(owner && !owner->on_rq);
  6676		return owner;
  6677	}
  6678	#else /* SCHED_PROXY_EXEC */
  6679	bool is_proxy_task(struct task_struct *p) { return false; }
  6680	static inline void set_task_proxy(struct task_struct *p) { }
> 6681	static inline void clear_task_proxy(p) { }
  6682	static struct task_struct *
  6683	find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
  6684	{
  6685		WARN_ONCE(1, "This should never be called in the !SCHED_PROXY_EXEC case\n");
  6686		return donor;
  6687	}
  6688	#endif /* SCHED_PROXY_EXEC */
  6689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
