Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEDD36A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 01:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694742213; x=1726278213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Zixrr10o9M88noBSHesWycv9vN9Z7S0VmWX9nUcQzc=;
  b=mMmeLbUpBUYEhZvcdUM089XBZAoVOHmgfnuaa+mm+vCXqG9CW/UxY+4L
   08p31KkDeYEyBw0iQOnRHsGdjwipSdTAu4kHYxVVpCoTIwXyxsAw5787W
   c+Vf2n20Cj7KpMLZ25T7hmILCfBCzsrqzQKaQZ1fMkHiabx8JJ8E2FEM2
   uz9BvsbjqFvPWCdwYrt2ZICHh4wPiBefK86VBfyZjtp0tUJl3kBEPhcdg
   V2By1CbJRxoIrXPiJXG543FV8QKsJzn5krE7FI8GSpFWzKzRniewRYX2Q
   TGJW1nwHKd8v5GywhR7EFmqFO+fssZb/gGomu2AWFoFgnHRcR8kzdUp68
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376469807"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="376469807"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 18:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="810330450"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="810330450"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Sep 2023 18:40:09 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgxoU-0002H7-2t;
	Fri, 15 Sep 2023 01:40:06 +0000
Date: Fri, 15 Sep 2023 09:39:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-kunit 5/9] arch/loongarch/include/asm/page.h:99:35:
 error: 'READ_IMPLIES_EXEC' undeclared
Message-ID: <202309150911.0CwWN4PA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-kunit
head:   75675904b940d8090d74bde195d8ba4a2e3aee80
commit: 282ae3bc8ef2f1742153b9462ff31c20c09ebc6a [5/9] iov_iter: Create a function to prepare userspace VM for UBUF/IOVEC tests
config: loongarch-randconfig-002-20230915 (https://download.01.org/0day-ci/archive/20230915/202309150911.0CwWN4PA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309150911.0CwWN4PA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150911.0CwWN4PA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm_types_task.h:16,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from lib/kunit_iov_iter.c:10:
   lib/kunit_iov_iter.c: In function 'iov_kunit_create_user_buf':
>> arch/loongarch/include/asm/page.h:99:35: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
      99 |          ((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0) | \
         |                                   ^~~~~~~~~~~~~~~~~
   include/linux/mm.h:414:32: note: in expansion of macro 'VM_DATA_DEFAULT_FLAGS'
     414 | #define VM_STACK_DEFAULT_FLAGS VM_DATA_DEFAULT_FLAGS
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:427:37: note: in expansion of macro 'VM_STACK_DEFAULT_FLAGS'
     427 | #define VM_STACK_FLAGS  (VM_STACK | VM_STACK_DEFAULT_FLAGS | VM_ACCOUNT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   lib/kunit_iov_iter.c:294:43: note: in expansion of macro 'VM_STACK_FLAGS'
     294 |         vm_flags_init(vma, VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP);
         |                                           ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/page.h:99:35: note: each undeclared identifier is reported only once for each function it appears in
      99 |          ((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0) | \
         |                                   ^~~~~~~~~~~~~~~~~
   include/linux/mm.h:414:32: note: in expansion of macro 'VM_DATA_DEFAULT_FLAGS'
     414 | #define VM_STACK_DEFAULT_FLAGS VM_DATA_DEFAULT_FLAGS
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:427:37: note: in expansion of macro 'VM_STACK_DEFAULT_FLAGS'
     427 | #define VM_STACK_FLAGS  (VM_STACK | VM_STACK_DEFAULT_FLAGS | VM_ACCOUNT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   lib/kunit_iov_iter.c:294:43: note: in expansion of macro 'VM_STACK_FLAGS'
     294 |         vm_flags_init(vma, VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP);
         |                                           ^~~~~~~~~~~~~~
   lib/kunit_iov_iter.c: At top level:
   lib/kunit_iov_iter.c:261:26: warning: 'iov_kunit_create_user_buf' defined but not used [-Wunused-function]
     261 | static u8 __user *__init iov_kunit_create_user_buf(struct kunit *test,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit_iov_iter.c:191:13: warning: 'iov_kunit_check_user_pattern' defined but not used [-Wunused-function]
     191 | static void iov_kunit_check_user_pattern(struct kunit *test, const u8 __user *buffer,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit_iov_iter.c:119:13: warning: 'iov_kunit_fill_user_buf' defined but not used [-Wunused-function]
     119 | static void iov_kunit_fill_user_buf(struct kunit *test,
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/READ_IMPLIES_EXEC +99 arch/loongarch/include/asm/page.h

09cfefb7fa70c3 Huacai Chen 2022-05-31   96  
09cfefb7fa70c3 Huacai Chen 2022-05-31   97  #define VM_DATA_DEFAULT_FLAGS \
09cfefb7fa70c3 Huacai Chen 2022-05-31   98  	(VM_READ | VM_WRITE | \
09cfefb7fa70c3 Huacai Chen 2022-05-31  @99  	 ((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0) | \
09cfefb7fa70c3 Huacai Chen 2022-05-31  100  	 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
09cfefb7fa70c3 Huacai Chen 2022-05-31  101  

:::::: The code at line 99 was first introduced by commit
:::::: 09cfefb7fa70c3af011b0db0a513fd80b2f18abc LoongArch: Add memory management

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
