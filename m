Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795229440;
	b=HOpH/o2Ecg0dFDs1kSMxm6EnltEAwfta4yXS6PhfcPql+UH7WCgPNNI2JJx9+Z3OODxh
	 wB9u2+iZLgoJ2ublSNrfAxFOw9g7ZQqMWZJloRIxwI7dAq/8H/SkzRc9lJL7z6sP+4GTH
	 T+9vTlmgplWSrZtd4xHZEa7G6c2rbllJjia5gwJREoKHys3Wz3DJP8d13fE8GWCyOT8rF
	 DtGtFn38k159I5CR46vhbQzWSOIg1irWz39Z8X8Q5rZR001I1qWlLaRmLDDTrQfcomUoE
	 eYHTkMAWi3VHXCdc8f4TQyaQP+iC2dEh9ikguZgM40RpkjeQKrTkS4KiZ6C4R6Tfw7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795229440;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yCBx/Es5J3SUpzkPHLi96/E6VeKicpxhtWzFsN0S05s=;
	b=zrklDWoUGG4+5V6hez3f74IyIyek8a0t2TcFMffOf2AcGyUs/OGBYmRJ/l2lXAFkT9vS
	 nX3rCLc6Z0FYsZgNX3QgTP7FjTElzDa9Hi4ZQeZchts/2FZCL71tjWnaMFy4j6OBjjO48
	 CHvX5EY41Kqhs7MfqydISkVkEym2ibzOtBKbep/e4Ul0LO1Kqr3GOMaJIok09YhOd1C/Y
	 XPJ6nnM8mbl7/4vJVuT2lpnddU8Eh1oTC03tKtFRbh81mhsOxV61KLzMtc6tyOZXon+as
	 sTTATIB4QOFSnUJDAOHpW02bMTCYBnvbzIkIJnVy1C5KV80FzmJUnGji/mjBHCGDX4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="VQ76/E5b";
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E24260A3818
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 02:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E24260A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VQ76/E5b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795229438; x=1826765438;
  h=date:from:to:cc:subject:message-id;
  bh=TDLJr6QVq3+vLPLHDt6l6qsY3dWRPIJ0JtuQidSGitY=;
  b=VQ76/E5b+/1bxYo9Jl3NmAKnDvcKh9u+o8q2sw71jOXeNABbU4EXRnZa
   KqUuecCIrN0WO4+bs5HZdin0XMkwDWLK7okWW1SHL/B4WUB7wPBLy1RHI
   VRTtu9Bhkl09K9Z2V1KO/SR18cZDN7qabgis8Y2ZzyLdaqeCranNEg1V6
   kfEHkqcS94+BMh296INIz31ca9MqJweZwNsNsV/ogRWYPGYLEWvBYN+PE
   +ergRlZfeAXkgeKxzOrgQWA+xf9hs55dS0B5nAghcmnb7YDTy4tYavBob
   edhWyKin0ZF1sBN8IMunZQouJsG6UW0/oqfnHfHKa4Yq2lJWZFB5x9l2N
   g==;
X-CSE-ConnectionGUID: 3A25E4WfR1O3ybelhgS+ZA==
X-CSE-MsgGUID: 1BCbqLvHTQmCQiNelzvKvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4123669"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4123669"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 18:50:37 -0800
X-CSE-ConnectionGUID: 5I0xCVAlQV+bbAFU7HqWoA==
X-CSE-MsgGUID: YYarhr3WRNuvt5SpkxVh1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11166986"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 20 Nov 2026 18:50:34 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUbBO-000000004Dd-3vC1;
	Sat, 21 Nov 2026 02:50:30 +0000
Date: Sat, 21 Nov 2026 03:49:59 +0100
From: kernel test robot <lkp@intel.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: include/linux/compiler_types.h:631:45: error: call to
 '__compiletime_assert_433' declared with attribute error: BUILD_BUG_ON
 failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) !=
 sizeof(*u)
Message-ID: <20261121034304.2dPxVKzk-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Finn,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5f22fb20497f4983094131f00a734362300d22d2
commit: e428b013d9dff30f7a65509e33047ba975cce8ba atomic: specify alignment for atomic_t and atomic64_t
date:   10 months ago
config: m68k-randconfig-2000-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121034304.2dPxVKzk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121034304.2dPxVKzk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e428b013d9df ("atomic: specify alignment for atomic_t and atomic64_t")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121034304.2dPxVKzk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'qlt_queue_unknown_atio',
       inlined from 'qlt_24xx_atio_pkt_all_vps.isra' at drivers/scsi/qla2xxx/qla_target.c:331:4:
>> include/linux/compiler_types.h:631:45: error: call to '__compiletime_assert_433' declared with attribute error: BUILD_BUG_ON failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) != sizeof(*u)
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:612:25: note: in definition of macro '__compiletime_assert'
     612 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:631:9: note: in expansion of macro '_compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_target.c:216:9: note: in expansion of macro 'BUILD_BUG_ON'
     216 |         BUILD_BUG_ON(offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) != sizeof(*u));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_433 +631 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  617  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  618  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  619  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  620  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  621  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  622   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  623   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  624   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  625   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  626   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  627   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  628   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  629   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  630  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @631  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  632  

:::::: The code at line 631 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
