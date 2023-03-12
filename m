Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A62185F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Mar 2023 07:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678604776; x=1710140776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wzI+2Y2PI3+mDL4cMeYCLwWxaFJXIMZ4fXV65OaoBYc=;
  b=g4ZDjnivG1SSyRpjM7xNw/TstNrkDDQymxIeW8UK79TPlNh5l5hi2iOt
   Nblo3fZCHoESamZq6mE9dBGHl7c9jN7BKSQIxd4rG6vRqHV5uFP7so1MK
   Wc97Q7wdkulKtBK7Ab1hsGTtJ/4zACiqzmk7A8ceZn8wbty7R8a/3oVxR
   jXs8FLCFx59WVbstQySpEnmsl0xSj9BLymFVrAsLIW4fAEPAk+sJbAJcn
   n75ze7qxxxomPqTXKO7FrNNX9MpZ2skIjBGkC/Gn8S/cQ6xPoBSbxLDsL
   nj07DDYNQUqb1+YSONot72Gmpr9A3IkW8fmV9GQhbrvied3aszqOxTwy5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="325323495"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="325323495"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 23:06:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="678307766"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="678307766"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Mar 2023 23:06:15 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbFmY-00055J-2M;
	Sun, 12 Mar 2023 07:06:14 +0000
Date: Sun, 12 Mar 2023 15:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 290/371] kernel/sched/smp.h:14:20: error: redefinition
 of 'flush_smp_call_function_queue'
Message-ID: <202303121502.Ee62GQc5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   66bb0e6d857d9b3bce5062779df9216e00986c6f
commit: 7b3d43238e0fd4a97c85581d819604e81ff0b585 [290/371] sched/alt: [Sync] 16bf5a5e1ec5 smp: Rename flush_smp_call_function_from_idle()
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230312/202303121502.Ee62GQc5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/zen-kernel/zen-kernel/commit/7b3d43238e0fd4a97c85581d819604e81ff0b585
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 7b3d43238e0fd4a97c85581d819604e81ff0b585
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121502.Ee62GQc5-lkp@intel.com/

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
