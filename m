Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795845770;
	b=17tYQcRFJAH5IemNCD26OX45Hldk8tC+9Or2Y7aApUrmoUfjGc6Jxz2p4W7FbplzNQip
	 +KiGPf472cTEUeCylEflHkl2x3bnnQzywg4RYADsEoxf0MIdpoQY0EujLJzc2ETdQIeuF
	 Gk2Gwn4y4kRtv/FvT52hk/X4T1q155Z1XhdHlDyzi3DkGQqsH4G/YSbc2cKri1yF3yoyN
	 6RFYQrchkgXBwfB2uUDu7QKGfv/fuZrLby+gFkAN35OCQfmQIXSdDi9umn1Bwd4aLRn2R
	 Xu+FcMvTQmtw5112ITjtVyK4maRtf8iIrSCYr5TNlnDOIgrM2BHAPTRbrsRfHU/c25Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795845770;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=CM5OWNb3QTvEG8r8ViXRqm7Y/IbPeQkLzO87dm3PI6c=;
	b=I6wm16TJ/XM1oCMs0reu0k0Hx3V7+jwp14UGk0kjNhHg6eSaA1Lx6/8b8qCmsqJ47LUp
	 vHwGpYY60kQsUJBcBD2/IKDYk0Gde3tJ2+AeVybXUOhncMlo29XtiW3TUtschmVeCOm9O
	 Z/jaUChyMHQTIYb02l0K+858zFFdNqLZOs7CPD/MFoU3tO5jy6aE+pHvqPnkSnIsxYFTR
	 QdPgfCKtxlQu5kpG2ez5IHkH1+rPOzi1t1tsyItkFApHmM4kFy2cnntD+k0DWfK5CHkkn
	 7bhQMBQPXQLzXQmiDM06UHzxOIGB3IIaLgoWumopVms9IyE3gLZouA2+zrYCcV5iWdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YdI0FWzk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503A2606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Nov 2026 06:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YdI0FWzk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71601F00897;
	Sat, 28 Nov 2026 06:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795845769;
	bh=CM5OWNb3QTvEG8r8ViXRqm7Y/IbPeQkLzO87dm3PI6c=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=YdI0FWzk60IXnvN7A2LSy1jLJsGUQXgoKxblxmKiYOQXsI1ZAYnnKyKkBbKf7Q44O
	 MKLH0NHGknYEt2ByW8kw35MmZvpaHMoILFsjXLxjKXbQyOieehRwR+vMLxu/5oNkHL
	 umE78A3EEnccD3JU0vxqkq0KUglDMPZEhGuFsq8RSdxD61S9AubikYTGoVlRWprkhA
	 sdklG58gQhvsntPI+BBE6faAeDdORy3TJ29jZgkXRkn45mqRWJrCvfqz2IAUx0pSsI
	 bhs2FOhAqkUa5I2NCMUs+QBoIUYDHb6lt9L4nigzEuMVDH1B6JJnDdr+JXuz2uCCI2
	 Ge77hoWKzzToA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9383CCE15C8; Fri, 27 Nov 2026 22:02:44 -0800 (PST)
Date: Fri, 27 Nov 2026 22:02:44 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Joel Fernandes <jfern@kernel.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 27/38] kernel/rcu/rcutorture.c:1491:28: error:
 'struct rcu_torture_ops' has no member named 'check_boost_failed'
Message-ID: <5eef3f67-9828-4f02-912f-16fc041aea9a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20261128023258.zmFiYqU7-lkp@intel.com>
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
In-Reply-To: <20261128023258.zmFiYqU7-lkp@intel.com>

