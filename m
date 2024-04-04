Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B507B20B35
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 04:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712203231; cv=none; b=g81lcZws9/Ed57Hs8SuM3glxgWWABeYIGuHCiArExfsw+smFfXrvYBL3PYPs9tCJIfLh8OG37ZPWMU7j6O5KDlPZNlzGx1/RhlxDFpHTmkmriFsF1IABUG3kO3CwAKunWqMwR6BeqoyIWtcV5F5UwdTuHOgW8SXUYE8E/8eKZqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712203231; c=relaxed/simple;
	bh=9q3nqc1PmF8Muk3LV2FSJT9rq4bi7AamOGYy8hEwPjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cXNXOVSjO6t/6ZjpaEpyiRPy+rQXfRmef2Y5qiewQJzA5pK4BPw8eSFzA8mU6vsELOD90KwbxAINqDUvN9m3FRhHPXRiMSUSo5dsvys+5+D7GWOvK5hpyOSVNZrC/E/n7LgpaI+pK4vdgdqRDxfGoVZKWZikDhIxjUpSEFb3wto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyYyZ9Fk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyYyZ9Fk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712203228; x=1743739228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9q3nqc1PmF8Muk3LV2FSJT9rq4bi7AamOGYy8hEwPjU=;
  b=IyYyZ9FkD2ttmnWA+uo5F0vbcqZvJ2JpdM5x19hNRyL5fkKkGW9819BA
   0xylLoJoX5cUgHmy7Ke6beVeUPgLgPn9Sm34WUgQnLkQrs/MIvMtdImgt
   qHWLHO/yg9LHWVPAz8RPUAuIQ2MfWafqTN1YDIJi547/uqOP0nJY/C38x
   JlRlOPzOLwKUnyXQZ1g7k/OrcLcb1BCGsd0oEwn7BmMGxIrHO1A1oVZx5
   X38q4X/ucWBo1zHzBRJEial9wugN/XQhqJyy9TQ+MfP4NrUE/ezyydhyq
   diMU7kTQsK+J3V/eyuguSuzyxypvVohjF5LX1Spppao6s6m2ECNyr96bT
   A==;
X-CSE-ConnectionGUID: a4rq5PGcRTeNu2o2+p8Rkg==
X-CSE-MsgGUID: pdGNfHMhTAyGZQoXq3K4Mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11242885"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="11242885"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 21:00:28 -0700
X-CSE-ConnectionGUID: s+XyQFzvSrmvLaSy7JRPtg==
X-CSE-MsgGUID: G2suzA2pRPq6IdajSutl3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="18629253"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Apr 2024 21:00:27 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsEH2-0000aM-1H;
	Thu, 04 Apr 2024 04:00:24 +0000
Date: Thu, 4 Apr 2024 11:59:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 20143/20147] kernel/sched/rt.c:1647:6:
 warning: no previous prototype for function 'cpu_busy_with_softirqs'
Message-ID: <202404041114.MiHCeriw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   5dd0c4814fa5d61e0944fccd38547e6cb94635eb
commit: dcdec80d6bb8a786f5d5b24b4af51e0e15c534a9 [20143/20147] ANDROID: Export cpu_busy_with_softirqs()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240404/202404041114.MiHCeriw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041114.MiHCeriw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041114.MiHCeriw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
>> kernel/sched/rt.c:1647:6: warning: no previous prototype for function 'cpu_busy_with_softirqs' [-Wmissing-prototypes]
   bool cpu_busy_with_softirqs(int cpu)
        ^
   kernel/sched/rt.c:1647:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool cpu_busy_with_softirqs(int cpu)
   ^
   static 
   In file included from kernel/sched/build_policy.c:49:
   kernel/sched/pelt.c:182:1: warning: no previous prototype for function '___update_load_sum' [-Wmissing-prototypes]
   ___update_load_sum(u64 now, struct sched_avg *sa,
   ^
   kernel/sched/pelt.c:181:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   kernel/sched/pelt.c:262:1: warning: no previous prototype for function '___update_load_avg' [-Wmissing-prototypes]
   ___update_load_avg(struct sched_avg *sa, unsigned long load)
   ^
   kernel/sched/pelt.c:261:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
   kernel/sched/pelt.c:484:5: warning: no previous prototype for function 'sched_pelt_multiplier' [-Wmissing-prototypes]
   int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
       ^
   kernel/sched/pelt.c:484:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
   ^
   static 
   4 warnings generated.


vim +/cpu_busy_with_softirqs +1647 kernel/sched/rt.c

  1631	
  1632	#ifdef CONFIG_RT_SOFTIRQ_AWARE_SCHED
  1633	/*
  1634	 * Return whether the given cpu is currently non-preemptible
  1635	 * while handling a potentially long softirq, or if the current
  1636	 * task is likely to block preemptions soon because it is a
  1637	 * ksoftirq thread that is handling softirqs.
  1638	 */
  1639	bool cpu_busy_with_softirqs(int cpu)
  1640	{
  1641		u32 softirqs = per_cpu(active_softirqs, cpu) |
  1642			       __cpu_softirq_pending(cpu);
  1643	
  1644		return softirqs & LONG_SOFTIRQ_MASK;
  1645	}
  1646	#else
> 1647	bool cpu_busy_with_softirqs(int cpu)
  1648	{
  1649		return false;
  1650	}
  1651	#endif /* CONFIG_RT_SOFTIRQ_AWARE_SCHED */
  1652	EXPORT_SYMBOL_GPL(cpu_busy_with_softirqs);
  1653	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
