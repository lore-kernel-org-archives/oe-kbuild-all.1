Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80B519AD89
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 04:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739940774; cv=none; b=sTvfhgvmPa2FLJQ2OPR9pn5GD6bofBp9TtkxgxFVI3yiXRsXFsh9w5jMepGd/UGqcM6OuBmbFT1anwiWxmCSEP5ZfzdVNAwzOuQHhA/c7HX1ucEHNVLoRima1ve1Zne3i3NAxmCysHtY20xPzdl9eFiC9bZLDqt2ry4BYyZ5Fg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739940774; c=relaxed/simple;
	bh=jTM/DidQIAQIM7NA8h+c4nmBxUnGnUfVg2rSKNC+K0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vAYKZ67+VuB+leKgTxGOfZabniM+WHWkv9aYsOIZ+h2OU9LO+NwutIC2ky19YBgUN2Fxcpnfkp/8F87PYvrp8zdbGl/yVmnVBbSkk+ek4xJUOwEfWLuTLCcL0nlUdYIyC4e+x0ooqe4WShWbwruR9yfQjsgzPNqxI+hke8/kZGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ar7q7XGo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar7q7XGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739940773; x=1771476773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jTM/DidQIAQIM7NA8h+c4nmBxUnGnUfVg2rSKNC+K0E=;
  b=ar7q7XGoBk6i8UTOJGIE3nuPWxpO0g54IidildmCu1q95QN2yo1LLqE6
   T7h7wfkKXZMJsmVdWBljLzj29UPOUJNNWr3GFkCXmXudcGM3a0ci0Nrfj
   ZgxdDc8Ui6BNwXwQiDsIAQTY2KsYpJZmYDhoSVJcKDqFlPz6rYRxAVb6G
   c8P6M/6c482jDq7MRkLPTTM/wIv+DB2c6KZ2iWLsCCc36ShMhm1wTzIhj
   HF1XnYYN/4nyo9FA+Vy9d2M7pJi7IG6j2n5lU+sV3SeBP2+ycbaw7XnLa
   7ZufuLcSjIuTMi2t4Rw6m92ljkGDVSRgyJcvOvRKAVq2BDE02/Wd5JySf
   Q==;
X-CSE-ConnectionGUID: wIaVtet2Tb2u6IPneBd7tQ==
X-CSE-MsgGUID: /Lz8a7AGQ5GdpKZTKw5z5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="43495379"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="43495379"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 20:52:53 -0800
X-CSE-ConnectionGUID: cRX6lExdRDSJ6zPLWLcHoA==
X-CSE-MsgGUID: E1jYjrDDTSakJs7oerV/ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119254348"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Feb 2025 20:52:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkc4e-0001Fh-0a;
	Wed, 19 Feb 2025 04:52:43 +0000
Date: Wed, 19 Feb 2025 12:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Schwab <schwab@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [linux-next:master 3383/4377]
 include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast
 truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
Message-ID: <202502191201.7fARkW7m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
commit: 1898300abf3508bca152e65b36cce5bf93d7e63e [3383/4377] riscv/atomic: Do proper sign extension also for unsigned in arch_cmpxchg
config: riscv-randconfig-r111-20250219 (https://download.01.org/0day-ci/archive/20250219/202502191201.7fARkW7m-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250219/202502191201.7fARkW7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191201.7fARkW7m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/atomic64_test.c: note: in included file (through include/linux/atomic.h):
>> include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
>> include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)

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
