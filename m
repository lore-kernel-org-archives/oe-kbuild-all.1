Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317BA7C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681493502; x=1713029502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aicpwujaWJecDc4HZTAhVmPSaOHMs6W6fHsQIVP7Yiw=;
  b=DLguG47PZHdKikzMMCTPV8T00xtn5thZGF01U3qf53Au4QQEk2tl7gPv
   ou3IaNQLzKogN4d/noaMGvAK+U6U53+KFiWcV9p3EmXr1Pc9af2TIarWJ
   K1gTPqJbUppHxQQEW4e3tQpZ3cdq6JrGELlbqMk3Mb+J+7P+GXfsSqSNz
   NwFoONOgAdt7OnNiaOcFU04SyYcbBf9xJ1N8n0cOpLuk7/j4+VZvNSPQA
   n/bBGkZymmiqyc09hsKpyBxMCTHBSMeMhXCgUZWik2VkDvLkGzBdTiLw8
   pAXh9dxtZ4DOg9seeN66JxawlLfrSSaZAQkAm97R5tDSfpUnkxlpB7i5v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="346362205"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="346362205"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 10:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="864272370"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="864272370"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Apr 2023 10:31:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnNGt-000Zl9-2Q;
	Fri, 14 Apr 2023 17:31:39 +0000
Date: Sat, 15 Apr 2023 01:31:11 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:hotplug 30/43] arch/mips/kernel/smp.c:694:6: error:
 redefinition of 'arch_cpuhp_cleanup_dead_cpu'
Message-ID: <202304150132.q2B7hVx8-lkp@intel.com>
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
head:   4d727216750fd6fa9e783fbfa84c683fd41824e7
commit: 4f735a0bfa6f52b00634270bf5272473d341def5 [30/43] MIPS: SMP_CPS: Switch to hotplug core state synchronization
config: mips-bmips_be_defconfig (https://download.01.org/0day-ci/archive/20230415/202304150132.q2B7hVx8-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=4f735a0bfa6f52b00634270bf5272473d341def5
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel hotplug
        git checkout 4f735a0bfa6f52b00634270bf5272473d341def5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150132.q2B7hVx8-lkp@intel.com/

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
   include/linux/cpuhotplug.h:531:20: note: previous definition of 'arch_cpuhp_cleanup_dead_cpu' with type 'void(unsigned int)'
     531 | static inline void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu) { }
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
