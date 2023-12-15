Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DCD539D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 01:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSTFyfk5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702605258; x=1734141258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qgv/rY+V6yPl0Rrkf1op6KUVIuZVcpikSohnp/tD9Lc=;
  b=QSTFyfk57TvgtxcwPF1fVCm3ee35rJalllcCOti8lSGroWv2srcOJNNF
   hf9c5DWR/H4RPkh/PgICVi28OX1gmXKKpBVbE9LCwWJgNrB+gMh81ME3u
   rSF6fUVQZ5LRBMkciTlsxeDFqhjWeEv83eW7fKRrYDEdyLOQFyyoLuRml
   QgsvIhIpWc+ndP3XRPrB/32CSAboE0twKQFFtojf8XFnSoEIDIBLzeb81
   zPbVkIb/0n675oAHLv1rCUqIPXnaoFjuXat/jwPSxMeA2sNqUoN2MFUzy
   zuurgXdWG1pHW5WX0B1uomDgE87byNK20+2bJyFDyV3lKNw9abQ98mz3Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2070170"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="2070170"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:53:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="840492480"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="840492480"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Dec 2023 17:53:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDxOe-000Mxp-1Q;
	Fri, 15 Dec 2023 01:53:48 +0000
Date: Fri, 15 Dec 2023 09:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/2] kernel/sched/pelt.c:183:5:
 error: no previous prototype for function '___update_load_sum'
