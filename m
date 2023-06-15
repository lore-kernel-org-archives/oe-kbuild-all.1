Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B2D2E0D4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 21:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686863932; x=1718399932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S4XH0M32qWiUrVRLEz7yrGH/OgHTT37julNFIgHFmdM=;
  b=RvFLXgsn6mjER4+hdsWvfdZ5RpDRe7h92b/0hTmNLL6YxWVioHtY0Sq9
   ExgSLLKqg9mVz3/TYeYEhlv+r8R5/jVlbGyGHVWCIDED2P863NtIVI+1V
   UjdOHvtWmrnAuUkUN/Kl80rNXaR5evUOmGl3rvTvCLnme85S8Q66pycuz
   FEqaG1cRFRnDJw5AsDLNnoiuLnSNiK3w2qJ+9mvcjmytlQYgjnGiCb4HZ
   qTT+9klCJE0NhLZCJeyEWcv1D0BUT5UWSB9I9ccIc5QIZVrtr/p0TLXBU
   UEXiuRMCfb6qsjjB231pQuTn9NW9MW76Vq4wxzRptrNIJezUd/NFhi+Qc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387636620"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="387636620"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 14:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="1042835331"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="1042835331"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jun 2023 14:18:50 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9uMj-0000OH-38;
	Thu, 15 Jun 2023 21:18:49 +0000
Date: Fri, 16 Jun 2023 05:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:init 13/17] arch/x86/mm/mem_encrypt.c:79:13: error:
 redefinition of 'mem_encrypt_init'
Message-ID: <202306160543.6uYOWD3f-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git init
head:   ac34be5c954816ae3e4097f58e82ce408cc4dcbb
commit: e62e04db8441af32c19e3cc36ec2488c6eb62aed [13/17] init, x86: Move mem_encrypt_init() into arch_cpu_finalize_init()
config: x86_64-randconfig-a005-20230615 (https://download.01.org/0day-ci/archive/20230616/202306160543.6uYOWD3f-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=e62e04db8441af32c19e3cc36ec2488c6eb62aed
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel init
        git checkout e62e04db8441af32c19e3cc36ec2488c6eb62aed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160543.6uYOWD3f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/mem_encrypt.c:79:13: error: redefinition of 'mem_encrypt_init'
      79 | void __init mem_encrypt_init(void)
         |             ^~~~~~~~~~~~~~~~
   In file included from include/linux/mem_encrypt.h:17,
                    from arch/x86/include/asm/processor-flags.h:6,
                    from arch/x86/include/asm/irqflags.h:5,
                    from include/linux/irqflags.h:16,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from include/linux/dma-direct.h:9,
                    from arch/x86/mm/mem_encrypt.c:10:
   arch/x86/include/asm/mem_encrypt.h:88:20: note: previous definition of 'mem_encrypt_init' with type 'void(void)'
      88 | static inline void mem_encrypt_init(void) { }
         |                    ^~~~~~~~~~~~~~~~


vim +/mem_encrypt_init +79 arch/x86/mm/mem_encrypt.c

20f07a044a76ae Kirill A. Shutemov 2021-12-06  77  
20f07a044a76ae Kirill A. Shutemov 2021-12-06  78  /* Architecture __weak replacement functions */
20f07a044a76ae Kirill A. Shutemov 2021-12-06 @79  void __init mem_encrypt_init(void)

:::::: The code at line 79 was first introduced by commit
:::::: 20f07a044a76aebaaa0603038857229b5c460d69 x86/sev: Move common memory encryption code to mem_encrypt.c

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
