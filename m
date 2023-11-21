Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC043BB2B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 22:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/MGWp7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700606674; x=1732142674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8yNISvLdZFalMlizDxMmo03wMv6hRosHjvlpanfTZ6k=;
  b=c/MGWp7vMBfdzJfS6l/zio/r+2P6x+B48vaY4urF+1QbAJMTBFexQMF6
   Nh11I+2a5qdEi2lHLnqVjVezYz1Oz7mAEeWM5JupQoSaq1yjqDvGzTROj
   c14KWoR3f9cKcfTRy6YWZbtzoh7vYUm/ZfpXgR+Nrq8CPfmeCorjSQxiI
   tKlovAgyhz9vSj1T4ZYnfSTR4yqALMqMviSh3PwUhfY7U+W7wroMzLSWy
   CMSAsb9v7nnffR1DmyBI5wGM5o419bB+WesE6x345ur/QFkOrkKZMzJdL
   nuTN22xSFG3ur+utXRpMdmolXaqUYjWn2rLS9B1Hr8ziqLEmXsZtGS0oq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="456274451"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="456274451"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 14:44:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="8027988"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Nov 2023 14:44:33 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5ZTq-0008ME-00;
	Tue, 21 Nov 2023 22:44:30 +0000
Date: Wed, 22 Nov 2023 06:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-defer-cleanups 2/2] fs/xfs/libxfs/xfs_defer.c:747:1:
 warning: no previous prototype for function 'xfs_defer_alloc'
Message-ID: <202311220537.jgLkLYNQ-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231122/202311220537.jgLkLYNQ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220537.jgLkLYNQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220537.jgLkLYNQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_defer.c:747:1: warning: no previous prototype for function 'xfs_defer_alloc' [-Wmissing-prototypes]
   xfs_defer_alloc(
   ^
   fs/xfs/libxfs/xfs_defer.c:746:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct xfs_defer_pending *
   ^
   static 
   1 warning generated.


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
