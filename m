Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D9B1C3306
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 16:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760027883; cv=none; b=pFOg0f4Gm7SLqGLrIm+bdgw45e2pqpXcHDEmtUo2Gfv8Lto+fK52LzbhS4FramI7Y2nXTYMC6yQ/FmCLdQyOFtiuErf7B8DJ5cwAszZgW9+irieFPaD0uXh1yUZX6ZUlXmN6X0JlxpkF6DYHj/Wl0Ro8gTKd7yzaVx+DyO/Sl5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760027883; c=relaxed/simple;
	bh=/bfWbTV9IiaR9rzvV9g7HtKP0oenXXle3qPDjYmwrB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pFaeMy4g81287H+JOTVqLLsQlM9VQG0GvnPAzMYOWA9Ydr+Mcp3eR7WVTQTmNodG33VvlEGRphkFuSZ8BI/zDAVKYml86gWHGb0snzrNoCQZVWeIH/DmLHe/GEa/JxNWwoAzDHzBa+fthoksYSu11FfuOXh8Ci5YKVEJBVv62XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDFmMvAR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDFmMvAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760027879; x=1791563879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/bfWbTV9IiaR9rzvV9g7HtKP0oenXXle3qPDjYmwrB4=;
  b=NDFmMvARhaPmxfXRyWcKblnc7Z+2k+FWMWgCZHBPscESOOh0KcWsrzuE
   /IwItLH8KkMwNBLM1bdgZzQWZwl60Nrb2yQEikDIMiY9lLa0IMKMlj6uL
   wNbEx5k1vu3YfoSmYd3iRCtzmogP9eWPf7x0RKlFP/CuSP9aPkFEwv+yo
   Jcja7ELoNxdOhgltByWDA1rE72VhWCfiY2IE0DAWxH1cdrfu7FWmVkuxQ
   rArDl234SwNkTZ7oe0r6o2JW1hMNOBg9BGGu2i5xN+ol3JxflFh0t3eB5
   9QdR+09F6Cmp1pRPHk1vyatYnJOT88z5L7UOOrhHkLa6pCblZKpuy2ELr
   w==;
X-CSE-ConnectionGUID: iZ1TKxstSLuMRLa/eeObmg==
X-CSE-MsgGUID: /gcbzYZgQNGCpe25NM78ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73672976"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="73672976"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 09:37:59 -0700
X-CSE-ConnectionGUID: UgZ5+tq8TEWTVIalSNLxDw==
X-CSE-MsgGUID: WiAhyU8LRKCajGPeNUdPOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="181182058"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Oct 2025 09:37:58 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6teN-000114-2h;
	Thu, 09 Oct 2025 16:37:55 +0000
Date: Fri, 10 Oct 2025 00:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-quota-cleanups 17/20] fs/xfs/xfs_qm.c:1396:6: warning:
 variable 'error' is used uninitialized whenever 'if' condition is true
Message-ID: <202510100015.g7ccC3D1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-quota-cleanups
head:   7bc9beb7cf78de1e9425c5bcc3e943744fa6b89a
commit: c894f1aafc49e6d9af7695c0b7ceaa90af8f49d2 [17/20] xfs: open code xfs_qm_dquot_walk
config: riscv-randconfig-002-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100015.g7ccC3D1-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100015.g7ccC3D1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100015.g7ccC3D1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_qm.c:1396:6: warning: variable 'error' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1396 |         if (!XFS_DQ_IS_DIRTY(dqp))
         |             ^~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_qm.c:1417:9: note: uninitialized use occurs here
    1417 |         return error;
         |                ^~~~~
   fs/xfs/xfs_qm.c:1396:2: note: remove the 'if' if its condition is always false
    1396 |         if (!XFS_DQ_IS_DIRTY(dqp))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
    1397 |                 goto out_unlock;
         |                 ~~~~~~~~~~~~~~~
   fs/xfs/xfs_qm.c:1379:13: note: initialize the variable 'error' to silence this warning
    1379 |         int                     error;
         |                                      ^
         |                                       = 0
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +1396 fs/xfs/xfs_qm.c

