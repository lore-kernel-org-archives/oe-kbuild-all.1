Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF3B3FDB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 05:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690349871; x=1721885871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FcKC6zCwLsSd/ASDymGvouiGNmEtwx65VjDjNKE6twk=;
  b=fKuVKyN4SEKnODxziN8JJLsYKWei9i61xwShtE0UcaPve1seGdSnZwE8
   iqr16nVz6fnQ0ukQXhiEU9zmuOxd36CQ5Kj+W1cj825YGwuAvQ/FChamg
   f3ZFEILtVfRgo4tB5uKe7iJQmFyun6tkPq6kqMWuw0KFxFIhExSdQad6N
   HqAw2DCbkJ6mIGIDn8F55zzMmUmASEh/P5/G7DReQ88gzeXc7hRgCKZEw
   uNO7xZQ23QHEnMG4ze3Sldy0Me1Q1xgGlxhy9egemh/8kVhM+PEGqvKVi
   h4xXzhgU/7G4viuYUAY7ThSQjHMLSGyuqmiVChe6P7hC+HLzOKPbMzTy1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352825232"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="352825232"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 22:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="900270340"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="900270340"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Jul 2023 22:37:50 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOXDZ-0000hp-1O;
	Wed, 26 Jul 2023 05:37:49 +0000
Date: Wed, 26 Jul 2023 13:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 340/358]
 drivers/gpu/drm/ttm/ttm_bo.c:787:15: error: 'struct ttm_buffer_object' has
 no member named 'pin_count'
Message-ID: <202307261313.oC9VaRiO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   643df3563d38a49189f970269b48469e47dd5a20
commit: a5c1d950bc66eb8a15d86b0fc44af14b1006008f [340/358] drm/ttm: never consider pinned BOs for eviction&swap
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230726/202307261313.oC9VaRiO-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261313.oC9VaRiO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261313.oC9VaRiO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/ttm_bo.c: In function 'ttm_bo_evict_swapout_allowable':
>> drivers/gpu/drm/ttm/ttm_bo.c:787:15: error: 'struct ttm_buffer_object' has no member named 'pin_count'
     787 |         if (bo->pin_count) {
         |               ^~


vim +787 drivers/gpu/drm/ttm/ttm_bo.c

   771	
   772	/**
   773	 * Check the target bo is allowable to be evicted or swapout, including cases:
   774	 *
   775	 * a. if share same reservation object with ctx->resv, have assumption
   776	 * reservation objects should already be locked, so not lock again and
   777	 * return true directly when either the opreation allow_reserved_eviction
   778	 * or the target bo already is in delayed free list;
   779	 *
   780	 * b. Otherwise, trylock it.
   781	 */
   782	static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
   783				struct ttm_operation_ctx *ctx, bool *locked, bool *busy)
   784	{
   785		bool ret = false;
   786	
 > 787		if (bo->pin_count) {
   788			*locked = false;
   789			*busy = false;
   790			return false;
   791		}
   792	
   793		if (bo->base.resv == ctx->resv) {
   794			dma_resv_assert_held(bo->base.resv);
   795			if (ctx->flags & TTM_OPT_FLAG_ALLOW_RES_EVICT
   796			    || !list_empty(&bo->ddestroy))
   797				ret = true;
   798			*locked = false;
   799			if (busy)
   800				*busy = false;
   801		} else {
   802			ret = dma_resv_trylock(bo->base.resv);
   803			*locked = ret;
   804			if (busy)
   805				*busy = !ret;
   806		}
   807	
   808		return ret;
   809	}
   810	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
