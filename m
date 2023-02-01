Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4750C33FA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 18:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675277086; x=1706813086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d5exMxam/qAcRI1LX103GLTpWm9Jhq4rvW982LKDxLg=;
  b=mLCLbP/2c+pvjBn9rJ9xZww2a2NwosM2M9LQM4+j+vTSFIYIykuh+gd1
   CXXSU7C6jX2N6K/2pLiPCLNQD/DQ3+9parrq5Pw0V1qMwJdj4kFy8rVpP
   lQAjPNRBKTlbdQpHTyNtLeurnNni2bieFX/PppFP6vf8sUSBEGSayRUwI
   TDq2wpDNYJ0nDbuHnmUAHOdWbx6R+iMLOWt0W6w4wJsFjmkQtqqvyFkTQ
   EsqJ4fCzkisIu96pDCkTUpyAINBJXCvhJTmu4opr+CL6wCPFn1ZGFcXLh
   oa41LGen3M1Ua2zvO+jVxL6LCSAxp/zwq3c8r2J3OB3VN2rLRJgeVviDx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330371592"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330371592"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 10:44:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="910410099"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="910410099"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2023 10:44:44 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNI67-0005i0-2i;
	Wed, 01 Feb 2023 18:44:43 +0000
Date: Thu, 2 Feb 2023 02:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3 12/25]
 arch/m68k/include/asm/page_mm.h:131:26: error: invalid operands to binary <<
 (have 'void *' and 'int')
Message-ID: <202302020236.tnYI7Atm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3
head:   ac3cfb78163256f2febd47ebd017d9f5b75820dd
commit: 246a4c87fbded16b1202eac820589fbf249f129f [12/25] m68k/mm: Make pfn accessors static inlines
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302020236.tnYI7Atm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=246a4c87fbded16b1202eac820589fbf249f129f
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3
        git checkout 246a4c87fbded16b1202eac820589fbf249f129f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/kernel/asm-offsets.c:15:
   arch/m68k/include/asm/page_mm.h: In function 'pfn_to_virt':
>> arch/m68k/include/asm/page_mm.h:131:26: error: invalid operands to binary << (have 'void *' and 'int')
     131 |         return __va(pfn) << PAGE_SHIFT;
         |                ~~~~~~~~~ ^~
         |                |
         |                void *
   make[2]: *** [scripts/Makefile.build:114: arch/m68k/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +131 arch/m68k/include/asm/page_mm.h

   128	
   129	static inline void * pfn_to_virt(unsigned long pfn)
   130	{
 > 131		return __va(pfn) << PAGE_SHIFT;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
