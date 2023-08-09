Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE253612D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691595159; x=1723131159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EkN+dcMpmHQwmwH8fRlWc6aK7l43Ka5Iwdu4+rrkgh0=;
  b=O2DC28GE3uAeosqKwDWwcRYBSp+1Au4GPl50cgVsP1/MkwyxZka0J+oQ
   PIxoXUeyet2tojE/Q6Umtv64c34hrp6GiESRg7OE+sjiIZEXAY2l9W4GN
   AgV/AgLrLdPpi8mGLa9MOtYHHhNNRbaCgieZkKNfXCcPqj90j2mhml2JK
   3Masi7afcI4faDVEIIJO+rQ4KGglXcd2aJ1Qexp8JFWfg+zniQsL7nTl9
   8tLiZOlkQG67YKr/rOdCsGOyEaYilUjJydEWvmaTKCS6NknAIa26+Jp+7
   4NxwbPz5AqkjQ/u2eMsmr8M6yddf6YvQDfr7qC+hNgsc4IqMzIhPq9vpa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="368614069"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="368614069"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 08:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="681726251"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="681726251"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Aug 2023 08:32:36 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTlAq-0006C6-0F;
	Wed, 09 Aug 2023 15:32:36 +0000
Date: Wed, 9 Aug 2023 23:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.5-rc1 8/12]
 arch/openrisc/include/asm/page.h:82:26: error: invalid operands to binary <<
 (have 'void *' and 'int')
Message-ID: <202308092341.eCJFkiBT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.5-rc1
head:   b6a25d37eca4850c246b94d73bd2e3c75860d265
commit: fff0346dea0719290c5eca8239fa15406e813c95 [8/12] openrisc: Make pfn accessors statics inlines
config: openrisc-randconfig-r032-20230809 (https://download.01.org/0day-ci/archive/20230809/202308092341.eCJFkiBT-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092341.eCJFkiBT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308092341.eCJFkiBT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/openrisc/include/asm/processor.h:19,
                    from arch/openrisc/include/asm/thread_info.h:22,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:5,
                    from ./arch/openrisc/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from arch/openrisc/kernel/asm-offsets.c:23:
   arch/openrisc/include/asm/page.h: In function 'pfn_to_virt':
>> arch/openrisc/include/asm/page.h:82:26: error: invalid operands to binary << (have 'void *' and 'int')
      82 |         return __va(pfn) << PAGE_SHIFT;
         |                          ^~
   make[3]: *** [scripts/Makefile.build:116: arch/openrisc/kernel/asm-offsets.s] Error 1 shuffle=1625006458
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=1625006458
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1625006458
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1625006458
   make: Target 'prepare' not remade because of errors.


vim +82 arch/openrisc/include/asm/page.h

    79	
    80	static inline void * pfn_to_virt(unsigned long pfn)
    81	{
  > 82		return __va(pfn) << PAGE_SHIFT;
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
