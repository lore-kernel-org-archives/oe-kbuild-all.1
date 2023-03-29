Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FA17B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 11:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680090171; x=1711626171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=22+SGcppje4NRDYAga4MlrSwF0aX3K61rlI5WMuxHp8=;
  b=AAPvmVbNZD82fIWmgywMUOFhSe5WQCnb0VxcCLuA+wXeXjp5KTGN7u/w
   Bi55KdeL/KSvKQH/fP9bGAL56E8Gy2Wkm1zMC/tEEan+ain20I9TG9tsf
   uV3If4UQHPH/eP25tL3ifqCLhfvqS/gK5ystzn8LUK7qRmwJ8Bwai6pyh
   Ey3FSsgcMk785Ba2l4t4G4NO2GnxjawW/8le87fSVdWRlOUwIpwbgnRT0
   2d9SDovzTeG896lMdZiSTqai1HU8yoaFGVzebgPqOPF+cXpLdUJOrz/6R
   SBIXULzbKQu4ERxkohhP74jAf1Pu4IuE/gfwF1EGG/Pv7AEVuAI6VZ2/N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="343271878"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="343271878"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 04:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="661574061"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="661574061"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 29 Mar 2023 04:42:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phUCV-000JUO-2s;
	Wed, 29 Mar 2023 11:42:47 +0000
