Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41F21D3E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178597; cv=none; b=kiRw9WZQklIoXbK2d+xMscYtuuslDufwybBbyWt95oRQXATvBBHUk0osrlwPsvxNUBc3aSZ8m6IRIires+dQdMfI2nOe43zgLvuFNOOWD5XTlc0FCkAq1GeaMbvBh1Ai6FkMSjZadNUrAezxDT5Puh+a1mw9sYZhvsVuvioEtC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178597; c=relaxed/simple;
	bh=Y8RBUM1qQ9JoKcTsC1CHM3ZAP7w6AdNknVsjyrcflrE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WdIsrVmtYthUe3RJ4ys0cC+mx3BKf30kRc91VYRMMu745os+ElkQ1S9N2ugqjkngkk36dxVjebe5UL6eLl2l5lHUZcFrj+uoD/+HyejqgFQjp/AOsMaIxz+w/xBoxw8yrmx/08Rybvbt0DjbVa0tlekMVIr38e881qHAwiFELGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ANY1shYh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANY1shYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767178595; x=1798714595;
  h=date:from:to:cc:subject:message-id;
  bh=Y8RBUM1qQ9JoKcTsC1CHM3ZAP7w6AdNknVsjyrcflrE=;
  b=ANY1shYhqg2jtimZfxbcI4mF34Ztao+G5Cp/+zel7IRNjyhwZEyosuDJ
   xN+W+3Yy6IpkevwKHTWeWedkP7x1q32XFGqnBV5cu8Vu5w0Dkteg1X8Zw
   A5ywnt7H4jOMqu1h16m7B0I2beg0fvcF+39tYuDm4Fodxmz2AVIWLi9oN
   ZiseCJ7RYu2p8z2BDRSDcjEuPpW3N1vvyF4NfjgQvw1gDrU1JPnKPz86V
   wKXLG0WB1lbDEmV1S+q1LQKnVNpZQilUN7vagt2cFskDCKpPzmE6VChrJ
   iJoZ3NynUcoO2I+pGzoDq6Zo2f63/5GyI2upz+RIXAT+vt/XLCv4bY/Ig
   w==;
X-CSE-ConnectionGUID: 6a8/YKv0RyeCDWererk2zQ==
X-CSE-MsgGUID: x7yUxWHsR22PUT74Aey/Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="67945654"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="67945654"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 02:56:34 -0800
X-CSE-ConnectionGUID: gAp5IfXKSzS7mX3c2n7/rQ==
X-CSE-MsgGUID: 3JE68rTQTt6ETlzp799R3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="206468759"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Dec 2025 02:56:32 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vatsU-0000000017x-1GkJ;
	Wed, 31 Dec 2025 10:56:30 +0000
Date: Wed, 31 Dec 2025 18:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] clang diag:
 include/linux/mman.h:137:21: warning: division by zero is undefined
Message-ID: <202512311816.XLYzkjO1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   ecd8c13eebd9ac39eaa1b45d9fe23ff020c4e68c
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [2/2] UPSTREAM: block: add a rq_list type
config: arm64-randconfig-002-20251231 (https://download.01.org/0day-ci/archive/20251231/202512311816.XLYzkjO1-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512311816.XLYzkjO1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512311816.XLYzkjO1-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   make[3]: *** [rust/Makefile:431: rust/helpers/helpers.o] Error 1 shuffle=3474266458
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
   Unable to generate bindings: clang diagnosed error: include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
   include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
   include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'
--
   make[3]: *** [rust/Makefile:332: rust/bindings/bindings_helpers_generated.rs] Error 1 shuffle=3474266458
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
   Unable to generate bindings: clang diagnosed error: include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
   include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
   include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
