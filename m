Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF666187D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675334140; x=1706870140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DEpuUTzbLIq7NrB9c6pgkZu8CgkK0ApIE1EFONWN9RY=;
  b=HDZjSigkc3Kd3oBP59hPB5nhAuUOlxQ0EueqAKOb4IOuTCUwrH0Eh4Tq
   ltreUoVi/qZqaWXly/sRFNRo1ylvfngw+NQF8pCr6CAICLSH9+mwatisA
   WLGOv32Hk285tNiB8TfcMu9G4I8ki2JoWMIP6jqQqb2n+bO4eI6IRKkjO
   MpPqQgcgwFgqW9Avf7VfstlJ8MxLV/9T0mAkbUDYhS3QvTajQfUjm1kgm
   1xMHQS4dH+2xHoWDeaccUmCB+R5qR8+VNnOFBc94iA9WPuxF0uP1wZSMI
   QTx0NnWp88EgVMmO1gKi2+N1NPBxA9OKYkAAigAFsfZpfOqDTw/QefCQY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="312060494"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="312060494"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 02:35:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="665233783"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="665233783"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Feb 2023 02:35:25 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNWw8-0006QK-1D;
	Thu, 02 Feb 2023 10:35:24 +0000
Date: Thu, 2 Feb 2023 18:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3 10/25]
 arch/csky/include/asm/page.h:88:26: error: invalid operands to binary <<
 (have 'void *' and 'int')
Message-ID: <202302021858.5D7Mdevu-lkp@intel.com>
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
commit: bea7055d9a9a982090f391a7d7f2d8a02401b465 [10/25] csky: Make pfn accessors static inlines
config: csky-randconfig-r032-20230201 (https://download.01.org/0day-ci/archive/20230202/202302021858.5D7Mdevu-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=bea7055d9a9a982090f391a7d7f2d8a02401b465
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3
        git checkout bea7055d9a9a982090f391a7d7f2d8a02401b465
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/csky/include/asm/thread_info.h:9,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:5,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from arch/csky/kernel/asm-offsets.c:4:
   arch/csky/include/asm/page.h: In function 'pfn_to_virt':
>> arch/csky/include/asm/page.h:88:26: error: invalid operands to binary << (have 'void *' and 'int')
      88 |         return __va(pfn) << PAGE_SHIFT;
         |                          ^~
   make[2]: *** [scripts/Makefile.build:114: arch/csky/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +88 arch/csky/include/asm/page.h

    85	
    86	static inline void * pfn_to_virt(unsigned long pfn)
    87	{
  > 88		return __va(pfn) << PAGE_SHIFT;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
