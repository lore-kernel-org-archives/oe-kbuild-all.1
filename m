Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747D366
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 05:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678166180; x=1709702180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bcm5Jd5I1xziAJILazWgGTDuJMS1wNnmMzvRAj/ljj0=;
  b=erRv2JxVwpYeQuk/FEa52RPZJJWwlsuOCdw9hGViu1nXUjqb6k1Q0PJY
   LvmTMUr9OY7AVN98nh7yKd84OHkjFinEY8n1RyVHZBVfubjALNcOIzTyU
   BPEJEnJxo8tLmsXL8eySyzeO1wfVKvoRL0qh0fVse3tLkU6VFHnXgV/LH
   M10XnrYdMOFykSbs51Su1yoZkGUu0tQwuYgvVNmJYefd+ml+P1yBA5uc2
   FOyxp6Z7I9n4gRlYw3PMElsCei7JlktTo6aIUpEB+aj/o2FVV5jqK7YIa
   uQLuV41KzF46W/Fg3OoqVWyvC5h9a21cd0MlCOV7KYm7gQsrOFHx719VE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="334477029"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="334477029"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 21:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="740596805"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="740596805"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Mar 2023 21:03:51 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZPUM-0000yd-1u;
	Tue, 07 Mar 2023 05:03:50 +0000
Date: Tue, 7 Mar 2023 13:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.02.27a 108/108]
 kernel/rcu/rcutorture.c:3289: undefined reference to `set_nmi_torture'
Message-ID: <202303071217.ajqvt2rz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2023.02.27a
head:   b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007
commit: b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007 [108/108] rcutorture: Test NMI diagnostics
config: arm-randconfig-r006-20230305 (https://download.01.org/0day-ci/archive/20230307/202303071217.ajqvt2rz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2023.02.27a
        git checkout b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071217.ajqvt2rz-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/rcu/rcutorture.o: in function `rcutorture_test_nmis':
>> kernel/rcu/rcutorture.c:3289: undefined reference to `set_nmi_torture'
>> arm-linux-gnueabi-ld: kernel/rcu/rcutorture.c:3301: undefined reference to `set_nmi_torture'


vim +3289 kernel/rcu/rcutorture.c

  3281	
  3282	static void rcutorture_test_nmis(int n)
  3283	{
  3284	#if IS_BUILTIN(CONFIG_RCU_TORTURE_TEST)
  3285		int cpu;
  3286		int dumpcpu;
  3287		int i;
  3288	
> 3289		set_nmi_torture(nmi_delay, nmi_halt1, nmi_halt2, nmi_halt3);
  3290		for (i = 0; i < n; i++) {
  3291			preempt_disable();
  3292			cpu = smp_processor_id();
  3293			dumpcpu = cpu + 1;
  3294			if (dumpcpu >= nr_cpu_ids)
  3295				dumpcpu = 0;
  3296			pr_alert("%s: CPU %d invoking dump_cpu_task(%d)\n", __func__, cpu, dumpcpu);
  3297			dump_cpu_task(dumpcpu);
  3298			preempt_enable();
  3299			schedule_timeout_uninterruptible(15 * HZ);
  3300		}
> 3301		set_nmi_torture(0, false, false, false);
  3302	#else // #if IS_BUILTIN(CONFIG_RCU_TORTURE_TEST)
  3303		WARN_ONCE(n, "Non-zero rcutorture.test_nmis=%d permitted only when rcutorture is built in.\n", test_nmis);
  3304	#endif // #else // #if IS_BUILTIN(CONFIG_RCU_TORTURE_TEST)
  3305	}
  3306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
