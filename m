Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE419EED3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 21:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768252080; cv=none; b=QRimh5RmNqb0StBIjN9ugdCGifeLhiYIKfu1dSA6oLnKIgRpQhRRuBxvH2sDXB4Dc6scrbgbMtEWBVgrjHOroo+wyLtgtCCtQJy0F19cOs8ktYcH/7MlETWE/TN3vo2n7KAHKiiXP4eRHuAZWsRNEm327uVY5cHMoo/npjiWwsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768252080; c=relaxed/simple;
	bh=sY+tHHVKoAhL23kGLM6HWF7Fg3yeu8VAOs4w+JhtsxA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lNViA6EdkD0t8fkARqMv7p8mW23gLyJd6yRddMhjR2IGgYxfVAqqIEhv2PE+wTBdJAvqz2oSaxlwOLD+b5aJt8maIELZaqVVJc49bmXaNN0QHW8ycVxDo4LwhCf067aokNCxIpr8jMWwC49QjjObKnYRJPGzvS8pgX2c8i+LEfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGri/sJA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGri/sJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768252078; x=1799788078;
  h=date:from:to:cc:subject:message-id;
  bh=sY+tHHVKoAhL23kGLM6HWF7Fg3yeu8VAOs4w+JhtsxA=;
  b=JGri/sJAdwWz3EDHbxHGjChigXIHbxctVApSy5sW/I8ShM4LcudRgJ8X
   nzEJ8efovw8qpDKAcAsbwO+q4G+WPDyvhyhR8EgEMWjUfy1vGzNZ62pLb
   saMrtWnVFWZUQacnnAVYfRXhLnvT1uQOpqsWaxBKpWH+bjTJvvVuMupfF
   b+06mAFkWSXbJjzI6UrcRdObqHWcTwhBL7XvfZWF6eIOo7B+cDmKWerH5
   VrX1EmB//xeQiGo4N4+TpPy7ne+wbryaIjNT/1OPnjJ0HqM5X4i7zoGR+
   6hkJeFnEHYfKgQLD4xpnP097pydhCa3xI1gDvb4RVBMtdSFfg/B6fmaK+
   w==;
X-CSE-ConnectionGUID: s50YtKvySyyFbBPDPm7cnw==
X-CSE-MsgGUID: PEZzqCkoR7iidm4c8DMdRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79830015"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="79830015"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 13:07:56 -0800
X-CSE-ConnectionGUID: skwDOtO3QK2h4E77REgKlQ==
X-CSE-MsgGUID: Y3pqeKqRQZmTjSKYCSBVzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="204102228"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jan 2026 13:07:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfP8i-00000000Dsa-2x0B;
	Mon, 12 Jan 2026 21:07:52 +0000
Date: Tue, 13 Jan 2026 05:07:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 23/23]
 include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast
 truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
Message-ID: <202601130542.GqqkBY25-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   f252e92f05cfac0417c6766c7b387e0798643c1d
commit: f252e92f05cfac0417c6766c7b387e0798643c1d [23/23] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: arc-randconfig-r113-20260112 (https://download.01.org/0day-ci/archive/20260113/202601130542.GqqkBY25-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130542.GqqkBY25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130542.GqqkBY25-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/atomic64_test.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/arc/include/asm/bitops.h, ...):
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
