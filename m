Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8E5A923
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 20:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680552520; x=1712088520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2JSYHb9SeMpwwibNn4EYm+5+g9x3EwabUEKQtVXhCoY=;
  b=hSjay6p9lgsEbIH80Ha0tz85U//7yeTnzoUfMeBd7+w9c4Juxng3gCp5
   eI8H8TN81XdVKS6QHw5BpqAG/biuC25jeT5sHM2Wr4B7KjoV27thE7yZw
   a3kRTgYohsyb7H56d4jf14MqF/lFHGe/eKvD8mPuvyIgZNVGPq1oBOBs7
   GmLPo4bxWYYYrBLGX2N/HkNqbYgRfSkDFwmZeIAjzQ6uLpF3bR+x51O4G
   R9M4zSbdmhGVVHU5bd/HRLY0JiKxBm6sPblHHdIsn6JBVdSdfS+w92m3Y
   GQIcgaxfMeo4jvkv1x8jDQiGvlmsMgvLP+BntV1/qGMw0caFLPUqSgbAU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322401357"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="322401357"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 13:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="716416519"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="716416519"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Apr 2023 13:08:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjQTl-000Oku-3B;
	Mon, 03 Apr 2023 20:08:37 +0000
Date: Tue, 4 Apr 2023 04:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2022-10 3/4]
 drivers/irqchip/irq-tegra.c:151:18: warning: implicit conversion from
 'unsigned long' to 'u32' (aka 'unsigned int') changes value from
 18446744073709551615 to 4294967295
Message-ID: <202304040413.GuGDgHMy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2022-10
head:   071c6d24d82202916ab7d24d4f2c8bdef9321da9
commit: a97e0e511d0b24a6b5b4f69e48ff407c6f33359f [3/4] FROMGIT: arm64: io: Use asm-generic high level MMIO accessors
config: arm64-randconfig-r004-20230403 (https://download.01.org/0day-ci/archive/20230404/202304040413.GuGDgHMy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15-2022-10
        git checkout a97e0e511d0b24a6b5b4f69e48ff407c6f33359f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304040413.GuGDgHMy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-tegra.c:151:18: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                   writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
                   ~~~~~~~~~~~~~~ ^~~~
   drivers/irqchip/irq-tegra.c:154:18: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                   writel_relaxed(~0ul, ictlr + ICTLR_CPU_IER_CLR);
                   ~~~~~~~~~~~~~~ ^~~~
   drivers/irqchip/irq-tegra.c:175:18: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                   writel_relaxed(~0ul, ictlr + ICTLR_CPU_IER_CLR);
                   ~~~~~~~~~~~~~~ ^~~~
   drivers/irqchip/irq-tegra.c:180:18: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                   writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
                   ~~~~~~~~~~~~~~ ^~~~
   drivers/irqchip/irq-tegra.c:315:18: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                   writel_relaxed(~0UL, base + ICTLR_CPU_IER_CLR);
                   ~~~~~~~~~~~~~~ ^~~~
   5 warnings generated.


vim +151 drivers/irqchip/irq-tegra.c

de3ce0804916a9b Marc Zyngier 2015-03-11  134  
de3ce0804916a9b Marc Zyngier 2015-03-11  135  static int tegra_ictlr_suspend(void)
de3ce0804916a9b Marc Zyngier 2015-03-11  136  {
de3ce0804916a9b Marc Zyngier 2015-03-11  137  	unsigned long flags;
de3ce0804916a9b Marc Zyngier 2015-03-11  138  	unsigned int i;
de3ce0804916a9b Marc Zyngier 2015-03-11  139  
de3ce0804916a9b Marc Zyngier 2015-03-11  140  	local_irq_save(flags);
de3ce0804916a9b Marc Zyngier 2015-03-11  141  	for (i = 0; i < num_ictlrs; i++) {
de3ce0804916a9b Marc Zyngier 2015-03-11  142  		void __iomem *ictlr = lic->base[i];
de3ce0804916a9b Marc Zyngier 2015-03-11  143  
de3ce0804916a9b Marc Zyngier 2015-03-11  144  		/* Save interrupt state */
de3ce0804916a9b Marc Zyngier 2015-03-11  145  		lic->cpu_ier[i] = readl_relaxed(ictlr + ICTLR_CPU_IER);
de3ce0804916a9b Marc Zyngier 2015-03-11  146  		lic->cpu_iep[i] = readl_relaxed(ictlr + ICTLR_CPU_IEP_CLASS);
de3ce0804916a9b Marc Zyngier 2015-03-11  147  		lic->cop_ier[i] = readl_relaxed(ictlr + ICTLR_COP_IER);
de3ce0804916a9b Marc Zyngier 2015-03-11  148  		lic->cop_iep[i] = readl_relaxed(ictlr + ICTLR_COP_IEP_CLASS);
de3ce0804916a9b Marc Zyngier 2015-03-11  149  
de3ce0804916a9b Marc Zyngier 2015-03-11  150  		/* Disable COP interrupts */
de3ce0804916a9b Marc Zyngier 2015-03-11 @151  		writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
de3ce0804916a9b Marc Zyngier 2015-03-11  152  
de3ce0804916a9b Marc Zyngier 2015-03-11  153  		/* Disable CPU interrupts */
de3ce0804916a9b Marc Zyngier 2015-03-11  154  		writel_relaxed(~0ul, ictlr + ICTLR_CPU_IER_CLR);
de3ce0804916a9b Marc Zyngier 2015-03-11  155  
de3ce0804916a9b Marc Zyngier 2015-03-11  156  		/* Enable the wakeup sources of ictlr */
de3ce0804916a9b Marc Zyngier 2015-03-11  157  		writel_relaxed(lic->ictlr_wake_mask[i], ictlr + ICTLR_CPU_IER_SET);
de3ce0804916a9b Marc Zyngier 2015-03-11  158  	}
de3ce0804916a9b Marc Zyngier 2015-03-11  159  	local_irq_restore(flags);
de3ce0804916a9b Marc Zyngier 2015-03-11  160  
de3ce0804916a9b Marc Zyngier 2015-03-11  161  	return 0;
de3ce0804916a9b Marc Zyngier 2015-03-11  162  }
de3ce0804916a9b Marc Zyngier 2015-03-11  163  

:::::: The code at line 151 was first introduced by commit
:::::: de3ce0804916a9b4f3b58e4e78727d5483c4df04 irqchip: tegra: Add DT-based support for legacy interrupt controller

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Jason Cooper <jason@lakedaemon.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
