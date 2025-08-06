Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6EE1805A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 02:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754446163; cv=none; b=T8k3q6Vqk5IZajzXCk8CPSLxgXajY2QsU419GuOFna/6XRYAvftQH3cjDxrTdfKwRc6WPNbUPKnRkIAcVv+On0mGa3sD0jmlMRO0rn5Tsrwlllu7Tv6HWsnxneWiaKaq2f8x0OpFxWfBC8lIuFhNvIZJDDzpAii1xER2PDiVSS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754446163; c=relaxed/simple;
	bh=WuHakVHD86lw+29OgymB+lA7wn6tbxPG2yhbDwNMRzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o9b90EpB0qEzuuiqNwRKNFgBkbmUINspu9pNRTGCyTZgmxhlahNNTBa1gWYLdZC/FQj+FbV/aYBVmUVlnxq5XdbsucLEtOGJYrJJ970OehF01TECxTFOIZQmvrTVzs8M+1FEd+GFdJD/NLrJBbdBTJhreEo6aYh0AlgkzA1GI9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0wP0X7m; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0wP0X7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754446162; x=1785982162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WuHakVHD86lw+29OgymB+lA7wn6tbxPG2yhbDwNMRzc=;
  b=V0wP0X7mtWwDJdobG9BsMhLsfE274CqmLlu9VRuIWk/lgPlQT8Mua+lX
   +fBMRNXQyp4/1d3jvPFhscn2rGPjDZVx8yKmc7Zz6oXZT+OTIkiX4fEMI
   2YgGql798Vxgp+1lKF8rxc0GU9K81K29/Zlz+h4Rz6YQlrfsAyPEwcbTI
   77bGhaKBa3FzuBetjdN9lrjTyZ8m2/mMJECxWQCfB9oo42lguVmd23f2B
   jYthE/HW+LSmVciDs0yOzGfGcecUyVZvBMAX+FFRIrT8C2wgE0aH/4C+Q
   LYKCKgVdLcvgZIJ4KRTaIr+knHgl++BMd/k9IAQb0P24zWwIFNczPDN94
   w==;
X-CSE-ConnectionGUID: euj6K0YBSmW5DT2mGWR91Q==
X-CSE-MsgGUID: 1pUrcF/DRdyxvblC+ZTlRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56898956"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56898956"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 19:09:21 -0700
X-CSE-ConnectionGUID: +NzzllWHRfmr22SQwcRCOA==
X-CSE-MsgGUID: 8+2ZEbzFR8u0i/NH/N/Sow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164550732"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 05 Aug 2025 19:09:20 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujTaf-000279-2E;
	Wed, 06 Aug 2025 02:09:17 +0000
Date: Wed, 6 Aug 2025 04:09:05 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 kernel/sched/core.c:1361:21: warning: 'uclamp_mutex' defined but not used
Message-ID: <202508060441.MM0R2ly9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   440f245a6945def0d91684fef68e7737ea3bac58
commit: d2d6422f8bd17c6bb205133e290625a564194496 [1/1] x86: Allow to enable PREEMPT_RT.
config: i386-buildonly-randconfig-2004-20250806 (https://download.01.org/0day-ci/archive/20250806/202508060441.MM0R2ly9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060441.MM0R2ly9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060441.MM0R2ly9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/seqlock.h:19,
                    from include/linux/dcache.h:11,
                    from include/linux/fs.h:8,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:10:
>> kernel/sched/core.c:1361:21: warning: 'uclamp_mutex' defined but not used [-Wunused-variable]
    1361 | static DEFINE_MUTEX(uclamp_mutex);
         |                     ^~~~~~~~~~~~
   include/linux/mutex.h:101:22: note: in definition of macro 'DEFINE_MUTEX'
     101 |         struct mutex mutexname = __MUTEX_INITIALIZER(mutexname)
         |                      ^~~~~~~~~


vim +/uclamp_mutex +1361 kernel/sched/core.c

71f8bd4600521f kernel/sched.c      Ingo Molnar     2007-07-09  1349  
69842cba9ace84 kernel/sched/core.c Patrick Bellasi 2019-06-21  1350  #ifdef CONFIG_UCLAMP_TASK
2480c093130f64 kernel/sched/core.c Patrick Bellasi 2019-08-22  1351  /*
2480c093130f64 kernel/sched/core.c Patrick Bellasi 2019-08-22  1352   * Serializes updates of utilization clamp values
2480c093130f64 kernel/sched/core.c Patrick Bellasi 2019-08-22  1353   *
2480c093130f64 kernel/sched/core.c Patrick Bellasi 2019-08-22  1354   * The (slow-path) user-space triggers utilization clamp value updates which
2480c093130f64 kernel/sched/core.c Patrick Bellasi 2019-08-22  1355   * can require updates on (fast-path) scheduler's data structures used to
2480c093130f64 kernel/sched/core.c Patrick Bellasi 2019-08-22  1356   * support enqueue/dequeue operations.
2480c093130f64 kernel/sched/core.c Patrick Bellasi 2019-08-22  1357   * While the per-CPU rq lock protects fast-path update operations, user-space
2480c093130f64 kernel/sched/core.c Patrick Bellasi 2019-08-22  1358   * requests are serialized using a mutex to reduce the risk of conflicting
2480c093130f64 kernel/sched/core.c Patrick Bellasi 2019-08-22  1359   * updates or API abuses.
2480c093130f64 kernel/sched/core.c Patrick Bellasi 2019-08-22  1360   */
2480c093130f64 kernel/sched/core.c Patrick Bellasi 2019-08-22 @1361  static DEFINE_MUTEX(uclamp_mutex);
2480c093130f64 kernel/sched/core.c Patrick Bellasi 2019-08-22  1362  

:::::: The code at line 1361 was first introduced by commit
:::::: 2480c093130f64ac3a410504fa8b3db1fc4b87ce sched/uclamp: Extend CPU's cgroup controller

:::::: TO: Patrick Bellasi <patrick.bellasi@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
