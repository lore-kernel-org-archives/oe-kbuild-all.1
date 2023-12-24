Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD40D30E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Dec 2023 19:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n17DaA2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703446237; x=1734982237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4E1wlA+ErbSiJA0h9fBVBO07wSwjNuXnXdtZDsIAkhE=;
  b=n17DaA2JPBEB2jCTFIlbCj/AHjtBYAt+nC38HqgbMl9qwmWnYXPIm4cO
   nFfFhnUjDr9YXpJcIc2I0tzWrKBoraZt8Ipt+xLypMp3eZTqWRVqOt6xu
   3NqaYArFJXOArQDRLC+DXFNJEAWO0NpLUNJ0o836H/LATZ3aCRir5cnEf
   f0f1W4aTFO3BnImMGafVpjorzqlEE5gC6VVESA3IWRMjOU2ZUOOd6lJD8
   IZIZ7jYp5Gmb1+lbIC9WnwkXwQnODvEWnmi7jjri2avSTJbSvVYiTjKqF
   fyYD2uLyNYgCsc41+F/7d4t2efAUAxjAGIobdGjgIYorw5zePDspt2XeD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="14926393"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="14926393"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 11:30:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="806510625"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="806510625"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Dec 2023 11:30:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHUAW-000CZ1-0d;
	Sun, 24 Dec 2023 19:30:04 +0000
Date: Mon, 25 Dec 2023 03:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 3/6] kernel/time/tick-sched.c:1549:6:
 error: redefinition of 'tick_cancel_sched_timer'
Message-ID: <202312250352.n5i13mey-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   32e5d04ff134e3655e249f0ae608a1ad42dfb82a
commit: 95e94ce181eb6254e9e9cc351879577178af8dd0 [3/6] tick: Remove useless oneshot ifdeffery
config: arm-randconfig-r061-20231224 (https://download.01.org/0day-ci/archive/20231225/202312250352.n5i13mey-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312250352.n5i13mey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312250352.n5i13mey-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/tick-sched.c:1549:6: error: redefinition of 'tick_cancel_sched_timer'
    1549 | void tick_cancel_sched_timer(int cpu)
         |      ^
   kernel/time/tick-sched.h:109:20: note: previous definition is here
     109 | static inline void tick_cancel_sched_timer(int cpu) { }
         |                    ^
   1 error generated.


vim +/tick_cancel_sched_timer +1549 kernel/time/tick-sched.c

79bf2bb335b85d Thomas Gleixner 2007-02-16  1548  
79bf2bb335b85d Thomas Gleixner 2007-02-16 @1549  void tick_cancel_sched_timer(int cpu)
79bf2bb335b85d Thomas Gleixner 2007-02-16  1550  {
79bf2bb335b85d Thomas Gleixner 2007-02-16  1551  	struct tick_sched *ts = &per_cpu(tick_cpu_sched, cpu);
79bf2bb335b85d Thomas Gleixner 2007-02-16  1552  

:::::: The code at line 1549 was first introduced by commit
:::::: 79bf2bb335b85db25d27421c798595a2fa2a0e82 [PATCH] tick-management: dyntick / highres functionality

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
