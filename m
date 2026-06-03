Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3103930677E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 13:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494027; cv=none; b=Nrjq3PL5VLwV7p6szMbytY2zmzseQapWl46cZnwvFWwxgUHIDOjfo3A1qXq2IQGuEW5WYKfIr0MI3CqGkRoxYSRhpYIACwddr6HTyjRTZ6KILb9qedSqqRw1UXhdkqVwCRKj7rAs/1HNb+MqEJ/hbtlxeslVjVFzeJh2s/Q9g3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494027; c=relaxed/simple;
	bh=l1yoXBjwYXfxs6FuuBBA3f2rs43NWhsl+b8/ba5IlDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AVLluzj3i1HQ8Tz0duUeeoe3et4yPE+lWOpxnIHIBBgF/Cqkfhn39mQQSBq67G+eygY2xL9Y4P5MQdylCey49uy/SXDR1g22I/4IE0QENlCEWbE2DPMabHARBNdMJbVik4e35yB0X+eTf0VzWSuMGphJqCuzWQAtwaIZhskHhLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyKwR6hY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyKwR6hY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780494025; x=1812030025;
  h=date:from:to:cc:subject:message-id;
  bh=l1yoXBjwYXfxs6FuuBBA3f2rs43NWhsl+b8/ba5IlDY=;
  b=iyKwR6hYfpyoVO77w2gl7JFaNCp4J+0+U0S55FqlSQHESVCLCtqrwFks
   VS74R+XyzipTv17bMBy6JDb85oSyNcTH5Xm17FTOPus49EY2eato6SPAC
   5V8l0q9d4J29T76WrYC3cU2ujVNv5qh72rBmea+wxarckHEMpPix+kaHn
   xipn/mLmH9nKYse2p24Fz4Or+w+uKsG8FucnQbs5IXr6Xntwp6Ch8Ul5X
   +UFqKEXV5wvuULgJM4R8vAZaRt2cu+B4xzMOr7AuevuKUBAUNU6JC3F6i
   octpeJu3w9wLpvj30gKTrjtH2/aFDDY3bu0rIWxhvNgJ14gdvCVLIyjRI
   w==;
X-CSE-ConnectionGUID: Zhm+c/ZQQ+2DNFWwNPi6nA==
X-CSE-MsgGUID: +Gu7nEO4TSi738pUR//3GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81299477"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="81299477"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 06:40:25 -0700
X-CSE-ConnectionGUID: XB9ZMmlBTTK9yp20V7C7OQ==
X-CSE-MsgGUID: IYFduMaqQcukSP+nqEPinQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="268144447"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jun 2026 06:40:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUlpU-00000000DTM-0Hqo;
	Wed, 03 Jun 2026 13:40:20 +0000
Date: Wed, 03 Jun 2026 21:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>
Subject: include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse:
 sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes
 deafcafe)
Message-ID: <202606032126.mdl90A9W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: ea7caffedd011f7d40abe93a884ffbe46f122535 ARC: atomics: Implement arch_atomic64_cmpxchg using _relaxed
date:   12 months ago
config: arc-randconfig-r123-20260603 (https://download.01.org/0day-ci/archive/20260603/202606032126.mdl90A9W-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606032126.mdl90A9W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ea7caffedd01 ("ARC: atomics: Implement arch_atomic64_cmpxchg using _relaxed")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606032126.mdl90A9W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/atomic64_test.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/arc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
>> include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
>> include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)

vim +4152 include/linux/atomic/atomic-arch-fallback.h

37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4126  
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4127  /**
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4128   * raw_atomic64_cmpxchg() - atomic compare and exchange with full ordering
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4129   * @v: pointer to atomic64_t
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4130   * @old: s64 value to compare with
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4131   * @new: s64 value to assign
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4132   *
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4133   * If (@v == @old), atomically updates @v to @new with full ordering.
6dfee110c6cc7a include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2024-02-09  4134   * Otherwise, @v is not modified and relaxed ordering is provided.
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4135   *
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4136   * Safe to use in noinstr code; prefer atomic64_cmpxchg() elsewhere.
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4137   *
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4138   * Return: The original value of @v.
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4139   */
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4140  static __always_inline s64
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4141  raw_atomic64_cmpxchg(atomic64_t *v, s64 old, s64 new)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4142  {
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4143  #if defined(arch_atomic64_cmpxchg)
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4144  	return arch_atomic64_cmpxchg(v, old, new);
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4145  #elif defined(arch_atomic64_cmpxchg_relaxed)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4146  	s64 ret;
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4147  	__atomic_pre_full_fence();
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4148  	ret = arch_atomic64_cmpxchg_relaxed(v, old, new);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4149  	__atomic_post_full_fence();
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4150  	return ret;
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4151  #else
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05 @4152  	return raw_cmpxchg(&v->counter, old, new);
d12157efc8e083 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4153  #endif
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4154  }
d12157efc8e083 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4155  

:::::: The code at line 4152 was first introduced by commit
:::::: 9257959a6e5b4fca6fc8e985790bff62c2046f20 locking/atomic: scripts: restructure fallback ifdeffery

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
