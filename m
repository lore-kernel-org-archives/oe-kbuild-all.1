Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157E91170A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 21:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695675655; x=1727211655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hP0kyE/1B9v498jfdv47SVZuQywuNZuvg1ocILK96XE=;
  b=YlTyvjtqmkNktXlar1OL9URkCrhtWhGL/BUqEva4JbNVmVm8Foe4ZyC+
   G1Q2rrDhLkLnpOqmHANY5k++v6rXFlzPUS5U8ce9lw8kudloppsbx3AsQ
   +4pZmdebMHSTQVqQOIqsNSigRqGKU4AEi9NDxEb2KuQo4CQ/wC/3jQDwk
   cqJ6r/y4Ut609gs864g062KxSY8vt6rvpd6EXlGOLa3Y6fPYlTFL1YyTe
   I5vbpZknFKU+B1DFswQxKCg+N+LQ6dOPqAXFYSDsP9UeLHHZ6OeMJKBDU
   Nk7Xlpo4KEmO21BVN2u3NH1e+L/YuRJl1GLwtwp7Dguio9/bqf+qElXCA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="447880180"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="447880180"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 14:00:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751881804"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="751881804"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 25 Sep 2023 14:00:52 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkshG-00021N-1e;
	Mon, 25 Sep 2023 21:00:50 +0000
Date: Tue, 26 Sep 2023 05:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tinazhangzw:per-iommu_IOTLB_invalidation 9/14]
 sound/pci/ad1889.c:47:12: warning: 'index' defined but not used
Message-ID: <202309260433.4iCwXhM2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/TinaZhangZW/linux.git per-iommu_IOTLB_invalidation
head:   c5144840fce67da51a43d9b6ef05b4b344f5786f
commit: fa8b08eb650d3a32f2190224035305d113bbea75 [9/14] iommu: Add mmu_notifier to iommu_domain
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230926/202309260433.4iCwXhM2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260433.4iCwXhM2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260433.4iCwXhM2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/include/asm/pci.h:7,
                    from include/linux/pci.h:2037,
                    from sound/pci/ad1889.c:24:
   include/linux/iommu.h:117:45: error: field 'notifier' has incomplete type
     117 |                         struct mmu_notifier notifier;
         |                                             ^~~~~~~~
   In file included from include/linux/init.h:5,
                    from sound/pci/ad1889.c:23:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:517:20: note: in expansion of macro 'ARRAY_SIZE'
     517 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:501:9: note: in expansion of macro 'module_param_array_named'
     501 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ad1889.c:48:1: note: in expansion of macro 'module_param_array'
      48 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/ad1889.c:47:12: warning: 'index' defined but not used [-Wunused-variable]
      47 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from arch/s390/include/asm/pci.h:7,
                    from include/linux/pci.h:2037,
                    from sound/pci/atiixp.c:12:
   include/linux/iommu.h:117:45: error: field 'notifier' has incomplete type
     117 |                         struct mmu_notifier notifier;
         |                                             ^~~~~~~~
>> sound/pci/atiixp.c:27:12: warning: 'index' defined but not used [-Wunused-variable]
      27 | static int index = SNDRV_DEFAULT_IDX1;  /* Index 0-MAX */
         |            ^~~~~
--
   In file included from arch/s390/include/asm/pci.h:7,
                    from include/linux/pci.h:2037,
                    from sound/pci/atiixp_modem.c:12:
   include/linux/iommu.h:117:45: error: field 'notifier' has incomplete type
     117 |                         struct mmu_notifier notifier;
         |                                             ^~~~~~~~
>> sound/pci/atiixp_modem.c:27:12: warning: 'index' defined but not used [-Wunused-variable]
      27 | static int index = -2; /* Exclude the first card */
         |            ^~~~~
--
   In file included from arch/s390/include/asm/pci.h:7,
                    from include/linux/pci.h:2037,
                    from sound/pci/intel8x0.c:18:
   include/linux/iommu.h:117:45: error: field 'notifier' has incomplete type
     117 |                         struct mmu_notifier notifier;
         |                                             ^~~~~~~~
>> sound/pci/intel8x0.c:31:12: warning: 'index' defined but not used [-Wunused-variable]
      31 | static int index = SNDRV_DEFAULT_IDX1;  /* Index 0-MAX */
         |            ^~~~~
--
   In file included from arch/s390/include/asm/pci.h:7,
                    from include/linux/pci.h:2037,
                    from sound/pci/intel8x0m.c:15:
   include/linux/iommu.h:117:45: error: field 'notifier' has incomplete type
     117 |                         struct mmu_notifier notifier;
         |                                             ^~~~~~~~
>> sound/pci/intel8x0m.c:29:12: warning: 'index' defined but not used [-Wunused-variable]
      29 | static int index = -2; /* Exclude the first card */
         |            ^~~~~
