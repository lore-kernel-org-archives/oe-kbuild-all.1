Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795293626;
	b=oud4ZsjhaSdkzNc8uWvs/0X0zHC2TKX6FvSIOS2fQZ/Z/4MSWHf65Lh0OdhJsmHG0/BD
	 rza4fRUVEgH45V2QNFLcZeHbn1gy5jEd9ApnVMHa1VvqBNak3ztVFJVIvPFEyl/vQEP/2
	 qEiKabw41HKZLm0sLkVoW5+GB2N3AcEAixwCTnV7DAaJg0ewge1OxVgMwdtrVZTuT6Nh9
	 5YL3Rr1UPpFWNQ7F6YmS9iV1x/ix/3AhHk76yVdWHZvbTso48dcF29ofslInD9MoRDfsZ
	 E7N8yWUkA3BE2Ky8gSn98OPjwojMzai+DhTHglEWNbBIUHmzVkjL7ePBCEufEB9IhZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795293626;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=mO7aPZ3TKVzCLsaFKOwlsodZaFIbsI+kvE+Ck9bvLHc=;
	b=B+rdTSldMf0Q7UL56dPGfMoBc9T5VsertJah0Y+1ZNWA7hNr7JIspUIWaLqcC9JHl1Kc
	 4DV6xmTYQkgWevpGfqUinPY/rM/ho3yG1C7VweHoXSoPuy+E7psEr/5PfyTSVKpouGxOR
	 vM2Go4aS0yVVeXrYySLGBn4ZXncFiw5GF897QGoZ2q9E00Szj+80DFhacGXuZuHVTdfXB
	 yyyn5olPAKLvwBEGdZyDHnKDIcV7/vanqHYTZqShxE0Llm0/UR91Ck1Z6SCP9SEgA98uA
	 emOH7fuvgCp9uy1sdtr/nIWdL5R/CUv6/tCpB0qpeEWzkNGT4RNLmAbVAdrQsIAGOjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aRb/bHLx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFFB606A32A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 20:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aRb/bHLx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C441F000C4;
	Sat, 21 Nov 2026 20:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795293626;
	bh=mO7aPZ3TKVzCLsaFKOwlsodZaFIbsI+kvE+Ck9bvLHc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=aRb/bHLxKFDRAVFGhC9LsKlKe9zh9GURKnW4VMY8W5uCeEog7nt0f+aquqZ/KU7dA
	 9/rUXlb2MGGRau3E4cWlk4VF0DUIm+h5W8MHiD3F6sI3xGVzL/eMAqkCjaetDZ67mR
	 d4JMceUwsNjuhBK1PNFMVymSEXSa3RSuaw89ZVZLT+yQrZ275fQtR0HAmlIZ5xklq1
	 piAOoXzS48sP8ML1fk6iy0p4mhZ0EAlTVgqW2HivZXy+vaUtvhkJykR384PwJDKd/n
	 A7GdsCaSGHEWzTBXIo/JmLKvR3kFKf+gQPc1XpfdxDnPY3b/4hMycohCF0TPoODQ7A
	 e0qvlDrcfKqyg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0E8C1CE0E3E; Sat, 21 Nov 2026 12:40:26 -0800 (PST)
Date: Sat, 21 Nov 2026 12:40:26 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 36/36] kernel/rcu/tree_stall.h:326:22: warning:
 unused variable 'th'
Message-ID: <a0888607-17d3-4e4b-a90f-3faa6df158f3@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20261121073022.6xaJ1aeC-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121073022.6xaJ1aeC-lkp@intel.com>

On Sat, Nov 21, 2026 at 07:33:07AM +0100, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev
> head:   b08fb2b41824a539bc858f6733c0f5622a4751f0
> commit: b08fb2b41824a539bc858f6733c0f5622a4751f0 [36/36] rcu: Fixup for "rcu: Print CPU that preempted stalled reader wants to run on"
> config: sh-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121073022.6xaJ1aeC-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 10.5.0
> smatch: v0.5.0-9187-g5189e3fb
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121073022.6xaJ1aeC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/20261121073022.6xaJ1aeC-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from kernel/rcu/tree.c:5126:
>    kernel/rcu/tree_stall.h: In function 'check_slow_task':
> >> kernel/rcu/tree_stall.h:326:22: warning: unused variable 'th' [-Wunused-variable]
>      326 |  struct task_struct *th;
>          |                      ^~

