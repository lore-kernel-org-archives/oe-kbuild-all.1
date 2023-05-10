Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C83E2F23
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 23:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683762291; x=1715298291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVYP/JSsuoBjFnIO0k2z5PN0MzZAFX61qd5dK2mW7TI=;
  b=PV3Jrqbhycute7DndU74Iim3RKOq+Yqupyha84ncd6PeOyG0vpR9xhdi
   mSM5Z4pcGSp/ZFZoJI7gKvHg7Uta2ZQVkBwDdBRP0u8CdxXrGlcGZTmp/
   gEwv6ozlcDT4HTXJTGfflJhFO6KZlFr90UGqXCEDaT+K53x0gthsjnY5Y
   HRzJ8LAbGRgyWJ7LxM/ujRvs75HarNkPd63V1H5qLpMsVxufVJy4uwsVW
   KpL7ZK+m08WkwAhWQW+sHSr43QbASCuaoS7J6TmJBy6VYRz64FT05k8Wt
   SQ0AWQy83iT8BvPw/UarPsK8/OmE4+rhlDnjlSLI19IifAHxU4E20o3EM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="329968722"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="329968722"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 16:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="764496669"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="764496669"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 May 2023 16:44:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwtUG-0003eu-2t;
	Wed, 10 May 2023 23:44:48 +0000
Date: Thu, 11 May 2023 07:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:hotplug 24/36] arch/mips/kernel/smp.c:694:6: error:
 redefinition of 'arch_cpuhp_cleanup_dead_cpu'
Message-ID: <202305110757.nhT5Socq-lkp@intel.com>
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
head:   c30400d1e2a96ac9b2328edaecf5f81a9de0af5b
commit: 89977631b9758736923b828c8cddc61ea2acbbba [24/36] MIPS: SMP_CPS: Switch to hotplug core state synchronization
config: mips-bmips_be_defconfig (https://download.01.org/0day-ci/archive/20230511/202305110757.nhT5Socq-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=89977631b9758736923b828c8cddc61ea2acbbba
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel hotplug
        git checkout 89977631b9758736923b828c8cddc61ea2acbbba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110757.nhT5Socq-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/smp.c:334:17: warning: no previous prototype for 'start_secondary' [-Wmissing-prototypes]
     334 | asmlinkage void start_secondary(void)
         |                 ^~~~~~~~~~~~~~~
   arch/mips/kernel/smp.c:454:5: warning: no previous prototype for 'setup_profiling_timer' [-Wmissing-prototypes]
     454 | int setup_profiling_timer(unsigned int multiplier)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> arch/mips/kernel/smp.c:694:6: error: redefinition of 'arch_cpuhp_cleanup_dead_cpu'
     694 | void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/cpu.h:20,
                    from arch/mips/kernel/smp.c:21:
   include/linux/cpuhotplug.h:529:20: note: previous definition of 'arch_cpuhp_cleanup_dead_cpu' with type 'void(unsigned int)'
     529 | static inline void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_cpuhp_cleanup_dead_cpu +694 arch/mips/kernel/smp.c

   692	
   693	#ifdef CONFIG_HOTPLUG_CPU
 > 694	void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
   695	{
   696		if (mp_ops->cleanup_dead_cpu)
   697			mp_ops->cleanup_dead_cpu(cpu);
   698	}
   699	#endif
   700	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
