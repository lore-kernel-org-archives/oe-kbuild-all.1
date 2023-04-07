Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DBFA46
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 01:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680830007; x=1712366007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+PZys9fxMjM130NoN/CJgRti4E5+EI2FQkz7stl29Co=;
  b=BN+FETVvw6TBCYuRAG4ijqjVPP4eVL8FZCqHB0esb/teCGr4MIxyLRYh
   3SzfDusu66mvkuPxEIU2OGUdtc7Vo0MhV7ELc+yhs1AoK91LyYd49FecD
   G1crK2rcgf2T1uIK0tVZpvFbwVDmfISCCopL6vG44Cz56EcpSA5cZDTpP
   V/pUaYOrweGLxRog4viBOmlPnoz0gsGaDH2cGLNOJFuZHi6cDu2FMkKEx
   hLMqgdOVptZGQDbPtUYlUUKkTbDC5zZvYVDGvFGoPgxfAVc/CSrRKaF+A
   pYjxq/OWb1JX1T5ojTOX4llPpxhwyMEXg+4d5xgR+oBLVwyVzU+/OIOt8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344654791"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="344654791"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 18:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664712329"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="664712329"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Apr 2023 18:13:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkafI-000Ry4-0r;
	Fri, 07 Apr 2023 01:13:20 +0000
Date: Fri, 7 Apr 2023 09:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:hotplug 31/43] arch/parisc/kernel/smp.c:505:6: error:
 redefinition of 'arch_cpuhp_cleanup_dead_cpu'
Message-ID: <202304070910.Ih30vmQN-lkp@intel.com>
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
commit: ef6c27c6de3a4e7cfb2df48c52d24c46762ed341 [31/43] parisc: Switch to hotplug core state synchronization
config: parisc-randconfig-r015-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070910.Ih30vmQN-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=ef6c27c6de3a4e7cfb2df48c52d24c46762ed341
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel hotplug
        git checkout ef6c27c6de3a4e7cfb2df48c52d24c46762ed341
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070910.Ih30vmQN-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/parisc/kernel/smp.c:120:1: warning: no previous prototype for 'ipi_interrupt' [-Wmissing-prototypes]
     120 | ipi_interrupt(int irq, void *dev_id)
         | ^~~~~~~~~~~~~
   arch/parisc/kernel/smp.c:311:6: warning: no previous prototype for 'smp_callin' [-Wmissing-prototypes]
     311 | void smp_callin(unsigned long pdce_proc)
         |      ^~~~~~~~~~
>> arch/parisc/kernel/smp.c:505:6: error: redefinition of 'arch_cpuhp_cleanup_dead_cpu'
     505 | void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/cpu.h:20,
                    from arch/parisc/kernel/smp.c:31:
   include/linux/cpuhotplug.h:531:20: note: previous definition of 'arch_cpuhp_cleanup_dead_cpu' with type 'void(unsigned int)'
     531 | static inline void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_cpuhp_cleanup_dead_cpu +505 arch/parisc/kernel/smp.c

   504	
 > 505	void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
