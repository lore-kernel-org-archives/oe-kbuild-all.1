Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BCD2D8387
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 08:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771317391; cv=none; b=AnOYNeZTDG6vyJ+7C3HczI7QF27j29Rsf/hqBzk7FaTdsTns/wsTdl0YFNesaJpxw7cb/RYDZnhItDjlkIvfMYlt89x1gd9QH30Kj3OMiY3rM4qH9usn3VqbJ4oN73F4BWHYV1S9Ryl7a7hhwbHkZi0OTg6x7WP6bmrMwG/8YWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771317391; c=relaxed/simple;
	bh=egKiPW45lo3BOKS1vnk91pB8Qm0sDj7GZrMyD1nZSOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jeyUAHP2Yt4ZWVhhnGyNbWQoKAc/Cfe8Wf8Kkz02UYpuAZBT7VmjWtkNW7ErJbC5fSALjn+FrFFBjhxHZ3HYIcR1afpimiso6TERHKETGQVXEnahhA7EQ8fq4g8ioQ/qaoHHX1zcTqtKLfxNcBzlNtcf53/4gVtTccIiX0RvjOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3y02OFC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3y02OFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771317390; x=1802853390;
  h=date:from:to:cc:subject:message-id;
  bh=egKiPW45lo3BOKS1vnk91pB8Qm0sDj7GZrMyD1nZSOI=;
  b=i3y02OFCeZEp3K85GUP9M2NAP7p4prESFX0Y9e9xgybbUwVz1DNp4g4A
   AirVEfNXwHVqGP8hr5KsyXhWV1TorplFwH8+LU8OYVd0Uy4tlLYXdzMIX
   5hEWy2WznhtV/c7g6KkYsGuOEs98Qb5ofDfr7wTYByHMmf9tEghKG76YC
   GPigsXENK3eZyRFv/3NUCU4DAn43VYDGJwIVREA/VcgEicfWn341cbbjI
   M3zRUa8BZ0z53iH1G8UGIZ3tRM2GecSKfzWV8f/PXy5QIZuwi2tHS2TBr
   IlUmA2j/M810ozE3GP3NvJenzcPAwAVsUTVgfc1+YGpqz9Ege0Lpo7gK7
   A==;
X-CSE-ConnectionGUID: 890i4FGnSaiKMxe7Tnam1Q==
X-CSE-MsgGUID: 59D1zA5rTBG/KdI/myojaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83820568"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="83820568"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 00:36:30 -0800
X-CSE-ConnectionGUID: Cr5ceiZ9RNKsVcRzKYis4g==
X-CSE-MsgGUID: yDKFMW1ZTHO5NDPtLDU8+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="212906590"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Feb 2026 00:36:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsGZG-000000010lQ-119U;
	Tue, 17 Feb 2026 08:36:26 +0000
Date: Tue, 17 Feb 2026 16:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 15/36]
 kernel/time/hrtimer.c:1850:53: error: 'flags' undeclared
Message-ID: <202602171612.8Euz2ODo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   b4fb5671d1c3610e5afbae296e258f8f5cd9d512
commit: ca4168a4f661f966e6a0c00e852eb519f8a9ad7d [15/36] hrtimer: Use guards where appropriate
config: x86_64-randconfig-003-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171612.8Euz2ODo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171612.8Euz2ODo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171612.8Euz2ODo-lkp@intel.com/

Note: the tglx-devel/sched/hrtick HEAD b4fb5671d1c3610e5afbae296e258f8f5cd9d512 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/time/hrtimer.c: In function 'hrtimer_run_softirq':
>> kernel/time/hrtimer.c:1850:53: error: 'flags' undeclared (first use in this function)
    1850 |                 __hrtimer_run_queues(cpu_base, now, flags, HRTIMER_ACTIVE_SOFT);
         |                                                     ^~~~~
   kernel/time/hrtimer.c:1850:53: note: each undeclared identifier is reported only once for each function it appears in


vim +/flags +1850 kernel/time/hrtimer.c

21d6d52a1b7028e Thomas Gleixner     2015-04-14  1841  
e68ac2b488495fa Caleb Sander Mateos 2024-08-15  1842  static __latent_entropy void hrtimer_run_softirq(void)
5da70160462e80b Anna-Maria Gleixner 2017-12-21  1843  {
5da70160462e80b Anna-Maria Gleixner 2017-12-21  1844  	struct hrtimer_cpu_base *cpu_base = this_cpu_ptr(&hrtimer_bases);
5da70160462e80b Anna-Maria Gleixner 2017-12-21  1845  
f61eff83cec9cfa Anna-Maria Gleixner 2019-07-26  1846  	hrtimer_cpu_base_lock_expiry(cpu_base);
ca4168a4f661f96 Thomas Gleixner     2026-02-08  1847  	scoped_guard(raw_spinlock_irqsave, &cpu_base->lock) {
ca4168a4f661f96 Thomas Gleixner     2026-02-08  1848  		ktime_t now = hrtimer_update_base(cpu_base);
5da70160462e80b Anna-Maria Gleixner 2017-12-21  1849  
5da70160462e80b Anna-Maria Gleixner 2017-12-21 @1850  		__hrtimer_run_queues(cpu_base, now, flags, HRTIMER_ACTIVE_SOFT);
5da70160462e80b Anna-Maria Gleixner 2017-12-21  1851  		cpu_base->softirq_activated = 0;
5da70160462e80b Anna-Maria Gleixner 2017-12-21  1852  		hrtimer_update_softirq_timer(cpu_base, true);
ca4168a4f661f96 Thomas Gleixner     2026-02-08  1853  	}
f61eff83cec9cfa Anna-Maria Gleixner 2019-07-26  1854  	hrtimer_cpu_base_unlock_expiry(cpu_base);
5da70160462e80b Anna-Maria Gleixner 2017-12-21  1855  }
5da70160462e80b Anna-Maria Gleixner 2017-12-21  1856  

:::::: The code at line 1850 was first introduced by commit
:::::: 5da70160462e80b0ab8a6960cdd0cdd476907523 hrtimer: Implement support for softirq based hrtimers

:::::: TO: Anna-Maria Gleixner <anna-maria@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
