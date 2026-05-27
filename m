Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20A2384250
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 03:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852857; cv=none; b=XZ8Qg8RXBNx4EcUGSTXgWTKJ6qX+uxEByPJOV98q2Sj7JMWR+vFlOHHi7X4GfvjOCrEtiybUdAGH+/33Lwi8YQe0DtKjMAopSLehx7rzYJX/V6nQKKcrJgWkijDv1TCVqrQu4OcMcrBFchIzazEFKRR8CrTUHUV5vFZnMH9f6lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852857; c=relaxed/simple;
	bh=pXcvPY/1mdSRNUQr5bTbLEfT6d8bjPSx6vww9U8I7ms=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bY7zhwhQKtDXH2xYL6mvEoaMcECfDCEOjFdzF13HPioigy/HBPirlyXIIHcHerta8cdBewDDe95xMxE59VxP8SVpUELZyStauPGM+f7dtEDIhG8lCwsc1fRj3XMPbUPmjQ2kERIXfyQIx8vkozL4unW8WrlwCUbCYxHfIvPPmXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcMbIGau; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcMbIGau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779852854; x=1811388854;
  h=date:from:to:cc:subject:message-id;
  bh=pXcvPY/1mdSRNUQr5bTbLEfT6d8bjPSx6vww9U8I7ms=;
  b=CcMbIGauyev7C8X2rXqrDdrjYIn+pFachAUQgr9j3a8n7kuJktuwfQxl
   M2WQjnSVQ5gXNsCS40/rZVm9yozPmUc2mAQVkzPKJXXwHYWHEaKK/vAvh
   Hh6nmSiT4Onf3fLTJc+ujSOnz8z2FlalaazKE5PvM8jbDcVlJxdMQVC/B
   AhKVu3ou2UySkU53Lmexd+QtyopnCdItksYLQx5jZKvAu8ek9ZaOIFdmt
   xYGTz6zBKV1BrpagfKrXsZNokIGf7n9MABmKTK93/4j/GmZlKfRILpk9v
   GoXuGSmsXGGPg0OnEMgjj2uzifTIzNch9JlrLotf/PLbiThjsI+1kdCp3
   w==;
X-CSE-ConnectionGUID: l9+JeFxNSSinppxrkJEddw==
X-CSE-MsgGUID: dssHs1rGTgC0Z8MdUBJXhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79824671"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="79824671"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 20:34:12 -0700
X-CSE-ConnectionGUID: 1bU/iNZFQXm5bMdH8hkfwA==
X-CSE-MsgGUID: s2OHA7l0TB6JfAic379xOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="241947043"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 May 2026 20:34:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS521-000000003L6-0u9f;
	Wed, 27 May 2026 03:34:09 +0000
Date: Wed, 27 May 2026 11:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 2/2]
 kernel/sched/core.c:1361:21: warning: 'uclamp_mutex' defined but not used
Message-ID: <202605271114.wf6VDNTy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   7d38f5b0e4b0d06970e261174e220a997a0908e7
commit: d8fccd9ca5f905533dc6c26cfd1f91beb8691c95 [2/2] arm64: Allow to enable PREEMPT_RT.
config: arm64-randconfig-001-20260527 (https://download.01.org/0day-ci/archive/20260527/202605271114.wf6VDNTy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271114.wf6VDNTy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d8fccd9ca5f9 ("arm64: Allow to enable PREEMPT_RT.")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271114.wf6VDNTy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/seqlock.h:19,
                    from include/linux/dcache.h:11,
                    from include/linux/fs.h:8,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:10:
>> kernel/sched/core.c:1361:21: warning: 'uclamp_mutex' defined but not used [-Wunused-variable]
    static DEFINE_MUTEX(uclamp_mutex);
                        ^~~~~~~~~~~~
   include/linux/mutex.h:101:15: note: in definition of macro 'DEFINE_MUTEX'
     struct mutex mutexname = __MUTEX_INITIALIZER(mutexname)
                  ^~~~~~~~~


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
