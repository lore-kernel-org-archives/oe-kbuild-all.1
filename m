Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDE0A4C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 06:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689403075; x=1720939075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PAMCWhS5JfFGYC7ijnyjfgRQl5eF8MWvJssk1RdGgMY=;
  b=ZiL54jD8U2GHphlpq9VQryw/1VPyuaR0AgnCFoniLZvF7s0sGS6e2gVM
   /JcM4CUJwFoRhAsCRXZxqE5xZcst0umb49M50AxqYTi6GL7pY/Svv5ypJ
   0LI0eH8t27CDHR0o+U3pgnx0io8czh3xeO7RzqIK5DAc7KAOR9a0cOh3l
   +xbsLjpsdao47fKq/FkBXVmAapJmGeA6ubaKLjKFlOqEj6aFJNyDg91oP
   h5hCwIzCCT5XP0a2oJd9Czxp3G0k5CnGqi6SrApfYE3LmtdxDYfqCgVlX
   dtLE9zRHfaLVMHM2mI0vpplmOQdSKnHPJ5yJMdZzuZ/7JCXILfTI2cKQU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="429399475"
X-IronPort-AV: E=Sophos;i="6.01,207,1684825200"; 
   d="scan'208";a="429399475"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 23:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="812682231"
X-IronPort-AV: E=Sophos;i="6.01,207,1684825200"; 
   d="scan'208";a="812682231"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2023 23:37:53 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKYue-0007zd-1S;
	Sat, 15 Jul 2023 06:37:52 +0000
Date: Sat, 15 Jul 2023 14:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:arm64-gcs 1/48] include/linux/build_bug.h:16:51: error:
 bit-field '<anonymous>' width not an integer constant
Message-ID: <202307151450.SZseecBC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rick,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   e90b1663883e49f3f5aef612fde57503c21ad1ad
commit: 7a8d3d70c8ecb0b3392221a446051a64f9cbadda [1/48] mm: Rename arch pte_mkwrite()'s to pte_mkwrite_novma()
config: sparc-sparc64_defconfig (https://download.01.org/0day-ci/archive/20230715/202307151450.SZseecBC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307151450.SZseecBC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307151450.SZseecBC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:29,
                    from include/sound/pcm.h:15,
                    from sound/drivers/dummy.c:20:
   include/linux/pgtable.h: In function 'pmd_mkwrite':
   include/linux/pgtable.h:528:16: error: implicit declaration of function 'pmd_mkwrite_novma'; did you mean 'pte_mkwrite_novma'? [-Werror=implicit-function-declaration]
     528 |         return pmd_mkwrite_novma(pmd);
         |                ^~~~~~~~~~~~~~~~~
         |                pte_mkwrite_novma
   include/linux/pgtable.h:528:16: error: incompatible types when returning type 'int' but 'pmd_t' was expected
     528 |         return pmd_mkwrite_novma(pmd);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from sound/drivers/dummy.c:7:
   sound/drivers/dummy.c: At top level:
>> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:59: note: in expansion of macro '__must_be_array'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:517:20: note: in expansion of macro 'ARRAY_SIZE'
     517 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:501:9: note: in expansion of macro 'module_param_array_named'
     501 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/dummy.c:62:1: note: in expansion of macro 'module_param_array'
      62 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/drivers/dummy.c:48:12: warning: 'index' defined but not used [-Wunused-variable]
      48 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
   cc1: some warnings being treated as errors


vim +16 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10   6  
bc6245e5efd70c Ian Abbott       2017-07-10   7  #ifdef __CHECKER__
bc6245e5efd70c Ian Abbott       2017-07-10   8  #define BUILD_BUG_ON_ZERO(e) (0)
bc6245e5efd70c Ian Abbott       2017-07-10   9  #else /* __CHECKER__ */
bc6245e5efd70c Ian Abbott       2017-07-10  10  /*
bc6245e5efd70c Ian Abbott       2017-07-10  11   * Force a compilation error if condition is true, but also produce a
8788994376d84d Rikard Falkeborn 2019-12-04  12   * result (of value 0 and type int), so the expression can be used
bc6245e5efd70c Ian Abbott       2017-07-10  13   * e.g. in a structure initializer (or where-ever else comma expressions
bc6245e5efd70c Ian Abbott       2017-07-10  14   * aren't permitted).
bc6245e5efd70c Ian Abbott       2017-07-10  15   */
8788994376d84d Rikard Falkeborn 2019-12-04 @16  #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
527edbc18a70e7 Masahiro Yamada  2019-01-03  17  #endif /* __CHECKER__ */
527edbc18a70e7 Masahiro Yamada  2019-01-03  18  

:::::: The code at line 16 was first introduced by commit
:::::: 8788994376d84d627450fd0d67deb6a66ddf07d7 linux/build_bug.h: change type to int

:::::: TO: Rikard Falkeborn <rikard.falkeborn@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
