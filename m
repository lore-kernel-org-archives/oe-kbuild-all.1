Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10363C10
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 11:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678794578; x=1710330578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0c0Wyi+yn/1nqMBtS0qAN+oUEofV4FihW8UKQP/tkdw=;
  b=Dp2Mh2V8OpluKkW4WjAgJf8u6AfN+ae6UTbgQQZXleh+4Azqw70H94uy
   LyXYvRqAiu8rs9Hsr1n8JQUOAWr59VPLgeAKfb/1QjmUp4VX5i7vuin4x
   Ef63Ai9rZ3G+AVvqWWpj07MwNMvMx91Wr7VzxgGHUIat+30pcBD4fxLv1
   WprpxuIubXdhC6PokVylnQr8Plfkg9K5i3CyzufG7irIBJDl0Mo+68Mv1
   LCUZ1kLmPvF/dVi+OQJsm7VrfPDX/0iPq9PoLHmL2ZteGh78f1Lcmm9BF
   Ec/cN+P+/QICsE2Kb9OunG8l2WpFQzwNXqtfmTIFxMsjByH372P7pZp02
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="339765144"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="339765144"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 04:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="743294136"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="743294136"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Mar 2023 04:49:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc39p-0006su-2r;
	Tue, 14 Mar 2023 11:49:33 +0000
Date: Tue, 14 Mar 2023 19:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
 10/31] arch/csky/include/asm/page.h:88:26: error: invalid operands to binary
 << (have 'void *' and 'int')
Message-ID: <202303141916.09MCg6S3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
head:   961fd7e75191ae82383f80c1dfd97559f14965b8
commit: bea7055d9a9a982090f391a7d7f2d8a02401b465 [10/31] csky: Make pfn accessors static inlines
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230314/202303141916.09MCg6S3-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=bea7055d9a9a982090f391a7d7f2d8a02401b465
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
        git checkout bea7055d9a9a982090f391a7d7f2d8a02401b465
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141916.09MCg6S3-lkp@intel.com/

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
