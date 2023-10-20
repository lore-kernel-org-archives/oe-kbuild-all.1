Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB9C13AC4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0ZXwKhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697808313; x=1729344313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6QKv7AjbGjVgTpjUHkgaKJWVtxib7/I43/5Y5f/Hhug=;
  b=K0ZXwKhKEYs0m0GQq4IPj13bBnQEP6Mvs3j6diLi3kUlJZDgs4SomEsv
   wXeH9hZjz3Eh/tta5eibXy7zj/OLQvVwlHHmjA3fmBBS8J0nPc9Aa3asc
   AwKtXN4CmXdC40mEiMaHmn4xmdKc805F1yRr21unZNv9v9TlEFLO/a0GF
   3yk0q1O5yakbX3M3LDXFm8qztYVj0yH5Z7qkS5BnzOlTOo3LXXd2PnORh
   C2w0XpmMDYMjM9nRCXxrq4zuJFk2DrvC0zNkkRYcfOB7YHBiDZ70/oA6z
   zCwu7JhpHT0wA99NaPMpM466Y7F5SHFMUeYsT5mqoVtaYd9qHZubjgkam
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="450721375"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="450721375"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 06:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="761051554"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="761051554"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Oct 2023 06:25:10 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtpUy-0003Yo-2g;
	Fri, 20 Oct 2023 13:25:08 +0000
Date: Fri, 20 Oct 2023 21:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [srikard:shared_P10_asym_packing 5/9]
 arch/powerpc/include/asm/smp.h:38:1: error: type defaults to 'int' in
 declaration of 'DECLARE_STATIC_KEY_FALSE'
Message-ID: <202310202112.nCIli2wW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/srikard/linux.git shared_P10_asym_packing
head:   ee45990d32ba943988a34a5ca1c8cff9ce3de32c
commit: fccd682bebf9fba102f4ef95d98b3902ff38820e [5/9] powerpc/smp: Move shared_processor static key to smp.h
config: powerpc64-randconfig-002-20231020 (https://download.01.org/0day-ci/archive/20231020/202310202112.nCIli2wW-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310202112.nCIli2wW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310202112.nCIli2wW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/smp.h:113,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:12:
>> arch/powerpc/include/asm/smp.h:38:1: warning: data definition has no type or storage class
      38 | DECLARE_STATIC_KEY_FALSE(shared_processor);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/smp.h:38:1: error: type defaults to 'int' in declaration of 'DECLARE_STATIC_KEY_FALSE' [-Werror=implicit-int]
>> arch/powerpc/include/asm/smp.h:38:1: warning: parameter names (without types) in function declaration
   arch/powerpc/include/asm/smp.h: In function 'is_shared_processor':
>> arch/powerpc/include/asm/smp.h:42:16: error: implicit declaration of function 'static_branch_unlikely' [-Werror=implicit-function-declaration]
      42 |         return static_branch_unlikely(&shared_processor);
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/smp.h:42:40: error: 'shared_processor' undeclared (first use in this function); did you mean 'is_shared_processor'?
      42 |         return static_branch_unlikely(&shared_processor);
         |                                        ^~~~~~~~~~~~~~~~
         |                                        is_shared_processor
   arch/powerpc/include/asm/smp.h:42:40: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/powerpc/kernel/asm-offsets.s] Error 1 shuffle=3329994693
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2 shuffle=3329994693
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=3329994693
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=3329994693
   make: Target 'prepare' not remade because of errors.


vim +38 arch/powerpc/include/asm/smp.h

    36	
    37	#ifdef CONFIG_PPC_SPLPAR
  > 38	DECLARE_STATIC_KEY_FALSE(shared_processor);
    39	
    40	static inline bool is_shared_processor(void)
    41	{
  > 42		return static_branch_unlikely(&shared_processor);
    43	}
    44	#else
    45	static inline bool is_shared_processor(void)
    46	{
    47		return false;
    48	}
    49	#endif
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
