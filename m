Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38423DB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 03:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694750026; x=1726286026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4d/k/vMUYUJTBqlom9+EyhIIfuCFjGCNOo9BCuozgAw=;
  b=j7B2EVue2exOLWJc0be45kjo2L3j73PNJUyIgkLQuDFsSkXqKJwKd5BU
   Dtmfk9LzLuhI/O89aiM3Zv8ZA5wHUPwj10W+l9OHBYvJn36qiFjPZ67zf
   4bcapBMrrw9kYhnkGR9ns2s+lkQ2GhBA0sc5QjyDD4sXs9bEECA4I9hM8
   7qqGjD9vdckSgp1sIgoavBM9g8zpKv5cbhHxDwPIXbLu2e1vPxlx8YcSX
   eW1ijRw5hpZJakJp8GqdKsOTi8OFa/Fbe0/v8gaMY0eSRXG6BRv0q2foK
   gJdMQ2S2Wip3ACcipnqdqgaaodmGUWH5h3KJtIZJ+dw+nvk8fPbzaoa3f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376486022"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="376486022"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 20:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="991696049"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="991696049"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Sep 2023 20:53:44 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgzth-0002PD-10;
	Fri, 15 Sep 2023 03:53:38 +0000
Date: Fri, 15 Sep 2023 11:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 74/133] arch/x86/include/asm/svm.h:514:9:
 error: implicit declaration of function 'ASSERT_STRUCT_OFFSET'
Message-ID: <202309151120.mHgzEN0H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   5ae4363848a6f48988a8fb5caea3d34503785a21
commit: 033671fc511439f6fde88640d0bff031ad9bb80a [74/133] KVM: SVM: Name and check reserved fields with structs offset
config: i386-randconfig-011-20230915 (https://download.01.org/0day-ci/archive/20230915/202309151120.mHgzEN0H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151120.mHgzEN0H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309151120.mHgzEN0H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/hyperv/ivm.c:13:
   arch/x86/include/asm/svm.h: In function '__unused_size_checks':
>> arch/x86/include/asm/svm.h:514:9: error: implicit declaration of function 'ASSERT_STRUCT_OFFSET' [-Werror=implicit-function-declaration]
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/svm.h:526:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     526 |         BUILD_BUG_RESERVED_OFFSET(vmcb_save_area, 0xa0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:526:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     526 |         BUILD_BUG_RESERVED_OFFSET(vmcb_save_area, 0xa0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:527:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     527 |         BUILD_BUG_RESERVED_OFFSET(vmcb_save_area, 0xcc);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:528:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     528 |         BUILD_BUG_RESERVED_OFFSET(vmcb_save_area, 0xd8);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:529:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     529 |         BUILD_BUG_RESERVED_OFFSET(vmcb_save_area, 0x180);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:530:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     530 |         BUILD_BUG_RESERVED_OFFSET(vmcb_save_area, 0x248);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:531:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     531 |         BUILD_BUG_RESERVED_OFFSET(vmcb_save_area, 0x298);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:533:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     533 |         BUILD_BUG_RESERVED_OFFSET(sev_es_save_area, 0xc8);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:534:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     534 |         BUILD_BUG_RESERVED_OFFSET(sev_es_save_area, 0xcc);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:535:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     535 |         BUILD_BUG_RESERVED_OFFSET(sev_es_save_area, 0xd8);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:536:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     536 |         BUILD_BUG_RESERVED_OFFSET(sev_es_save_area, 0x1c0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:537:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     537 |         BUILD_BUG_RESERVED_OFFSET(sev_es_save_area, 0x248);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:538:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     538 |         BUILD_BUG_RESERVED_OFFSET(sev_es_save_area, 0x298);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:539:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     539 |         BUILD_BUG_RESERVED_OFFSET(sev_es_save_area, 0x2f0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:540:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     540 |         BUILD_BUG_RESERVED_OFFSET(sev_es_save_area, 0x320);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:541:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     541 |         BUILD_BUG_RESERVED_OFFSET(sev_es_save_area, 0x380);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:542:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     542 |         BUILD_BUG_RESERVED_OFFSET(sev_es_save_area, 0x3f0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:544:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     544 |         BUILD_BUG_RESERVED_OFFSET(ghcb_save_area, 0x0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:545:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     545 |         BUILD_BUG_RESERVED_OFFSET(ghcb_save_area, 0xcc);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:546:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     546 |         BUILD_BUG_RESERVED_OFFSET(ghcb_save_area, 0x148);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:547:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     547 |         BUILD_BUG_RESERVED_OFFSET(ghcb_save_area, 0x168);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:548:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     548 |         BUILD_BUG_RESERVED_OFFSET(ghcb_save_area, 0x180);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:549:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     549 |         BUILD_BUG_RESERVED_OFFSET(ghcb_save_area, 0x1e0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:550:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     550 |         BUILD_BUG_RESERVED_OFFSET(ghcb_save_area, 0x200);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:551:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     551 |         BUILD_BUG_RESERVED_OFFSET(ghcb_save_area, 0x320);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:552:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     552 |         BUILD_BUG_RESERVED_OFFSET(ghcb_save_area, 0x380);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:553:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     553 |         BUILD_BUG_RESERVED_OFFSET(ghcb_save_area, 0x3b0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/svm.h:514:30: error: expected expression before 'struct'
     514 |         ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
         |                              ^~~~~~
   arch/x86/include/asm/svm.h:555:9: note: in expansion of macro 'BUILD_BUG_RESERVED_OFFSET'
     555 |         BUILD_BUG_RESERVED_OFFSET(ghcb, 0xff0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ASSERT_STRUCT_OFFSET +514 arch/x86/include/asm/svm.h

   512	
   513	#define BUILD_BUG_RESERVED_OFFSET(x, y) \
 > 514		ASSERT_STRUCT_OFFSET(struct x, reserved ## _ ## y, y)
   515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