Message-ID: <202312150936.WsIkxgNL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   ab6f88aebe2fc11299ab6da38ff960cdf785b050
commit: e8762ad4243943f3b5b3bd5289b3f6e6243545e8 [1/2] ANDROID: sched: Add vendor hook for util-update related functions
config: x86_64-sof-customedconfig-compile-test-defconfig (https://download.01.org/0day-ci/archive/20231215/202312150936.WsIkxgNL-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150936.WsIkxgNL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150936.WsIkxgNL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/pelt.c:28:
   kernel/sched/sched.h:1770:15: error: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
           head->func = (void (*)(struct callback_head *))func;
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/pelt.c:183:5: error: no previous prototype for function '___update_load_sum' [-Werror,-Wmissing-prototypes]
   int ___update_load_sum(u64 now, struct sched_avg *sa,
       ^
   kernel/sched/pelt.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ___update_load_sum(u64 now, struct sched_avg *sa,
   ^
   static 
>> kernel/sched/pelt.c:260:6: error: no previous prototype for function '___update_load_avg' [-Werror,-Wmissing-prototypes]
   void ___update_load_avg(struct sched_avg *sa, unsigned long load)
        ^
   kernel/sched/pelt.c:260:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ___update_load_avg(struct sched_avg *sa, unsigned long load)
   ^
   static 
   3 errors generated.


vim +/___update_load_sum +183 kernel/sched/pelt.c

  > 28	#include "sched.h"
    29	#include "pelt.h"
    30	
    31	/*
    32	 * Approximate:
    33	 *   val * y^n,    where y^32 ~= 0.5 (~1 scheduling period)
    34	 */
    35	static u64 decay_load(u64 val, u64 n)
    36	{
    37		unsigned int local_n;
    38	
    39		if (unlikely(n > LOAD_AVG_PERIOD * 63))
    40			return 0;
    41	
    42		/* after bounds checking we can collapse to 32-bit */
    43		local_n = n;
    44	
    45		/*
    46		 * As y^PERIOD = 1/2, we can combine
    47		 *    y^n = 1/2^(n/PERIOD) * y^(n%PERIOD)
    48		 * With a look-up table which covers y^n (n<PERIOD)
    49		 *
    50		 * To achieve constant time decay_load.
    51		 */
    52		if (unlikely(local_n >= LOAD_AVG_PERIOD)) {
    53			val >>= local_n / LOAD_AVG_PERIOD;
    54			local_n %= LOAD_AVG_PERIOD;
    55		}
    56	
    57		val = mul_u64_u32_shr(val, runnable_avg_yN_inv[local_n], 32);
    58		return val;
    59	}
    60	
    61	static u32 __accumulate_pelt_segments(u64 periods, u32 d1, u32 d3)
    62	{
    63		u32 c1, c2, c3 = d3; /* y^0 == 1 */
    64	
    65		/*
    66		 * c1 = d1 y^p
    67		 */
    68		c1 = decay_load((u64)d1, periods);
    69	
    70		/*
    71		 *            p-1
    72		 * c2 = 1024 \Sum y^n
    73		 *            n=1
    74		 *
    75		 *              inf        inf
    76		 *    = 1024 ( \Sum y^n - \Sum y^n - y^0 )
    77		 *              n=0        n=p
    78		 */
    79		c2 = LOAD_AVG_MAX - decay_load(LOAD_AVG_MAX, periods) - 1024;
    80	
    81		return c1 + c2 + c3;
    82	}
    83	
    84	/*
    85	 * Accumulate the three separate parts of the sum; d1 the remainder
    86	 * of the last (incomplete) period, d2 the span of full periods and d3
    87	 * the remainder of the (incomplete) current period.
    88	 *
    89	 *           d1          d2           d3
    90	 *           ^           ^            ^
    91	 *           |           |            |
    92	 *         |<->|<----------------->|<--->|
    93	 * ... |---x---|------| ... |------|-----x (now)
    94	 *
    95	 *                           p-1
    96	 * u' = (u + d1) y^p + 1024 \Sum y^n + d3 y^0
    97	 *                           n=1
    98	 *
    99	 *    = u y^p +					(Step 1)
   100	 *
   101	 *                     p-1
   102	 *      d1 y^p + 1024 \Sum y^n + d3 y^0		(Step 2)
   103	 *                     n=1
   104	 */
   105	static __always_inline u32
   106	accumulate_sum(u64 delta, struct sched_avg *sa,
   107		       unsigned long load, unsigned long runnable, int running)
   108	{
   109		u32 contrib = (u32)delta; /* p == 0 -> delta < 1024 */
   110		u64 periods;
   111	
   112		delta += sa->period_contrib;
   113		periods = delta / 1024; /* A period is 1024us (~1ms) */
   114	
   115		/*
   116		 * Step 1: decay old *_sum if we crossed period boundaries.
   117		 */
   118		if (periods) {
   119			sa->load_sum = decay_load(sa->load_sum, periods);
   120			sa->runnable_sum =
   121				decay_load(sa->runnable_sum, periods);
   122			sa->util_sum = decay_load((u64)(sa->util_sum), periods);
   123	
   124			/*
   125			 * Step 2
   126			 */
   127			delta %= 1024;
   128			if (load) {
   129				/*
   130				 * This relies on the:
   131				 *
   132				 * if (!load)
   133				 *	runnable = running = 0;
   134				 *
   135				 * clause from ___update_load_sum(); this results in
   136				 * the below usage of @contrib to disappear entirely,
   137				 * so no point in calculating it.
   138				 */
   139				contrib = __accumulate_pelt_segments(periods,
   140						1024 - sa->period_contrib, delta);
   141			}
   142		}
   143		sa->period_contrib = delta;
   144	
   145		if (load)
   146			sa->load_sum += load * contrib;
   147		if (runnable)
   148			sa->runnable_sum += runnable * contrib << SCHED_CAPACITY_SHIFT;
   149		if (running)
   150			sa->util_sum += contrib << SCHED_CAPACITY_SHIFT;
   151	
   152		return periods;
   153	}
   154	
   155	/*
   156	 * We can represent the historical contribution to runnable average as the
   157	 * coefficients of a geometric series.  To do this we sub-divide our runnable
   158	 * history into segments of approximately 1ms (1024us); label the segment that
   159	 * occurred N-ms ago p_N, with p_0 corresponding to the current period, e.g.
   160	 *
   161	 * [<- 1024us ->|<- 1024us ->|<- 1024us ->| ...
   162	 *      p0            p1           p2
   163	 *     (now)       (~1ms ago)  (~2ms ago)
   164	 *
   165	 * Let u_i denote the fraction of p_i that the entity was runnable.
   166	 *
   167	 * We then designate the fractions u_i as our co-efficients, yielding the
   168	 * following representation of historical load:
   169	 *   u_0 + u_1*y + u_2*y^2 + u_3*y^3 + ...
   170	 *
   171	 * We choose y based on the with of a reasonably scheduling period, fixing:
   172	 *   y^32 = 0.5
   173	 *
   174	 * This means that the contribution to load ~32ms ago (u_32) will be weighted
   175	 * approximately half as much as the contribution to load within the last ms
   176	 * (u_0).
   177	 *
   178	 * When a period "rolls over" and we have new u_0`, multiplying the previous
   179	 * sum again by y is sufficient to update:
   180	 *   load_avg = u_0` + y*(u_0 + u_1*y + u_2*y^2 + ... )
   181	 *            = u_0 + u_1*y + u_2*y^2 + ... [re-labeling u_i --> u_{i+1}]
   182	 */
 > 183	int ___update_load_sum(u64 now, struct sched_avg *sa,
   184			       unsigned long load, unsigned long runnable, int running)
   185	{
   186		u64 delta;
   187	
   188		delta = now - sa->last_update_time;
   189		/*
   190		 * This should only happen when time goes backwards, which it
   191		 * unfortunately does during sched clock init when we swap over to TSC.
   192		 */
   193		if ((s64)delta < 0) {
   194			sa->last_update_time = now;
   195			return 0;
   196		}
   197	
   198		/*
   199		 * Use 1024ns as the unit of measurement since it's a reasonable
   200		 * approximation of 1us and fast to compute.
   201		 */
   202		delta >>= 10;
   203		if (!delta)
   204			return 0;
   205	
   206		sa->last_update_time += delta << 10;
   207	
   208		/*
   209		 * running is a subset of runnable (weight) so running can't be set if
   210		 * runnable is clear. But there are some corner cases where the current
   211		 * se has been already dequeued but cfs_rq->curr still points to it.
   212		 * This means that weight will be 0 but not running for a sched_entity
   213		 * but also for a cfs_rq if the latter becomes idle. As an example,
   214		 * this happens during idle_balance() which calls
   215		 * update_blocked_averages().
   216		 *
   217		 * Also see the comment in accumulate_sum().
   218		 */
   219		if (!load)
   220			runnable = running = 0;
   221	
   222		/*
   223		 * Now we know we crossed measurement unit boundaries. The *_avg
   224		 * accrues by two steps:
   225		 *
   226		 * Step 1: accumulate *_sum since last_update_time. If we haven't
   227		 * crossed period boundaries, finish.
   228		 */
   229		if (!accumulate_sum(delta, sa, load, runnable, running))
   230			return 0;
   231	
   232		return 1;
   233	}
   234	EXPORT_SYMBOL_GPL(___update_load_sum);
   235	
   236	/*
   237	 * When syncing *_avg with *_sum, we must take into account the current
   238	 * position in the PELT segment otherwise the remaining part of the segment
   239	 * will be considered as idle time whereas it's not yet elapsed and this will
   240	 * generate unwanted oscillation in the range [1002..1024[.
   241	 *
   242	 * The max value of *_sum varies with the position in the time segment and is
   243	 * equals to :
   244	 *
   245	 *   LOAD_AVG_MAX*y + sa->period_contrib
   246	 *
   247	 * which can be simplified into:
   248	 *
   249	 *   LOAD_AVG_MAX - 1024 + sa->period_contrib
   250	 *
   251	 * because LOAD_AVG_MAX*y == LOAD_AVG_MAX-1024
   252	 *
   253	 * The same care must be taken when a sched entity is added, updated or
   254	 * removed from a cfs_rq and we need to update sched_avg. Scheduler entities
   255	 * and the cfs rq, to which they are attached, have the same position in the
   256	 * time segment because they use the same clock. This means that we can use
   257	 * the period_contrib of cfs_rq when updating the sched_avg of a sched_entity
   258	 * if it's more convenient.
   259	 */
 > 260	void ___update_load_avg(struct sched_avg *sa, unsigned long load)
   261	{
   262		u32 divider = get_pelt_divider(sa);
   263	
   264		/*
   265		 * Step 2: update *_avg.
   266		 */
   267		sa->load_avg = div_u64(load * sa->load_sum, divider);
   268		sa->runnable_avg = div_u64(sa->runnable_sum, divider);
   269		WRITE_ONCE(sa->util_avg, sa->util_sum / divider);
   270	}
   271	EXPORT_SYMBOL_GPL(___update_load_avg);
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
