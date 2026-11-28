Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795829773;
	b=uuNt/oAUvfJrV+l0bV7RjeHP+3u7eEMeKbE4aKkViMiJWSDHXTDwGnnoQjwpliExpr0o
	 qJeU5OsAtwKWvrIl0eSbwyc0HSYV2tiumNe69gQ/tdN8PnckvwWfxqC77REMJD295DQOV
	 zMXHxijKTsOcaJpbTf7heMRvRqMD07ylNUaZMEXdtoDjILFLmuYA7RYYtUCFDvOeF8jtS
	 /xWEQ9w2dsKfmkfeuNCab/mXqxpiJksa7WhBpCZVkMQx2YkuLThLQFpXWkUxKTxnIXbnK
	 y4lZo92J9b1rUWjfkVcweCbEQ8XYlp9ETdWwLO7ebq6jGJZbMPb82AHdY2P0EjrJOeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795829773;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2DhVyIU7gNuPwwCLUHQhA7aeCJxNpv1+SsIpLN6Ivzc=;
	b=xkBm8Zcm3roK7uDHiqmXvr/4XvYzBCj+BTcakrOSKJAqvkmmvVNNYBGkPCICO0rB1Tm1
	 GlZL5H8tnr0ceaNE37UgG+ercv+8hOlcPfdEOKzVRGqVc/SvSKZ9jYt9Dd2E7/AyBBEF2
	 ryfresHES+KqqDCN/av2CUrRbjYFF0wMg88C1xIbjOKZJzH5rnj66DaSPE9ShAIrGLFQp
	 2FDiMmwOzK9b8XOWOkgOcTHi6PfaCQilDDH58tiIVNkWfuMacfSvVf02Ve3lLBVikgbos
	 lb00zQZoob6KJX80xnhtA3IhDJ5P2LUI7Nlxh337ub2AB7hzN4A40+gzI+cCJ882g1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FKZrfw4M;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43E606A321
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Nov 2026 01:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF43E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FKZrfw4M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795829773; x=1827365773;
  h=date:from:to:cc:subject:message-id;
  bh=QJJO0tsU8sRQqB4a1oLJuzAP/93FebD9rh3kytKcR2U=;
  b=FKZrfw4M1nttmbYYJ043zPw8JPRwnVHZWCKNkvS+MaKixqFBrn6A9G3M
   Pt6X6EQWiVgpYz5ayVkFH7YV8qCA4EzbZIhlACI/9nrFuZWsr9SQdnkcx
   fYR1+k3rprEmreNYIwZQXJXHDbfEIZRX6i7JRyeiZbXVkoLQbSYMZ9r9H
   dYJawQCILj2ic3NM/V1183snVgb7srS10qpXGoI9iEXSb80Zp/D0aN/rs
   lWQT6W96RUTREbcraARBuLMtXRpFBKw4ZNAdkC4af/bn3J+QPMGpVZh+A
   iryy6n61Cpo7I53d88h3Nm+mHN29OV5OvYsmy+3qKnbOEk6U6+OG7Q4Ni
   A==;
X-CSE-ConnectionGUID: +k50CcOfSGqTVVTm0rXTEA==
X-CSE-MsgGUID: UFeYxJNnS0ezvqMLibTr5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4700897"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4700897"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 17:36:12 -0800
X-CSE-ConnectionGUID: up3YER5FTFe0gaw5I4OzCQ==
X-CSE-MsgGUID: LZ5oQQIhTmeFN0QvRmDLbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4017033"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 27 Nov 2026 17:36:10 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX7MG-000000000TU-1Ce6;
	Sat, 28 Nov 2026 01:36:08 +0000
Date: Sat, 28 Nov 2026 02:35:20 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <jfern@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmckrcu:dev 27/38] kernel/rcu/rcutorture.c:1491:28:
 error: 'struct rcu_torture_ops' has no member named 'check_boost_failed'
