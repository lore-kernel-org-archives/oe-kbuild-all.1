Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA8DA47
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 01:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680830011; x=1712366011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LlCXO9HPuYyRBJI5L+xhEKRwt3dR2AaDrLnM08/RrjQ=;
  b=bUtvcMeH76BcPFbFNEgJKcdlDKWU0lkdO1nttOSWFxdw1Hdw6rVWUuhL
   LRrMigiy3L4ox/GqqEqoURiaJ/KZ1KiJdOojVgenZP1HmUmWDBJd0Wowp
   srC2XCJPcLLjhLaBKd9eVrTi7VW/tupnfut9olM0XW7hV2zlX8oOsz4xy
   zeglZN4CFj6ROCF0ErT7JByKiz0YioYipleE6JDZWzeGYFYhSY94uCvLt
   9shBYLlPJDPOZWErB8obFAWTK26uh8krOu98IiEw1fnofGnXlLPybQc+m
   O4AKWotmGOoHPc8pVm9AEu1ttGPQrnqv8jXDgeprquv0YRfawd2XvBqn0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344654793"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="344654793"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 18:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664712328"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="664712328"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Apr 2023 18:13:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkafI-000RyA-14;
	Fri, 07 Apr 2023 01:13:20 +0000
Date: Fri, 7 Apr 2023 09:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:hotplug 30/43] arch/mips/kernel/smp.c:695:13: error:
 'smp_ops' undeclared; did you mean 'mp_ops'?
Message-ID: <202304070925.LaJRMmfj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git hotplug
head:   3675258f0132b4f3fd39917e9d5a53f5e23094b5
commit: 584ff5381a02d25470d98c0515644e3a19f59d54 [30/43] MIPS: SMP_CPS: Switch to hotplug core state synchronization
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230407/202304070925.LaJRMmfj-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=584ff5381a02d25470d98c0515644e3a19f59d54
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel hotplug
        git checkout 584ff5381a02d25470d98c0515644e3a19f59d54
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070925.LaJRMmfj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/cpu.c: In function 'cpuhp_wait_for_sync_state':
>> kernel/cpu.c:316:26: warning: integer overflow in expression of type 'long int' results in '1410065408' [-Woverflow]
     316 |         end = start + 10 * NSEC_PER_SEC;
         |                          ^
--
   arch/mips/kernel/smp.c:334:17: warning: no previous prototype for 'start_secondary' [-Wmissing-prototypes]
     334 | asmlinkage void start_secondary(void)
         |                 ^~~~~~~~~~~~~~~
   arch/mips/kernel/smp.c:454:5: warning: no previous prototype for 'setup_profiling_timer' [-Wmissing-prototypes]
     454 | int setup_profiling_timer(unsigned int multiplier)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/smp.c: In function 'arch_cpuhp_cleanup_dead_cpu':
>> arch/mips/kernel/smp.c:695:13: error: 'smp_ops' undeclared (first use in this function); did you mean 'mp_ops'?
     695 |         if (smp_ops.cleanup_dead_cpu)
         |             ^~~~~~~
         |             mp_ops
   arch/mips/kernel/smp.c:695:13: note: each undeclared identifier is reported only once for each function it appears in


vim +695 arch/mips/kernel/smp.c

   692	
   693	void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
   694	{
 > 695		if (smp_ops.cleanup_dead_cpu)
   696			smp_ops.cleanup_dead_cpu(cpu);
   697	}
   698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
