Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D511F427C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 22:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778191846; cv=none; b=XcE0NDQgnvLr4dgfw+wAH5n9mbD7HHHIhjJP6jNET5+BDJk2XqKlvVrnhhssbw443crsXF7LXGNvDaIkkgZJkN7Rsv+HdrrNRYdifGXAmRTCJux7OvbHd9ppsqo7LBqLBag3siiZRLI5XgzDsQWLwmvalt2E6p9Tyezu3tiDGhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778191846; c=relaxed/simple;
	bh=gDWKNewhdf22ns7W4SntwSNgYmXr2FN04pI/jLlEAY0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M195Rio+nXtdN5fkZ2GMAAVslrMQwyBul+7PChbVmma5/ljLyIeIouaek40DSmh7tO1151okzv/4h8ExYvPHPKK8DHcRqWRlD15uUrOhILq7OTu7KUF6cjLFUW27IXx4WE3KfLtjYtBnA1C74/qC8wEiiDhWI2CE3ol9CybXlaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5HA3IXp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5HA3IXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778191845; x=1809727845;
  h=date:from:to:cc:subject:message-id;
  bh=gDWKNewhdf22ns7W4SntwSNgYmXr2FN04pI/jLlEAY0=;
  b=V5HA3IXpWChRiHd8ircF8D97xKop0S61cylayJlX1AIBAlMcGUHFmZW4
   TV13YL3lZFoSsdItV57Wri2DVGbmYfgmAy5kAKgFEfDllB4dZPs9/JRla
   1W35MQIMg0NJpz213qkEZ5H69o3UnONufrokxkwQfedO11uOcDxsEB2zf
   Sui9ig4hMcL7HBz4wZPLcKPG+x271ghOgwLvCXknMlrFuOIejhiF5hpOV
   /ite1gWONlG7YtEBOcoQmsSfpecgiPHi+os24N9mfcjhjoxRrFhFZ3MsP
   FPVL6FLlF5Cx2YxHk2OS6f67ReEuvTUn0bHOFpDhH6n6rIlbOORBCbvO0
   w==;
X-CSE-ConnectionGUID: +I8eWrUeRBSV3jAo8TcFcA==
X-CSE-MsgGUID: AfQRHPc3TBWy453Yzj+AGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89464641"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="89464641"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 15:10:44 -0700
X-CSE-ConnectionGUID: RSf7eaGoQ1acM8fQVeeFyA==
X-CSE-MsgGUID: nxexZjdLS+6AtJpDH2D67A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="241570101"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 May 2026 15:10:43 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL6vZ-000000000Vl-03fW;
	Thu, 07 May 2026 22:10:41 +0000
Date: Fri, 08 May 2026 06:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 76/79]
 include/linux/compiler_types.h:572:45: error: call to
 '__compiletime_assert_683' declared with attribute error: Need native word
 sized stores/loads for atomicity.
Message-ID: <202605080601.ET8LmBSv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   45ed86f458bd0ab7b0ce15c7f245404dd62d82d7
commit: ded571fc647c86a7d51d84b6586eabddb276f8a9 [76/79] bcachefs: parallelize write buffer flushes per btree
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260508/202605080601.ET8LmBSv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080601.ET8LmBSv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080601.ET8LmBSv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'wb_pin_le',
       inlined from 'any_wb_pin_le' at fs/bcachefs/btree/write_buffer.c:840:7,
       inlined from 'btree_write_buffer_flush_seq.isra' at fs/bcachefs/btree/write_buffer.c:873:3:
>> include/linux/compiler_types.h:572:45: error: call to '__compiletime_assert_683' declared with attribute error: Need native word sized stores/loads for atomicity.
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:553:25: note: in definition of macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:575:9: note: in expansion of macro 'compiletime_assert'
     575 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   arch/parisc/include/asm/barrier.h:68:9: note: in expansion of macro 'compiletime_assert_atomic_type'
      68 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree/write_buffer.c:828:24: note: in expansion of macro 'smp_load_acquire'
     828 |         u64 inc      = smp_load_acquire(&wb->inc.pin.seq);
         |                        ^~~~~~~~~~~~~~~~


vim +/__compiletime_assert_683 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  573  

:::::: The code at line 572 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
