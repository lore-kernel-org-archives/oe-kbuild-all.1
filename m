Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F410C5E0AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6krcum3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702569453; x=1734105453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w3PSyjX6wVV85/dkiC6neSjh286P4y72s3f3AM7bKAc=;
  b=U6krcum3lRzqGSSOKbQkglcdsboBi3Xpx0ou3DZfD6ZlfR4VtqTDDkD7
   vXaIjhec3bGO5Axx/SdHhY6CuN9GPW22RRuhDjra2vmBiHYDCmEIqY+9G
   Jl9P3hhI6nFortawuFvVbRM4mlKOGPAjQeP1pilGoaapoapl8kXb+BSPf
   jHnxTrl+/qraMz2X+ZHTH/WapzLTlFrVvgSFvkhhRapxJgM18dB6pB84G
   McnqNx9sSb1Imr/SGR22zkY6qGEyJ8TTWgCCPZYBHou9dyDjw/Ou5+kDH
   pMye3Pyw7blldUTSoLXL6Np3Xs21vQggeWXDK8gN5yo/fBnz+tz5eHUmT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="380123959"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="380123959"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="777938985"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="777938985"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Dec 2023 07:57:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDo5Y-000MFa-0i;
	Thu, 14 Dec 2023 15:57:28 +0000
Date: Thu, 14 Dec 2023 23:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/2] kernel/sched/pelt.c:183:5:
 error: no previous prototype for '___update_load_sum'
Message-ID: <202312142343.kUE0Z81e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   5feaf92b247cfa3dd98eefa2915dfb3b305ac2d2
commit: e8762ad4243943f3b5b3bd5289b3f6e6243545e8 [1/2] ANDROID: sched: Add vendor hook for util-update related functions
config: x86_64-sof-customedconfig-atom-defconfig (https://download.01.org/0day-ci/archive/20231214/202312142343.kUE0Z81e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312142343.kUE0Z81e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312142343.kUE0Z81e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/pelt.c:183:5: error: no previous prototype for '___update_load_sum' [-Werror=missing-prototypes]
     183 | int ___update_load_sum(u64 now, struct sched_avg *sa,
         |     ^~~~~~~~~~~~~~~~~~
>> kernel/sched/pelt.c:260:6: error: no previous prototype for '___update_load_avg' [-Werror=missing-prototypes]
     260 | void ___update_load_avg(struct sched_avg *sa, unsigned long load)
         |      ^~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/___update_load_sum +183 kernel/sched/pelt.c

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
