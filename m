Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3980BE5C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 04:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6ZdVPM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700627304; x=1732163304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66+toIqedRFzEaN8L7o5CcdSqSQkktRqHxCAcul2O/8=;
  b=f6ZdVPM3WwVmQvDS6optAAFss9ktMABPCDz7DAKq/PDPmEX3eZ3fBDsx
   SO5bU3btcuzAGrATkpdsFTWreTRXx/WKzkHfAW7iIvLxMFtEMc9ArVUN3
   7aF1Vr46plP3HkE/oR0baUnMwpKOhNoB6Hdb9qA8qCQxCs61MbN/SHZUU
   XFNym156UzleQ6dtaow01J+4349iilyCu31+DSE/rw75MWUMKI1EBWxD6
   di6DjvjCjNuJEFwVnWouc4dNR4idCgYEWsdJ52Ahs8S65rK47o7Pcikm4
   pMuf5P+xcsthC+lkuBRAtBb2xh4UISjWabzzmrjiWQOqjqcDWqiERA0gt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="382377067"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="382377067"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 20:28:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="910674529"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="910674529"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2023 20:28:22 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5epk-0008e1-2x;
	Wed, 22 Nov 2023 04:28:09 +0000
Date: Wed, 22 Nov 2023 12:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-defer-cleanups 2/2] fs/xfs/libxfs/xfs_defer.c:746:26:
 sparse: sparse: symbol 'xfs_defer_alloc' was not declared. Should it be
 static?
Message-ID: <202311221231.qC4o8Zxz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-defer-cleanups
head:   e522e139829f885434ffcb789fd64b4f83af3a5e
commit: e522e139829f885434ffcb789fd64b4f83af3a5e [2/2] xfs: share code between xfs_defer_add and xfs_defer_add_barrier
config: x86_64-randconfig-121-20231122 (https://download.01.org/0day-ci/archive/20231122/202311221231.qC4o8Zxz-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221231.qC4o8Zxz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221231.qC4o8Zxz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_defer.c:746:26: sparse: sparse: symbol 'xfs_defer_alloc' was not declared. Should it be static?

vim +/xfs_defer_alloc +746 fs/xfs/libxfs/xfs_defer.c

32f118708d4396d Darrick J. Wong   2023-09-11  744  
e522e139829f885 Christoph Hellwig 2023-10-28  745  /* Create a new pending item at the end of the intake list. */
eb9ad0e562e5ebd Darrick J. Wong   2023-09-11 @746  struct xfs_defer_pending *
e522e139829f885 Christoph Hellwig 2023-10-28  747  xfs_defer_alloc(
0f37d1780c3d864 Brian Foster      2018-08-01  748  	struct xfs_trans		*tp,
629ba28d0229a48 Christoph Hellwig 2023-10-27  749  	const struct xfs_defer_op_type	*ops)
4e0cc29b91a8056 Darrick J. Wong   2016-08-03  750  {
e522e139829f885 Christoph Hellwig 2023-10-28  751  	struct xfs_defer_pending	*dfp;
0f37d1780c3d864 Brian Foster      2018-08-01  752  
f3c799c22c661e1 Darrick J. Wong   2021-10-12  753  	dfp = kmem_cache_zalloc(xfs_defer_pending_cache,
f3c799c22c661e1 Darrick J. Wong   2021-10-12  754  			GFP_NOFS | __GFP_NOFAIL);
629ba28d0229a48 Christoph Hellwig 2023-10-27  755  	dfp->dfp_ops = ops;
4e0cc29b91a8056 Darrick J. Wong   2016-08-03  756  	INIT_LIST_HEAD(&dfp->dfp_work);
9d9e62338597068 Brian Foster      2018-08-01  757  	list_add_tail(&dfp->dfp_list, &tp->t_dfops);
e522e139829f885 Christoph Hellwig 2023-10-28  758  	return dfp;
e522e139829f885 Christoph Hellwig 2023-10-28  759  };
e522e139829f885 Christoph Hellwig 2023-10-28  760  

:::::: The code at line 746 was first introduced by commit
:::::: eb9ad0e562e5ebd9d5aed1f4a02cfe715fd9c471 xfs: allow pausing of pending deferred work items

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
