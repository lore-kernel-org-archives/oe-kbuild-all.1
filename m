Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ECB3A1E93
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765893698; cv=none; b=iL/SxHm8nzKnKuy+X5s2WkDiOxTMgk+N0gznVcSK/Yu/M2kckS0M6tCG0Eie3I+240SaVSVfswaNekneaZ9oSAFb2tjI5yYaUevbcKJfb0vF2hS94iLWlQqFswUx8NuYhvT4riDVHugmAzkgSLtkIje4jpwYwbDojQDYov9pxPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765893698; c=relaxed/simple;
	bh=vJrR5sAIPAPrZMl3QZAJ4ZNqOmbFW/TKmYQ/AG9T2kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NbwejJCMHSlK5kzR+Z4+c5YbZCeemzhazMwyAnLcMcwx01wglH3kUMHi6GPTbFp5qijMAWy5qh/4Od9LdaswjSgZ/MgI8mhG5gGGv8Pz77oEgKarFjdlndsbWZt/MzDPdIGD95LGY0MiV4/x60HhlEoplOvJg35p4YiaGBtQfHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DB2aOdpF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DB2aOdpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765893695; x=1797429695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vJrR5sAIPAPrZMl3QZAJ4ZNqOmbFW/TKmYQ/AG9T2kk=;
  b=DB2aOdpFgAAfbmw3xXW/giN2WqTuy/RnwPSMVQi+xd2z7LT/2sTGFCHT
   0dv7+vPLlB7QVO9qFOa9XURB/JGSRVcvut7o/+cUzBaM6dcD0YGGZszwo
   nVU7P9sL8OJ9m82erPwbirUaLBwLhm4cWSqQPzyJM2lSsF/wEV4r3/y7v
   EVyyVQyNvFXQr9aYmGql8d7/0RyN/c9RSFO+LK4ZZReUBmrCl9ReaXNF+
   vV1NEp/gQfjVkp4YAxHUfUh3sLutn8GmCNpyfOPzode/n6IreeQys/DTz
   WTOIL5DAlRzyppfuPrXEFWHjULXuuiGOfv1d0kQBxJuz1HcLZIPxTkAgC
   A==;
X-CSE-ConnectionGUID: IlnR3mZpQWehqf3b+KpdJQ==
X-CSE-MsgGUID: stMQyV+mRLukoyYo1SZevg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71665216"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="71665216"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 06:01:34 -0800
X-CSE-ConnectionGUID: NIJwWtB9RYKq3MvbDLKS/g==
X-CSE-MsgGUID: iO5u4hulTCGlbDHEJQNAAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198008166"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 06:01:34 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVVcD-000000003Gb-2yiG;
	Tue, 16 Dec 2025 14:01:27 +0000
Date: Tue, 16 Dec 2025 22:00:20 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:ctx-analysis/dev 23/35] include/linux/lockref.h:54:11:
 error: implicit declaration of function '__cond_lock'; did you mean
 '__folio_lock'?
Message-ID: <202512162100.o9MYIF18-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   982f41984aa2e06402a8080e95499ae6c10a4e74
commit: 5f9dac2b3233d00dd0201bf081a53f2e8a26e773 [23/35] compiler-context-analysis: Remove __cond_lock() function-like helper
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20251216/202512162100.o9MYIF18-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162100.o9MYIF18-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162100.o9MYIF18-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/dcache.h:14,
                    from include/linux/unicode.h:6,
                    from include/linux/fs/super.h:6,
                    from include/linux/fs.h:5,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1268,
                    from fs/xfs/xfs_linux.h:25,
                    from fs/xfs/xfs.h:26,
                    from fs/xfs/xfs_dquot.c:6:
   fs/xfs/xfs_dquot.c: In function 'xfs_qm_dqrele':