This is me only partially compensating for an old commit.  It will be
automatically fixed when I pull in the latest.

							Thanx, Paul

> vim +/th +326 kernel/rcu/tree_stall.h
> 
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  316  
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  317  /*
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  318   * Report out the state of a not-running task that is stalling the
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  319   * current RCU grace period.
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  320   */
> 9b3c4ab3045e95 Peter Zijlstra   2021-09-21  321  static int check_slow_task(struct task_struct *t, void *arg)
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  322  {
> fd5121d99c8648 Paul E. McKenney 2026-11-09  323  	int cpu;
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  324  	struct rcu_node *rnp;
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  325  	struct rcu_stall_chk_rdr *rscrp = arg;
> fd5121d99c8648 Paul E. McKenney 2026-11-09 @326  	struct task_struct *th;
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  327  
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  328  	if (task_curr(t))
> 9b3c4ab3045e95 Peter Zijlstra   2021-09-21  329  		return -EBUSY; // It is running, so decline to inspect it.
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  330  	rscrp->nesting = t->rcu_read_lock_nesting;
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  331  	rscrp->rs = t->rcu_read_unlock_special;
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  332  	rscrp->on_blkd_list = !list_empty(&t->rcu_node_entry);
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  333  	rscrp->rcu_rdr_running = task_curr(t);
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  334  	rscrp->rcu_rdr_boosted = 0;
> fd5121d99c8648 Paul E. McKenney 2026-11-09  335  	rscrp->rcu_rdr_cpu = cpu = task_cpu(t);
> fd5121d99c8648 Paul E. McKenney 2026-11-09  336  	rscrp->rcu_rdr_cpu_offline = cpu_is_offline(cpu);
> fd5121d99c8648 Paul E. McKenney 2026-11-09  337  	lockdep_assert_irqs_disabled();
> b08fb2b41824a5 Paul E. McKenney 2026-11-20  338  	rscrp->rcu_rdr_cpu_task = cpu_curr_snapshot_rcu(cpu);
> fd5121d99c8648 Paul E. McKenney 2026-11-09  339  	// There is no need for get_task_struct(t) because we are in
> fd5121d99c8648 Paul E. McKenney 2026-11-09  340  	// an implicit RCU read-side critical section due to interrupts
> fd5121d99c8648 Paul E. McKenney 2026-11-09  341  	// being disabled.
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  342  	if (rscrp->on_blkd_list) {
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  343  		rnp = READ_ONCE(t->rcu_blocked_node);
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  344  		raw_spin_lock_rcu_node(rnp); /* irqs already disabled. */
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  345  		if (rnp == READ_ONCE(t->rcu_blocked_node)) {
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  346  			if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  347  				rscrp->rcu_rdr_boosted = 1;
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  348  		} else {
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  349  			rscrp->rcu_rdr_boosted = 2;
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  350  		}
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  351  		raw_spin_unlock_rcu_node(rnp); /* irqs remain disabled. */
> 49be2ba9f0fa25 Paul E. McKenney 2026-09-03  352  	}
> 9b3c4ab3045e95 Peter Zijlstra   2021-09-21  353  	return 0;
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  354  }
> 5bef8da66a9c45 Paul E. McKenney 2020-03-11  355  
> 
> :::::: The code at line 326 was first introduced by commit
> :::::: fd5121d99c864841cfea8f6ba115075491447a96 rcu: Print CPU that preempted stalled reader wants to run on
> 
> :::::: TO: Paul E. McKenney <paulmck@kernel.org>
> :::::: CC: Joel Fernandes <jfern@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
