Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4720D5258
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692622280; x=1724158280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cLkdLFivZNKNMeutfqOQzBRgqDpQs4o8cFwXjf/swPQ=;
  b=cMnZGDNeMaZ5kqHnxg5V2KJHWr6fFQ65l61sNmJCO4/jFTRjexoRTYbF
   E1LhRHYIUJHe4d4Wsj6n6EWAWG1bI/jeH0/WiVMhv3q6r3pYjXfzSRbTR
   LY8vLlIBpUMq7OlzphYAua+ttpjrbxlq5ozT9UPZRkgPIcb94IBN02Nre
   IBTt884Ta+usP0uAiAfoiDtlXX+KkdZIm1flM4cUiDg48g/8k12G7ddeW
   JUfPCGj43Hqn+MZXSYo1gfGbWE6f46xBsYmyAMQAvCRC6Nq35jedvov9t
   RAc8x6rvL1WaE5YWeAdMWX6X+7ZeftzH72cQ/JP5lSSniEDQ6vMkfYhir
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437503051"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="437503051"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 05:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="738887927"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="738887927"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Aug 2023 05:51:16 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY4NH-0000UK-1s;
	Mon, 21 Aug 2023 12:51:15 +0000
Date: Mon, 21 Aug 2023 20:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: WANG Xuerui <git@xen0n.name>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [linux-next:master 6848/11453] sound/pci/bt87x.c:27:12: warning:
 'index' defined but not used
Message-ID: <202308212007.ZUt7noOA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: e2843c7596e77f4f9b006a1417546231395d0986 [6848/11453] LoongArch: Replace -ffreestanding with finer-grained -fno-builtin's
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230821/202308212007.ZUt7noOA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212007.ZUt7noOA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212007.ZUt7noOA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/percpu.h:13,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from sound/pci/bt87x.c:11:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   In file included from include/linux/init.h:5,
                    from sound/pci/bt87x.c:10:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
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
   sound/pci/bt87x.c:33:1: note: in expansion of macro 'module_param_array'
      33 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/bt87x.c:27:12: warning: 'index' defined but not used [-Wunused-variable]
      27 | static int index[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = -2}; /* Exclude the first card */
         |            ^~~~~
--
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
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
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
>> sound/usb/card.c:63:12: warning: 'index' defined but not used [-Wunused-variable]
      63 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~


vim +/index +27 sound/pci/bt87x.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  26  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @27  static int index[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = -2}; /* Exclude the first card */
^1da177e4c3f41 Linus Torvalds 2005-04-16  28  static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;	/* ID for this card */
a67ff6a54095e2 Rusty Russell  2011-12-15  29  static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;	/* Enable this card */
6581f4e74d8541 Takashi Iwai   2006-05-17  30  static int digital_rate[SNDRV_CARDS];	/* digital input rate */
6205372c320bed Takashi Iwai   2020-07-14  31  static bool load_all;	/* allow to load cards not the allowlist */
^1da177e4c3f41 Linus Torvalds 2005-04-16  32  

:::::: The code at line 27 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
