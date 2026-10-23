Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792753081;
	b=pLAnuKXYOhpvKpaZzvcOubo7+TerPqVx/qAg/nSO6IXqPoyw21ma7Qm6LJTgwMYr47GW
	 EiWXuiElsJ1BIHdV0YQB9iR6QHyl1hqBsOlxtxgLSUtcDJK8jj2d4DBYYrxZaJu1zVDre
	 e7RNkq+rrTnC54impt8FpoUzwkdA6xByYNCEOE8d1vIDrhO2omyQBSa42kQ05Rnjge0Sw
	 AkHRfnrkWAKXAwfsiaE0OHirDMyRoWhPdljOqC0xmRux0aMkAg9OME+CHwzU5b/qXZaV7
	 RxYmNfBnvt/BRjDDQBY9Kn5BdnDvndXH8Yc8HQ5hWNmEBdJ47GkgcNABo5lUPYHGgEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792753081;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=V0FmJJZsy1FLTuzMlsEw1TvCvidY8W7bjuJhLhLK4m4=;
	b=OVzo8rJG+TyoZc7CTzidB6i202FqPIRKsX5L+ZUZvxPlAxjWKCgGCgeFz7fk+efZ2Qlo
	 x1x9LC0+8+bk0UIri4fvlYmmSnaRHd/yVt8T07gVVnXZq7cT/3z4GGD0SQ2H1WOzh5Dbh
	 wi2tFiLKj0+QxtvRnL3OlVmrZJCy7dk2kW7qNrGvgaOMpcD4sa/BDDFpnd7IUqegE8u2o
	 WMHIdxyAcQNG3OnHsnCZqQsH1SU8g9SGbTIb9aMpO0cgXQuLMQkI5zRTsZsWj/Q0rfiQE
	 kyjSi42MxIP24wAo4wWnj+OFJVXzwAUT4NMDaHYe0jn9NVtmor9klcRpilYAtfbq7gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a5ZFMaiR;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AF0606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 10:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01AF0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a5ZFMaiR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792753080; x=1824289080;
  h=date:from:to:cc:subject:message-id;
  bh=RNOFNn2YTccQLcCKkBxvUvDdoaZltRbOtDnyLkhEihM=;
  b=a5ZFMaiRQ2T0NQV/55Iy8a7XhF8TGBWVigMfq9P8jPm5b+jG1vWOkjuJ
   RmZcxceu0Lxag8D1aPWN4OvJi74pjju0gJDDy6H9kchwOCqIjKLhDNwgc
   /FLXpQn9ttCSyTWjRBfMEojmUxWRyyHBuqJ8uoiEPsYmwCquwBfhSVoMV
   3LVatDQ5pTgAhE4hQpglHMIKo6SrDSFp+MihwNIpdjKR8HKzDWxlpZ/Kz
   h0EnT6IHTNcTIauFpEcUR4L8cFmRd/OBjmM/WoPRgM/dc63wBBkkH1mSB
   jncV4of2NiB+XtDP205gVtgHj6iXlR/ca9pe0NxKMwD1DhavmjxEzQ687
   w==;
X-CSE-ConnectionGUID: 4lSZeETMT7K6f544DKDgzA==
X-CSE-MsgGUID: zNb93/wfTEGlVpHeuWTeLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1407941"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1407941"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 03:57:59 -0700
X-CSE-ConnectionGUID: tMF6aOrvQ62VKqQ+nA0iiA==
X-CSE-MsgGUID: Gxj+mIgjQSSZaVyLfbAZXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3958902"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Oct 2026 03:57:58 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKCyC-000000000ah-0OyZ;
	Fri, 23 Oct 2026 10:57:56 +0000
Date: Fri, 23 Oct 2026 12:56:57 +0200
From: kernel test robot <lkp@intel.com>
To: Jonathan Flynn <jonathan.flynn@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: 
 [snitzer:kernel-7.3/nfs-testing-canary-reduce-i_lock-contention-LOCALIO
 254/297] include/linux/atomic/atomic-arch-fallback.h:259:7: error: void value
 not ignored as it ought to be
Message-ID: <202610231242.MZof6X7A-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/nfs-testing-canary-reduce-i_lock-contention-LOCALIO
head:   70f3d203da1180371c51ad3bdaab1e24b15e8988
commit: 31c1686e8f4441749d31204c83efc843f02d6af6 [254/297] NFSv4/flexfiles: move layoutstats accounting to a per-stripe lock
config: powerpc-randconfig-2000-20261023 (https://download.01.org/0day-ci/archive/20261023/202610231242.MZof6X7A-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231242.MZof6X7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231242.MZof6X7A-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/atomic.h:80,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/kref.h:16,
                    from include/linux/mm_types.h:8,
                    from include/linux/uio.h:9,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/in.h:25,
                    from include/linux/in.h:19,
                    from include/linux/nfs_fs.h:22,
                    from fs/nfs/flexfilelayout/flexfilelayout.c:10:
   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'nfs4_ff_layoutstat_start_io':
>> include/linux/atomic/atomic-arch-fallback.h:259:7: error: void value not ignored as it ought to be
     ___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
          ^
   include/linux/atomic/atomic-instrumented.h:4918:2: note: in expansion of macro 'raw_try_cmpxchg64'
     raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
     ^~~~~~~~~~~~~~~~~
   fs/nfs/flexfilelayout/flexfilelayout.c:760:9: note: in expansion of macro 'try_cmpxchg64'
     return try_cmpxchg64(&ffl->last_report_time, &last_report, now);
            ^~~~~~~~~~~~~


vim +259 include/linux/atomic/atomic-arch-fallback.h

29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  249  
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  250  #if defined(arch_try_cmpxchg64)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  251  #define raw_try_cmpxchg64 arch_try_cmpxchg64
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  252  #elif defined(arch_try_cmpxchg64_relaxed)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  253  #define raw_try_cmpxchg64(...) \
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  254  	__atomic_op_fence(arch_try_cmpxchg64, __VA_ARGS__)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  255  #else
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  256  #define raw_try_cmpxchg64(_ptr, _oldp, _new) \
0aa7be05d83cc5 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  257  ({ \
0aa7be05d83cc5 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  258  	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05 @259  	___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
0aa7be05d83cc5 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  260  	if (unlikely(___r != ___o)) \
0aa7be05d83cc5 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  261  		*___op = ___r; \
0aa7be05d83cc5 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  262  	likely(___r == ___o); \
0aa7be05d83cc5 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  263  })
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  264  #endif
0aa7be05d83cc5 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  265  

:::::: The code at line 259 was first introduced by commit
:::::: 9257959a6e5b4fca6fc8e985790bff62c2046f20 locking/atomic: scripts: restructure fallback ifdeffery

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
