Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794012584;
	b=JLRjryQ8SfVdbRbKrfjwoFR7IlgXMeUNU5sImV9wW/mILbhi+PKcAtsl/2+Ywt9hlLEm
	 /d63ZzBdSSaF3x/DON3CLGgQqR9UVMFeAe0PSWGzIY/DE5sS60sajlZRipzN43jeD6iQ4
	 PtyQrp2Yzbkxn4c3rzeulsV0wjCe9hlMEsUXjciIGPHvLU1xtmGRaNWa2eIOHqTSm2tQZ
	 t/mYysHwjYu5WFi+1dPr04aMNRIbcqJFpdG+e7/PrXWz7jsYxgxHvWhbOM1KDTyTlyrMK
	 z4oAAGtLjZ6+rA1bHiA24EI9RkJcmTOl9mLEsphwG2R4Af5Rbx+K22/qpS9RsnwMcOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012584;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Fx8j3sNRVUGTAoojDh86x9Emy1/n83ieAyU2qsif/TI=;
	b=v8SCr1H9m4wZBGr4EM5nwLO+kOrjWlgg9ijGsDlmH3XvZfyUA3cO8T8qPckJ4ynQbrDV
	 eUVKoGakazJ/69UE3jVz9y47dYqo23IQREwpruCz+Lqxnq2sKaCJGYqLpblE8I3heEQqR
	 jIM96hob/X+zhxar0Yhh9971Bd8Hhh2BNjJWKcNovlHXi7ZTt5siNR9I3jLGvRiofrkQ/
	 x1oGi98KaM0lytfj/1HnGaXR2pMxML7KaNKacDOx+V8ZtrJQ3PiuBNYivQJ6EORYSo5dM
	 QDj1ekjZXJiTeaWWo5Ckx54yblfATz+4ctd0Y9rn1s/gv0rFjAboZPnU5USmXiLrRnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aLhI9BBy;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA4E606F9EC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 00:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA4E606F9EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aLhI9BBy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794012583; x=1825548583;
  h=date:from:to:cc:subject:message-id;
  bh=osifFaXfEiy+rPhvfymOPZuB7eyYNZCJirg+6qRSVkI=;
  b=aLhI9BByxSa5WoKdk5K+lYciW9nkWDQ9FtKyQ1DdL8rXrwYOwxjOWZij
   RlfZfQP6rI5EWJtaip3x0KH9C5nfJapuwD2KCvVvLagq9LriUTju8thal
   0GxubvH8HgCQVdTqamrC3ipUYt2yFJ+nmoqGfNqxZfQJixCS1wVUTRcxt
   0JOvEK2NKNEUEUBtlTgcvxSN1XzvGUdULlI579s3eE4RwVyjZ5KDVw5Rz
   adCECZxsNNsYEiwnNARN7uWw929upRUEZ7RfiFLN1TnfI0qyQryFk9C2c
   /ymSFr7MdxanO/dCp3FXbFNMJ9PcBJblp+BySMRpEUqb2eN0BWXGIcqFd
   g==;
X-CSE-ConnectionGUID: h5la24BDTOC3L1KK8wRZEA==
X-CSE-MsgGUID: CNar4hcmQ0uIY83KhF+y0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2874585"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2874585"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 16:49:42 -0800
X-CSE-ConnectionGUID: Lv3CS0Z4R3ik+mfW0EHYBQ==
X-CSE-MsgGUID: LKxQW1jsT7KTm7qI+rhNCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7276535"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2026 16:49:40 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPUcj-00000000q9r-299U;
	Sat, 07 Nov 2026 00:49:37 +0000
