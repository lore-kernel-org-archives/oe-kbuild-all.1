Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9FE15D1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 00:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756944570; cv=none; b=B3JV+LMvkY1pki8wuoCkGnAGX4OvryKPTyKmPKky2pqXUD3V9nWTf5c9VOjc4eKMqBv6rTIT271p1x1DPWbi5tkodH9TQtW3sHUuJNwjL4a7WUznDk+k1wxV9F5UhzGepFoXNg5K248Vtkb7mnMJ/HxtclvpGcvFqPdSihDcr1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756944570; c=relaxed/simple;
	bh=562PxdjQEKiIe1wDC6joaukASfW3MJG+mHmRUE9M4rc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ng2FxKFeRB/CjhfuCVSddps4kWtDGl5fdv5ZswZzLo5Q3NEkx2YT7gROLbnjaE8yYow+8VjF/kZ6p+BMZy5rFnz7VguURvEAE6C1lIss3R5Hdt4Sf8bTRxdc5aOdU7XDa6DWrRa7CER5ThfCwzVQCEDNwUL5s3beXW6VDkQbpSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e22YTS7n; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e22YTS7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756944569; x=1788480569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=562PxdjQEKiIe1wDC6joaukASfW3MJG+mHmRUE9M4rc=;
  b=e22YTS7nfJKagu0q55yS0ajd8P6VB9Evk3IBePu4bbL2XID44KSkrUR1
   3FMl2PFXkam38W0QLWmMbyqptC+ZeFcIT74Xh/V8peeuanyYgZOH5h548
   2ONGtlvpMlw3dECYI60U/1n45jY9uUJM8S1u2IKDipbm/+eEOWmRkO3Tx
   9TpWE2ZHma1WPDoTSW6ClKjuKLgPdqxF/XECUiwjbQBL8XOIepCSJNn4n
   xfEz0IXZbGy5IYu+00zfIgV1tnFP+hxOhCfxu854uvC4kmH3PYOveIc4z
   93qyjR25QqoQWhYcHDHEUCDpL414aDYL7Q4n36P+x9/1HspQxl9PY1cAi
   w==;
X-CSE-ConnectionGUID: 8MUp8uSXQ6WV5zPHj3s+Hw==
X-CSE-MsgGUID: iJCJO+SNRo2j0+vKdhWuEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="63097547"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="63097547"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 17:09:28 -0700
X-CSE-ConnectionGUID: MgtYpmoZQTGKb9HLTO/8ig==
X-CSE-MsgGUID: 6bxbHXDiTJqKkynWMXshxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="176079267"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2025 17:09:26 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utxWz-0004XF-3B;
	Thu, 04 Sep 2025 00:09:07 +0000
Date: Thu, 4 Sep 2025 08:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:rqspinlock/bug 1/2]
 include/linux/atomic/atomic-arch-fallback.h:242:27: error: initialization of
 'struct mcs_spinlock **' from incompatible pointer type 'struct mcs_spinlock
 *'
Message-ID: <202509040745.Bf5NBwsf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux rqspinlock/bug
head:   7097697299471d7a596f3ed08edc869b8840ba62
commit: d0166ca6f4be3e5a50fa57a221eb2c660083bede [1/2] rqspinlock: Enable timeouts on MCS handover
config: arm64-randconfig-001-20250904 (https://download.01.org/0day-ci/archive/20250904/202509040745.Bf5NBwsf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509040745.Bf5NBwsf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509040745.Bf5NBwsf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/atomic.h:80,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:25,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from kernel/bpf/rqspinlock.c:16:
   kernel/bpf/rqspinlock.c: In function 'resilient_queued_spin_lock_slowpath':
>> include/linux/atomic/atomic-arch-fallback.h:242:27: error: initialization of 'struct mcs_spinlock **' from incompatible pointer type 'struct mcs_spinlock *' [-Werror=incompatible-pointer-types]
     typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
                              ^
   include/linux/atomic/atomic-instrumented.h:4908:2: note: in expansion of macro 'raw_try_cmpxchg_relaxed'
     raw_try_cmpxchg_relaxed(__ai_ptr, __ai_oldp, __VA_ARGS__); \
     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/rqspinlock.c:541:8: note: in expansion of macro 'try_cmpxchg_relaxed'
      if (!try_cmpxchg_relaxed(&prev->next, RES_NODE_NEXT(lock), node)) {
           ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +242 include/linux/atomic/atomic-arch-fallback.h

29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  234  
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  235  #if defined(arch_try_cmpxchg_relaxed)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  236  #define raw_try_cmpxchg_relaxed arch_try_cmpxchg_relaxed
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  237  #elif defined(arch_try_cmpxchg)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  238  #define raw_try_cmpxchg_relaxed arch_try_cmpxchg
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  239  #else
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  240  #define raw_try_cmpxchg_relaxed(_ptr, _oldp, _new) \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  241  ({ \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29 @242  	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  243  	___r = raw_cmpxchg_relaxed((_ptr), ___o, (_new)); \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  244  	if (unlikely(___r != ___o)) \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  245  		*___op = ___r; \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  246  	likely(___r == ___o); \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  247  })
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  248  #endif
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  249  

:::::: The code at line 242 was first introduced by commit
:::::: 29f006fdefe6f88abde973a0b0f20d2704e93fd4 asm-generic/atomic: Add try_cmpxchg() fallbacks

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
