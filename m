Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34BC389
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 05:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676610966; x=1708146966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x45kO+mqywznHCQ5eD/aj1L75odP/zV2SzkLSZ5WgyE=;
  b=BfVZAsuduTKhKXT6iXx1AjRMZdASezfnNtTEWyUz82Clp3EBzPyue19L
   Dsz9qMe0ApEFJlGccmnLGLS01VOa6zH4Eg7oH8G1Z4SOe8wZpJS3eYOsF
   UGvdes2B/6afJ7PAB8mVzeYcAJASBAc+1uTy1ap54nlGbJ6nk9d54swPf
   DEnGESutru9ROa0ZSHhS9ghIifEl31AqyKUvaKZZfmnKDYrhCL1w6qZPc
   MgkA12BwMxlSXhxCvgfhmd9uxKai7/NswBlRMzXScctFU2STRSrizF2yQ
   JoHwZR0kIdiWHSYTXWpF/x5PxP8xXKgTZYdo6lDblGCB4yF34A+7akVOc
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333272453"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="333272453"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 21:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="915963301"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="915963301"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Feb 2023 21:16:05 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSt6G-000B8n-01;
	Fri, 17 Feb 2023 05:16:00 +0000
Date: Fri, 17 Feb 2023 13:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/dyn_hrtimer 8/9] kernel/time/hrtimer.c:2279:36: error:
 'hrtimer_hres_enabled' undeclared here (not in a function); did you mean
 'hrtimer_is_hres_enabled'?
Message-ID: <202302171322.U1rf95gJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git timers/dyn_hrtimer
head:   31e07f4405a012e1635024ec1b251a0751eca016
commit: c8955957b069db629d89e96fdf157ebe389da1d2 [8/9] sysctl boiler plate
config: arc-randconfig-r043-20230213 (https://download.01.org/0day-ci/archive/20230217/202302171322.U1rf95gJ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=c8955957b069db629d89e96fdf157ebe389da1d2
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern timers/dyn_hrtimer
        git checkout c8955957b069db629d89e96fdf157ebe389da1d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash kernel/time/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171322.U1rf95gJ-lkp@intel.com/

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
   kernel/time/hrtimer.c:1648:14: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
    1648 |         bool expires_in_hardirq;
         |              ^~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c: At top level:
>> kernel/time/hrtimer.c:2279:36: error: 'hrtimer_hres_enabled' undeclared here (not in a function); did you mean 'hrtimer_is_hres_enabled'?
    2279 |                 .data           = &hrtimer_hres_enabled,
         |                                    ^~~~~~~~~~~~~~~~~~~~
         |                                    hrtimer_is_hres_enabled


vim +2279 kernel/time/hrtimer.c

  2275	
  2276	static struct ctl_table timer_hres_sysctl[] = {
  2277		{
  2278			.procname	= "timer_highres",
> 2279			.data		= &hrtimer_hres_enabled,
  2280			.maxlen		= sizeof(unsigned int),
  2281			.mode		= 0644,
  2282			.proc_handler	= hrtimer_hres_handler,
  2283			.extra1		= SYSCTL_ZERO,
  2284			.extra2		= SYSCTL_ONE,
  2285		},
  2286		{}
  2287	};
  2288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
