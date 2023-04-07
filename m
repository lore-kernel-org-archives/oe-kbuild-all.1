Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA6FA46
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 01:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680831203; x=1712367203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tfJisPar9C63stUODh7v3JsKzUGr0Ud2vxBAhtWSRN4=;
  b=OSj3UupxxlnKhStA6GjFouJgoZXsIM7gu5ktRUNRihuh0exKq6aAw9Aj
   DZ5HXEkIzTyjb1iNXcouDOhPfwA54AcPUUSZmaPqkPXsvy5P5Eo69UWRz
   rKiNg7iC2yUNqEJiafD2HLuJlnzMiRbMUQQr1Z5PpuBhULQiolyVH7G5F
   2pdpJJjENfQswriICWwuQuCq1F1x9uKNVepRETOp+UGBwBuXGG3X2+WII
   Bt6sFo/ARoURW65VFvBH2Gpq3mZgXC2P61pQdEk+rl4AX6xQ+JEzWQzlK
   Cz0+NIlVTWKmVXFJRh+hqrBO+eRnugpwRCO72WnpU7EhSd6QpGNkUkYyT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344657386"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="344657386"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 18:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664716525"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="664716525"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Apr 2023 18:33:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkayf-000RzG-2n;
	Fri, 07 Apr 2023 01:33:21 +0000
Date: Fri, 7 Apr 2023 09:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:hotplug 32/43] arch/riscv/kernel/cpu-hotplug.c:55:6:
 error: redefinition of 'arch_cpuhp_cleanup_dead_cpu'
Message-ID: <202304070947.mA6KUbCw-lkp@intel.com>
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
commit: 71622e99f16217b2be66e87b63b7521c8ec697af [32/43] riscv: Switch to hotplug core state synchronization
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230407/202304070947.mA6KUbCw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=71622e99f16217b2be66e87b63b7521c8ec697af
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel hotplug
        git checkout 71622e99f16217b2be66e87b63b7521c8ec697af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070947.mA6KUbCw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/cpu-hotplug.c:55:6: error: redefinition of 'arch_cpuhp_cleanup_dead_cpu'
      55 | void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/cpu.h:20,
                    from arch/riscv/kernel/cpu-hotplug.c:11:
   include/linux/cpuhotplug.h:531:20: note: previous definition of 'arch_cpuhp_cleanup_dead_cpu' with type 'void(unsigned int)'
     531 | static inline void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/cpu-hotplug.c: In function 'arch_cpu_idle_dead':
>> arch/riscv/kernel/cpu-hotplug.c:75:9: error: implicit declaration of function 'cpuhp_ap_report_death'; did you mean 'cpuhp_ap_report_dead'? [-Werror=implicit-function-declaration]
      75 |         cpuhp_ap_report_death();
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         cpuhp_ap_report_dead
   cc1: some warnings being treated as errors


vim +/arch_cpuhp_cleanup_dead_cpu +55 arch/riscv/kernel/cpu-hotplug.c

    50	
    51	/*
    52	 * Called on the thread which is asking for a CPU to be shutdown, if the
    53	 * CPU reported dead to the hotplug core.
    54	 */
  > 55	void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
    56	{
    57		int ret = 0;
    58	
    59		pr_notice("CPU%u: off\n", cpu);
    60	
    61		/* Verify from the firmware if the cpu is really stopped*/
    62		if (cpu_ops[cpu]->cpu_is_stopped)
    63			ret = cpu_ops[cpu]->cpu_is_stopped(cpu);
    64		if (ret)
    65			pr_warn("CPU%d may not have stopped: %d\n", cpu, ret);
    66	}
    67	
    68	/*
    69	 * Called from the idle thread for the CPU which has been shutdown.
    70	 */
    71	void arch_cpu_idle_dead(void)
    72	{
    73		idle_task_exit();
    74	
  > 75		cpuhp_ap_report_death();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
