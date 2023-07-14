Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9047F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 01:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689298409; x=1720834409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3B3eDdbpYn4ncbnYeD2Pp/pZs5XJJz2Yeas5AYk2yKo=;
  b=nryUxZRnc+qS95tqdpcbigMzSSqTUEnId94zZ1yCP48zXxan8P9EDlOt
   MBYz/onPUNIoY3oOC7kEz2jEBrGwOCfQTD2PY80nqZYto+ow8Pvgsx0cB
   9Hz4cR8NDzyoyLpUWSWv1NGzit9v+zazyPDwJDZlBuZguXstTM3Dlrgt6
   pzglMCtZ31ih/lkILhQl9AjEr56gxro8r/U8ropI0tLaUHaaZWfAS/aFR
   vhSC6kvorbjqrs5lhGcUpnQLHR50IxRTqAzi9nl+EnRSadr096Q8H2eFK
   NyusAqpSsXujo90QyqKjHEwkWviZamEwRSlXYmchkCt8h+H03ogAAXyx4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="396171237"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="396171237"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 18:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="725511351"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="725511351"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jul 2023 18:33:15 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK7gJ-00072K-0l;
	Fri, 14 Jul 2023 01:33:15 +0000
Date: Fri, 14 Jul 2023 09:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/gmem 1/31] include/linux/compiler_types.h:397:45:
 error: call to '__compiletime_assert_542' declared with attribute error:
 BUILD_BUG_ON failed: sizeof(gfn_range.arg) != sizeof(unsigned long) || +
 sizeof(range->arg) != sizeof(unsigned long)
Message-ID: <202307140936.dt44LonQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/gmem
head:   9cbe075ae7adfaccafbef6c181188fefceaf7482
commit: 799ed8bc49dabefca5bb4b2c773cbe81ab3c0b61 [1/31] KVM: Wrap kvm_gfn_range.pte in a per-action union
config: i386-randconfig-r022-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140936.dt44LonQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140936.dt44LonQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140936.dt44LonQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function '__kvm_handle_hva_range',
       inlined from 'kvm_handle_hva_range' at arch/x86/kvm/../../../virt/kvm/kvm_main.c:656:9,
       inlined from 'kvm_mmu_notifier_change_pte' at arch/x86/kvm/../../../virt/kvm/kvm_main.c:716:2:
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_542' declared with attribute error: BUILD_BUG_ON failed: sizeof(gfn_range.arg) != sizeof(unsigned long) || + sizeof(range->arg) != sizeof(unsigned long)
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:568:9: note: in expansion of macro 'BUILD_BUG_ON'
     568 |         BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(unsigned long) ||
         |         ^~~~~~~~~~~~
   In function '__kvm_handle_hva_range',
       inlined from 'kvm_handle_hva_range_no_flush' at arch/x86/kvm/../../../virt/kvm/kvm_main.c:675:9,
       inlined from 'kvm_mmu_notifier_test_young' at arch/x86/kvm/../../../virt/kvm/kvm_main.c:883:9:
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_542' declared with attribute error: BUILD_BUG_ON failed: sizeof(gfn_range.arg) != sizeof(unsigned long) || + sizeof(range->arg) != sizeof(unsigned long)
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:568:9: note: in expansion of macro 'BUILD_BUG_ON'
     568 |         BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(unsigned long) ||
         |         ^~~~~~~~~~~~
   In function '__kvm_handle_hva_range',
       inlined from 'kvm_handle_hva_range' at arch/x86/kvm/../../../virt/kvm/kvm_main.c:656:9,
       inlined from 'kvm_mmu_notifier_clear_flush_young' at arch/x86/kvm/../../../virt/kvm/kvm_main.c:851:9:
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_542' declared with attribute error: BUILD_BUG_ON failed: sizeof(gfn_range.arg) != sizeof(unsigned long) || + sizeof(range->arg) != sizeof(unsigned long)
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:568:9: note: in expansion of macro 'BUILD_BUG_ON'
     568 |         BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(unsigned long) ||
         |         ^~~~~~~~~~~~
   In function '__kvm_handle_hva_range',
       inlined from 'kvm_mmu_notifier_invalidate_range_end' at arch/x86/kvm/../../../virt/kvm/kvm_main.c:827:2:
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_542' declared with attribute error: BUILD_BUG_ON failed: sizeof(gfn_range.arg) != sizeof(unsigned long) || + sizeof(range->arg) != sizeof(unsigned long)
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:568:9: note: in expansion of macro 'BUILD_BUG_ON'
     568 |         BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(unsigned long) ||
         |         ^~~~~~~~~~~~
   In function '__kvm_handle_hva_range',
       inlined from 'kvm_mmu_notifier_invalidate_range_start' at arch/x86/kvm/../../../virt/kvm/kvm_main.c:789:2:
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_542' declared with attribute error: BUILD_BUG_ON failed: sizeof(gfn_range.arg) != sizeof(unsigned long) || + sizeof(range->arg) != sizeof(unsigned long)
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:568:9: note: in expansion of macro 'BUILD_BUG_ON'
     568 |         BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(unsigned long) ||
         |         ^~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_mmu_notifier_clear_young':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_542' declared with attribute error: BUILD_BUG_ON failed: sizeof(gfn_range.arg) != sizeof(unsigned long) || + sizeof(range->arg) != sizeof(unsigned long)
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:568:9: note: in expansion of macro 'BUILD_BUG_ON'
     568 |         BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(unsigned long) ||
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_542 +397 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  383  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  384  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  386  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  388   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  389   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  396  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @397  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  398  

:::::: The code at line 397 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