>> include/linux/lockref.h:54:11: error: implicit declaration of function '__cond_lock'; did you mean '__folio_lock'? [-Wimplicit-function-declaration]
      54 |         (!__cond_lock((_lockref)->lock, !lockref_put_or_lock(_lockref)))
         |           ^~~~~~~~~~~
   fs/xfs/xfs_dquot.c:1123:13: note: in expansion of macro 'lockref_put_or_lock'
    1123 |         if (lockref_put_or_lock(&dqp->q_lockref))
         |             ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/dcache.h:14,
                    from include/linux/unicode.h:6,
                    from include/linux/fs/super.h:6,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/buffer_head.h:12,
                    from fs/gfs2/glock.c:12:
   fs/gfs2/glock.c: In function '__gfs2_glock_put_or_lock':
>> include/linux/lockref.h:54:11: error: implicit declaration of function '__cond_lock'; did you mean '__folio_lock'? [-Wimplicit-function-declaration]
      54 |         (!__cond_lock((_lockref)->lock, !lockref_put_or_lock(_lockref)))
         |           ^~~~~~~~~~~
   fs/gfs2/glock.c:255:13: note: in expansion of macro 'lockref_put_or_lock'
     255 |         if (lockref_put_or_lock(&gl->gl_lockref))
         |             ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/dcache.h:14,
                    from include/linux/unicode.h:6,
                    from include/linux/fs/super.h:6,
                    from include/linux/fs.h:5,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1268,
                    from fs/gfs2/quota.c:40:
   fs/gfs2/quota.c: In function 'qd_put':
>> include/linux/lockref.h:54:11: error: implicit declaration of function '__cond_lock'; did you mean '__folio_lock'? [-Wimplicit-function-declaration]
      54 |         (!__cond_lock((_lockref)->lock, !lockref_put_or_lock(_lockref)))
         |           ^~~~~~~~~~~
   fs/gfs2/quota.c:328:13: note: in expansion of macro 'lockref_put_or_lock'
     328 |         if (lockref_put_or_lock(&qd->qd_lockref))
         |             ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/dcache.h:14,
                    from include/linux/unicode.h:6,
                    from include/linux/fs/super.h:6,
                    from include/linux/fs.h:5,
                    from fs/erofs/internal.h:10,
                    from fs/erofs/compress.h:9,
                    from fs/erofs/zdata.c:7:
   fs/erofs/zdata.c: In function 'z_erofs_put_pcluster':
>> include/linux/lockref.h:54:11: error: implicit declaration of function '__cond_lock'; did you mean '__folio_lock'? [-Wimplicit-function-declaration]
      54 |         (!__cond_lock((_lockref)->lock, !lockref_put_or_lock(_lockref)))
         |           ^~~~~~~~~~~
   fs/erofs/zdata.c:945:13: note: in expansion of macro 'lockref_put_or_lock'
     945 |         if (lockref_put_or_lock(&pcl->lockref))
         |             ^~~~~~~~~~~~~~~~~~~


vim +54 include/linux/lockref.h

63440d1c6dd1fc Christoph Hellwig 2025-01-15  48  
25d8060418b4e8 Christoph Hellwig 2025-01-15  49  void lockref_get(struct lockref *lockref);
25d8060418b4e8 Christoph Hellwig 2025-01-15  50  int lockref_put_return(struct lockref *lockref);
6d2868d5b6fca7 Christoph Hellwig 2025-01-15  51  bool lockref_get_not_zero(struct lockref *lockref);
6d2868d5b6fca7 Christoph Hellwig 2025-01-15  52  bool lockref_put_or_lock(struct lockref *lockref);
12eef14bcbac77 Christoph Hellwig 2025-12-09  53  #define lockref_put_or_lock(_lockref) \
12eef14bcbac77 Christoph Hellwig 2025-12-09 @54  	(!__cond_lock((_lockref)->lock, !lockref_put_or_lock(_lockref)))
0f8f2aaaab0b0f Waiman Long       2013-08-28  55  

:::::: The code at line 54 was first introduced by commit
:::::: 12eef14bcbac77bd08dc5693ad5818e69993246f lockref: add a __cond_lock annotation for lockref_put_or_lock

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
