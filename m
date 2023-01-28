Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353B453B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 12:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674910531; x=1706446531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gooteXtjNENo6Q+X5EvZxEsIBpvk11GsyEQPxW2JA/g=;
  b=I71RSLJONJzfNK47CAiLkbBO+2uwOVFmgXqbSWnMYdDSCqwzX9orzJbq
   aJWN41OxtZvF8h5QNYJ8y8TV/kfknVZSW/HEqqKKDW9/2WgZ46aeP2DoU
   5TR/Q4/0ILLBM6zp/d9/v8eaAxdRoLeBobS1Mlnzu+BH4grTQnjTxuBPg
   aRullRY9GXlM9TwwAI6IChX4aMwsCDn2qN6Zc/NTqAYLc3NzMD00PH48Q
   K+WszFORkudr4dJu0MTU0lNrW7C+BAr1ZCmD0wRWfrY05hoXNsFaZEWsu
   0grYodLSQL+0Dhc0E1PO5VH+c23IBZ8OCLbEK5NLqlOM8BRSEAPQ7gUn3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="328574890"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="328574890"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 04:55:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="992375549"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="992375549"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2023 04:55:29 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLkjw-0000es-2c;
	Sat, 28 Jan 2023 12:55:28 +0000
Date: Sat, 28 Jan 2023 20:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 5/10]
 kernel/trace/trace_preemptirq.c:103:9: error: implicit declaration of
 function 'trace'; did you mean 'notrace'?
Message-ID: <202301282055.i3hqtrHw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   be06c7d02443a4ce151434fed1ca2c9502f6816d
commit: 013918b05da9a651cba310028d94101abecaaf7b [5/10] tracing, preempt: Squash _rcuidle tracing
config: arm64-randconfig-r001-20230123 (https://download.01.org/0day-ci/archive/20230128/202301282055.i3hqtrHw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=013918b05da9a651cba310028d94101abecaaf7b
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core
        git checkout 013918b05da9a651cba310028d94101abecaaf7b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/trace/trace_preemptirq.c: In function 'trace_preempt_on':
>> kernel/trace/trace_preemptirq.c:103:9: error: implicit declaration of function 'trace'; did you mean 'notrace'? [-Werror=implicit-function-declaration]
     103 |         trace(preempt_enable)(a0, a1);
         |         ^~~~~
         |         notrace
>> kernel/trace/trace_preemptirq.c:103:15: error: 'preempt_enable' undeclared (first use in this function); did you mean 'perf_pmu_enable'?
     103 |         trace(preempt_enable)(a0, a1);
         |               ^~~~~~~~~~~~~~
         |               perf_pmu_enable
   kernel/trace/trace_preemptirq.c:103:15: note: each undeclared identifier is reported only once for each function it appears in
   kernel/trace/trace_preemptirq.c: In function 'trace_preempt_off':
>> kernel/trace/trace_preemptirq.c:109:15: error: 'preempt_disable' undeclared (first use in this function); did you mean 'perf_pmu_disable'?
     109 |         trace(preempt_disable)(a0, a1);
         |               ^~~~~~~~~~~~~~~
         |               perf_pmu_disable
   cc1: some warnings being treated as errors


vim +103 kernel/trace/trace_preemptirq.c

   100	
   101	void trace_preempt_on(unsigned long a0, unsigned long a1)
   102	{
 > 103		trace(preempt_enable)(a0, a1);
   104		tracer_preempt_on(a0, a1);
   105	}
   106	
   107	void trace_preempt_off(unsigned long a0, unsigned long a1)
   108	{
 > 109		trace(preempt_disable)(a0, a1);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
