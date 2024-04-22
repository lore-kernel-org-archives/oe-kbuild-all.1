Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9C61C287
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 23:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713828888; cv=none; b=C0NaHMcdX9Zf8vqPFDwm1z3+llPk8bIFBu7vSno6Crck7fIu5gBGjTildkKYkRcPIh8Y28gvEy7ifsxmbi+KdOP+JogkKkcuSGy9fGqjF9mX39g+IYrECBcO7Mg1DmsrjoU4bgY77uvcBH7hj8b6gUAtThImrQW8c3JvYAf8i4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713828888; c=relaxed/simple;
	bh=WoBJqZ3pfeuu0cQk2sOfwJO00BQNDauSLx0h09PWTUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VaV+SRQTruq/9dxRKPYC8s7ccDrJXt5VOB6vkzSfIPut3Z6HObC20YFPiQEky7FDm7VRi7T2VEH+a3yz9zRilIWEZGyLJof3qL1bV7SepYNNMKtT55bE/XhHobAIhi+6WUMSI1m3NkxUZbXnSET1VLp8AytFiLgxCDZ6wQCR/7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1ApZibq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1ApZibq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713828887; x=1745364887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WoBJqZ3pfeuu0cQk2sOfwJO00BQNDauSLx0h09PWTUU=;
  b=M1ApZibq7+YgE+vZpC+uZatGJiqiA34DJ0cFyBzOdCla89nMSC95PO0Z
   hYuebHpXXy+49W9bxOpqtfGTe7/XH9CPiGVnTwCTZfULvSmHn7a3OtAFY
   rRUdvFXttYxtgXBIH50PmCTtJFM12L37dRspF/SPhmSynAUWfYOdMFYRw
   RduTcOvbV/KWX/YzLNYsK86eNWcz5l39uvJ0kyCZuqSm70rzkxzi2YsNt
   tMwdFNawjLA7vmtvWWaETRyraBOsQY5rFHuPcCaT10S9IJd8OzYpO0ynj
   mbE6x1nJBn55RSFHo90LmyZS8C8l+LvTpkopRoRHam+GnsYXedWas2Y96
   w==;
X-CSE-ConnectionGUID: EKDbjn1vTRK0xhZyvpnq2g==
X-CSE-MsgGUID: aX6flI8TQFadmu9G+lXtMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9309664"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9309664"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 16:34:46 -0700
X-CSE-ConnectionGUID: N2A7ecMiTx6iEouQNjisKg==
X-CSE-MsgGUID: 6mOpWi7OR6+NRjPfpZdHhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="55112180"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Apr 2024 16:34:44 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz3BK-0000KC-0K;
	Mon, 22 Apr 2024 23:34:42 +0000
