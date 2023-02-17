Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3BF39E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 05:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676610123; x=1708146123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OXQyXQ1J3YVzo4rIgDWoim0Iy2zXnN1hBNy5W8Gx4qc=;
  b=P3iwkVsD1Isx8jLb8S2AcLPX3bHffYD4lqVat/BOUkQuLm7SbWDY/mUC
   1hE6qnvN/O7jgYUFeypF4ufmGx0zk4fkgucCxsgg9ohIbqx7t5FTiIjA6
   UTwXsMgjiUCwrPtiDWCm/QvfFeD3MN9LsGuQwGD8TaPp4JGGF4PNLNWod
   TVSAK8yrLKUNEMT8yKzYM9XCBkqqb7CC8TfsiqKzTuSJMA+bnOh7xpZGJ
   Btu9Y5zZYhiRfzCUfwNu5np9UgN4Cpv3GJvIuDItzvCKQH3klohznQUty
   BZo3Opuzow7Tq5UNrWWGTCe7FTFwEakJb/DldUfcpT4RgtOcg5oX5jqAb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="334110746"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="334110746"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 21:02:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670419293"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="670419293"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Feb 2023 21:02:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSssh-000B88-1s;
	Fri, 17 Feb 2023 05:01:59 +0000
Date: Fri, 17 Feb 2023 13:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/dyn_hrtimer 9/9] kernel/time/hrtimer.c:2275:21: error:
 'hrtimer_hres_enabled' undeclared; did you mean 'hrtimer_is_hres_enabled'?
Message-ID: <202302171252.pqA6CcJZ-lkp@intel.com>
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
commit: 31e07f4405a012e1635024ec1b251a0751eca016 [9/9] fixup! sysctl boiler plate
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230217/202302171252.pqA6CcJZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=31e07f4405a012e1635024ec1b251a0751eca016
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern timers/dyn_hrtimer
        git checkout 31e07f4405a012e1635024ec1b251a0751eca016
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/time/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171252.pqA6CcJZ-lkp@intel.com/

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
   kernel/time/hrtimer.c: In function 'hrtimer_hres_handler':
>> kernel/time/hrtimer.c:2275:21: error: 'hrtimer_hres_enabled' undeclared (first use in this function); did you mean 'hrtimer_is_hres_enabled'?
    2275 |                 if (hrtimer_hres_enabled == hres)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     hrtimer_is_hres_enabled
   kernel/time/hrtimer.c:2275:21: note: each undeclared identifier is reported only once for each function it appears in
   kernel/time/hrtimer.c: At top level:
   kernel/time/hrtimer.c:2291:36: error: 'hrtimer_hres_enabled' undeclared here (not in a function); did you mean 'hrtimer_is_hres_enabled'?
    2291 |                 .data           = &hrtimer_hres_enabled,
         |                                    ^~~~~~~~~~~~~~~~~~~~
         |                                    hrtimer_is_hres_enabled


vim +2275 kernel/time/hrtimer.c

  2263	
  2264	static int hrtimer_hres_handler(struct ctl_table *table, int write,
  2265				      void *buffer, size_t *lenp, loff_t *ppos)
  2266	{
  2267		int ret = 0;
  2268		bool hres;
  2269	
  2270		if (!write)
  2271			ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
  2272		else {
  2273			hres = ((char *)buffer)[0] != '0';
  2274	
> 2275			if (hrtimer_hres_enabled == hres)
  2276				return ret;
  2277	
  2278			if (hres) {
  2279				// hrtimer_switch_to_hres
  2280				printk("Trying to switch to high res\n");
  2281			} else {
  2282				printk("Trying to switch to low res\n");
  2283			}
  2284		}
  2285		return ret;
  2286	}
  2287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