On Sat, Nov 28, 2026 at 02:35:20AM +0100, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev
> head:   68dcfb0e34ee3a9628f6b5ce7e06931b5248bb9e
> commit: 8519baa09dfe01ca5dbeed4a80ca84bab7de2ab9 [27/38] rcutorture: Remove unused check_boost_failed hook
> config: x86_64-randconfig-2002-20261127 (https://download.01.org/0day-ci/archive/20261128/20261128023258.zmFiYqU7-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128023258.zmFiYqU7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/20261128023258.zmFiYqU7-lkp@intel.com/
> 
> Note: the paulmckrcu/dev HEAD 68dcfb0e34ee3a9628f6b5ce7e06931b5248bb9e builds fine.
>       It only hurts bisectability.

This should go away when I rebase onto your latest.

							Thanx, Paul

> All errors (new ones prefixed by >>):
> 
>    kernel/rcu/rcutorture.c: In function 'rcu_torture_boost_failed':
> >> kernel/rcu/rcutorture.c:1491:28: error: 'struct rcu_torture_ops' has no member named 'check_boost_failed'
>     1491 |                 if (cur_ops->check_boost_failed && !cur_ops->check_boost_failed(gp_state, &cpu)) {
>          |                            ^~
>    kernel/rcu/rcutorture.c:1491:60: error: 'struct rcu_torture_ops' has no member named 'check_boost_failed'
>     1491 |                 if (cur_ops->check_boost_failed && !cur_ops->check_boost_failed(gp_state, &cpu)) {
>          |                                                            ^~
>    kernel/rcu/rcutorture.c:1518:27: error: 'struct rcu_torture_ops' has no member named 'check_boost_failed'
>     1518 |         } else if (cur_ops->check_boost_failed && !cur_ops->check_boost_failed(gp_state, NULL)) {
>          |                           ^~
>    kernel/rcu/rcutorture.c:1518:59: error: 'struct rcu_torture_ops' has no member named 'check_boost_failed'
>     1518 |         } else if (cur_ops->check_boost_failed && !cur_ops->check_boost_failed(gp_state, NULL)) {
>          |                                                           ^~
> 
> 
> vim +1491 kernel/rcu/rcutorture.c
> 
> 450efca7182a51 Joel Fernandes (Google  2018-06-10  1474) 
> 063f5a4df99145 Paul E. McKenney        2021-04-14  1475  static bool rcu_torture_boost_failed(unsigned long gp_state, unsigned long *start)
> 3b745c8969c752 Joel Fernandes (Google  2018-06-10  1476) {
> 0260b92e1c3941 Paul E. McKenney        2021-04-08  1477  	int cpu;
> 5e59fba573e64c Paul E. McKenney        2021-01-15  1478  	static int dbg_done;
> 063f5a4df99145 Paul E. McKenney        2021-04-14  1479  	unsigned long end = jiffies;
> bcd4af44e2f173 Paul E. McKenney        2021-04-08  1480  	bool gp_done;
> 0260b92e1c3941 Paul E. McKenney        2021-04-08  1481  	unsigned long j;
> 0260b92e1c3941 Paul E. McKenney        2021-04-08  1482  	static unsigned long last_persist;
> 0260b92e1c3941 Paul E. McKenney        2021-04-08  1483  	unsigned long lp;
> 0260b92e1c3941 Paul E. McKenney        2021-04-08  1484  	unsigned long mininterval = test_boost_duration * HZ - HZ / 2;
> 5e59fba573e64c Paul E. McKenney        2021-01-15  1485  
> 063f5a4df99145 Paul E. McKenney        2021-04-14  1486  	if (end - *start > mininterval) {
> 7b9dad7abad707 Paul E. McKenney        2021-04-07  1487  		// Recheck after checking time to avoid false positives.
> 7b9dad7abad707 Paul E. McKenney        2021-04-07  1488  		smp_mb(); // Time check before grace-period check.
> 7b9dad7abad707 Paul E. McKenney        2021-04-07  1489  		if (cur_ops->poll_gp_state(gp_state))
> 7b9dad7abad707 Paul E. McKenney        2021-04-07  1490  			return false; // passed, though perhaps just barely
> 0260b92e1c3941 Paul E. McKenney        2021-04-08 @1491  		if (cur_ops->check_boost_failed && !cur_ops->check_boost_failed(gp_state, &cpu)) {
> 0260b92e1c3941 Paul E. McKenney        2021-04-08  1492  			// At most one persisted message per boost test.
> 0260b92e1c3941 Paul E. McKenney        2021-04-08  1493  			j = jiffies;
> 0260b92e1c3941 Paul E. McKenney        2021-04-08  1494  			lp = READ_ONCE(last_persist);
> 80e935c8c154d8 Paul E. McKenney        2024-10-09  1495  			if (time_after(j, lp + mininterval) &&
> 80e935c8c154d8 Paul E. McKenney        2024-10-09  1496  			    cmpxchg(&last_persist, lp, j) == lp) {
> 80e935c8c154d8 Paul E. McKenney        2024-10-09  1497  				if (cpu < 0)
> 80e935c8c154d8 Paul E. McKenney        2024-10-09  1498  					pr_info("Boost inversion persisted: QS from all CPUs\n");
> 80e935c8c154d8 Paul E. McKenney        2024-10-09  1499  				else
> 0260b92e1c3941 Paul E. McKenney        2021-04-08  1500  					pr_info("Boost inversion persisted: No QS from CPU %d\n", cpu);
> 80e935c8c154d8 Paul E. McKenney        2024-10-09  1501  			}
> 0260b92e1c3941 Paul E. McKenney        2021-04-08  1502  			return false; // passed on a technicality
> 0260b92e1c3941 Paul E. McKenney        2021-04-08  1503  		}
> 3b745c8969c752 Joel Fernandes (Google  2018-06-10  1504) 		VERBOSE_TOROUT_STRING("rcu_torture_boost boosting failed");
> 3b745c8969c752 Joel Fernandes (Google  2018-06-10  1505) 		n_rcu_torture_boost_failure++;
> ea6d962e80b619 Paul E. McKenney        2021-03-30  1506  		if (!xchg(&dbg_done, 1) && cur_ops->gp_kthread_dbg) {
> ea6d962e80b619 Paul E. McKenney        2021-03-30  1507  			pr_info("Boost inversion thread ->rt_priority %u gp_state %lu jiffies %lu\n",
> 063f5a4df99145 Paul E. McKenney        2021-04-14  1508  				current->rt_priority, gp_state, end - *start);
> 5e59fba573e64c Paul E. McKenney        2021-01-15  1509  			cur_ops->gp_kthread_dbg();
> bcd4af44e2f173 Paul E. McKenney        2021-04-08  1510  			// Recheck after print to flag grace period ending during splat.
> bcd4af44e2f173 Paul E. McKenney        2021-04-08  1511  			gp_done = cur_ops->poll_gp_state(gp_state);
> bcd4af44e2f173 Paul E. McKenney        2021-04-08  1512  			pr_info("Boost inversion: GP %lu %s.\n", gp_state,
> bcd4af44e2f173 Paul E. McKenney        2021-04-08  1513  				gp_done ? "ended already" : "still pending");
> 3b745c8969c752 Joel Fernandes (Google  2018-06-10  1514) 
> 3b745c8969c752 Joel Fernandes (Google  2018-06-10  1515) 		}
> 3b745c8969c752 Joel Fernandes (Google  2018-06-10  1516) 
> 7b9dad7abad707 Paul E. McKenney        2021-04-07  1517  		return true; // failed
> 063f5a4df99145 Paul E. McKenney        2021-04-14  1518  	} else if (cur_ops->check_boost_failed && !cur_ops->check_boost_failed(gp_state, NULL)) {
> 063f5a4df99145 Paul E. McKenney        2021-04-14  1519  		*start = jiffies;
> 3b745c8969c752 Joel Fernandes (Google  2018-06-10  1520) 	}
> 3b745c8969c752 Joel Fernandes (Google  2018-06-10  1521) 
> 7b9dad7abad707 Paul E. McKenney        2021-04-07  1522  	return false; // passed
> 3b745c8969c752 Joel Fernandes (Google  2018-06-10  1523) }
> 3b745c8969c752 Joel Fernandes (Google  2018-06-10  1524) 
> 
> :::::: The code at line 1491 was first introduced by commit
> :::::: 0260b92e1c39412b1e345e202355c43169c16274 rcutorture: Forgive RCU boost failures when CPUs don't pass through QS
> 
> :::::: TO: Paul E. McKenney <paulmck@kernel.org>
> :::::: CC: Paul E. McKenney <paulmck@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
