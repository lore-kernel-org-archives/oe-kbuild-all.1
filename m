Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070E1A945
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 07:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771054461; cv=none; b=F+U2hbtH/kOt153KEN/OsjhzMbpqgoDoEQqxgMhdk7dQNPKxcWhVYV2zi63b4qOacrfgMPjj2ptC/8sNfMeWYPleoV7L1Z8NAtU7veLC5HHA1/GQphL0/zXmrczNOGrgxqZ4zlp62OfqmtFtUUlKWzTqwB2OjT2Ts6TMORJ8j/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771054461; c=relaxed/simple;
	bh=3yrTX0M01SD+u/QxQAbZzCJcPfSSm6RntOr+7NAyhi8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WZPRfWa+4TXjzZdClWPBFufRV24D9nIgRxgjdnN0jFmJ4B5XfaWaAQLU6m6vG9Mh6Ohw9iCY/dUUufTKt1ccfNiqzj4aWt9i833aDA4DxOVQU+ioTnNl1HIloU/CkjmVV08lbRE9aQpqnqLt/ywBKeFnYA4ee/xiPL3we6jwXKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCD6Gkpf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCD6Gkpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771054459; x=1802590459;
  h=date:from:to:cc:subject:message-id;
  bh=3yrTX0M01SD+u/QxQAbZzCJcPfSSm6RntOr+7NAyhi8=;
  b=hCD6GkpfzMIHsiOdLmXAS5F5bPfcL6mGmkRhRKhYU/u5qpv5U5LWk13S
   vgXseBne2EyrP9ui8aRfqzaQDFmUSZTImAjTBJqQ220qZurRJPEDosV+x
   IeOlV7C26E/Ptw3o84PJ2R3AcU/IMjDyEhDgJl0Y4geIPr1yJ4+X+sSlL
   oH3pKd4IJBjLQSip8ZHFvVCTjRpI1Jks466OirVlefouRFBZbH6/3lRwe
   bE7SrW26jEhgKI6rcOupXJyotQGQp1aUzq+jfK6cS3+IXEmA990aCuZd9
   bnZNyrnZpD6r0bpq38XDAQuOA5njCOZoca95iGkdZf5wuyLhL5XbOae7Y
   w==;
X-CSE-ConnectionGUID: hz8mTFzCQHSf+wWTojUbKg==
X-CSE-MsgGUID: YgqWtZR2ScGyWOpQjagLpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71942314"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="71942314"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 23:34:18 -0800
X-CSE-ConnectionGUID: qkzPJH7USIiCdVWcz9mefA==
X-CSE-MsgGUID: 4utravLFRDWSAWWnola0WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="212383737"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Feb 2026 23:34:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrAAQ-00000000wLs-3yYU;
	Sat, 14 Feb 2026 07:34:14 +0000
Date: Sat, 14 Feb 2026 15:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 kernel/sched/core.c:1361:21: warning: 'uclamp_mutex' defined but not used
Message-ID: <202602141516.pPXw1EnU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   61840435f11e28e97d67ea95baef27dddb8a4b2e
commit: d8fccd9ca5f905533dc6c26cfd1f91beb8691c95 [2/2] arm64: Allow to enable PREEMPT_RT.
config: arm64-randconfig-004-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141516.pPXw1EnU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141516.pPXw1EnU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141516.pPXw1EnU-lkp@intel.com/

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
