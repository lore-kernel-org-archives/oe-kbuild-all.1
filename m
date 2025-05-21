Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1881C212B3B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 15:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841839; cv=none; b=pRxPtzA3FlPb0JppIIlZfH7P3HdQ/+mVO1hYtAIrm2i5pXvch8zAHf+xuZB/BdOI96/J4eJFMJet8emHNBsTUNTwdDqibHOP4THsxlWs9v6DSmjJOTuDB2SgtolDGxRPXuBmJoXb7u+H/aMezJAUli8Q8gfLmERvVHW0RzbEroU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841839; c=relaxed/simple;
	bh=jc1/UTbPukp1asAgfawdF1dPeTb92k2/dHpoHyOzvKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pevIfu4qzsRAq7eQMNbRMFuIsaBVC6RmNz7ZoY9cbCkjUae8ZKUdt5PmWjpFzYGbB+O3K7uu2fULLGTOZej8T7PdfVX/7DDAXAQBFp05DXscle7/HxCJkOJczxEh4dDRrVeJ/nd211Q/8c4RQSlNNV09B9hbxdT0gQ3P0qPGurc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwsuTXmR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwsuTXmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747841838; x=1779377838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jc1/UTbPukp1asAgfawdF1dPeTb92k2/dHpoHyOzvKM=;
  b=LwsuTXmR6vaz/nDYYVgL4YXCpPh4RMM9EW0qdx/lgPruZ1UekcxMIHSx
   C9w7GPZ1iIRC84VxAklbzFTpnyP/YV9ECjDyMx5rH/3mQ727qfikvlRIx
   i5jBSx7h5J9JCsIR1GSJbwMkU+r9Mo2ysQb7L9w8lNxYkmvDPc14CbQew
   K8wdSjTjQQmkRTQy+iYeqgXTSfcYVYO4i1S3WyBwHzFxZNH7wPpKtlFK0
   pMeYasHRQiNYbV1qXBHF9ImdkicQTSf11eJJwXdldhz9oYttbo/pmxbcf
   JXf7IhCKg0+JRVJT24fm3PuIDXz4ClgXhcCLCO7/IMSlndD15fT/7ERU8
   Q==;
X-CSE-ConnectionGUID: baumWi65RyeqV0X6r5cy5A==
X-CSE-MsgGUID: xCKwYVXXQzia1e0MpRsRgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="48945178"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="48945178"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 08:37:15 -0700
X-CSE-ConnectionGUID: hT/tHS8MR2Oe+f3iZiDqjw==
X-CSE-MsgGUID: pBGDPZqaSlOJZfqfi4iZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140645215"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 May 2025 08:37:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHlVI-000OPA-0L;
	Wed, 21 May 2025 15:37:12 +0000
Date: Wed, 21 May 2025 23:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12611/12618] include/linux/compiler.h:191:9:
 error: '__v' undeclared
Message-ID: <202505212325.2ZmguXFx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7bac2c97af4078d7a627500c9bcdd5b033f97718
commit: bd8589c92d7f22712f27ff92f45defa2362123b5 [12611/12618] Merge branch 'for-next/kspp' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20250521/202505212325.2ZmguXFx-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505212325.2ZmguXFx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505212325.2ZmguXFx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from include/linux/backing-dev.h:12,
                    from mm/vma_internal.h:12,
                    from mm/vma_init.c:8:
   mm/vma_init.c: In function 'vm_area_init_from':
   include/linux/string.h:398:9: error: expected expression before 'do'
     398 |         do {                                                    \
         |         ^~
   include/linux/compiler.h:189:28: note: in definition of macro 'data_race'
     189 |         __auto_type __v = (expr);                                       \
         |                            ^~~~
   mm/vma_init.c:58:19: note: in expansion of macro 'memcpy'
      58 |         data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shared)));
         |                   ^~~~~~
>> include/linux/compiler.h:191:9: error: '__v' undeclared (first use in this function)
     191 |         __v;                                                            \
         |         ^~~
   mm/vma_init.c:58:9: note: in expansion of macro 'data_race'
      58 |         data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shared)));
         |         ^~~~~~~~~
   include/linux/compiler.h:191:9: note: each undeclared identifier is reported only once for each function it appears in
     191 |         __v;                                                            \
         |         ^~~
   mm/vma_init.c:58:9: note: in expansion of macro 'data_race'
      58 |         data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shared)));
         |         ^~~~~~~~~


vim +/__v +191 include/linux/compiler.h

6f33d58794ef4c Rusty Russell         2012-11-22  167  
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  168  /**
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  169   * data_race - mark an expression as containing intentional data races
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  170   *
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  171   * This data_race() macro is useful for situations in which data races
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  172   * should be forgiven.  One example is diagnostic code that accesses
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  173   * shared variables but is not a part of the core synchronization design.
020e6c22bd6e67 Paul E. McKenney      2024-05-10  174   * For example, if accesses to a given variable are protected by a lock,
020e6c22bd6e67 Paul E. McKenney      2024-05-10  175   * except for diagnostic code, then the accesses under the lock should
020e6c22bd6e67 Paul E. McKenney      2024-05-10  176   * be plain C-language accesses and those in the diagnostic code should
020e6c22bd6e67 Paul E. McKenney      2024-05-10  177   * use data_race().  This way, KCSAN will complain if buggy lockless
020e6c22bd6e67 Paul E. McKenney      2024-05-10  178   * accesses to that variable are introduced, even if the buggy accesses
020e6c22bd6e67 Paul E. McKenney      2024-05-10  179   * are protected by READ_ONCE() or WRITE_ONCE().
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  180   *
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  181   * This macro *does not* affect normal code generation, but is a hint
020e6c22bd6e67 Paul E. McKenney      2024-05-10  182   * to tooling that data races here are to be ignored.  If the access must
020e6c22bd6e67 Paul E. McKenney      2024-05-10  183   * be atomic *and* KCSAN should ignore the access, use both data_race()
020e6c22bd6e67 Paul E. McKenney      2024-05-10  184   * and READ_ONCE(), for example, data_race(READ_ONCE(x)).
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  185   */
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  186  #define data_race(expr)							\
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  187  ({									\
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  188  	__kcsan_disable_current();					\
7c812814e8c34a Alexey Dobriyan       2024-06-24 @189  	__auto_type __v = (expr);					\
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  190  	__kcsan_enable_current();					\
37d1a04b13a6d2 Thomas Gleixner       2020-06-11 @191  	__v;								\
37d1a04b13a6d2 Thomas Gleixner       2020-06-11  192  })
230fa253df6352 Christian Borntraeger 2014-11-25  193  

:::::: The code at line 191 was first introduced by commit
:::::: 37d1a04b13a6d2fec91a6813fc034947a27db034 Rebase locking/kcsan to locking/urgent

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
