Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BD9323E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 19:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676661633; x=1708197633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KVbrpK+JTakSbdVs5E6iAWQ/jjVvPKi+G4fqUk5m/94=;
  b=Bqg9OJnyrqbx9vTRBXaO8KIr92TCtUwlprSjLy2IDDgSflzgbLLz1EuA
   +pr0ZEbzQET4PliG5iIikg0je/rWqPkz748WsM+MzBVxci3jXEsz3aQ7a
   a6qHMETSB0/D7S5X80O1PmzkJ4KoC8EJ4+piDIlaHQtk1vbF2Sbecrc00
   5hxd93ryfsW3B9VuISiJUNU9WFoIoRCHvP6PQX6rlTPdQYwKbW/wSRu4v
   oS4MjdDCUPv3Unl8WEPzAyDlruQ0qhrHCtL8auBwhZViQgrIUYu5lszI+
   n5sriNgcKzFUv4/vgpSq3I+q7zAsZu4ZuuTDclM4QJGHPHYmfXEU/BuLE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="311696424"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="311696424"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 11:20:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="794504245"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="794504245"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Feb 2023 11:20:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT6HW-000BkX-2v;
	Fri, 17 Feb 2023 19:20:30 +0000
Date: Sat, 18 Feb 2023 03:20:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/dyn_hrtimer 8/8] kernel/time/tick-sched.c:1395:6:
 warning: no previous prototype for 'tick_nohz_switch_to_nohz'
Message-ID: <202302180334.JjyTsGOK-lkp@intel.com>
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
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230218/202302180334.JjyTsGOK-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
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
| Link: https://lore.kernel.org/oe-kbuild-all/202302180334.JjyTsGOK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/tick-sched.c:1395:6: warning: no previous prototype for 'tick_nohz_switch_to_nohz' [-Wmissing-prototypes]
    1395 | void tick_nohz_switch_to_nohz(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/tick_nohz_switch_to_nohz +1395 kernel/time/tick-sched.c

  1391	
  1392	/**
  1393	 * tick_nohz_switch_to_nohz - switch to nohz mode
  1394	 */
> 1395	void tick_nohz_switch_to_nohz(void)
  1396	{
  1397		struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
  1398		ktime_t next;
  1399	
  1400		if (!tick_nohz_enabled)
  1401			return;
  1402	
  1403		if (tick_switch_to_oneshot(tick_nohz_handler))
  1404			return;
  1405	
  1406		/*
  1407		 * Recycle the hrtimer in ts, so we can share the
  1408		 * hrtimer_forward with the highres code.
  1409		 */
  1410		hrtimer_init(&ts->sched_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
  1411		/* Get the next period */
  1412		next = tick_init_jiffy_update();
  1413	
  1414		hrtimer_set_expires(&ts->sched_timer, next);
  1415		hrtimer_forward_now(&ts->sched_timer, TICK_NSEC);
  1416		tick_program_event(hrtimer_get_expires(&ts->sched_timer), 1);
  1417		tick_nohz_activate(ts, NOHZ_MODE_LOWRES);
  1418	}
  1419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
