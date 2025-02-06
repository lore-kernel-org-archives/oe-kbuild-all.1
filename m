Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8892417D2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 22:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882468; cv=none; b=IWYZOsNYSBE4f3IEybi/foucd4UgqVPumECy+92IcEpFGovX/E+The4dMH5ZFuvOPC6BGscWXZW8IYh998c3LATygeG1uPiVVwTS5dRpMEYiz5k/E36WUynGxfQmrscWvCc7h4cCFVK5C5tnaav+p2AV0oMZIUPnrGw6atmDS3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882468; c=relaxed/simple;
	bh=RAIzp3tBXLPA4K+VX5xl9vBBGpJQirIOPhiTLIejoQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PELpiMmRFpN8GuWsoDTAKc/dV+xr7MoyMVBffmBeIVDes1BgXfT7ERmqwivt3whTuFz7ciZgjoi+Dc+56wtalIrbpY0RQFs74vP0msbDGSVvySgvfJRhSQ2fh85LKIUbW57ZkkkPckebhL98MUpQN2VbXCRFsMTUmLz87vEXsgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3D99c7W; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3D99c7W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738882467; x=1770418467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RAIzp3tBXLPA4K+VX5xl9vBBGpJQirIOPhiTLIejoQo=;
  b=B3D99c7WNJtOV5N0xCu6qxBqmrQHqFZwJFTpdyw+O3nooNk8/sJJIq2r
   182aln/OCwjLMo7zz+40b8EJ3P66XYmGtXwmNAf8Yd6NITtm9kSgs/5PT
   NPf6+f4PbFCB04g6vQ92m+SALBkhc5AjWf7afbMGNZ4cql80c7N8oofju
   FAc/1brGZEiJv3FFs0Gq+j4eZpSffB9tEjHlFJT50Tj/EzSY6igVL/C+t
   tZDBXl2Nqpmbj0OrAbnUmRSx4kxXmNGwRXi4ApxIDtHQyJwld+VMMQ20P
   H1qNlA9z2v5X4cvtvhQFJRqacXDUERYv13psv/Ao3LEta4Vf4CK38c7UJ
   Q==;
X-CSE-ConnectionGUID: lNCkZnGXSpGNhdr5FAgw9w==
X-CSE-MsgGUID: Gxtk8wEkSvi/I0uqV90v+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39643476"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39643476"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 14:54:27 -0800
X-CSE-ConnectionGUID: 3SQirPYORLG1XLF53SlrKw==
X-CSE-MsgGUID: kodT+i6SRECOLOp4jy3Njw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134588099"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Feb 2025 14:54:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgAlL-000xUH-1K;
	Thu, 06 Feb 2025 22:54:23 +0000
Date: Fri, 7 Feb 2025 06:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:task/work 5/6]
 include/linux/sched/isolation.h:93:1: warning: no return statement in
 function returning non-void
Message-ID: <202502070636.m8tkFw1T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git task/work
head:   3a5b43d6075ec915d0bf17d38d15f9c75d05dc26
commit: 1526f337fd88fdf6bf5184dd1d8ad334a40baac2 [5/6] sched/isolation: Introduce isolated task work
config: csky-randconfig-002-20250207 (https://download.01.org/0day-ci/archive/20250207/202502070636.m8tkFw1T-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070636.m8tkFw1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070636.m8tkFw1T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/time/hrtimer.c:41:
   include/linux/sched/isolation.h: In function 'isolated_task_work_queue':
>> include/linux/sched/isolation.h:93:1: warning: no return statement in function returning non-void [-Wreturn-type]
      93 | static inline int isolated_task_work_queue(void) { }
         | ^~~~~~
   kernel/time/hrtimer.c: At top level:
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:124:35: warning: initialized field overwritten [-Woverride-init]
     124 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')


vim +93 include/linux/sched/isolation.h

    90	
    91	extern void isolated_task_work_init(struct task_struct *tsk);
    92	#else
  > 93	static inline int isolated_task_work_queue(void) { }
    94	static inline void isolated_task_work_init(struct task_struct *tsk) { }
    95	#endif /* CONFIG_NO_HZ_FULL */
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