Message-ID: <20261128023258.zmFiYqU7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/paulmckrcu/linux dev
head:   68dcfb0e34ee3a9628f6b5ce7e06931b5248bb9e
commit: 8519baa09dfe01ca5dbeed4a80ca84bab7de2ab9 [27/38] rcutorture: Remove unused check_boost_failed hook
config: x86_64-randconfig-2002-20261127 (https://download.01.org/0day-ci/archive/20261128/20261128023258.zmFiYqU7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128023258.zmFiYqU7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128023258.zmFiYqU7-lkp@intel.com/

Note: the paulmckrcu/dev HEAD 68dcfb0e34ee3a9628f6b5ce7e06931b5248bb9e builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/rcu/rcutorture.c: In function 'rcu_torture_boost_failed':
>> kernel/rcu/rcutorture.c:1491:28: error: 'struct rcu_torture_ops' has no member named 'check_boost_failed'
    1491 |                 if (cur_ops->check_boost_failed && !cur_ops->check_boost_failed(gp_state, &cpu)) {
         |                            ^~
   kernel/rcu/rcutorture.c:1491:60: error: 'struct rcu_torture_ops' has no member named 'check_boost_failed'
    1491 |                 if (cur_ops->check_boost_failed && !cur_ops->check_boost_failed(gp_state, &cpu)) {
         |                                                            ^~
   kernel/rcu/rcutorture.c:1518:27: error: 'struct rcu_torture_ops' has no member named 'check_boost_failed'
    1518 |         } else if (cur_ops->check_boost_failed && !cur_ops->check_boost_failed(gp_state, NULL)) {
         |                           ^~
   kernel/rcu/rcutorture.c:1518:59: error: 'struct rcu_torture_ops' has no member named 'check_boost_failed'
    1518 |         } else if (cur_ops->check_boost_failed && !cur_ops->check_boost_failed(gp_state, NULL)) {
         |                                                           ^~


vim +1491 kernel/rcu/rcutorture.c

450efca7182a51 Joel Fernandes (Google  2018-06-10  1474) 
063f5a4df99145 Paul E. McKenney        2021-04-14  1475  static bool rcu_torture_boost_failed(unsigned long gp_state, unsigned long *start)
3b745c8969c752 Joel Fernandes (Google  2018-06-10  1476) {
0260b92e1c3941 Paul E. McKenney        2021-04-08  1477  	int cpu;
5e59fba573e64c Paul E. McKenney        2021-01-15  1478  	static int dbg_done;
063f5a4df99145 Paul E. McKenney        2021-04-14  1479  	unsigned long end = jiffies;
bcd4af44e2f173 Paul E. McKenney        2021-04-08  1480  	bool gp_done;
0260b92e1c3941 Paul E. McKenney        2021-04-08  1481  	unsigned long j;
0260b92e1c3941 Paul E. McKenney        2021-04-08  1482  	static unsigned long last_persist;
0260b92e1c3941 Paul E. McKenney        2021-04-08  1483  	unsigned long lp;
0260b92e1c3941 Paul E. McKenney        2021-04-08  1484  	unsigned long mininterval = test_boost_duration * HZ - HZ / 2;
5e59fba573e64c Paul E. McKenney        2021-01-15  1485  
063f5a4df99145 Paul E. McKenney        2021-04-14  1486  	if (end - *start > mininterval) {
7b9dad7abad707 Paul E. McKenney        2021-04-07  1487  		// Recheck after checking time to avoid false positives.
7b9dad7abad707 Paul E. McKenney        2021-04-07  1488  		smp_mb(); // Time check before grace-period check.
7b9dad7abad707 Paul E. McKenney        2021-04-07  1489  		if (cur_ops->poll_gp_state(gp_state))
7b9dad7abad707 Paul E. McKenney        2021-04-07  1490  			return false; // passed, though perhaps just barely
0260b92e1c3941 Paul E. McKenney        2021-04-08 @1491  		if (cur_ops->check_boost_failed && !cur_ops->check_boost_failed(gp_state, &cpu)) {
0260b92e1c3941 Paul E. McKenney        2021-04-08  1492  			// At most one persisted message per boost test.
0260b92e1c3941 Paul E. McKenney        2021-04-08  1493  			j = jiffies;
0260b92e1c3941 Paul E. McKenney        2021-04-08  1494  			lp = READ_ONCE(last_persist);
80e935c8c154d8 Paul E. McKenney        2024-10-09  1495  			if (time_after(j, lp + mininterval) &&
80e935c8c154d8 Paul E. McKenney        2024-10-09  1496  			    cmpxchg(&last_persist, lp, j) == lp) {
80e935c8c154d8 Paul E. McKenney        2024-10-09  1497  				if (cpu < 0)
80e935c8c154d8 Paul E. McKenney        2024-10-09  1498  					pr_info("Boost inversion persisted: QS from all CPUs\n");
80e935c8c154d8 Paul E. McKenney        2024-10-09  1499  				else
0260b92e1c3941 Paul E. McKenney        2021-04-08  1500  					pr_info("Boost inversion persisted: No QS from CPU %d\n", cpu);
80e935c8c154d8 Paul E. McKenney        2024-10-09  1501  			}
0260b92e1c3941 Paul E. McKenney        2021-04-08  1502  			return false; // passed on a technicality
0260b92e1c3941 Paul E. McKenney        2021-04-08  1503  		}
3b745c8969c752 Joel Fernandes (Google  2018-06-10  1504) 		VERBOSE_TOROUT_STRING("rcu_torture_boost boosting failed");
3b745c8969c752 Joel Fernandes (Google  2018-06-10  1505) 		n_rcu_torture_boost_failure++;
ea6d962e80b619 Paul E. McKenney        2021-03-30  1506  		if (!xchg(&dbg_done, 1) && cur_ops->gp_kthread_dbg) {
ea6d962e80b619 Paul E. McKenney        2021-03-30  1507  			pr_info("Boost inversion thread ->rt_priority %u gp_state %lu jiffies %lu\n",
063f5a4df99145 Paul E. McKenney        2021-04-14  1508  				current->rt_priority, gp_state, end - *start);
5e59fba573e64c Paul E. McKenney        2021-01-15  1509  			cur_ops->gp_kthread_dbg();
bcd4af44e2f173 Paul E. McKenney        2021-04-08  1510  			// Recheck after print to flag grace period ending during splat.
bcd4af44e2f173 Paul E. McKenney        2021-04-08  1511  			gp_done = cur_ops->poll_gp_state(gp_state);
bcd4af44e2f173 Paul E. McKenney        2021-04-08  1512  			pr_info("Boost inversion: GP %lu %s.\n", gp_state,
bcd4af44e2f173 Paul E. McKenney        2021-04-08  1513  				gp_done ? "ended already" : "still pending");
3b745c8969c752 Joel Fernandes (Google  2018-06-10  1514) 
3b745c8969c752 Joel Fernandes (Google  2018-06-10  1515) 		}
3b745c8969c752 Joel Fernandes (Google  2018-06-10  1516) 
7b9dad7abad707 Paul E. McKenney        2021-04-07  1517  		return true; // failed
063f5a4df99145 Paul E. McKenney        2021-04-14  1518  	} else if (cur_ops->check_boost_failed && !cur_ops->check_boost_failed(gp_state, NULL)) {
063f5a4df99145 Paul E. McKenney        2021-04-14  1519  		*start = jiffies;
3b745c8969c752 Joel Fernandes (Google  2018-06-10  1520) 	}
3b745c8969c752 Joel Fernandes (Google  2018-06-10  1521) 
7b9dad7abad707 Paul E. McKenney        2021-04-07  1522  	return false; // passed
3b745c8969c752 Joel Fernandes (Google  2018-06-10  1523) }
3b745c8969c752 Joel Fernandes (Google  2018-06-10  1524) 

:::::: The code at line 1491 was first introduced by commit
:::::: 0260b92e1c39412b1e345e202355c43169c16274 rcutorture: Forgive RCU boost failures when CPUs don't pass through QS

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
