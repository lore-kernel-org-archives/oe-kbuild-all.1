Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8ED396D03
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 04:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791778755; cv=none; b=jF0pU6Amg29xabGL/z1nnMJwihbEz/Q8iYPmTzBNRkYg3iF1owh6+AyNMm+ltDcgSZOfuzD4bC5M2Z6d8Sa6LvhwohojjocOijY2jRktQ4GXQmryGZF/YBYzJJ/Y52JVVUPNGwH+H1ozxDZwCrPgmZCyH35XAd+QIimeR3D25gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791778755; c=relaxed/simple;
	bh=J9rUjXbrcrTJRK0DKV1vebmH7iG7DrMcQkVIX4Pgd/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NpWLcMQEgtNZIXM1DMZUWXhBuA4J4k52NOgE5CKhAXSTDQy69GbaM0lO56eUrJUENvuDkt9414r7ogZVA1aNllLU8fSFaZzUc8JrfZO79XSVPcO0ZASWjSQELA4eWzRuog67nGj55qHiZxvmI/4vkK8QV+DJEbQZA74KLZyZol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JNduJWwS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JNduJWwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791778754; x=1823314754;
  h=date:from:to:cc:subject:message-id;
  bh=J9rUjXbrcrTJRK0DKV1vebmH7iG7DrMcQkVIX4Pgd/Q=;
  b=JNduJWwSv5afYRcQRqVff2av0DC6w5/YClcNmhzOwZR+k4sRutknM7ua
   MIR58axdemcO4i4mFY/n7NyTxz3dPMQFO0GjweEPDNEpQIwTTN+n3Nz/Z
   UVO8Xr717d+SjbYau15b88fCz86IcZY8vVX+n+GVEcorGxIeZy62o4qrs
   VMMwN4hYiSb1lnVsK+M7fSXFeS/RQuGuinaYd/BdJcdsxCTfBRD8UPWSW
   MMFQAVscIv4+5GqXFxGnQ6YvSYL9SyMi6oiL0CXA/CkxFlY3UxgcPkILu
   WMKtmAn8NBTwJ2hh7FdlgyW25xeDCILswa685fR+6kxw62a6iVYRCLTj9
   g==;
X-CSE-ConnectionGUID: 44+2ybiTQ7a3LhlaN40WhQ==
X-CSE-MsgGUID: R9uaEekqSYqboThhj8plug==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="354286"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="354286"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 21:19:13 -0700
X-CSE-ConnectionGUID: z16tqKFUSpGRImTP6AZX8w==
X-CSE-MsgGUID: ahV4yZ4tShuVKfX9HgT4hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="808642"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 11 Oct 2026 21:19:11 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG7VE-000000009uI-3aVl;
	Mon, 12 Oct 2026 04:19:08 +0000
Date: Mon, 12 Oct 2026 06:18:09 +0200
From: kernel test robot <lkp@intel.com>
To: Jonathan Flynn <jonathan.flynn@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:kernel-7.3/main 105/167]
 include/linux/atomic/atomic-arch-fallback.h:259:14: error: invalid use of
 void expression
Message-ID: <202610120616.f9AEpmNF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/main
head:   790d686a2be11b8bd1a028272f63bd49da1f7666
commit: 3cb87e25d0dce98de0172c4925acca4a481c39c5 [105/167] NFSv4/flexfiles: move layoutstats accounting to a per-stripe lock
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261012/202610120616.f9AEpmNF-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610120616.f9AEpmNF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610120616.f9AEpmNF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/atomic.h:80,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/uio.h:8,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/in.h:25,
                    from include/linux/in.h:19,
                    from include/linux/nfs_fs.h:22,
                    from fs/nfs/flexfilelayout/flexfilelayout.c:10:
   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'nfs4_ff_layoutstat_start_io':
>> include/linux/atomic/atomic-arch-fallback.h:259:14: error: invalid use of void expression
     259 |         ___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4918:9: note: in expansion of macro 'raw_try_cmpxchg64'
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~
   fs/nfs/flexfilelayout/flexfilelayout.c:760:16: note: in expansion of macro 'try_cmpxchg64'
     760 |         return try_cmpxchg64(&ffl->last_report_time, &last_report, now);
         |                ^~~~~~~~~~~~~
--
   In file included from include/linux/atomic.h:80,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/uio.h:8,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/in.h:25,
                    from include/linux/in.h:19,
                    from include/linux/nfs_fs.h:22,
                    from flexfilelayout.c:10:
   flexfilelayout.c: In function 'nfs4_ff_layoutstat_start_io':
>> include/linux/atomic/atomic-arch-fallback.h:259:14: error: invalid use of void expression
     259 |         ___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4918:9: note: in expansion of macro 'raw_try_cmpxchg64'
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~
   flexfilelayout.c:760:16: note: in expansion of macro 'try_cmpxchg64'
     760 |         return try_cmpxchg64(&ffl->last_report_time, &last_report, now);
         |                ^~~~~~~~~~~~~


vim +259 include/linux/atomic/atomic-arch-fallback.h

29f006fdefe6f88 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  249  
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  250  #if defined(arch_try_cmpxchg64)
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  251  #define raw_try_cmpxchg64 arch_try_cmpxchg64
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  252  #elif defined(arch_try_cmpxchg64_relaxed)
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  253  #define raw_try_cmpxchg64(...) \
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  254  	__atomic_op_fence(arch_try_cmpxchg64, __VA_ARGS__)
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  255  #else
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  256  #define raw_try_cmpxchg64(_ptr, _oldp, _new) \
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  257  ({ \
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  258  	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05 @259  	___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  260  	if (unlikely(___r != ___o)) \
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  261  		*___op = ___r; \
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  262  	likely(___r == ___o); \
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  263  })
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  264  #endif
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  265  

:::::: The code at line 259 was first introduced by commit
:::::: 9257959a6e5b4fca6fc8e985790bff62c2046f20 locking/atomic: scripts: restructure fallback ifdeffery

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
