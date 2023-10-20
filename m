Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDD0CA43
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 06:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLYYz4fx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697783095; x=1729319095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6KS61vR+c3uDRI3JXjztnn2lCCO9vPbmq9P7sdFfrFg=;
  b=JLYYz4fx+tZeY9Ts4rZ46C22J8/7/YLlTIsfvlU2GKHayaUTHQ82cgYX
   T/K/aVUG3dVUDD2ecsoCzzgAc5AveCn3jvSSHPsBzIoy17v6DzdOfaR5D
   2339DVZW4cVxOXwLya+blr7eMBmdsnw5mxn90Ssl6FG7VYYeotfHKOaIl
   WFX6A4h9wQbHwqGDQpupbB0lMzicTFCCly2ditVszgmVBHmxR/8pDg47h
   jbBB4JePReAnx3JapIlmgFrXd81OHoRgWNpxGvApGyppQoUXb3K7hZCIN
   UFSqP8WocNuXTurGiP55DctWou+kkIn5adJseqFj3CsTP5uFPaCcXEtw6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="417569781"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="417569781"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 23:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="707136980"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="707136980"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Oct 2023 23:24:53 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtiwF-00038i-0K;
	Fri, 20 Oct 2023 06:24:51 +0000
Date: Fri, 20 Oct 2023 14:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:rcu/dev 4/4] include/linux/rcupdate.h:137:16:
 error: 'return' with a value, in function returning void
Message-ID: <202310201433.rJ2n4fKK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/dev
head:   f9a3a161b4eb14012fe048077374c34046b770a3
commit: f9a3a161b4eb14012fe048077374c34046b770a3 [4/4] rcu/tasks: Delay creation of RCU-Tasks gp kthread to real idle code
config: um-defconfig (https://download.01.org/0day-ci/archive/20231020/202310201433.rJ2n4fKK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201433.rJ2n4fKK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201433.rJ2n4fKK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/um/user-offsets.c:17:6: warning: no previous prototype for 'foo' [-Wmissing-prototypes]
      17 | void foo(void)
         |      ^~~
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/x86/um/shared/sysdep/kernel-offsets.h:3,
                    from arch/um/kernel/asm-offsets.c:1:
   include/linux/rcupdate.h: In function 'rcu_spawn_tasks_kthread':
>> include/linux/rcupdate.h:137:16: error: 'return' with a value, in function returning void [-Werror=return-type]
     137 |         return 0;
         |                ^
   include/linux/rcupdate.h:135:20: note: declared here
     135 | static inline void rcu_spawn_tasks_kthread(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/um/shared/sysdep/kernel-offsets.h: At top level:
   arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous prototype for 'foo' [-Wmissing-prototypes]
       9 | void foo(void)
         |      ^~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/um/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/return +137 include/linux/rcupdate.h

   131	
   132	#ifdef CONFIG_TASKS_RCU
   133	int rcu_spawn_tasks_kthread(void);
   134	#else
   135	static inline void rcu_spawn_tasks_kthread(void)
   136	{
 > 137		return 0;
   138	}
   139	#endif
   140	
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
