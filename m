Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF25633
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 02:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686017921; x=1717553921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uu38WaTigT6esQEr86y+gswQFMo7ee6McPtQDbqiZPU=;
  b=Q+xkBkBwfErL9kuH8HA+ogvl1Z4Bx/xfOPl55Cif3sqg3iPLkRBV3WzB
   FVw+Mbgi6j5Io8doLkQ+d+HFht0ai9wLOflj9BUN7WN8jZBua+Of4Nai1
   /L7XVe31lFqjhglCIXyKGFsRctK1c6nBi1sJVYf6a9MK0DjahlwqwcUcp
   +Pov0TSYtU1Bk7Iy0WyGOcTU0w3l0T0r7vza9+f5t6hahJuZPXye41sbN
   XUqTcvs4Cj+Qau+39q1i93Gb8kDLLl8obfCLcEz924HruaE59NJ567gCs
   ZODhN5l1BxdhEBzxbBHDBumLVRn8lcN9bONjwTwSa8OHq/RUsQ6te8nYj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="358994381"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="358994381"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 19:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="773951634"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="773951634"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jun 2023 19:18:39 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6MHP-0004ho-0w;
	Tue, 06 Jun 2023 02:18:39 +0000
Date: Tue, 6 Jun 2023 10:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 22/61] init/init_task.c:31:42: error:
 expected '}' before '(' token
Message-ID: <202306061014.IypImIXA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   16a20adb1e0ae19ad42041a7d1b5583e4705ca0c
commit: 2e9a3527e7a51ba24410e43a2d0d1d10d62ae1b1 [22/61] posix-timers: Convert timer list to hlist
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230606/202306061014.IypImIXA-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=2e9a3527e7a51ba24410e43a2d0d1d10d62ae1b1
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel timers/posix
        git checkout 2e9a3527e7a51ba24410e43a2d0d1d10d62ae1b1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061014.IypImIXA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> init/init_task.c:31:42: error: expected '}' before '(' token
      31 |         .posix_timers   = HLIST_HEAD_INIT(),
         |                                          ^
   init/init_task.c:18:44: note: to match this '{'
      18 | static struct signal_struct init_signals = {
         |                                            ^


vim +31 init/init_task.c

    17	
    18	static struct signal_struct init_signals = {
    19		.nr_threads	= 1,
    20		.thread_head	= LIST_HEAD_INIT(init_task.thread_node),
    21		.wait_chldexit	= __WAIT_QUEUE_HEAD_INITIALIZER(init_signals.wait_chldexit),
    22		.shared_pending	= {
    23			.list = LIST_HEAD_INIT(init_signals.shared_pending.list),
    24			.signal =  {{0}}
    25		},
    26		.multiprocess	= HLIST_HEAD_INIT,
    27		.rlim		= INIT_RLIMITS,
    28		.cred_guard_mutex = __MUTEX_INITIALIZER(init_signals.cred_guard_mutex),
    29		.exec_update_lock = __RWSEM_INITIALIZER(init_signals.exec_update_lock),
    30	#ifdef CONFIG_POSIX_TIMERS
  > 31		.posix_timers	= HLIST_HEAD_INIT(),
    32		.cputimer	= {
    33			.cputime_atomic	= INIT_CPUTIME_ATOMIC,
    34		},
    35	#endif
    36		INIT_CPU_TIMERS(init_signals)
    37		.pids = {
    38			[PIDTYPE_PID]	= &init_struct_pid,
    39			[PIDTYPE_TGID]	= &init_struct_pid,
    40			[PIDTYPE_PGID]	= &init_struct_pid,
    41			[PIDTYPE_SID]	= &init_struct_pid,
    42		},
    43		INIT_PREV_CPUTIME(init_signals)
    44	};
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
