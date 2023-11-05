Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCFFBA46
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZS1O8KvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699186933; x=1730722933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SgHhFquMjEn7O3oh+GIzLaRnYapcWeUg3rDj4VYkA0I=;
  b=ZS1O8KvDU4k2jJSHNoWiKaxgGsvzDm7eSim9gsS/rrY9aA3IgwNGshQt
   CWzZUBlIpupLAzRvaJn5wVC6jC+Rp1Abyv0XmFeUiDE7ScVb5tnnWEzD2
   YE8WgAw09pWOT5ZNZlVW7JZtDPayP00W9fAsB3kcpJ3rutusGE/w/28kI
   ns3jxCLy0LNZ5xSYeAwuDDCHJYyWarv+su672EwkxuVR0rTTWeYNMgGQt
   3HURoGLBAuPW7rzLwFKY1ZAYWlTf3Wp4JOncsCwFNSlp2HD/NUgu55an8
   VqeCHC/V5pLaJB3nz7sFvP1sHYcitC2izMiGYMPbmTAcD/dA74sS1aQ2e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="392009502"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="392009502"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 04:22:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="935551880"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="935551880"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Nov 2023 04:22:08 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzc8k-0005Pq-1F;
	Sun, 05 Nov 2023 12:22:06 +0000
Date: Sun, 5 Nov 2023 20:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 18786/24072]
 kernel/sched/pelt.c:260:6: warning: no previous prototype for function
 '___update_load_avg'
Message-ID: <202311052049.CN6dgFHA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   85ccc4a25c6007d2ac4284565b1864f9abd44808
commit: ed6f0796dd282d82a7e9cc43a5879e8a0523909b [18786/24072] ANDROID: sched/pelt: export ___update_load_[sum|avg]
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231105/202311052049.CN6dgFHA-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311052049.CN6dgFHA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311052049.CN6dgFHA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/pelt.c:183:5: warning: no previous prototype for function '___update_load_sum' [-Wmissing-prototypes]
   int ___update_load_sum(u64 now, struct sched_avg *sa,
       ^
   kernel/sched/pelt.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ___update_load_sum(u64 now, struct sched_avg *sa,
   ^
   static 
>> kernel/sched/pelt.c:260:6: warning: no previous prototype for function '___update_load_avg' [-Wmissing-prototypes]
   void ___update_load_avg(struct sched_avg *sa, unsigned long load)
        ^
   kernel/sched/pelt.c:260:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ___update_load_avg(struct sched_avg *sa, unsigned long load)
   ^
   static 
   2 warnings generated.


vim +/___update_load_avg +260 kernel/sched/pelt.c

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
