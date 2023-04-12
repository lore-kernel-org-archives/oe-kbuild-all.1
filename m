Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5CD6121
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 15:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681312935; x=1712848935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yEEQHh8HiDtYju+SUgktlTrjh/jk3YGrGj4Kzv8b31U=;
  b=VZXyQJYZ2tUN4m7p/4+GcpD0PkuTOtifyymDbZB8cLhbFos87tPZ1Arb
   aZxKeWrcTJ9ZMRNPwi/Al5R7f9WBQ58JljB/JE6F7tk/WP+lYJ61OArmW
   e7WOJvFkNVdJH3ShdICzk701M0Fx/VOC3otH8r/bvgGN+fktvx1sGXLG6
   6yZe+SUr3ON53RhaNpziwsYovrP7QNoslmVoyQBYcmPFJlHg7+ka65vrw
   kW8QjOTnMhAizi0kBKTED/6+An4wj039YBiN/RtiN98KVWcD4rxqCs98s
   ZkOpwJ1oWofSoo08yGeHdg0CJOIYuUZph7gtfFLGqSvYIRpFFeGFmVrTX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328040588"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="328040588"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 08:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="666399853"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="666399853"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Apr 2023 08:22:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmcIW-000XoB-1b;
	Wed, 12 Apr 2023 15:22:12 +0000
Date: Wed, 12 Apr 2023 23:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:hotplug 30/43] arch/mips/kernel/smp.c:695:19: error:
 'mp_ops' is a pointer; did you mean to use '->'?
Message-ID: <202304122327.pQGxWUmh-lkp@intel.com>
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
head:   d7f9f48885591b7c7551c606d448f3fcb5d200dd
commit: 90a2fb60757378fd35e1e951e90e8925a6b03746 [30/43] MIPS: SMP_CPS: Switch to hotplug core state synchronization
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230412/202304122327.pQGxWUmh-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=90a2fb60757378fd35e1e951e90e8925a6b03746
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel hotplug
        git checkout 90a2fb60757378fd35e1e951e90e8925a6b03746
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304122327.pQGxWUmh-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/smp.c:334:17: warning: no previous prototype for 'start_secondary' [-Wmissing-prototypes]
     334 | asmlinkage void start_secondary(void)
         |                 ^~~~~~~~~~~~~~~
   arch/mips/kernel/smp.c:454:5: warning: no previous prototype for 'setup_profiling_timer' [-Wmissing-prototypes]
     454 | int setup_profiling_timer(unsigned int multiplier)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/smp.c: In function 'arch_cpuhp_cleanup_dead_cpu':
>> arch/mips/kernel/smp.c:695:19: error: 'mp_ops' is a pointer; did you mean to use '->'?
     695 |         if (mp_ops.cleanup_dead_cpu)
         |                   ^
         |                   ->
   arch/mips/kernel/smp.c:696:23: error: 'mp_ops' is a pointer; did you mean to use '->'?
     696 |                 mp_ops.cleanup_dead_cpu(cpu);
         |                       ^
         |                       ->


vim +695 arch/mips/kernel/smp.c

   692	
   693	void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
   694	{
 > 695		if (mp_ops.cleanup_dead_cpu)
   696			mp_ops.cleanup_dead_cpu(cpu);
   697	}
   698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
