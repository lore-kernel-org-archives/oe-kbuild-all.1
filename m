Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A573D994
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 00:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768349758; cv=none; b=pKB/gRkBiAVA6zVGm64ifqQjwaX3qNfvD1z1xsMqGlzlAYUi9QK5FrSeN8dclJIN2zjPkwClkuruhGxWZjrDTkUHojWRP/aUeI778mjLxlJhgN6M4WChuPbVSaN/zqXBWe9shdRAJm7DiKUgwqI2h/WyqhUxH9zTy6yNSA0AYCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768349758; c=relaxed/simple;
	bh=qvUX3+e1PgwuSV6kW8+Cq6uae5zAGJ9NDQY4S772U5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BrvcACV7oe7X8ANlW5B58AOG1LlH5zBkJTDbyPCxYCh1HGxCOm2tU83dGKzUddmB3RU7NYq5iQO+Hsim5KuRQWiYBBDP86oZA0GefND85cLktxYUxrEGxAMaiZ9hlHfeYpweel6eMUskrwviDn0SFbF19RgFqbKQ9dUPtUXVfF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QuBasL9a; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuBasL9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768349757; x=1799885757;
  h=date:from:to:cc:subject:message-id;
  bh=qvUX3+e1PgwuSV6kW8+Cq6uae5zAGJ9NDQY4S772U5k=;
  b=QuBasL9aZ9v72RdXiKYc9I+HAeWCZvPV4ia76xNVD6KKXIFu5Wjh03d/
   InsLhx1WcOUZKPrM0VAHNALc00KJ02IjZb4hUnEzGzZwDljCF7DBjbVsc
   QOyhcRHkMSrweTDWyG3JUpftz6Z2fpGMnVCpt1AMenw/iXSIwRcPeNfIB
   c0shaXl8a6xChIZ3BWidqr7httBXCASczW7PMN+z8oFOMMUK+EwqI+2Ao
   NVF7vGfC0kO19II2X4d/Vplq3wAx6zr+vNs0l/Hyf1WYjrxJR2dkzKV5c
   9RG+Dgh7ZISnbhrGjaBWs4LYEB+JmaoskclLsuoPxAvyvXQkyyciTg9ov
   A==;
X-CSE-ConnectionGUID: vKJMaQBcS2Snfutynykg5w==
X-CSE-MsgGUID: CvrMw4PdQBuVZjbEpOa6Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80294168"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="80294168"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 16:15:57 -0800
X-CSE-ConnectionGUID: 8Ln/KUySRfe2LHfaxx1uiQ==
X-CSE-MsgGUID: BKejbGEfSP+vp1gvfPVhdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204161722"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2026 16:15:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfoYD-00000000FXw-1Qyg;
	Wed, 14 Jan 2026 00:15:53 +0000
Date: Wed, 14 Jan 2026 08:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 3/14] fs/proc/stat.c:34:39:
 error: incompatible type for argument 1 of 'kcpustat_field'
Message-ID: <202601140828.n7yTd5l3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   8c562e5c98799c4f2ed88dfc1c3266a4d4e2e7a8
commit: ae772e9af99e85b9a3b84e0233c17d69b253800d [3/14] sched/cputime: Correctly support vtime idle time
config: x86_64-randconfig-011-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140828.n7yTd5l3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140828.n7yTd5l3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140828.n7yTd5l3-lkp@intel.com/

Note: the frederic-dynticks/timers/core HEAD 8c562e5c98799c4f2ed88dfc1c3266a4d4e2e7a8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   fs/proc/stat.c: In function 'get_idle_time':
>> fs/proc/stat.c:34:39: error: incompatible type for argument 1 of 'kcpustat_field'
      34 |                 idle = kcpustat_field(&kcpustat_cpu(cpu), CPUTIME_IDLE, cpu);
   In file included from fs/proc/stat.c:6:
   include/linux/kernel_stat.h:103:47: note: expected 'enum cpu_usage_stat' but argument is of type 'struct kernel_cpustat *'
     103 | extern u64 kcpustat_field(enum cpu_usage_stat usage, int cpu);
         |                           ~~~~~~~~~~~~~~~~~~~~^~~~~
>> fs/proc/stat.c:34:24: error: too many arguments to function 'kcpustat_field'
      34 |                 idle = kcpustat_field(&kcpustat_cpu(cpu), CPUTIME_IDLE, cpu);
         |                        ^~~~~~~~~~~~~~
   include/linux/kernel_stat.h:103:12: note: declared here
     103 | extern u64 kcpustat_field(enum cpu_usage_stat usage, int cpu);
         |            ^~~~~~~~~~~~~~
   fs/proc/stat.c: In function 'get_iowait_time':
   fs/proc/stat.c:50:41: error: incompatible type for argument 1 of 'kcpustat_field'
      50 |                 iowait = kcpustat_field(&kcpustat_cpu(cpu), CPUTIME_IOWAIT, cpu);
   include/linux/kernel_stat.h:103:47: note: expected 'enum cpu_usage_stat' but argument is of type 'struct kernel_cpustat *'
     103 | extern u64 kcpustat_field(enum cpu_usage_stat usage, int cpu);
         |                           ~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/proc/stat.c:50:26: error: too many arguments to function 'kcpustat_field'
      50 |                 iowait = kcpustat_field(&kcpustat_cpu(cpu), CPUTIME_IOWAIT, cpu);
         |                          ^~~~~~~~~~~~~~
   include/linux/kernel_stat.h:103:12: note: declared here
     103 | extern u64 kcpustat_field(enum cpu_usage_stat usage, int cpu);
         |            ^~~~~~~~~~~~~~


vim +/kcpustat_field +34 fs/proc/stat.c

    24	
    25	u64 get_idle_time(struct kernel_cpustat *kcs, int cpu)
    26	{
    27		u64 idle, idle_usecs = -1ULL;
    28	
    29		if (cpu_online(cpu))
    30			idle_usecs = get_cpu_idle_time_us(cpu, NULL);
    31	
    32		if (idle_usecs == -1ULL)
    33			/* !NO_HZ or cpu offline or vtime so we can rely on cpustat.idle */
  > 34			idle = kcpustat_field(&kcpustat_cpu(cpu), CPUTIME_IDLE, cpu);
    35		else
    36			idle = idle_usecs * NSEC_PER_USEC;
    37	
    38		return idle;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
