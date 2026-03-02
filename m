Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41CE35A393
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 23:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772495910; cv=none; b=cMUzqMPt8lr4GdWKkldLFx/9wot8Jy2G5z8xumSw8sWw7nGcAGNzTPdjiLyf6PT52/kWMf4bOKwWUwrMJqatNNZuW9pZrYRbvtzHVojVbesfgUXFg/rhUAYf8FqG8KfgOXIqzndaRmFB41OcqIwZ/vvugjZQ+oseXAXcHa3L5nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772495910; c=relaxed/simple;
	bh=koyzbirrC6lzDW8hEJh/FRkKUFYgp0uyt/Dbpy1ooe8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=abzdtWrh9aFBP63Jvp4YMEOz7+cW2CHfgL83F1BtktD1R3fGxypRYCYpts3Ln5NtK+bM4y4DBAkMhf3PyZestuluakh9b7uPKG3nYwVUs9Ww86oXQNw6ThxXtgO//KmAKDIixcXZ6aaLVPg7p7sRGDzNPiiooj1oCZj1wSDRcyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDOZyaFO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDOZyaFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772495909; x=1804031909;
  h=date:from:to:cc:subject:message-id;
  bh=koyzbirrC6lzDW8hEJh/FRkKUFYgp0uyt/Dbpy1ooe8=;
  b=IDOZyaFODpc3E4AFCO0unYIhJSxPhWP2FfIURMJmcE/8HIpgOX3I+umS
   6a+Q+x5etGIU7q+bd5aR/NC5YAogaqGYbz2/4Ql1m7x5ZkBOn8AnWulpm
   UB0ac+oV3aSwi4qr/dT9mHmwr9yNjHgb8NurTaj7iOTnULHhzmJAgDgRJ
   ga++HNlNNfMaTIUhXgXRqeUvrdp7g6ML/xu3+s4wE8ezZ0KAXpaHKjzrf
   8JkvzZrKJ6C/C805G0XVYQ2CNGVcoWWOaMmdaJqmfPUY1y3ehaZvHGoRg
   GVIW4nOXNN981sGJS6Ie9QIK2+P4UdwQRiTmMNLbWl2K5XJuF1anB6qsH
   w==;
X-CSE-ConnectionGUID: gRrF7ZbRTJW04FeGCneB0w==
X-CSE-MsgGUID: qpnzvD4rQvGu/vybPlZ56g==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73387136"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73387136"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 15:58:28 -0800
X-CSE-ConnectionGUID: 21tX4vP/SZCjQxwFAY9zEA==
X-CSE-MsgGUID: pTa/K8d5ROa8XOMIKd59sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="217048389"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Mar 2026 15:58:26 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxD9b-000000001Wj-28RH;
	Mon, 02 Mar 2026 23:58:23 +0000
Date: Tue, 03 Mar 2026 07:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: include/linux/compiler_types.h:631:38: error: call to
 '__compiletime_assert_431' declared with attribute error: BUILD_BUG_ON
 failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) !=
 sizeof(*u)
Message-ID: <202603030747.VX0v4otS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
commit: e428b013d9dff30f7a65509e33047ba975cce8ba atomic: specify alignment for atomic_t and atomic64_t
date:   5 weeks ago
config: m68k-randconfig-r133-20260303 (https://download.01.org/0day-ci/archive/20260303/202603030747.VX0v4otS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603030747.VX0v4otS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603030747.VX0v4otS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'qlt_queue_unknown_atio',
       inlined from 'qlt_24xx_atio_pkt_all_vps' at drivers/scsi/qla2xxx/qla_target.c:331:4,
       inlined from 'qlt_24xx_process_atio_queue' at drivers/scsi/qla2xxx/qla_target.c:7903:4:
>> include/linux/compiler_types.h:631:38: error: call to '__compiletime_assert_431' declared with attribute error: BUILD_BUG_ON failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) != sizeof(*u)
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:612:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:631:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_target.c:216:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) != sizeof(*u));
     ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_SELFTESTS
   Depends on [n]: NET [=y] && PHYLIB [=y] && INET [=n]
   Selected by [y]:
   - AMD_XGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_AMD [=y] && (OF_ADDRESS [=y] || ACPI || PCI [=y]) && HAS_IOMEM [=y] && (X86 || ARM64 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y]


vim +/__compiletime_assert_431 +631 include/linux/compiler_types.h

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
