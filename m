Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2D2CA45
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043139; cv=none; b=U7fgOrJPcKeJ3sWUUxcP2KFi42Xbq2cy0fl7MH0zTfP+WnUHkBfgAp22gn2/IQrfk0p3GXTYwNVpKMj4xhjujgUhxjYQtk9T2oUfUUP00gvK5keeGEtwSyVaaXYxuu34v+FOkrBYu4ckp0NK0tIXwx71ZnSMOYQOd/HzTieiuXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043139; c=relaxed/simple;
	bh=lE3KPgA2zs7KUgpA3IvPOiwg5WO1TU8jf8mFGGkn8e0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AlKRK8gQhxa/7sii7CcRuIakg/O3aBSPKdiHDRqFKevQm5o4HfLko+WKuV5k5WL7nSUfr6Sgf0FktHkRhVJHKnTXju2qLsLt92SnvInvGXwaMtsY4tcjdyEccDh644149sfYfrKmrVqIzu9QvW0uYsmaFbNp4gUp8YHLf5uYSYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ljrpw+7A; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ljrpw+7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784043137; x=1815579137;
  h=date:from:to:cc:subject:message-id;
  bh=lE3KPgA2zs7KUgpA3IvPOiwg5WO1TU8jf8mFGGkn8e0=;
  b=Ljrpw+7A5PViH434dGL/zLl6XyspLp3DLklaXecCBLXAP3KKAqfRE3F7
   TjAg08q1Do80v5+5VynzT0ISti9uB9IAkZOjJvNMC5yNAVURAwFUftm5x
   DnSfd9GMqUlAE+BI521n1bhHHA244wvFunGJ+26PTrsbRcynvpOm/bXw4
   87LmliipssOhtZ1YXSEyNCQ3VX0WynCjR4001mwfX/8Ew7hwANFbPhGEo
   4Y9td9DfxuEx92QIW1IwjPYn3SWs3u83BqufUISAruhvEFMmCdWTGjBE7
   e9PUhCjca5FKSXMoG//IeWGfQn/VQCzIrnGOQgoGZBnATUzSBUyDgSTVv
   g==;
X-CSE-ConnectionGUID: pzDAHhPVSsO+y7kUvu1mnA==
X-CSE-MsgGUID: b5KedQbLTCCUC1lG3Jt/zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="102091372"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="102091372"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 08:32:17 -0700
X-CSE-ConnectionGUID: GBR4A7YYSSeq6mMrMla1Ww==
X-CSE-MsgGUID: RwaSKM01Q/KZvDhXxRoIfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="255939019"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Jul 2026 08:32:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjf7E-00000000Mlw-2tT4;
	Tue, 14 Jul 2026 15:32:12 +0000
Date: Tue, 14 Jul 2026 23:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Tariq Toukan <tariqt@nvidia.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/en_main.c:663
 mlx5e_free_mpwqe_rq_drop_page() warn: inconsistent indenting
Message-ID: <202607142323.qm25Crps-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f26556c5eeea62cc934fa8938b148aa5844a6b6
commit: 0285cc3dac1b4ceb3dacdfce43627d41d649cf47 net/mlx5e: Alloc rq drop page based on calculated page_shift
date:   5 months ago
config: arm-randconfig-r072-20260714 (https://download.01.org/0day-ci/archive/20260714/202607142323.qm25Crps-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0285cc3dac1b ("net/mlx5e: Alloc rq drop page based on calculated page_shift")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607142323.qm25Crps-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/en_main.c:663 mlx5e_free_mpwqe_rq_drop_page() warn: inconsistent indenting

vim +663 drivers/net/ethernet/mellanox/mlx5/core/en_main.c

   655	
   656	static void mlx5e_free_mpwqe_rq_drop_page(struct mlx5e_rq *rq)
   657	{
   658		u16 page_order = max_t(s16, rq->mpwqe.page_shift - PAGE_SHIFT, 0);
   659		u32 page_size = BIT(PAGE_SHIFT + page_order);
   660	
   661		dma_unmap_page(rq->pdev, rq->wqe_overflow.addr, page_size,
   662			       rq->buff.map_dir);
 > 663		 __free_pages(rq->wqe_overflow.page, page_order);
   664	}
   665	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