Date: Sat, 07 Nov 2026 08:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 4/13]
 kernel/time/timekeeping.c:2583:undefined reference to `__udivdi3'
Message-ID: <202611070814.X4qXDkij-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   025c1312a0fa1a7672a6d1c89a3309e2f1196787
commit: 1f36afc1245c31ae40c5c261829f85c6a4200f29 [4/13] timekeeping: Reinstate proportional correction of ntp_error
config: sh-r7780mp_defconfig (https://download.01.org/0day-ci/archive/20261107/202611070814.X4qXDkij-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070814.X4qXDkij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070814.X4qXDkij-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/time/timekeeping.o: in function `accumulate_nsecs_to_secs':
>> kernel/time/timekeeping.c:2583:(.text+0xeac): undefined reference to `__udivdi3'


vim +2583 kernel/time/timekeeping.c

8524070b7982d7 John Stultz      2007-05-08  2572  
199d280c884de4 Alex Shi         2020-11-13  2573  /*
1f4f948706bcec John Stultz      2012-07-13  2574   * accumulate_nsecs_to_secs - Accumulates nsecs into secs
1f4f948706bcec John Stultz      2012-07-13  2575   *
571af55a31d365 Zhen Lei         2015-08-25  2576   * Helper function that accumulates the nsecs greater than a second
1f4f948706bcec John Stultz      2012-07-13  2577   * from the xtime_nsec field to the xtime_secs field.
1f4f948706bcec John Stultz      2012-07-13  2578   * It also calls into the NTP code to handle leapsecond processing.
1f4f948706bcec John Stultz      2012-07-13  2579   */
780427f0e113b4 David Vrabel     2013-06-27  2580  static inline unsigned int accumulate_nsecs_to_secs(struct timekeeper *tk)
1f4f948706bcec John Stultz      2012-07-13  2581  {
876e78818def29 Peter Zijlstra   2015-03-19  2582  	u64 nsecps = (u64)NSEC_PER_SEC << tk->tkr_mono.shift;
5258d3f25c76f6 John Stultz      2013-12-11 @2583  	unsigned int clock_set = 0;
1f36afc1245c31 David Woodhouse  2026-09-29  2584  	bool crossed = false;
1f4f948706bcec John Stultz      2012-07-13  2585  
876e78818def29 Peter Zijlstra   2015-03-19  2586  	while (tk->tkr_mono.xtime_nsec >= nsecps) {
1f4f948706bcec John Stultz      2012-07-13  2587  		int leap;
1f4f948706bcec John Stultz      2012-07-13  2588  
876e78818def29 Peter Zijlstra   2015-03-19  2589  		tk->tkr_mono.xtime_nsec -= nsecps;
1f4f948706bcec John Stultz      2012-07-13  2590  		tk->xtime_sec++;
1f4f948706bcec John Stultz      2012-07-13  2591  
78b98e3c5a66d5 Miroslav Lichvar 2018-03-09  2592  		/*
78b98e3c5a66d5 Miroslav Lichvar 2018-03-09  2593  		 * Skip NTP update if this second was accumulated before,
78b98e3c5a66d5 Miroslav Lichvar 2018-03-09  2594  		 * i.e. xtime_nsec underflowed in timekeeping_adjust()
78b98e3c5a66d5 Miroslav Lichvar 2018-03-09  2595  		 */
78b98e3c5a66d5 Miroslav Lichvar 2018-03-09  2596  		if (unlikely(tk->skip_second_overflow)) {
78b98e3c5a66d5 Miroslav Lichvar 2018-03-09  2597  			tk->skip_second_overflow = 0;
78b98e3c5a66d5 Miroslav Lichvar 2018-03-09  2598  			continue;
78b98e3c5a66d5 Miroslav Lichvar 2018-03-09  2599  		}
78b98e3c5a66d5 Miroslav Lichvar 2018-03-09  2600  
1f4f948706bcec John Stultz      2012-07-13  2601  		/* Figure out if its a leap sec and apply if needed */
5ffa25f573cf52 Thomas Gleixner  2025-05-19  2602  		leap = second_overflow(tk->id, tk->xtime_sec);
6d0ef903e2bda7 John Stultz      2012-07-27  2603  		if (unlikely(leap)) {
7d489d15ce4be5 John Stultz      2014-07-16  2604  			struct timespec64 ts;
6d0ef903e2bda7 John Stultz      2012-07-27  2605  
1f4f948706bcec John Stultz      2012-07-13  2606  			tk->xtime_sec += leap;
1f4f948706bcec John Stultz      2012-07-13  2607  
6d0ef903e2bda7 John Stultz      2012-07-27  2608  			ts.tv_sec = leap;
6d0ef903e2bda7 John Stultz      2012-07-27  2609  			ts.tv_nsec = 0;
6d0ef903e2bda7 John Stultz      2012-07-27  2610  			tk_set_wall_to_mono(tk,
7d489d15ce4be5 John Stultz      2014-07-16  2611  				timespec64_sub(tk->wall_to_monotonic, ts));
6d0ef903e2bda7 John Stultz      2012-07-27  2612  
cc244ddae6d4c6 John Stultz      2012-05-03  2613  			__timekeeping_set_tai_offset(tk, tk->tai_offset - leap);
cc244ddae6d4c6 John Stultz      2012-05-03  2614  
5258d3f25c76f6 John Stultz      2013-12-11  2615  			clock_set = TK_CLOCK_WAS_SET;
6d0ef903e2bda7 John Stultz      2012-07-27  2616  		}
1f36afc1245c31 David Woodhouse  2026-09-29  2617  
1f36afc1245c31 David Woodhouse  2026-09-29  2618  		crossed = true;
1f36afc1245c31 David Woodhouse  2026-09-29  2619  	}
1f36afc1245c31 David Woodhouse  2026-09-29  2620  
1f36afc1245c31 David Woodhouse  2026-09-29  2621  	/*
1f36afc1245c31 David Woodhouse  2026-09-29  2622  	 * Core timekeeper only; aux timekeepers are not covered by the
1f36afc1245c31 David Woodhouse  2026-09-29  2623  	 * timekeeping_max_deferment() wakeup which re-sizes the drain
1f36afc1245c31 David Woodhouse  2026-09-29  2624  	 * each second before it can overshoot.
1f36afc1245c31 David Woodhouse  2026-09-29  2625  	 */
1f36afc1245c31 David Woodhouse  2026-09-29  2626  	if (crossed && tk->id == TIMEKEEPER_CORE) {
1f36afc1245c31 David Woodhouse  2026-09-29  2627  		/* Re-size the proportional ntp_error drain for this second */
1f36afc1245c31 David Woodhouse  2026-09-29  2628  		s64 lsb_sec = ((s64)tk->cycle_interval <<
1f36afc1245c31 David Woodhouse  2026-09-29  2629  			       tk->ntp_error_shift) * NTP_INTERVAL_FREQ;
1f36afc1245c31 David Woodhouse  2026-09-29  2630  
1f36afc1245c31 David Woodhouse  2026-09-29  2631  		tk->err_drain = 0;
1f36afc1245c31 David Woodhouse  2026-09-29  2632  		if (abs(tk->ntp_error) > lsb_sec * TK_NTP_ERR_THRESH) {
1f36afc1245c31 David Woodhouse  2026-09-29  2633  			s32 max_drain = (u64)tk->tkr_mono.clock->mult *
1f36afc1245c31 David Woodhouse  2026-09-29  2634  					TK_NTP_ERR_MAX_PPM / 1000000;
1f36afc1245c31 David Woodhouse  2026-09-29  2635  
1f36afc1245c31 David Woodhouse  2026-09-29  2636  			tk->err_drain = clamp_t(s64,
1f36afc1245c31 David Woodhouse  2026-09-29  2637  						div64_s64(tk->ntp_error,
1f36afc1245c31 David Woodhouse  2026-09-29  2638  							  lsb_sec * TK_NTP_ERR_HORIZON),
1f36afc1245c31 David Woodhouse  2026-09-29  2639  						-max_drain, max_drain);
1f36afc1245c31 David Woodhouse  2026-09-29  2640  
1f36afc1245c31 David Woodhouse  2026-09-29  2641  			/*
1f36afc1245c31 David Woodhouse  2026-09-29  2642  			 * This accumulation may be running from an idle
1f36afc1245c31 David Woodhouse  2026-09-29  2643  			 * CPU's interrupt (jiffies catch-up). Make sure
1f36afc1245c31 David Woodhouse  2026-09-29  2644  			 * some CPU will honour the per-second deferment
1f36afc1245c31 David Woodhouse  2026-09-29  2645  			 * bound while the drain is active.
1f36afc1245c31 David Woodhouse  2026-09-29  2646  			 */
1f36afc1245c31 David Woodhouse  2026-09-29  2647  			if (tk->err_drain)
1f36afc1245c31 David Woodhouse  2026-09-29  2648  				tick_nohz_claim_do_timer();
1f36afc1245c31 David Woodhouse  2026-09-29  2649  		}
1f4f948706bcec John Stultz      2012-07-13  2650  	}
5258d3f25c76f6 John Stultz      2013-12-11  2651  	return clock_set;
1f4f948706bcec John Stultz      2012-07-13  2652  }
1f4f948706bcec John Stultz      2012-07-13  2653  

:::::: The code at line 2583 was first introduced by commit
:::::: 5258d3f25c76f6ab86e9333abf97a55a877d3870 timekeeping: Fix potential lost pv notification of time change

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: John Stultz <john.stultz@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
