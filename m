Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D86A947
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 19:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688672864; x=1720208864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OCihb67OCnEPzEa4DHOQaSTS0A1da9U0r2LFirfowiA=;
  b=JTW/F7WDX4e1U56wV7CN/i+JIQyoNzXDxmz9Bng1fZNYoRL4jzHfFnwZ
   oEaZacPTNAy4J8hRBsaTjVAAX2LJe4yQ/IzdsgDs+ChHgE9PuxBJssJeh
   RWqNXvbnEualNcdPyKilqFTRTAOumNnIdLAKQ4weGo9sNTLrLn9DnLwhx
   ETtK1P6ft+jhMPv9lByh0vU1bTvX8lSuQJWLE+ojXuyFWTKN9V65sogw+
   PCFTsL0zGZL2zD/U4HbxSZ2DRC1Swd7QkQZAaXYu9WvNwqsW+sHIEUZ2i
   xzC/8hziqb7+NUmPEfjM0icMxCbN8f+4wolqkKqj95T92QJ6Mu3b1AC/S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="429756410"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="429756410"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 12:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="864233916"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="864233916"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2023 12:47:42 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHUx3-0001Xi-2X;
	Thu, 06 Jul 2023 19:47:41 +0000
Date: Fri, 7 Jul 2023 03:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 5/11] lib/spdm.c:114:1: error: stray '#' in program
Message-ID: <202307070309.7WYJXT9F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   db8fb48c579edddd6cefbe057354bec7f4660bb2
commit: 16a792a0df64510db60583a587b7df4ea7757b0c [5/11] PCI/CMA: Authenticate devices on enumeration
config: microblaze-randconfig-r016-20230707 (https://download.01.org/0day-ci/archive/20230707/202307070309.7WYJXT9F-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070309.7WYJXT9F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307070309.7WYJXT9F-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/capability.h:18,
                    from include/linux/cred.h:11,
                    from lib/spdm.c:14:
>> include/vdso/bits.h:7:37: error: expected identifier or '(' before numeric constant
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                     ^
   include/uapi/linux/const.h:20:26: note: in definition of macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^
   include/uapi/linux/const.h:25:26: note: in expansion of macro '_AC'
      25 | #define _UL(x)          (_AC(x, UL))
         |                          ^~~
   include/vdso/const.h:7:26: note: in expansion of macro '_UL'
       7 | #define UL(x)           (_UL(x))
         |                          ^~~
   include/vdso/bits.h:7:34: note: in expansion of macro 'UL'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                  ^~
   lib/spdm.c:91:41: note: in expansion of macro 'BIT'
      91 | #define SPDM_ASYM_RSASSA_3072           BIT(2)
         |                                         ^~~
   lib/spdm.c:113:41: note: in expansion of macro 'SPDM_ASYM_RSASSA_3072'
     113 |                                         SPDM_ASYM_RSASSA_3072           | \
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:6:
>> include/vdso/bits.h:7:40: error: expected ')' before '<<' token
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   lib/spdm.c:91:41: note: in expansion of macro 'BIT'
      91 | #define SPDM_ASYM_RSASSA_3072           BIT(2)
         |                                         ^~~
   lib/spdm.c:113:41: note: in expansion of macro 'SPDM_ASYM_RSASSA_3072'
     113 |                                         SPDM_ASYM_RSASSA_3072           | \
         |                                         ^~~~~~~~~~~~~~~~~~~~~
>> lib/spdm.c:114:1: error: stray '#' in program
     114 | #endif
         | ^
>> lib/spdm.c:125: error: unterminated #if
     125 | #if IS_ENABLED(CRYPTO_SHA512)
         | 
   lib/spdm.c:115: error: unterminated #if
     115 | #if IS_ENABLED(CRYPTO_ECDSA)
         | 


vim +114 lib/spdm.c

869e9710e9b42d Jonathan Cameron 2022-09-06  109  
869e9710e9b42d Jonathan Cameron 2022-09-06  110  /* SPDM algorithms supported by this implementation */
869e9710e9b42d Jonathan Cameron 2022-09-06  111  #define SPDM_ASYM_ALGOS		       (				  \
869e9710e9b42d Jonathan Cameron 2022-09-06  112  #if IS_ENABLED(CRYPTO_RSA)
869e9710e9b42d Jonathan Cameron 2022-09-06  113  					SPDM_ASYM_RSASSA_3072		| \
869e9710e9b42d Jonathan Cameron 2022-09-06 @114  #endif
869e9710e9b42d Jonathan Cameron 2022-09-06  115  #if IS_ENABLED(CRYPTO_ECDSA)
869e9710e9b42d Jonathan Cameron 2022-09-06  116  					SPDM_ASYM_ECDSA_ECC_NIST_P256	| \
869e9710e9b42d Jonathan Cameron 2022-09-06  117  					SPDM_ASYM_ECDSA_ECC_NIST_P384	| \
869e9710e9b42d Jonathan Cameron 2022-09-06  118  #endif
869e9710e9b42d Jonathan Cameron 2022-09-06  119  					0)
869e9710e9b42d Jonathan Cameron 2022-09-06  120  
869e9710e9b42d Jonathan Cameron 2022-09-06  121  #define SPDM_HASH_ALGOS		       (				  \
869e9710e9b42d Jonathan Cameron 2022-09-06  122  #if IS_ENABLED(CRYPTO_SHA256)
869e9710e9b42d Jonathan Cameron 2022-09-06  123  					SPDM_HASH_SHA_256		| \
869e9710e9b42d Jonathan Cameron 2022-09-06  124  #endif
869e9710e9b42d Jonathan Cameron 2022-09-06 @125  #if IS_ENABLED(CRYPTO_SHA512)
869e9710e9b42d Jonathan Cameron 2022-09-06  126  					SPDM_HASH_SHA_384		| \
869e9710e9b42d Jonathan Cameron 2022-09-06  127  #endif
869e9710e9b42d Jonathan Cameron 2022-09-06  128  					0)
869e9710e9b42d Jonathan Cameron 2022-09-06  129  

:::::: The code at line 114 was first introduced by commit
:::::: 869e9710e9b42d9b4ce1bb445d8ce31cd8f5c0d5 spdm: Introduce library to authenticate devices

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