Date: Wed, 29 Mar 2023 19:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 2684/7607] arch/mips/loongson64/smp.c:203:26:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202303291916.ovLFJk2i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   198925fae644b0099b66fac1d972721e6e563b17
commit: 5bd3990723bdf43333b2c268cc6644cb1961125b [2684/7607] MIPS: Loongson64: Prefix ipi register address pointers with __iomem
config: mips-randconfig-s031-20230329 (https://download.01.org/0day-ci/archive/20230329/202303291916.ovLFJk2i-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5bd3990723bdf43333b2c268cc6644cb1961125b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 5bd3990723bdf43333b2c268cc6644cb1961125b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/loongson64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291916.ovLFJk2i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/mips/loongson64/smp.c:203:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:203:26: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:203:26: sparse:     got void *
   arch/mips/loongson64/smp.c:205:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:205:26: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:205:26: sparse:     got void *
   arch/mips/loongson64/smp.c:207:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:207:26: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:207:26: sparse:     got void *
   arch/mips/loongson64/smp.c:209:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:209:26: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:209:26: sparse:     got void *
   arch/mips/loongson64/smp.c:211:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:211:26: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:211:26: sparse:     got void *
   arch/mips/loongson64/smp.c:213:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:213:26: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:213:26: sparse:     got void *
   arch/mips/loongson64/smp.c:215:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:215:26: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:215:26: sparse:     got void *
   arch/mips/loongson64/smp.c:217:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:217:26: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:217:26: sparse:     got void *
   arch/mips/loongson64/smp.c:219:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:219:26: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:219:26: sparse:     got void *
   arch/mips/loongson64/smp.c:221:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:221:26: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:221:26: sparse:     got void *
   arch/mips/loongson64/smp.c:223:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:223:27: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:223:27: sparse:     got void *
   arch/mips/loongson64/smp.c:225:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:225:27: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:225:27: sparse:     got void *
   arch/mips/loongson64/smp.c:227:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:227:27: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:227:27: sparse:     got void *
   arch/mips/loongson64/smp.c:229:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:229:27: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:229:27: sparse:     got void *
   arch/mips/loongson64/smp.c:231:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:231:27: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:231:27: sparse:     got void *
   arch/mips/loongson64/smp.c:233:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:233:27: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:233:27: sparse:     got void *
   arch/mips/loongson64/smp.c:239:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:239:28: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:239:28: sparse:     got void *
   arch/mips/loongson64/smp.c:241:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:241:28: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:241:28: sparse:     got void *
   arch/mips/loongson64/smp.c:243:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:243:28: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:243:28: sparse:     got void *
   arch/mips/loongson64/smp.c:245:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:245:28: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:245:28: sparse:     got void *
   arch/mips/loongson64/smp.c:247:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:247:28: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:247:28: sparse:     got void *
   arch/mips/loongson64/smp.c:249:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:249:28: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:249:28: sparse:     got void *
   arch/mips/loongson64/smp.c:251:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:251:28: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:251:28: sparse:     got void *
   arch/mips/loongson64/smp.c:253:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:253:28: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:253:28: sparse:     got void *
   arch/mips/loongson64/smp.c:255:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:255:28: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:255:28: sparse:     got void *
   arch/mips/loongson64/smp.c:257:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:257:28: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:257:28: sparse:     got void *
   arch/mips/loongson64/smp.c:259:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:259:29: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:259:29: sparse:     got void *
   arch/mips/loongson64/smp.c:261:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:261:29: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:261:29: sparse:     got void *
   arch/mips/loongson64/smp.c:263:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:263:29: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:263:29: sparse:     got void *
   arch/mips/loongson64/smp.c:265:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:265:29: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:265:29: sparse:     got void *
   arch/mips/loongson64/smp.c:267:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:267:29: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:267:29: sparse:     got void *
   arch/mips/loongson64/smp.c:269:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:269:29: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:269:29: sparse:     got void *
   arch/mips/loongson64/smp.c:275:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:275:29: sparse:     expected void [noderef] __iomem *
   arch/mips/loongson64/smp.c:275:29: sparse:     got void *
   arch/mips/loongson64/smp.c:277:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/mips/loongson64/smp.c:277:29: sparse:     expected void [noderef] __iomem *

vim +203 arch/mips/loongson64/smp.c

ffe59ee36aaa83 arch/mips/loongson64/loongson-3/smp.c Huacai Chen 2019-09-21  200  
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  201  static void ipi_set0_regs_init(void)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  202  {
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26 @203  	ipi_set0_regs[0] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  204  		(SMP_CORE_GROUP0_BASE + SMP_CORE0_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  205  	ipi_set0_regs[1] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  206  		(SMP_CORE_GROUP0_BASE + SMP_CORE1_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  207  	ipi_set0_regs[2] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  208  		(SMP_CORE_GROUP0_BASE + SMP_CORE2_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  209  	ipi_set0_regs[3] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  210  		(SMP_CORE_GROUP0_BASE + SMP_CORE3_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  211  	ipi_set0_regs[4] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  212  		(SMP_CORE_GROUP1_BASE + SMP_CORE0_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  213  	ipi_set0_regs[5] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  214  		(SMP_CORE_GROUP1_BASE + SMP_CORE1_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  215  	ipi_set0_regs[6] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  216  		(SMP_CORE_GROUP1_BASE + SMP_CORE2_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  217  	ipi_set0_regs[7] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  218  		(SMP_CORE_GROUP1_BASE + SMP_CORE3_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  219  	ipi_set0_regs[8] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  220  		(SMP_CORE_GROUP2_BASE + SMP_CORE0_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  221  	ipi_set0_regs[9] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  222  		(SMP_CORE_GROUP2_BASE + SMP_CORE1_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  223  	ipi_set0_regs[10] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  224  		(SMP_CORE_GROUP2_BASE + SMP_CORE2_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  225  	ipi_set0_regs[11] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  226  		(SMP_CORE_GROUP2_BASE + SMP_CORE3_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  227  	ipi_set0_regs[12] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  228  		(SMP_CORE_GROUP3_BASE + SMP_CORE0_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  229  	ipi_set0_regs[13] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  230  		(SMP_CORE_GROUP3_BASE + SMP_CORE1_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  231  	ipi_set0_regs[14] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  232  		(SMP_CORE_GROUP3_BASE + SMP_CORE2_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  233  	ipi_set0_regs[15] = (void *)
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  234  		(SMP_CORE_GROUP3_BASE + SMP_CORE3_OFFSET + SET0);
e7841be50fe2b8 arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-06-26  235  }
300459d558725c arch/mips/loongson/loongson-3/smp.c   Huacai Chen 2014-03-21  236  

:::::: The code at line 203 was first introduced by commit
:::::: e7841be50fe2b8751a51a068b8cdcdcb6611e354 MIPS: Add Loongson-3B support

:::::: TO: Huacai Chen <chenhc@lemote.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
