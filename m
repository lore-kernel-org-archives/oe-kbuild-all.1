Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE515382
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 17:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680110656; x=1711646656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lwsIYxw4/Ib1Dnb3LKffw2h1DQqGivIeKXRX3TJh1Ks=;
  b=TQXLRDWh5c6DI6C26bApJC+lTQGLbtrxLqWnVSMMLZ3MWRawOxzFlu/y
   RWXzvEi3uvFIbKSXa1sIWmlHfmdoFBMDlipAIYlxmCsXnXV+5o5PAqatE
   QHqR6vsFAUneGJbMA11NXj7zWPpGSzfjuKyY950xBX/wFBTanI36kaPrW
   f4WFQhsO02+W529Pest1iZ35dK87mrW5ztyJBfTQu2rV48y/5vAJ3m15f
   J9dUwkTZRqwc7bRKesSPT8Kiywl7/MacaaXBqhjteHn2TU4NHzmxwCwmJ
   UEwx18Tegh42lPPF027mAKykBzeJ2HZPFh82ZJ4pJDg4U7yKZF8LAT7GI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="368720486"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="368720486"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 10:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="1014108463"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="1014108463"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Mar 2023 10:24:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phZWl-000Jl2-1G;
	Wed, 29 Mar 2023 17:24:03 +0000
Date: Thu, 30 Mar 2023 01:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-03292023-yi 15/42]
 include/linux/limits.h:23:25: warning: conversion from 'long long unsigned
 int' to 'long unsigned int' changes value from '18446744073709551615' to
 '4294967295'
Message-ID: <202303300107.AnVq6m7r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-03292023-yi
head:   032ce679f2322b426350f8721d7a1afca1bb7aab
commit: cfab6d45ee4dd485bc223d0135643093a7778923 [15/42] iommufd/selftest: Add domain_alloc_user() support in iommu mock
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20230330/202303300107.AnVq6m7r-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/cfab6d45ee4dd485bc223d0135643093a7778923
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd_nesting-03292023-yi
        git checkout cfab6d45ee4dd485bc223d0135643093a7778923
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300107.AnVq6m7r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/thread_info.h:12,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/xtensa/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from drivers/iommu/iommufd/selftest.c:6:
>> include/linux/limits.h:23:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      23 | #define U64_MAX         ((u64)~0ULL)
         |                         ^
   drivers/iommu/iommufd/iommufd_test.h:120:49: note: in expansion of macro 'U64_MAX'
     120 | #define IOMMU_HWPT_TYPE_BITMAP_SELFTTEST        U64_MAX
         |                                                 ^~~~~~~
   drivers/iommu/iommufd/selftest.c:340:29: note: in expansion of macro 'IOMMU_HWPT_TYPE_BITMAP_SELFTTEST'
     340 |         .hwpt_type_bitmap = IOMMU_HWPT_TYPE_BITMAP_SELFTTEST,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +23 include/linux/limits.h

54d50897d544c8 Masahiro Yamada 2019-03-07  12  
54d50897d544c8 Masahiro Yamada 2019-03-07  13  #define U8_MAX		((u8)~0U)
54d50897d544c8 Masahiro Yamada 2019-03-07  14  #define S8_MAX		((s8)(U8_MAX >> 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  15  #define S8_MIN		((s8)(-S8_MAX - 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  16  #define U16_MAX		((u16)~0U)
54d50897d544c8 Masahiro Yamada 2019-03-07  17  #define S16_MAX		((s16)(U16_MAX >> 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  18  #define S16_MIN		((s16)(-S16_MAX - 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  19  #define U32_MAX		((u32)~0U)
3f50f132d8400e John Fastabend  2020-03-30  20  #define U32_MIN		((u32)0)
54d50897d544c8 Masahiro Yamada 2019-03-07  21  #define S32_MAX		((s32)(U32_MAX >> 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  22  #define S32_MIN		((s32)(-S32_MAX - 1))
54d50897d544c8 Masahiro Yamada 2019-03-07 @23  #define U64_MAX		((u64)~0ULL)
54d50897d544c8 Masahiro Yamada 2019-03-07  24  #define S64_MAX		((s64)(U64_MAX >> 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  25  #define S64_MIN		((s64)(-S64_MAX - 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  26  

:::::: The code at line 23 was first introduced by commit
:::::: 54d50897d544c874562253e2a8f70dfcad22afe8 linux/kernel.h: split *_MAX and *_MIN macros into <linux/limits.h>

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
