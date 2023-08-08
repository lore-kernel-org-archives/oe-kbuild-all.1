Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EC8E569
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 10:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691490537; x=1723026537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=84zeQwrMV1Xn8EU6wJo8N4A87M2p9v3RvQzQL9dXaCA=;
  b=lyyHvjVpGBLtkKlKRd8czZ5jcETBdgDxWGhcQZP4z5TqYt8KLY9KFiW6
   1FBrTMaHovuRGijMs/eLZP1Bq2wYFdkoVuDmo1NvZ/nuctiO4ckvCMhCB
   3UpHYU9qp9lpqfXKKqPjGuED0psOYg0jqxJMW2izk4oWwGLzivmOJsgV6
   KNDnHqXqx0rAW6stCAj3Ee6kwoC+W85R/mCmS8CKAyEIFi1P/NvraAC+2
   594657NSFO13/yRmVgbE7pLKtzqxiYrmtQtrXtjsJkOKicyPU0xkUZwEQ
   96av888fUD69cFJACrmR0t3PYSqI7e5n1OBcv0yH9pXDAfRDhUNAsBnDl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374458211"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="374458211"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 03:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1061955449"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="1061955449"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Aug 2023 03:28:55 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTJxP-0005I8-0v;
	Tue, 08 Aug 2023 10:28:55 +0000
Date: Tue, 8 Aug 2023 18:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/csky-virt-to-phys 3/3]
 arch/csky/include/asm/page.h:87:26: error: invalid operands to binary <<
 (have 'void *' and 'int')
Message-ID: <202308081831.AwLfGh1Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/csky-virt-to-phys
head:   cc0c9b81d4f577d38eba4af3cbe268e0eac7b1df
commit: cc0c9b81d4f577d38eba4af3cbe268e0eac7b1df [3/3] csky: Make pfn accessors static inlines
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230808/202308081831.AwLfGh1Z-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081831.AwLfGh1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081831.AwLfGh1Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/csky/include/asm/thread_info.h:9,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:5,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from arch/csky/kernel/asm-offsets.c:4:
   arch/csky/include/asm/page.h: In function 'pfn_to_virt':
>> arch/csky/include/asm/page.h:87:26: error: invalid operands to binary << (have 'void *' and 'int')
      87 |         return __va(pfn) << PAGE_SHIFT;
         |                          ^~
   make[3]: *** [scripts/Makefile.build:116: arch/csky/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +87 arch/csky/include/asm/page.h

    84	
    85	static inline void * pfn_to_virt(unsigned long pfn)
    86	{
  > 87		return __va(pfn) << PAGE_SHIFT;
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