--
   In file included from arch/s390/include/asm/pci.h:7,
                    from include/linux/pci.h:2037,
                    from sound/pci/aw2/aw2-alsa.c:11:
   include/linux/iommu.h:117:45: error: field 'notifier' has incomplete type
     117 |                         struct mmu_notifier notifier;
         |                                             ^~~~~~~~
   In file included from include/linux/init.h:5,
                    from sound/pci/aw2/aw2-alsa.c:10:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:517:20: note: in expansion of macro 'ARRAY_SIZE'
     517 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:501:9: note: in expansion of macro 'module_param_array_named'
     501 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/aw2/aw2-alsa.c:137:1: note: in expansion of macro 'module_param_array'
     137 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/aw2/aw2-alsa.c:133:12: warning: 'index' defined but not used [-Wunused-variable]
     133 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from arch/s390/include/asm/pci.h:7,
                    from include/linux/pci.h:2037,
                    from sound/pci/lola/lola.c:15:
   include/linux/iommu.h:117:45: error: field 'notifier' has incomplete type
     117 |                         struct mmu_notifier notifier;
         |                                             ^~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from sound/pci/lola/lola.c:8:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:517:20: note: in expansion of macro 'ARRAY_SIZE'
     517 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:501:9: note: in expansion of macro 'module_param_array_named'
     501 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lola/lola.c:27:1: note: in expansion of macro 'module_param_array'
      27 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/lola/lola.c:23:12: warning: 'index' defined but not used [-Wunused-variable]
      23 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from arch/s390/include/asm/pci.h:7,
                    from include/linux/pci.h:2037,
                    from sound/pci/hda/hda_intel.c:31:
   include/linux/iommu.h:117:45: error: field 'notifier' has incomplete type
     117 |                         struct mmu_notifier notifier;
         |                                             ^~~~~~~~
   In file included from include/linux/bits.h:21,
                    from arch/s390/include/asm/ptrace.h:10,
                    from arch/s390/include/asm/lowcore.h:13,
                    from arch/s390/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/delay.h:23,
                    from sound/pci/hda/hda_intel.c:23:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:517:20: note: in expansion of macro 'ARRAY_SIZE'
     517 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:501:9: note: in expansion of macro 'module_param_array_named'
     501 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/hda_intel.c:125:1: note: in expansion of macro 'module_param_array'
     125 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/hda/hda_intel.c:104:12: warning: 'index' defined but not used [-Wunused-variable]
     104 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from arch/s390/include/asm/pci.h:7,
                    from include/linux/pci.h:2037,
                    from sound/pci/mixart/mixart.c:13:
   include/linux/iommu.h:117:45: error: field 'notifier' has incomplete type
     117 |                         struct mmu_notifier notifier;
         |                                             ^~~~~~~~
   In file included from include/linux/init.h:5,
                    from sound/pci/mixart/mixart.c:11:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:517:20: note: in expansion of macro 'ARRAY_SIZE'
     517 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:501:9: note: in expansion of macro 'module_param_array_named'
     501 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/mixart/mixart.c:40:1: note: in expansion of macro 'module_param_array'
      40 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/mixart/mixart.c:36:12: warning: 'index' defined but not used [-Wunused-variable]
      36 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;             /* Index 0-MAX */
         |            ^~~~~
--
   In file included from arch/s390/include/asm/pci.h:7,
                    from include/linux/pci.h:2037,
                    from sound/pci/nm256/nm256.c:17:
   include/linux/iommu.h:117:45: error: field 'notifier' has incomplete type
     117 |                         struct mmu_notifier notifier;
         |                                             ^~~~~~~~
>> sound/pci/nm256/nm256.c:40:12: warning: 'index' defined but not used [-Wunused-variable]
      40 | static int index = SNDRV_DEFAULT_IDX1;  /* Index */
         |            ^~~~~
--
   In file included from arch/s390/include/asm/pci.h:7,
                    from include/linux/pci.h:2037,
                    from sound/pci/rme9652/rme9652.c:12:
   include/linux/iommu.h:117:45: error: field 'notifier' has incomplete type
     117 |                         struct mmu_notifier notifier;
         |                                             ^~~~~~~~
   In file included from include/linux/bits.h:21,
                    from arch/s390/include/asm/ptrace.h:10,
                    from arch/s390/include/asm/lowcore.h:13,
                    from arch/s390/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/delay.h:23,
                    from sound/pci/rme9652/rme9652.c:9:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:517:20: note: in expansion of macro 'ARRAY_SIZE'
     517 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:501:9: note: in expansion of macro 'module_param_array_named'
     501 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/rme9652/rme9652.c:31:1: note: in expansion of macro 'module_param_array'
      31 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/rme9652/rme9652.c:26:12: warning: 'index' defined but not used [-Wunused-variable]
      26 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
..


vim +/index +47 sound/pci/ad1889.c

12bb5b78e51289 Clemens Ladisch 2005-09-01  46  
12bb5b78e51289 Clemens Ladisch 2005-09-01 @47  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
12bb5b78e51289 Clemens Ladisch 2005-09-01  48  module_param_array(index, int, NULL, 0444);
12bb5b78e51289 Clemens Ladisch 2005-09-01  49  MODULE_PARM_DESC(index, "Index value for the AD1889 soundcard.");
12bb5b78e51289 Clemens Ladisch 2005-09-01  50  

:::::: The code at line 47 was first introduced by commit
:::::: 12bb5b78e512898034cdd8813f2889743fa6fa3d [ALSA] ad1889: add AD1889 driver

:::::: TO: Clemens Ladisch <clemens@ladisch.de>
:::::: CC: Jaroslav Kysela <perex@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
