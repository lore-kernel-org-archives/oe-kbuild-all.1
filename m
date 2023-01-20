Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4983C38
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674237385; x=1705773385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0FC6s7jQLJtUJWYJuMJ4yef5gPwSvjXOjf7iYAgdrqE=;
  b=K+nlpZIU2Uo8eh2Rbitp5p5sX8YfrW5WMhybZLjebtxi6zwZP1cpN53q
   UeFHfKislmEbhW/BrHxNnrx8rWLeKe3UDF6J3V8iGVIRTFyPg6u6kawRE
   CDff8gJw0dEKJ4u2rYA20eoNXk9ZgrxRI7pVnZ6vzaN4ljSKK/uPQQtSZ
   YoHk/e/SMtKeeAM7+5b09KlV1rNWRpmXp0ZMfPOPnGVtwxDvERHcuRVfp
   WMiGu/AaAYatsho7HrWm41QtA0MMr+oWNNQM1WG5cPjhALFVezFXNiMtY
   8yRMDou1dqOjX9tIFXYLxJ5IhhZhC9YSKYlVnEQFVqK8l29bpLOgqdoAN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="411876132"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="411876132"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 09:56:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="749429394"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="749429394"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2023 09:56:14 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIvcb-0002ly-1U;
	Fri, 20 Jan 2023 17:56:13 +0000
Date: Sat, 21 Jan 2023 01:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yu-chen-surf:sis_v5_nr_llc 2/2] kernel/sched/fair.c:6285:26: error:
 'sd_llc_size' undeclared
Message-ID: <202301210110.QaBF5S1C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yu-chen-surf/linux.git sis_v5_nr_llc
head:   3753aece2c7a2a05e8e4ed4447ce0b1bd1ffb735
commit: 3753aece2c7a2a05e8e4ed4447ce0b1bd1ffb735 [2/2] sched/fair: Introduce SIS_SHORT to choose the CPU where short task is running during wake up
config: arm-randconfig-r046-20230119 (https://download.01.org/0day-ci/archive/20230121/202301210110.QaBF5S1C-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yu-chen-surf/linux/commit/3753aece2c7a2a05e8e4ed4447ce0b1bd1ffb735
        git remote add yu-chen-surf https://github.com/yu-chen-surf/linux.git
        git fetch --no-tags yu-chen-surf sis_v5_nr_llc
        git checkout 3753aece2c7a2a05e8e4ed4447ce0b1bd1ffb735
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:7,
                    from arch/arm/include/asm/percpu.h:68,
                    from include/linux/irqflags.h:17,
                    from arch/arm/include/asm/bitops.h:28,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:10,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'is_short_task':
>> kernel/sched/fair.c:6285:26: error: 'sd_llc_size' undeclared (first use in this function)
    6285 |                 (per_cpu(sd_llc_size, cpu) * sysctl_sched_min_granularity));
         |                          ^~~~~~~~~~~
   include/linux/percpu-defs.h:219:54: note: in definition of macro '__verify_pcpu_ptr'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:263:49: note: in expansion of macro 'VERIFY_PERCPU_PTR'
     263 | #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
         |                                                 ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/fair.c:6285:18: note: in expansion of macro 'per_cpu'
    6285 |                 (per_cpu(sd_llc_size, cpu) * sysctl_sched_min_granularity));
         |                  ^~~~~~~
   kernel/sched/fair.c:6285:26: note: each undeclared identifier is reported only once for each function it appears in
    6285 |                 (per_cpu(sd_llc_size, cpu) * sysctl_sched_min_granularity));
         |                          ^~~~~~~~~~~
   include/linux/percpu-defs.h:219:54: note: in definition of macro '__verify_pcpu_ptr'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:263:49: note: in expansion of macro 'VERIFY_PERCPU_PTR'
     263 | #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
         |                                                 ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/fair.c:6285:18: note: in expansion of macro 'per_cpu'
    6285 |                 (per_cpu(sd_llc_size, cpu) * sysctl_sched_min_granularity));
         |                  ^~~~~~~


vim +/sd_llc_size +6285 kernel/sched/fair.c

  6267	
  6268	/*
  6269	 * If a task switches in and then voluntarily relinquishes the
  6270	 * CPU quickly, it is regarded as a short duration task.
  6271	 *
  6272	 * SIS_SHORT tries to wake up the wakee on current CPU. This
  6273	 * aims to avoid race condition among CPUs due to frequent context
  6274	 * switch.
  6275	 *
  6276	 * Besides, in a system with large number of CPUs per LLC,
  6277	 * the SIS_SHORT inhits the spreading of short task more.
  6278	 * This is because the short duration task is more likely to
  6279	 * trigger race condition among many CPUs.
  6280	 */
  6281	static inline int is_short_task(struct task_struct *p, int cpu)
  6282	{
  6283		return sched_feat(SIS_SHORT) && p->se.dur_avg &&
  6284		       ((p->se.dur_avg * 1024) <
> 6285			(per_cpu(sd_llc_size, cpu) * sysctl_sched_min_granularity));
  6286	}
  6287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
