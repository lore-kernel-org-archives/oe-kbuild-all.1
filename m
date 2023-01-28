Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED87495
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 21:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674939714; x=1706475714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z668x9EifIz+5mSwV1K1s65IJQlLuRnNPX3624/Zg2s=;
  b=FIJZiXDoOJ4deKo7fsA+0V+8UT+4zu7pD8CRiYJzsRMP0a83H/VNI/wq
   plrokaSUQlLddj7c0vlbZnz/9ql+1PStwCJOJ+K3TyEEq3RO8PcBJNc2v
   UTxK/3jqixmbBOq6MF9toM7IRrALPNvRqeb8ZvPEmr0+IsgDd31kTXXd3
   8quYM9Pzv3V9nSQ0xUSqZkM1F9WX5dlEiICR0uO3SqdVEgJQs2v+ojzl5
   spFxZyRiODNB3WhnLVBnVLx9T6zKBIKoll6d0lmLlUopyLuix9AsbVTti
   YK1FgoJSelQMCspLsaVnd5ofUuuAMeApa6WRrrxP7KiMM6wB0eruMhmU7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="413555546"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="413555546"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 13:01:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="665629921"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="665629921"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jan 2023 13:01:52 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLsKd-00016T-24;
	Sat, 28 Jan 2023 21:01:51 +0000
Date: Sun, 29 Jan 2023 05:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.1/prjc 290/360] kernel/sched/smp.h:14:20: error: redefinition
 of 'flush_smp_call_function_queue'
Message-ID: <202301290422.GsPmg93i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.1/prjc
head:   b11e5642bc467c1a361ad4d1e4a7d671b958eaa2
commit: 6ac0fdb19dc7bfcd1322df9030dabf792734852e [290/360] sched/alt: [Sync] 16bf5a5e1ec5 smp: Rename flush_smp_call_function_from_idle()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230129/202301290422.GsPmg93i-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/6ac0fdb19dc7bfcd1322df9030dabf792734852e
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.1/prjc
        git checkout 6ac0fdb19dc7bfcd1322df9030dabf792734852e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:35:
>> kernel/sched/smp.h:14:20: error: redefinition of 'flush_smp_call_function_queue'
      14 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/sched.h:9,
                    from kernel/sched/build_policy.c:34:
   kernel/sched/alt_sched.h:296:20: note: previous definition of 'flush_smp_call_function_queue' with type 'void(void)'
     296 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:43:
   kernel/sched/idle.c: In function 'cpu_idle_poll':
   kernel/sched/idle.c:56:9: error: implicit declaration of function 'ct_idle_enter'; did you mean 'cpuidle_enter'? [-Werror=implicit-function-declaration]
      56 |         ct_idle_enter();
         |         ^~~~~~~~~~~~~
         |         cpuidle_enter
   kernel/sched/idle.c:63:9: error: implicit declaration of function 'ct_idle_exit'; did you mean 'ct_irq_exit'? [-Werror=implicit-function-declaration]
      63 |         ct_idle_exit();
         |         ^~~~~~~~~~~~
         |         ct_irq_exit
   cc1: some warnings being treated as errors


vim +/flush_smp_call_function_queue +14 kernel/sched/smp.h

d664e399128bd7 Thomas Gleixner 2022-04-13  10  
d664e399128bd7 Thomas Gleixner 2022-04-13  11  #ifdef CONFIG_SMP
16bf5a5e1ec564 Thomas Gleixner 2022-04-13  12  extern void flush_smp_call_function_queue(void);
d664e399128bd7 Thomas Gleixner 2022-04-13  13  #else
16bf5a5e1ec564 Thomas Gleixner 2022-04-13 @14  static inline void flush_smp_call_function_queue(void) { }

:::::: The code at line 14 was first introduced by commit
:::::: 16bf5a5e1ec56474ed2a19d72f272ed09a5d3ea1 smp: Rename flush_smp_call_function_from_idle()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
