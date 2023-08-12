Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32927EA1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 03:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691810223; x=1723346223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MHR6q7fJg0YrJbCJtdfIPxiV8DQmYkSCW0i9KYEomls=;
  b=UeA0+pLJ1d81tAqqjlQEvTPM3pqyu167h0w5qWavbgK99GChZyKVq4Jz
   m7hyvJqRjX2JPI1l015mq+YZ1nDALPQXz6mHARo82VND19BBDzr0l+IyL
   ThJkk7uni0TRce2NJIiS2SQoEmtpQX0XWqGkixkC3ONfnVqEOJx/g6DJ/
   5K8gAJ4JZ0VSdKOMzFoJD+0qmNIRVg/R0fQdfCGcuh2eFrKsWYqfVtM34
   IT4ZG/+NRjnpRejhs/ZejZYYRMmFHoS96UMjNrXxO3sYr6FCv6Z/2NiiP
   HGNChj43XCQ4o4GthUHXiZKxYEfRF737F4i9bV7aKts0iM724Kpe7p/21
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438133241"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="438133241"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 20:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846976592"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="846976592"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 20:17:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUf7c-0008E8-1x;
	Sat, 12 Aug 2023 03:17:00 +0000
Date: Sat, 12 Aug 2023 11:16:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 15/24] include/linux/build_bug.h:16:51: error:
 bit-field '<anonymous>' width not an integer constant
Message-ID: <202308121153.H9Q0iv6s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   5e3487a17fbf6e33d8ddd60444073ff0bc59b35e
commit: 6908950a8afc72c0e7e4131658994a3cd384c95c [15/24] pci: Add basic support for discovery of IDE on PCIe device
config: arm-randconfig-r046-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121153.H9Q0iv6s-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121153.H9Q0iv6s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121153.H9Q0iv6s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/pci/echoaudio/layla20.c:39:
   include/linux/pci.h:352:47: warning: 'enum pci_ide_stream_type' declared inside parameter list will not be visible outside of this definition or declaration
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:352:67: error: parameter 3 ('type') has incomplete type
     352 |                                          enum pci_ide_stream_type type)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/pci.h:350:19: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     350 | static inline int pcie_ide_stream_create(struct pci_dev *pdev1,
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:21,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:22,
                    from sound/pci/echoaudio/layla20.c:36:
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
   sound/pci/echoaudio/echoaudio.c:19:1: note: in expansion of macro 'module_param_array'
      19 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   In file included from sound/pci/echoaudio/layla20.c:102:
   sound/pci/echoaudio/echoaudio.c:15:12: warning: 'index' defined but not used [-Wunused-variable]
      15 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
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
