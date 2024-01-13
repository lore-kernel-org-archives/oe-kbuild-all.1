Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0C7F9D2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 05:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xm4rgRCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705124976; x=1736660976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p1OpVHWwywzF0aCHUwGzw4bO8wCeIwJTcSsrxU/LtrI=;
  b=Xm4rgRCmIdd2pLGt1ACLd72w1F5WQbdOzcE6mCEFg07sKpGww7ZJch4q
   BkkrPYrIQW+tVmBu5HqYCnTOIYkpjULWzB2WNdCNWQJ4bDMIBhno/F7pu
   i716y0PFC6ty9578Oih5fdA2wJ5yOM09tFpqR3EgFrb3INWx8jZcYFPQx
   1SoC1MpOiijApIUsNp9svECmtRQP59hsMNcfZU0k0/Rc9mQ4mSk+JvLrj
   GaRfRM7P3DJDOERzxBsqVWlW/taZn/pBggfDJgdGy5nHYpXbgOisxoBrO
   jndRaEPsraKvHlZsyeB1xlAIawce8DRHuR1PARFsrIB+iXnr/eHyCILz2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="20829111"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="20829111"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 21:49:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="1114427846"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="1114427846"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Jan 2024 21:49:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOWtf-000A9E-2l;
	Sat, 13 Jan 2024 05:49:31 +0000
Date: Sat, 13 Jan 2024 13:48:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11901/21544]
 kernel/time/tick-broadcast.c:43:13: warning:
 'tick_broadcast_oneshot_offline' declared 'static' but never defined
Message-ID: <202401131349.ZYw3yKr8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 0a442c1bf00aedf0f7b3d003bfca2f4690dd96d5 [11901/21544] tick: Remove outgoing CPU from broadcast masks
config: x86_64-randconfig-001-20240112 (https://download.01.org/0day-ci/archive/20240113/202401131349.ZYw3yKr8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131349.ZYw3yKr8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131349.ZYw3yKr8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/tick-broadcast.c:43:13: warning: 'tick_broadcast_oneshot_offline' declared 'static' but never defined [-Wunused-function]
      43 | static void tick_broadcast_oneshot_offline(unsigned int cpu);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/tick-broadcast.c: In function 'tick_broadcast_control':
   kernel/time/tick-broadcast.c:383:39: warning: this statement may fall through [-Wimplicit-fallthrough=]
     383 |                 tick_broadcast_forced = 1;
         |                 ~~~~~~~~~~~~~~~~~~~~~~^~~
   kernel/time/tick-broadcast.c:384:9: note: here
     384 |         case TICK_BROADCAST_ON:
         |         ^~~~
   kernel/time/tick-broadcast.c:885: warning: Function parameter or member 'bc' not described in 'tick_broadcast_setup_oneshot'


vim +43 kernel/time/tick-broadcast.c

    38	
    39	#ifdef CONFIG_TICK_ONESHOT
    40	static void tick_broadcast_setup_oneshot(struct clock_event_device *bc);
    41	static void tick_broadcast_clear_oneshot(int cpu);
    42	static void tick_resume_broadcast_oneshot(struct clock_event_device *bc);
  > 43	static void tick_broadcast_oneshot_offline(unsigned int cpu);
    44	#else
    45	static inline void tick_broadcast_setup_oneshot(struct clock_event_device *bc) { BUG(); }
    46	static inline void tick_broadcast_clear_oneshot(int cpu) { }
    47	static inline void tick_resume_broadcast_oneshot(struct clock_event_device *bc) { }
    48	static inline void tick_broadcast_oneshot_offline(unsigned int cpu) { }
    49	#endif
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