^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1367  
b84a3a96751f93 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-03-14  1368  STATIC int
b84a3a96751f93 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-03-14  1369  xfs_qm_flush_one(
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1370  	struct xfs_mount	*mp,
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1371  	xfs_dqtype_t		type,
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1372  	unsigned long		*idx,
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1373  	struct list_head	*buffer_list)
b84a3a96751f93 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-03-14  1374  {
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1375  	struct xfs_quotainfo	*qi = mp->m_quotainfo;
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1376  	struct radix_tree_root	*tree = xfs_dquot_tree(qi, type);
fe7257fd4b8ae9 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-04-23  1377  	struct xfs_buf		*bp = NULL;
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1378  	struct xfs_dquot	*dqp;
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1379  	int			error;
b84a3a96751f93 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-03-14  1380  
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1381  	mutex_lock(&qi->qi_tree_lock);
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1382  	if (!radix_tree_gang_lookup(tree, (void **)&dqp, *idx, 1)) {
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1383  		mutex_unlock(&qi->qi_tree_lock);
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1384  		*idx = 0;
662f80f12918cb fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1385  		return 0;
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1386  	}
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1387  
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1388  	*idx = dqp->q_id + 1;
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1389  	if (!lockref_get_not_dead(&dqp->q_lockref)) {
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1390  		mutex_unlock(&qi->qi_tree_lock);
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1391  		return -EAGAIN;
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1392  	}
c894f1aafc49e6 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1393  	mutex_unlock(&qi->qi_tree_lock);
662f80f12918cb fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1394  
9053ad45ff46f1 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-18  1395  	mutex_lock(&dqp->q_qlock);
b84a3a96751f93 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-03-14 @1396  	if (!XFS_DQ_IS_DIRTY(dqp))
b84a3a96751f93 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-03-14  1397  		goto out_unlock;
b84a3a96751f93 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-03-14  1398  
d62016b1a2df24 fs/xfs/xfs_qm.c       Dave Chinner      2025-06-26  1399  	xfs_qm_dqunpin_wait(dqp);
d62016b1a2df24 fs/xfs/xfs_qm.c       Dave Chinner      2025-06-26  1400  	xfs_dqflock(dqp);
7912e7fef2aebe fs/xfs/xfs_qm.c       Brian Foster      2017-06-14  1401  
ca378189fdfa89 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1402  	error = xfs_dquot_use_attached_buf(dqp, &bp);
fe7257fd4b8ae9 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-04-23  1403  	if (error)
fe7257fd4b8ae9 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-04-23  1404  		goto out_unlock;
ca378189fdfa89 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1405  	if (!bp) {
ca378189fdfa89 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1406  		error = -EFSCORRUPTED;
ca378189fdfa89 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1407  		goto out_unlock;
ca378189fdfa89 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1408  	}
b84a3a96751f93 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-03-14  1409  
a40fe30868ba43 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1410  	error = xfs_qm_dqflush(dqp, bp);
a40fe30868ba43 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1411  	if (!error)
43ff2122e6492b fs/xfs/xfs_qm.c       Christoph Hellwig 2012-04-23  1412  		xfs_buf_delwri_queue(bp, buffer_list);
fe7257fd4b8ae9 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-04-23  1413  	xfs_buf_relse(bp);
b84a3a96751f93 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-03-14  1414  out_unlock:
df288224396047 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1415  	mutex_unlock(&dqp->q_qlock);
df288224396047 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1416  	xfs_qm_dqrele(dqp);
b84a3a96751f93 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-03-14  1417  	return error;
b84a3a96751f93 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-03-14  1418  }
b84a3a96751f93 fs/xfs/xfs_qm.c       Christoph Hellwig 2012-03-14  1419  

:::::: The code at line 1396 was first introduced by commit
:::::: b84a3a96751f93071c1863f2962273973c8b8f5e xfs: remove the per-filesystem list of dquots

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Ben Myers <bpm@sgi.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
