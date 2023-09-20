Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B6A1A58E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 18:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695234404; x=1726770404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WiALOXWUkNPA5hGb7Jok02UdOHO+Ud9H3rUD3JPUZEQ=;
  b=Xby/aGhdLHGjDrbAtlpG3d4Oss+DQ6xKrd06K8EIG1ETlTaInIYFoe0R
   U8oeMBGzlSpsQOoEImWKHEm8RsXLHIhTRo5mLkRb1yyfieO+uCNfNTRV2
   3VSRITCHNgHI60ohXC+VARKWFfAGbszo3RkLg/Po5WnhOvSROg+lfJUPg
   hXUXs8loZHTubKZSYSbo80CmS+C2eO8KsI6vlCa4KM3jS7gK5YktKiwiS
   5KaZm+Re0rgRF0iy5UIWx9J2aJRdmK3p3CSDlTuwIo6A5hAFkQBASBVAf
   qqo4rBm2YlpxHARhQOpIcC7pJx0b1DZVJFxldiMbJYvPJfB08W8urpBYG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370620269"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="370620269"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 11:25:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812265957"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="812265957"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 Sep 2023 11:25:04 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj1sk-00091q-0z;
	Wed, 20 Sep 2023 18:25:02 +0000
Date: Thu, 21 Sep 2023 02:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-kunit 5/9] include/linux/mm.h:399:44: error:
 'READ_IMPLIES_EXEC' undeclared
Message-ID: <202309210230.sqvFOrLR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-kunit
head:   911fec82d1f700ecb7c5fd10c209970ef6073c05
commit: 753dd2441f342fda015894074e322652f781251c [5/9] iov_iter: Create a function to prepare userspace VM for UBUF/IOVEC tests
config: powerpc-randconfig-002-20230920 (https://download.01.org/0day-ci/archive/20230921/202309210230.sqvFOrLR-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210230.sqvFOrLR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210230.sqvFOrLR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/kunit_iov_iter.c:12:
   lib/kunit_iov_iter.c: In function 'iov_kunit_create_user_buf':
>> include/linux/mm.h:399:44: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
     399 | #define TASK_EXEC ((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0)
         |                                            ^~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:55: note: in expansion of macro 'TASK_EXEC'
     402 | #define VM_DATA_FLAGS_TSK_EXEC  (VM_READ | VM_WRITE | TASK_EXEC | \
         |                                                       ^~~~~~~~~
   arch/powerpc/include/asm/page.h:251:33: note: in expansion of macro 'VM_DATA_FLAGS_TSK_EXEC'
     251 | #define VM_DATA_DEFAULT_FLAGS32 VM_DATA_FLAGS_TSK_EXEC
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/page_32.h:13:33: note: in expansion of macro 'VM_DATA_DEFAULT_FLAGS32'
      13 | #define VM_DATA_DEFAULT_FLAGS   VM_DATA_DEFAULT_FLAGS32
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:414:32: note: in expansion of macro 'VM_DATA_DEFAULT_FLAGS'
     414 | #define VM_STACK_DEFAULT_FLAGS VM_DATA_DEFAULT_FLAGS
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:427:37: note: in expansion of macro 'VM_STACK_DEFAULT_FLAGS'
     427 | #define VM_STACK_FLAGS  (VM_STACK | VM_STACK_DEFAULT_FLAGS | VM_ACCOUNT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   lib/kunit_iov_iter.c:267:43: note: in expansion of macro 'VM_STACK_FLAGS'
     267 |         vm_flags_init(vma, VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP);
         |                                           ^~~~~~~~~~~~~~
   include/linux/mm.h:399:44: note: each undeclared identifier is reported only once for each function it appears in
     399 | #define TASK_EXEC ((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0)
         |                                            ^~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:55: note: in expansion of macro 'TASK_EXEC'
     402 | #define VM_DATA_FLAGS_TSK_EXEC  (VM_READ | VM_WRITE | TASK_EXEC | \
         |                                                       ^~~~~~~~~
   arch/powerpc/include/asm/page.h:251:33: note: in expansion of macro 'VM_DATA_FLAGS_TSK_EXEC'
     251 | #define VM_DATA_DEFAULT_FLAGS32 VM_DATA_FLAGS_TSK_EXEC
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/page_32.h:13:33: note: in expansion of macro 'VM_DATA_DEFAULT_FLAGS32'
      13 | #define VM_DATA_DEFAULT_FLAGS   VM_DATA_DEFAULT_FLAGS32
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:414:32: note: in expansion of macro 'VM_DATA_DEFAULT_FLAGS'
     414 | #define VM_STACK_DEFAULT_FLAGS VM_DATA_DEFAULT_FLAGS
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:427:37: note: in expansion of macro 'VM_STACK_DEFAULT_FLAGS'
     427 | #define VM_STACK_FLAGS  (VM_STACK | VM_STACK_DEFAULT_FLAGS | VM_ACCOUNT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   lib/kunit_iov_iter.c:267:43: note: in expansion of macro 'VM_STACK_FLAGS'
     267 |         vm_flags_init(vma, VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP);
         |                                           ^~~~~~~~~~~~~~
   lib/kunit_iov_iter.c: At top level:
   lib/kunit_iov_iter.c:234:26: warning: 'iov_kunit_create_user_buf' defined but not used [-Wunused-function]
     234 | static u8 __user *__init iov_kunit_create_user_buf(struct kunit *test,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/READ_IMPLIES_EXEC +399 include/linux/mm.h

a8bef8ff6ea15f Mel Gorman        2010-05-24  398  
c62da0c35d5851 Anshuman Khandual 2020-04-10 @399  #define TASK_EXEC ((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0)
c62da0c35d5851 Anshuman Khandual 2020-04-10  400  

:::::: The code at line 399 was first introduced by commit
:::::: c62da0c35d58518ddb26ff641d2485596567fd96 mm/vma: define a default value for VM_DATA_DEFAULT_FLAGS

:::::: TO: Anshuman Khandual <anshuman.khandual@arm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
