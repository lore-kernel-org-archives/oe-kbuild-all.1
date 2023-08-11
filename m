Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D9D1102
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 06:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691733943; x=1723269943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/9zootVvBy//KtZ1tAbkPpmERKwCt8GPpkF0daUkqSE=;
  b=i1VPZpdi33luBcmXkWK1kVVrEIVFt0P3eiszZ5fMTtzHLNfKaVUI5yeH
   j/a+gcIZQK6EPjfmknszuSoqMc+Xn0aFQzdvDmfnK8dKuoZqMJynJ/yK4
   rlg66IsC3eucumy4gl1NqlQ3VvdvFeuco2uN+RRmpsgyAsqAmE+bdMq8R
   x7kJBh09VVQQt9tssghlBdPnHGTtyrIx/BRtrvfgjq0fMf7V9a9YzrsrC
   8mXlxDRtRB65r54d7v/7Ms4+wCtBSltekb2trVakQbAq8L4Jyv6/A+oQt
   7wVwO5N34U6iM/L948xCfCoL6KeX5vAB76S651rsKuiqGaFVAGryBfyD0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="437942492"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="437942492"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 23:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="906326738"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="906326738"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Aug 2023 23:05:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qULH9-0007YR-39;
	Fri, 11 Aug 2023 06:05:31 +0000
Date: Fri, 11 Aug 2023 14:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: WANG Xuerui <git@xen0n.name>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [linux-next:master 7415/8441] include/linux/build_bug.h:16:51:
 error: bit-field '<anonymous>' width not an integer constant
Message-ID: <202308111426.3KoBPpal-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: e2843c7596e77f4f9b006a1417546231395d0986 [7415/8441] LoongArch: Replace -ffreestanding with finer-grained -fno-builtin's
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230811/202308111426.3KoBPpal-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111426.3KoBPpal-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111426.3KoBPpal-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from sound/usb/card.c:26:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   In file included from include/linux/bits.h:21,
                    from include/linux/bitops.h:6,
                    from sound/usb/card.c:23:
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
   sound/usb/card.c:81:1: note: in expansion of macro 'module_param_array'
      81 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/usb/card.c:63:12: warning: 'index' defined but not used [-Wunused-variable]
      63 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~


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
