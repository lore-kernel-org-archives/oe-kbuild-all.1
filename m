Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4476A1FC0EF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 21:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749071258; cv=none; b=ETm5tt8UeM8aRtWC4bt81+2FwZn9u6R05m3B09+qtdO7UTxTtpVuk0V4idRg939tWWd/dgV40rY33u/bfU0iO7X3gHDn3uxcvdCRWg8Bi6y//WAEWp/Z5m3mFEk1jkc0RAK0EsD9h5a96nUOk14VVl/mp5aDki4ul8ngtMebR8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749071258; c=relaxed/simple;
	bh=y7WtjGholYscdPYDNeCwsdK882o9UtkzJ4seyvNwmH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rgHi6rSjJuAul2q1czv8yphzyB0+iiYmZwgu87MXaFFHgzNrM0pDGAdAifv6w88S9cnFN4hiIGUmzs+zvmoLBGZ9sF/pCsXdvDTqFUJnuVBj6Rv5CR9ITUWS571QTHoJv0KcGkdaYFpHOi2UmxJRn3fTmQ10vtOqWctRhKdxZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3/jeS2a; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3/jeS2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749071256; x=1780607256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y7WtjGholYscdPYDNeCwsdK882o9UtkzJ4seyvNwmH0=;
  b=J3/jeS2a9TsJFHitn5VVDs185E7/NGTGYgzvRICyPwkhDG1HvBBLJkxw
   c+uxvo4TMGLZAJEIvUC9Lb0J2uTNBidcxsc4w1JOtEnK01NayWnytteiu
   ru9+lC1yFLD0IjHpIjuxNpML5diSl/lcYlI1YcDlmzVf4/5plnGTeXVK5
   8r+4uMI+0ly10LJKr7PVw6iHdeV14akUjbiz/ydprqwVoJsUvk/Sm+b1c
   SFUPBAB8NpTvLt0MTlr5+8PMgnzHVT2DzKnjc7/lvIWEKVSr6hUKBcceU
   IWeT8r4bdSMZFNLOw1yqRfTUPbwuYjIm6nqnKo/OQ9iv77TM4QnuE+bx9
   w==;
X-CSE-ConnectionGUID: wnntQLgPRcGDo/4pwskW3w==
X-CSE-MsgGUID: YSB+XRxER6yllKQVBSetfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="76570944"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="76570944"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 14:07:35 -0700
X-CSE-ConnectionGUID: 2QLhHmkWSEOT4WI8kelFfA==
X-CSE-MsgGUID: 7NQT6klFS0aOtbtISI8xGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="145895708"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jun 2025 14:07:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMvKe-0003TT-0R;
	Wed, 04 Jun 2025 21:07:32 +0000
Date: Thu, 5 Jun 2025 05:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 5/5] clang diag:
 include/linux/mman.h:137:21: warning: division by zero is undefined
Message-ID: <202506050522.uhpGGvvB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   edb64c67303d2eb44a9b75843fc89d61fcccb294
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [5/5] UPSTREAM: block: add a rq_list type
config: arm64-randconfig-004-20250605 (https://download.01.org/0day-ci/archive/20250605/202506050522.uhpGGvvB-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050522.uhpGGvvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050522.uhpGGvvB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
     262 |         if (!rl->tail)
         |              ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
     263 |                 rl->tail = rq;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
     268 |         struct request *rq = rl->head;
         |                              ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
     271 |                 rl->head = rl->head->rq_next;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
     271 |                 rl->head = rl->head->rq_next;
         |                            ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
     272 |                 if (!rl->head)
         |                      ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
     273 |                         rl->tail = NULL;
         |                         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'
     282 |         return rl->head;
         |                ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
   include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
>> clang diag: include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
>> clang diag: include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
   make[3]: *** [rust/Makefile:332: rust/bindings/bindings_helpers_generated.rs] Error 101 shuffle=2213207495
   make[3]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
   include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
>> clang diag: include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
>> clang diag: include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
   make[3]: *** [rust/Makefile:312: rust/bindings/bindings_generated.rs] Error 101 shuffle=2213207495
   make[3]: *** Deleting file 'rust/bindings/bindings_generated.rs'
   In file included from rust/helpers/helpers.c:21:
   In file included from rust/helpers/mman.c:3:
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
     137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:160:9: warning: division by zero is undefined [-Wdivision-by-zero]
     160 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
     137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 18 errors generated.
   make[3]: *** [rust/Makefile:431: rust/helpers/helpers.o] Error 1 shuffle=2213207495
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1292: prepare] Error 2 shuffle=2213207495
   make[1]: *** [Makefile:242: __sub-make] Error 2 shuffle=2213207495
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2 shuffle=2213207495
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
