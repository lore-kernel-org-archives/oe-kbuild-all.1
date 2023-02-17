Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8DE945D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 19:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676661634; x=1708197634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XF+jvuNzhm2gqVwEFk1CSsA7Btz8JItUbQp4r+YqcFo=;
  b=lZHnLJDitynnc/74ewvqHSpMIlr8tdafXQMWbQJLKHueNf1IPzxq8lbK
   xJAsODPZZy7C2L+wsBWqWQdvPnThK3f4PwYLr95lJ72uZvTdoCeOQZsd+
   2eVJthX4ypu86YUDHrr76F2CM7aX9TdBZM+m/KL7j+75/PU76ym9IUBPA
   RdcsxPTd5I2v8Cyh6z8hK6h69J/DXTzTWMYsQTXWBai9Bj94JBDZLJDh6
   zH0Vnt95RJVXWDr6xWdOciNKWLpvDUEE7qYv0OL6XGXsffFBmPmi5rtUv
   9CMX69FFjvUru6eBEFv7IgifQHsn9G1xRb49uN7/M/aegWlLoP518Rov4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="320172931"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="320172931"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 11:20:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="739357221"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="739357221"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2023 11:20:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT6HW-000Bkc-3D;
	Fri, 17 Feb 2023 19:20:30 +0000
Date: Sat, 18 Feb 2023 03:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/dyn_hrtimer 8/8] kernel/time/hrtimer.c:2279:36: error:
 lvalue required as left operand of assignment
Message-ID: <202302180358.EAwJMm0h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git timers/dyn_hrtimer
head:   621948fff66f3ce64f723a81566228363a29e3b5
commit: 621948fff66f3ce64f723a81566228363a29e3b5 [8/8] hrtimer: Add a sysctl to lower resolution of timers
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230218/202302180358.EAwJMm0h-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=621948fff66f3ce64f723a81566228363a29e3b5
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern timers/dyn_hrtimer
        git checkout 621948fff66f3ce64f723a81566228363a29e3b5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/time/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180358.EAwJMm0h-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
   kernel/time/hrtimer.c:1648:14: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
    1648 |         bool expires_in_hardirq;
         |              ^~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c: At top level:
>> kernel/time/hrtimer.c:2266:6: warning: no previous prototype for 'hrtimer_smp_call' [-Wmissing-prototypes]
    2266 | void hrtimer_smp_call(void *info)
         |      ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c: In function 'hrtimer_smp_call':
>> kernel/time/hrtimer.c:2279:36: error: lvalue required as left operand of assignment
    2279 |                 hrtimer_resolution = LOW_RES_NSEC;
         |                                    ^
   kernel/time/hrtimer.c: In function 'hrtimer_hres_handler':
   kernel/time/hrtimer.c:2295:21: error: 'hrtimer_hres_enabled' undeclared (first use in this function); did you mean 'hrtimer_is_hres_enabled'?
    2295 |                 if (hrtimer_hres_enabled == hres)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     hrtimer_is_hres_enabled
   kernel/time/hrtimer.c:2295:21: note: each undeclared identifier is reported only once for each function it appears in
   kernel/time/hrtimer.c: At top level:
   kernel/time/hrtimer.c:2313:36: error: 'hrtimer_hres_enabled' undeclared here (not in a function); did you mean 'hrtimer_is_hres_enabled'?
    2313 |                 .data           = &hrtimer_hres_enabled,
         |                                    ^~~~~~~~~~~~~~~~~~~~
         |                                    hrtimer_is_hres_enabled


vim +2279 kernel/time/hrtimer.c

  2264	
  2265	void tick_nohz_switch_to_nohz(void);
> 2266	void hrtimer_smp_call(void *info)
  2267	{
  2268		struct hrtimer_cpu_base *base = this_cpu_ptr(&hrtimer_bases);
  2269		bool hres = *((bool *)info);
  2270	
  2271		if (hres == __hrtimer_hres_active(base))
  2272			return;
  2273	
  2274		if (!hres) {
  2275			trace_printk("smp call: called stn\n");
  2276	
  2277			tick_nohz_switch_to_nohz();
  2278			base->hres_active = 0;
> 2279			hrtimer_resolution = LOW_RES_NSEC;
  2280			return;
  2281		}
  2282		hrtimer_switch_to_hres();
  2283	}
  2284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
