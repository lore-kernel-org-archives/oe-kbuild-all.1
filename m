Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638BF2B2D7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 03:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743217224; cv=none; b=BGoqFEJwq9q5BlInqv6v79qdnnU3mD4wCcL5mgOK9e2h/pqmGX7pWw2jw7WPs5nCIhJo+mPwBV1LGCyq2NW7bdupvnibFXHWjgXW0oSHb5L8r9CyFqXiZ1j3Wk5dUvOsITsLr+LtSxCIqBhObjrdS6qzyyYjshwCW3SjEkmWnQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743217224; c=relaxed/simple;
	bh=wNIJi9E1Cwgor41UtXb+k5RztuZOjQ1u9Tz2xzVVoZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KVZjh/7rHIueMwGNus8y66YAu1AFwM7rEZxGm9A/dCzJnW9bwgVoLoH/LIg3HkInYJzwp1hsXZYRnXjkJDXLtVwqyrPYlKywzuabN1O49Py+ZtoMRXLg5N5NhRZtmzVUPBTwc5n1OuXj513PzcxcYNw4JjmQqXIh6otLdQvbaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ew7eGX2n; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ew7eGX2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743217222; x=1774753222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wNIJi9E1Cwgor41UtXb+k5RztuZOjQ1u9Tz2xzVVoZ8=;
  b=ew7eGX2nMuYMlcXZJbxXHoDjv1WR9qcuoR5qxiFpDH7mRxhruA9AvRIx
   4P283bPl3xZuqcJG5jQ6ZCYjyx01JJW7YfVWRXgDdQvRoitSGaRhSkj1g
   tMLKhNPeHbGeolXQ2U3jmOqhBK3YXdYQlPZRdgL8zsPqqBr5fakcXvkD/
   7SDNI4mK3LxRgmBZzu9M54oxACkazrbEU+p0dxORZKRX9y1Lti4xOIGvv
   JRNSU+NY4lUnqW2mO+qEGPfiyQPVZP85be3+eavUTqbfLYNu1SCFx960j
   i+6BqdnUQqwa+95/l/3CZgVSPb0AjkT5I6a7Runyp+x7ZgZczVvUkA73q
   g==;
X-CSE-ConnectionGUID: LJGZy7yjSlOWKlht3a25Bg==
X-CSE-MsgGUID: IiDKrHP4RHaBgDASSENPUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44498823"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="44498823"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 20:00:19 -0700
X-CSE-ConnectionGUID: CidKsFRcT1yoq9NtFPiHMQ==
X-CSE-MsgGUID: gqpEhlRMQvG4GOZqEf05yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="156536753"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Mar 2025 20:00:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyMQh-0007re-2I;
	Sat, 29 Mar 2025 03:00:15 +0000
Date: Sat, 29 Mar 2025 10:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/scx-dlserver-boost 16/16]
 kernel/sched/deadline.c:1765:5: sparse: sparse: symbol
 'dl_server_remove_params' was not declared. Should it be static?
Message-ID: <202503291059.WDn2KL9g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/scx-dlserver-boost
head:   153b74fef19625181700e52ed4017330372a961e
commit: 153b74fef19625181700e52ed4017330372a961e [16/16] Add a function to remove the dl_server's bw reservation
config: parisc-randconfig-r131-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291059.WDn2KL9g-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250329/202503291059.WDn2KL9g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291059.WDn2KL9g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:991:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:991:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:991:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1529:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1529:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1529:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1654:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1654:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1654:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2416:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2416:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2416:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1262:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1262:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1262:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1262:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1262:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1262:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1362:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1362:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1362:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1673:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1673:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1673:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1673:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1673:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1673:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
>> kernel/sched/deadline.c:1765:5: sparse: sparse: symbol 'dl_server_remove_params' was not declared. Should it be static?
   kernel/sched/deadline.c:1818:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1818:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1818:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3126:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3126:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3126:23: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2291:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2291:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2291:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2492:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2492:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2492:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2492:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2492:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2492:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1295:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2291:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct *

vim +/dl_server_remove_params +1765 kernel/sched/deadline.c

  1755	
  1756	/**
  1757	 * dl_server_remove_params - Remove bandwidth reservation for a DL server
  1758	 * @dl_se: The DL server entity to remove bandwidth for
  1759	 *
  1760	 * This function removes the bandwidth reservation for a DL server entity,
  1761	 * cleaning up all bandwidth accounting and server state.
  1762	 *
  1763	 * Returns: 0 on success, negative error code on failure
  1764	 */
> 1765	int dl_server_remove_params(struct sched_dl_entity *dl_se)
  1766	{
  1767	    struct rq *rq = dl_se->rq;
  1768	    int cpu = cpu_of(rq);
  1769	    struct dl_bw *dl_b;
  1770	    int cpus;
  1771	
  1772	    if (!dl_se->dl_runtime)
  1773	        return 0;  /* Already disabled */
  1774	
  1775	    /*
  1776		 * First dequeue if still queued. It should not be queued since
  1777		 * we call this only after the last dl_server_stop().
  1778		 */
  1779	    if (WARN_ON_ONCE(on_dl_rq(dl_se)))
  1780	        dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);
  1781	
  1782	    /* Cancel any pending timers */
  1783	    hrtimer_try_to_cancel(&dl_se->dl_timer);
  1784	    hrtimer_try_to_cancel(&dl_se->inactive_timer);
  1785	
  1786	    
  1787		/* Remove bandwidth from both runqueue and root domain accounting */
  1788	    dl_b = dl_bw_of(cpu);
  1789	    guard(raw_spinlock)(&dl_b->lock);
  1790	    cpus = dl_bw_cpus(cpu);
  1791	
  1792	    sub_rq_bw(dl_se, &rq->dl);
  1793	    __dl_sub(dl_b, dl_se->dl_bw, cpus);
  1794	
  1795	    /*
  1796	     * If server was active and consuming bandwidth, remove it from
  1797	     * running bandwidth accounting. This should not happen because
  1798	     * we call this only after the last dl_server_stop().
  1799	     */
  1800	    if (WARN_ON_ONCE(!dl_se->dl_non_contending))
  1801	        sub_running_bw(dl_se, &rq->dl);
  1802	
  1803	    /*
  1804		 * Clear all server parameters. This will also clear ->dl_server so
  1805		 * the next dl_server_apply_params() will reconfigure the server.
  1806		 */
  1807	    __dl_clear_params(dl_se);
  1808	
  1809	    return 0;
  1810	}
  1811	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
