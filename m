Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E68376
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 03:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676603220; x=1708139220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b+7e4zbUfTh+5IuEaWV9M7oYViEPgrLfc1o0/VIwbSM=;
  b=cryeL8eOjrhbZDpijkAeLxeg9WoncilR0NXDZFcGoz7wnYAHjRrbQydF
   xj2GfUr3LpjN5YVfJ4p1FnZCMgRABI/eEozcv3YgDef5/5yUjd9NraIdJ
   WHHq7D9FukF6ATuGzvRoCgc0yV2cKdW1eZeWLzY1NRFZOA0eZx4kZL5SJ
   LcTKt8VjtDUt1UloT9Y4jcOXIP1CqjlroRTO5EhBMmmJUjW9VgIhDpdps
   YM8ypkQZMhi3+GbjianEtLHWelGR354a6IW7O47k4SeymRc85MLR5GZUa
   +w4eYc9TCIlUwvBRE4DZcRDmxCec2grVGt8KJJlyGnq9lTi+fxxqztlcd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="334098904"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="334098904"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 19:06:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="663736501"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="663736501"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Feb 2023 19:06:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSr5M-000B4W-3B;
	Fri, 17 Feb 2023 03:06:56 +0000
Date: Fri, 17 Feb 2023 11:06:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/dyn_hrtimer 6/6] kernel/time/hrtimer.c:2303:36: error:
 'hrtimer_hres_enabled' undeclared here (not in a function); did you mean
 'hrtimer_is_hres_enabled'?
Message-ID: <202302171023.iNyreDsY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git timers/dyn_hrtimer
head:   74512df043ae505bec27969a542a6c7b8e66e5ac
commit: 74512df043ae505bec27969a542a6c7b8e66e5ac [6/6] sysctl boiler plate
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230217/202302171023.iNyreDsY-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=74512df043ae505bec27969a542a6c7b8e66e5ac
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern timers/dyn_hrtimer
        git checkout 74512df043ae505bec27969a542a6c7b8e66e5ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171023.iNyreDsY-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/hrtimer.c:120:35: warning: initialized field overwritten [-Woverride-init]
     120 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   kernel/time/hrtimer.c: In function '__run_hrtimer':
   kernel/time/hrtimer.c:1656:14: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
    1656 |         bool expires_in_hardirq;
         |              ^~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c: At top level:
>> kernel/time/hrtimer.c:2303:36: error: 'hrtimer_hres_enabled' undeclared here (not in a function); did you mean 'hrtimer_is_hres_enabled'?
    2303 |                 .data           = &hrtimer_hres_enabled,
         |                                    ^~~~~~~~~~~~~~~~~~~~
         |                                    hrtimer_is_hres_enabled


vim +2303 kernel/time/hrtimer.c

  2299	
  2300	static struct ctl_table timer_hres_sysctl[] = {
  2301		{
  2302			.procname	= "timer_highres",
> 2303			.data		= &hrtimer_hres_enabled,
  2304			.maxlen		= sizeof(unsigned int),
  2305			.mode		= 0644,
  2306			.proc_handler	= hrtimer_hres_handler,
  2307			.extra1		= SYSCTL_ZERO,
  2308			.extra2		= SYSCTL_ONE,
  2309		},
  2310		{}
  2311	};
  2312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
