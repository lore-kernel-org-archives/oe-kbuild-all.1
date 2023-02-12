Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A657D10F8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 05:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676178819; x=1707714819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d4KNspT7ZNhI6ZwDrCtOJfbIplEpUYyKk5crEY3c7vE=;
  b=X6I4/pPwirrj5MZAh1V4JUbkaoqe/k2NaOeWJDMy509Ft2U8Y4fQpV9B
   9sa+xbF7UUbcR8KfKvyL4PSX/0lV66CUOdW6oeTAqxcAY+5SZhTrPd8jd
   Jp350J78uJJk/C0EdfbHw6+ZVwBZaat8JL5YqZBUMfNmWkJQp7pIZLjqm
   R+yPNB28VusrHlxZMoM8fGHHx6UT7AUsPZDxzYBifAHpbGWtn7QtbNyvY
   piLcqqN6x5obmGRMQ+1NYecWibgoWzcxl1lF/++4MWOQ/OaH+O/CjCl/r
   hwPckoJVGT/JbR96YD86rRAbJT4CM/HfcEOcNv72T4qLKShlRCf7sgDMt
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="329317758"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="329317758"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 21:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="618276566"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="618276566"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Feb 2023 21:13:37 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pR4gD-00074T-0U;
	Sun, 12 Feb 2023 05:13:37 +0000
Date: Sun, 12 Feb 2023 13:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.1/prjc-test 290/375] kernel/sched/smp.h:14:20: error:
 redefinition of 'flush_smp_call_function_queue'
Message-ID: <202302121354.qYjQ6Sgt-lkp@intel.com>
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

tree:   https://github.com/zen-kernel/zen-kernel 6.1/prjc-test
head:   543613647f11584e775c4eb8c5b784576e72e9c6
commit: 6ac0fdb19dc7bfcd1322df9030dabf792734852e [290/375] sched/alt: [Sync] 16bf5a5e1ec5 smp: Rename flush_smp_call_function_from_idle()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230212/202302121354.qYjQ6Sgt-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/6ac0fdb19dc7bfcd1322df9030dabf792734852e
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.1/prjc-test
        git checkout 6ac0fdb19dc7bfcd1322df9030dabf792734852e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302121354.qYjQ6Sgt-lkp@intel.com/

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
