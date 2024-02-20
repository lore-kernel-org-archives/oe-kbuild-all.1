Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B042B44C73
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 02:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708394840; cv=none; b=vFiSv2Rhldb5+s06tpRVUv6Bh7p6TzdLa1MWIjEENIfEujpoI6M2o5pxXJ59fz9clRdJ2rcVKw6X04aMZPqGf63cR90NHDaf9QBVbfGNfFDpACXIrXDPuc/bQTmjo0vekV0RX84Mv8gKER2PjFWu5eW/fk86J0RfkleMda3jgq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708394840; c=relaxed/simple;
	bh=FIW1CtFVRM/OfrwhnO/J63rEsVxcuFZFOoSLWEeUGr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAphtfiTMCznZ4dlyWFuXdVxNfyEzm2aeCdGvINWoPRWCi3dSjhIXCMkYSGAdf3XEj/wQYe38Cy8dfQuLWlmCAym2+MXHHZuxxecWKKGnd0E34TTWw5lmLpkG+BxXfa9XUY9F8kDDVSmEg/69plwrEo6JmhIjPvYifdM3Yzet1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MInKyYUF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MInKyYUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708394839; x=1739930839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FIW1CtFVRM/OfrwhnO/J63rEsVxcuFZFOoSLWEeUGr0=;
  b=MInKyYUF7s3Ql1+3ZVsOSIqrCRlNZqAnU3yUTGfaSkYory/CyoPXTL1Y
   8vR3vws5bohO9sAHO5DNq2riW4SzDUSoHOqSUt2XvCWa1pkRYwnxEzARE
   UZmW7UlpLVDRw831+jUVYy6kkX3dzuvW4ZqApnnS/hjETam0YbEvNFubK
   P1LJnjxu337OVbArDyGCvE7hXVHEG60+u+IXwD4QNlnD7vrD6rtZumfzU
   EG51lGjPDbiMBrv62nKgtYIrahP1Oilnih58Se/KUX4bbZHUu2PV9V8G+
   D3939R7QxUzpnpXldE3HVTc7oZ+zpyEvhmnrgpwLDvOgSoLnYeV2ap7fb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2609222"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2609222"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:07:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="27796779"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Feb 2024 18:07:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcFXL-0004By-31;
	Tue, 20 Feb 2024 02:07:12 +0000
Date: Tue, 20 Feb 2024 10:06:14 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.pidfd 21/21]
 include/linux/atomic/atomic-arch-fallback.h:191:34: error: initialization of
 'struct dentry **' from incompatible pointer type 'struct dentry *'
Message-ID: <202402201033.xjAH54m9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.pidfd
head:   b5273dc51b5b5843659d6b3ee930ac10ff3ad816
commit: a211767b02e79fa1984d8014a35932b7683db40b [21/21] libfs: improve path_from_stashed() helper
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20240220/202402201033.xjAH54m9-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240220/202402201033.xjAH54m9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402201033.xjAH54m9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from fs/libfs.c:7:
   fs/libfs.c: In function 'stash_dentry':
>> include/linux/atomic/atomic-arch-fallback.h:191:34: error: initialization of 'struct dentry **' from incompatible pointer type 'struct dentry *' [-Werror=incompatible-pointer-types]
     191 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                                  ^
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   fs/libfs.c:2036:28: note: in expansion of macro 'try_cmpxchg'
    2036 |                 if (likely(try_cmpxchg(stashed, old, dentry)))
         |                            ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +191 include/linux/atomic/atomic-arch-fallback.h

9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  182  
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  183  #if defined(arch_try_cmpxchg)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  184  #define raw_try_cmpxchg arch_try_cmpxchg
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  185  #elif defined(arch_try_cmpxchg_relaxed)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  186  #define raw_try_cmpxchg(...) \
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  187  	__atomic_op_fence(arch_try_cmpxchg, __VA_ARGS__)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  188  #else
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  189  #define raw_try_cmpxchg(_ptr, _oldp, _new) \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  190  ({ \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29 @191  	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  192  	___r = raw_cmpxchg((_ptr), ___o, (_new)); \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  193  	if (unlikely(___r != ___o)) \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  194  		*___op = ___r; \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  195  	likely(___r == ___o); \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  196  })
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  197  #endif
29f006fdefe6f8 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  198  

:::::: The code at line 191 was first introduced by commit
:::::: 29f006fdefe6f88abde973a0b0f20d2704e93fd4 asm-generic/atomic: Add try_cmpxchg() fallbacks

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