Date: Tue, 23 Apr 2024 07:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-snps-arc@lists.infradead.org
Subject: [linux-next:master 5871/7322] kernel/locking/osq_lock.c:165:21:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202404230701.NzcvDrfu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f529a6d274b3b8c75899e949649d231298f30a32
commit: 99ce03b849f89ae2a00addf5b5475d2bb81972f6 [5871/7322] ARC: Emulate one-byte cmpxchg
config: arc-randconfig-r132-20240423 (https://download.01.org/0day-ci/archive/20240423/202404230701.NzcvDrfu-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240423/202404230701.NzcvDrfu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404230701.NzcvDrfu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/locking/osq_lock.c:165:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct optimistic_spin_node *_o_ @@
   kernel/locking/osq_lock.c:165:21: sparse:     expected unsigned long [usertype] old
   kernel/locking/osq_lock.c:165:21: sparse:     got struct optimistic_spin_node *_o_
   kernel/locking/osq_lock.c:165:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct optimistic_spin_node *_n_ @@
   kernel/locking/osq_lock.c:165:21: sparse:     expected unsigned long [usertype] new
   kernel/locking/osq_lock.c:165:21: sparse:     got struct optimistic_spin_node *_n_
>> kernel/locking/osq_lock.c:165:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct optimistic_spin_node *_prev_ @@     got unsigned long @@
   kernel/locking/osq_lock.c:165:21: sparse:     expected struct optimistic_spin_node *_prev_
   kernel/locking/osq_lock.c:165:21: sparse:     got unsigned long
   kernel/locking/osq_lock.c:165:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct optimistic_spin_node *_o_ @@
   kernel/locking/osq_lock.c:165:21: sparse:     expected unsigned long [usertype] old
   kernel/locking/osq_lock.c:165:21: sparse:     got struct optimistic_spin_node *_o_
   kernel/locking/osq_lock.c:165:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct optimistic_spin_node *_n_ @@
   kernel/locking/osq_lock.c:165:21: sparse:     expected unsigned long [usertype] new
   kernel/locking/osq_lock.c:165:21: sparse:     got struct optimistic_spin_node *_n_
>> kernel/locking/osq_lock.c:165:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct optimistic_spin_node *_prev_ @@     got unsigned long @@
   kernel/locking/osq_lock.c:165:21: sparse:     expected struct optimistic_spin_node *_prev_
   kernel/locking/osq_lock.c:165:21: sparse:     got unsigned long

vim +165 kernel/locking/osq_lock.c

fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29   92  
90631822c5d307 kernel/locking/mcs_spinlock.c Jason Low             2014-07-14   93  bool osq_lock(struct optimistic_spin_queue *lock)
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29   94  {
046a619d8e9746 kernel/locking/mcs_spinlock.c Jason Low             2014-07-14   95  	struct optimistic_spin_node *node = this_cpu_ptr(&osq_node);
046a619d8e9746 kernel/locking/mcs_spinlock.c Jason Low             2014-07-14   96  	struct optimistic_spin_node *prev, *next;
90631822c5d307 kernel/locking/mcs_spinlock.c Jason Low             2014-07-14   97  	int curr = encode_cpu(smp_processor_id());
90631822c5d307 kernel/locking/mcs_spinlock.c Jason Low             2014-07-14   98  	int old;
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29   99  
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  100  	node->locked = 0;
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  101  	node->next = NULL;
90631822c5d307 kernel/locking/mcs_spinlock.c Jason Low             2014-07-14  102  	node->cpu = curr;
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  103  
c55a6ffa6285e2 kernel/locking/osq_lock.c     Davidlohr Bueso       2015-09-14  104  	/*
b4b29f94856ad6 kernel/locking/osq_lock.c     Will Deacon           2015-12-11  105  	 * We need both ACQUIRE (pairs with corresponding RELEASE in
b4b29f94856ad6 kernel/locking/osq_lock.c     Will Deacon           2015-12-11  106  	 * unlock() uncontended, or fastpath) and RELEASE (to publish
b4b29f94856ad6 kernel/locking/osq_lock.c     Will Deacon           2015-12-11  107  	 * the node fields we just initialised) semantics when updating
b4b29f94856ad6 kernel/locking/osq_lock.c     Will Deacon           2015-12-11  108  	 * the lock tail.
c55a6ffa6285e2 kernel/locking/osq_lock.c     Davidlohr Bueso       2015-09-14  109  	 */
b4b29f94856ad6 kernel/locking/osq_lock.c     Will Deacon           2015-12-11  110  	old = atomic_xchg(&lock->tail, curr);
90631822c5d307 kernel/locking/mcs_spinlock.c Jason Low             2014-07-14  111  	if (old == OSQ_UNLOCKED_VAL)
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  112  		return true;
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  113  
90631822c5d307 kernel/locking/mcs_spinlock.c Jason Low             2014-07-14  114  	prev = decode_cpu(old);
90631822c5d307 kernel/locking/mcs_spinlock.c Jason Low             2014-07-14  115  	node->prev = prev;
50972fe78f24f1 kernel/locking/osq_lock.c     Prateek Sood          2017-07-14  116  
50972fe78f24f1 kernel/locking/osq_lock.c     Prateek Sood          2017-07-14  117  	/*
50972fe78f24f1 kernel/locking/osq_lock.c     Prateek Sood          2017-07-14  118  	 * osq_lock()			unqueue
50972fe78f24f1 kernel/locking/osq_lock.c     Prateek Sood          2017-07-14  119  	 *
50972fe78f24f1 kernel/locking/osq_lock.c     Prateek Sood          2017-07-14  120  	 * node->prev = prev		osq_wait_next()
50972fe78f24f1 kernel/locking/osq_lock.c     Prateek Sood          2017-07-14  121  	 * WMB				MB
50972fe78f24f1 kernel/locking/osq_lock.c     Prateek Sood          2017-07-14  122  	 * prev->next = node		next->prev = prev // unqueue-C
50972fe78f24f1 kernel/locking/osq_lock.c     Prateek Sood          2017-07-14  123  	 *
50972fe78f24f1 kernel/locking/osq_lock.c     Prateek Sood          2017-07-14  124  	 * Here 'node->prev' and 'next->prev' are the same variable and we need
50972fe78f24f1 kernel/locking/osq_lock.c     Prateek Sood          2017-07-14  125  	 * to ensure these stores happen in-order to avoid corrupting the list.
50972fe78f24f1 kernel/locking/osq_lock.c     Prateek Sood          2017-07-14  126  	 */
50972fe78f24f1 kernel/locking/osq_lock.c     Prateek Sood          2017-07-14  127  	smp_wmb();
50972fe78f24f1 kernel/locking/osq_lock.c     Prateek Sood          2017-07-14  128  
4d3199e4ca8e66 kernel/locking/osq_lock.c     Davidlohr Bueso       2015-02-22  129  	WRITE_ONCE(prev->next, node);
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  130  
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  131  	/*
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  132  	 * Normally @prev is untouchable after the above store; because at that
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  133  	 * moment unlock can proceed and wipe the node element from stack.
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  134  	 *
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  135  	 * However, since our nodes are static per-cpu storage, we're
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  136  	 * guaranteed their existence -- this allows us to apply
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  137  	 * cmpxchg in an attempt to undo our queueing.
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  138  	 */
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  139  
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  140  	/*
e2db7592be8e83 kernel/locking/osq_lock.c     Ingo Molnar           2021-03-22  141  	 * Wait to acquire the lock or cancellation. Note that need_resched()
f5bfdc8e3947a7 kernel/locking/osq_lock.c     Waiman Long           2020-01-13  142  	 * will come with an IPI, which will wake smp_cond_load_relaxed() if it
f5bfdc8e3947a7 kernel/locking/osq_lock.c     Waiman Long           2020-01-13  143  	 * is implemented with a monitor-wait. vcpu_is_preempted() relies on
f5bfdc8e3947a7 kernel/locking/osq_lock.c     Waiman Long           2020-01-13  144  	 * polling, be careful.
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  145  	 */
f5bfdc8e3947a7 kernel/locking/osq_lock.c     Waiman Long           2020-01-13  146  	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
f5bfdc8e3947a7 kernel/locking/osq_lock.c     Waiman Long           2020-01-13  147  				  vcpu_is_preempted(node_cpu(node->prev))))
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  148  		return true;
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  149  
f5bfdc8e3947a7 kernel/locking/osq_lock.c     Waiman Long           2020-01-13  150  	/* unqueue */
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  151  	/*
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  152  	 * Step - A  -- stabilize @prev
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  153  	 *
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  154  	 * Undo our @prev->next assignment; this will make @prev's
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  155  	 * unlock()/unqueue() wait for a next pointer since @lock points to us
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  156  	 * (or later).
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  157  	 */
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  158  
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  159  	for (;;) {
33190b675ce2ea kernel/locking/osq_lock.c     Qian Cai              2020-02-11  160  		/*
33190b675ce2ea kernel/locking/osq_lock.c     Qian Cai              2020-02-11  161  		 * cpu_relax() below implies a compiler barrier which would
33190b675ce2ea kernel/locking/osq_lock.c     Qian Cai              2020-02-11  162  		 * prevent this comparison being optimized away.
33190b675ce2ea kernel/locking/osq_lock.c     Qian Cai              2020-02-11  163  		 */
33190b675ce2ea kernel/locking/osq_lock.c     Qian Cai              2020-02-11  164  		if (data_race(prev->next) == node &&
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29 @165  		    cmpxchg(&prev->next, node, NULL) == node)
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  166  			break;
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  167  
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  168  		/*
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  169  		 * We can only fail the cmpxchg() racing against an unlock(),
e2db7592be8e83 kernel/locking/osq_lock.c     Ingo Molnar           2021-03-22  170  		 * in which case we should observe @node->locked becoming
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  171  		 * true.
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  172  		 */
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  173  		if (smp_load_acquire(&node->locked))
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  174  			return true;
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  175  
f2f09a4cee3507 kernel/locking/osq_lock.c     Christian Borntraeger 2016-10-25  176  		cpu_relax();
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  177  
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  178  		/*
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  179  		 * Or we race against a concurrent unqueue()'s step-B, in which
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  180  		 * case its step-C will write us a new @node->prev pointer.
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  181  		 */
4d3199e4ca8e66 kernel/locking/osq_lock.c     Davidlohr Bueso       2015-02-22  182  		prev = READ_ONCE(node->prev);
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  183  	}
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  184  
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  185  	/*
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  186  	 * Step - B -- stabilize @next
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  187  	 *
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  188  	 * Similar to unlock(), wait for @node->next or move @lock from @node
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  189  	 * back to @prev.
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  190  	 */
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  191  
563adbfc351b2a kernel/locking/osq_lock.c     David Laight          2023-12-29  192  	next = osq_wait_next(lock, node, prev->cpu);
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  193  	if (!next)
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  194  		return false;
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  195  
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  196  	/*
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  197  	 * Step - C -- unlink
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  198  	 *
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  199  	 * @prev is stable because its still waiting for a new @prev->next
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  200  	 * pointer, @next is stable because our @node->next pointer is NULL and
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  201  	 * it will wait in Step-A.
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  202  	 */
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  203  
4d3199e4ca8e66 kernel/locking/osq_lock.c     Davidlohr Bueso       2015-02-22  204  	WRITE_ONCE(next->prev, prev);
4d3199e4ca8e66 kernel/locking/osq_lock.c     Davidlohr Bueso       2015-02-22  205  	WRITE_ONCE(prev->next, next);
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  206  
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  207  	return false;
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  208  }
fb0527bd5ea99b kernel/locking/mcs_spinlock.c Peter Zijlstra        2014-01-29  209  

:::::: The code at line 165 was first introduced by commit
:::::: fb0527bd5ea99bfeb2dd91e3c1433ecf745d6b99 locking/mutexes: Introduce cancelable MCS lock for adaptive spinning

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
