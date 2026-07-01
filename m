Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA96369D5C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 03:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782877430; cv=none; b=cpcSv58OKcuRM91Qy11Gs8Q+fEZtdIrIQ8UbLUCI/d5DRWNyQn1o0piT73cjHIBPtmUP+vvjTdU6VHPr8dgmPbvuEy/oxAiQO7nihRh2pcobo/o8R5opEXZEb+hum3YPGYRvhfhWqU9AubmS0sJm6hEHj7b0+qpwrcYMbqhblSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782877430; c=relaxed/simple;
	bh=NG/da0Hve6HqmtFxsWlEexfLXQRuKH31aDRxaZtfrj4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mbLRF2XCNebUip2jblb8zKYO2u8MpbEA4wS61ZVsqZieknBwKoB6Z5DRUyKbNC9OWBreaMAe6sFhuz9TAnPo1pL/snm2WeAkb0FrI2S/9aJEe855hEUlbP3vHXJrH089KKYeoicbVUOTfP5jC1JYhRFEh4U0mTQNgTS9O1Lfn5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJXy/EZ8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJXy/EZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782877429; x=1814413429;
  h=date:from:to:cc:subject:message-id;
  bh=NG/da0Hve6HqmtFxsWlEexfLXQRuKH31aDRxaZtfrj4=;
  b=nJXy/EZ8F/ddy5K4RF4wQ6t0kZIw1yvCjiKFTPO/cl+669dEJ25oX8hi
   8T8/9Okud/SaSSpamW3Dubi1EKq0Lfff3WUZ3/ljxDg6XYTNzTCocQAx8
   e/pPGMVEVA3RkDyhLb2bNNv6WGM3NaA91fCfYcY3bAGhLJXrmrvC1pAY6
   T1vyyjX2JanMnG9Z8lO7Ce/FBcKiwo/dGS0OyYHf47hLj3nVUy/3LoyXw
   NBIiCPLxHxEwCwM74P/Kupno17BSjRRD+UA714RN890FYllkYrbuWECn4
   hgmPWOMO78iq8gRAkkrZkne+TAwce6akEcJ/Y5ClHtgr6e1Qj5Na1AcBk
   Q==;
X-CSE-ConnectionGUID: i4Uw4wdLQcutBzVTPigngg==
X-CSE-MsgGUID: zId09+ZBSF23jXhfeQn/8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87283004"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="87283004"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 20:43:48 -0700
X-CSE-ConnectionGUID: SU+p14WuRV6qTyn791A+WA==
X-CSE-MsgGUID: 3J94rejRTbGUeaBRGnjuFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="282507547"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Jun 2026 20:43:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1welrS-000000008u9-1XWK;
	Wed, 01 Jul 2026 03:43:42 +0000
Date: Wed, 01 Jul 2026 11:43:20 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:coccinelle/include_directly 9/9]
 include/linux/find.h:3:2: error: "only <linux/bitmap.h> can be included
 directly"
Message-ID: <202607011147.TQ9ocl4o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git coccinelle/include_directly
head:   fafe7d3de15901736ce85fc06eb0b9b6d3f447cb
commit: fafe7d3de15901736ce85fc06eb0b9b6d3f447cb [9/9] bitmap: improve header protection
config: s390-randconfig-001-20260701 (https://download.01.org/0day-ci/archive/20260701/202607011147.TQ9ocl4o-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011147.TQ9ocl4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011147.TQ9ocl4o-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:62:
>> include/linux/find.h:3:2: error: "only <linux/bitmap.h> can be included directly"
       3 | #error "only <linux/bitmap.h> can be included directly"
         |  ^
   In file included from kernel/sched/build_policy.c:69:
   In file included from kernel/sched/ext/ext.c:7773:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:11:
   include/linux/compat.h:458:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/build_policy.c:69:
   In file included from kernel/sched/ext/ext.c:7773:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:11:
   include/linux/compat.h:458:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:134:2: note: array 'sig' declared here
     134 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:134:2: note: array 'sig' declared here
     134 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/build_policy.c:69:
   In file included from kernel/sched/ext/ext.c:7773:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:11:
   include/linux/compat.h:460:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     460 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/build_policy.c:69:
   In file included from kernel/sched/ext/ext.c:7773:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:11:
   include/linux/compat.h:460:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     460 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:134:2: note: array 'sig' declared here
     134 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:460:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     460 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:134:2: note: array 'sig' declared here
     134 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:460:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     460 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/build_policy.c:69:
   In file included from kernel/sched/ext/ext.c:7773:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:11:
   include/linux/compat.h:462:22: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     462 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/build_policy.c:69:
   In file included from kernel/sched/ext/ext.c:7773:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:11:
   include/linux/compat.h:462:10: warning: array index 3 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     462 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                 ^     ~
   include/linux/compat.h:134:2: note: array 'sig' declared here
     134 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:462:42: warning: array index 2 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     462 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                 ^     ~
   include/linux/compat.h:134:2: note: array 'sig' declared here
     134 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:462:53: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     462 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   12 warnings and 1 error generated.


vim +3 include/linux/find.h

   > 3	#error "only <linux/bitmap.h> can be included directly"
     4	#endif
     5	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
