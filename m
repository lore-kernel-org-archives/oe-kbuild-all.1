Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6088B746E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 01:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712193442; cv=none; b=Yvsk6TG76fwIAYb0t7ykScUIuJqn6bUItcNHOZ/jfcPL8P1VALHqccNBLD9dujGoXvnWbDNO0+0L870a2EZJ2fzvjkoR3Kf2oMy93JfyzxbWmNa/0ntix52o4zCeEqmusPWZs0GDzDWhwRY2iVJnrr6xEAVb8RhvDV1LGTVYKxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712193442; c=relaxed/simple;
	bh=gWZL6hYqd2dSNf43tPNyy0JDYs/rBfbgEhHIqG+4BYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SjjfFhRNI4GkxFF0/glL9e/FC+s/C4TKqfeUtuvWXO6KUSd8eRT74rnf2P/OEB4y0sDQMwygWJvxmasGR7jKzPAwyt1CFL+WQ2J+qNOE2n0UlR8gUesz0/oiolZ7ykvAUfpyZBk6KeVGORVVXDO/UyDdoepZAWLQeN2TrCzyBr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUBr9/IP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUBr9/IP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712193442; x=1743729442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gWZL6hYqd2dSNf43tPNyy0JDYs/rBfbgEhHIqG+4BYQ=;
  b=BUBr9/IPG07KFLMHEuhGWq1W4uRnmI/vIF163DoEq+rAMTaUFqNoUsaA
   1jSkqZAVCBh6zs5L+NhrTBetiZOKAuDWwLIkECTi3IFm/wO56ecasH14r
   m1X0E7mCPZl7Plo8px3FwNG1rcdaxJtQxp8e8QX0ewhY9cTvN2MDG354J
   p0jmcUfS0QAJJTP2HcZ9R/NNQO46qP+twogBOXPTp9W3lxNCflVqFAPDV
   ioiusyYByQiB4//C/mFp9fV6RBFNWF9nCmTFfouobbtcBslY/7zTjcUKa
   bqF73yeCnLqQezBvP7RbDbesL610N2gcTiSidNrqNiZYlot0IdjSR/GGN
   w==;
X-CSE-ConnectionGUID: FuMQmqlRQyi8MnYEuA7fWQ==
X-CSE-MsgGUID: JzAwrvadQHWsoQQwikjz/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7628465"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7628465"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 18:17:21 -0700
X-CSE-ConnectionGUID: 0kvYiR1jS0OEs7BZx+SsIA==
X-CSE-MsgGUID: OvDNNpkRRIqEVP0KeIjMLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="18596674"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Apr 2024 18:17:20 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsBjB-0000Qc-1L;
	Thu, 04 Apr 2024 01:17:17 +0000
Date: Thu, 4 Apr 2024 09:16:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 20143/20147] kernel/sched/rt.c:1647:6:
 warning: no previous prototype for 'cpu_busy_with_softirqs'
Message-ID: <202404040940.bUxGQYs5-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240404/202404040940.bUxGQYs5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040940.bUxGQYs5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040940.bUxGQYs5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
>> kernel/sched/rt.c:1647:6: warning: no previous prototype for 'cpu_busy_with_softirqs' [-Wmissing-prototypes]
    1647 | bool cpu_busy_with_softirqs(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:49:
   kernel/sched/pelt.c:182:1: warning: no previous prototype for '___update_load_sum' [-Wmissing-prototypes]
     182 | ___update_load_sum(u64 now, struct sched_avg *sa,
         | ^~~~~~~~~~~~~~~~~~
   kernel/sched/pelt.c:262:1: warning: no previous prototype for '___update_load_avg' [-Wmissing-prototypes]
     262 | ___update_load_avg(struct sched_avg *sa, unsigned long load)
         | ^~~~~~~~~~~~~~~~~~
   kernel/sched/pelt.c:484:5: warning: no previous prototype for 'sched_pelt_multiplier' [-Wmissing-prototypes]
     484 | int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
         |     ^~~~~~~~~~~~~~~~~~~~~


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
