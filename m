Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAAD15A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 00:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dv6Sy7dR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700614438; x=1732150438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8F43Crl7axaC8TiH0rWWqo6V1INnQKeqVnk/pEI2yJM=;
  b=dv6Sy7dRnyPQwCe5t/Gbn0po+V6DyXZzOYp5PF5qMLjYi0DyjmAJL+ag
   gVlFmaGYV+rP5TFx2PKYlgWLGDqU5NHsn5517TrfYiXQZQ45S8K1YqODZ
   LpLHk6dW00Z8lUtdYO+EVJGw4HDl2VGBzOVpQVrkGsf4cqeSHy9GXCbM7
   8xhmlR61+vMWdfVazSErzAGVMJOghl5rTQPH42q1LSGp5NoelFtC5YB2u
   mEcc47ERkdtj6lAr8dK6I6vqTbNIdbjn+HPoldoviIR68w6OXoq2rNR55
   zYoNr7UFJwkU+8PHKOqxVNrc5HBmAhUj/TP1dLdJOfRtZPpuhMaRDUyNK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="458450332"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="458450332"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 16:53:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="940253083"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="940253083"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Nov 2023 16:53:57 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5bV5-0008Sy-0J;
	Wed, 22 Nov 2023 00:53:55 +0000
Date: Wed, 22 Nov 2023 08:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-defer-cleanups 2/2] fs/xfs/libxfs/xfs_defer.c:747:1:
 warning: no previous prototype for 'xfs_defer_alloc'
Message-ID: <202311220835.7RgUe5Uq-lkp@intel.com>
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
config: powerpc-randconfig-r071-20231122 (https://download.01.org/0day-ci/archive/20231122/202311220835.7RgUe5Uq-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220835.7RgUe5Uq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220835.7RgUe5Uq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_defer.c:747:1: warning: no previous prototype for 'xfs_defer_alloc' [-Wmissing-prototypes]
     747 | xfs_defer_alloc(
         | ^~~~~~~~~~~~~~~


vim +/xfs_defer_alloc +747 fs/xfs/libxfs/xfs_defer.c

   744	
   745	/* Create a new pending item at the end of the intake list. */
   746	struct xfs_defer_pending *
 > 747	xfs_defer_alloc(
   748		struct xfs_trans		*tp,
   749		const struct xfs_defer_op_type	*ops)
   750	{
   751		struct xfs_defer_pending	*dfp;
   752	
   753		dfp = kmem_cache_zalloc(xfs_defer_pending_cache,
   754				GFP_NOFS | __GFP_NOFAIL);
   755		dfp->dfp_ops = ops;
   756		INIT_LIST_HEAD(&dfp->dfp_work);
   757		list_add_tail(&dfp->dfp_list, &tp->t_dfops);
   758		return dfp;
   759	};
   760	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
