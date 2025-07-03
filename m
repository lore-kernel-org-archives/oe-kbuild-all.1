Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65D625A2AE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 17:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751564237; cv=none; b=Tn78q4kMwRkSPI5MhQhWRmQssCbz1naz3J7CSKlVZIw9qS50Mi6/nVZQF9P0IN6hALYmdPo+OvKCrFJfG25raKwXrAkEVXFsIb+Oi0dtNjM9LySSlAFnBaHexGLOI9t7NUDasW4vlcS1BKut/xrF6kDoO7I4CGw8bw/Vi5WC5ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751564237; c=relaxed/simple;
	bh=OEy748VIT1MZFGsUfgCuFVL++q+L4zQ1MHBgkE4zBKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZkl6A15Mmzuy+oH8iy0iV941kjyG6E9FFX64jyB3h4w6ojNJmnlWR2ApVHwSuMqT8f69ceJRoR3hHH2C8jCaE0HCEQ59EVAvVfGy0wo9LDqdzC12mkmjXSnWk47h4XR168NJ7xLVnsw1bL50TLimhuJDU3eoGJEj7weE1fKISA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pl4wVLKE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pl4wVLKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751564235; x=1783100235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OEy748VIT1MZFGsUfgCuFVL++q+L4zQ1MHBgkE4zBKg=;
  b=Pl4wVLKE5Zj0d08OrR9W69R1T+1m4DaxZCtGznJivtVg3uog3dL40Wck
   E5mZwBI9C0Znh0w6zQ9mEKwZFRig5Hs3U/gBCT5wdVZLhqD9FPeZiu7Yd
   GLZ3Wl55lUcLXxtuu/TMZY+x3soHPfK3Wn8hltCG6UyfF6FrliKuBMvmS
   UicvW3qM/dloaKodKSBJRGhB6PpfZolfNGOKaZUN0WFF3jMan/yIYPTxY
   J1AW28wKkD2HdQV3KP4fFfnA8DZ7EnEXJCsgfHcHQGadABO+OxNNBklKH
   P8jdS5P2TKsC6onTtL1ph8Um6csGqRJdyZIREV6a9i6aAvMC+kHd8V1XD
   Q==;
X-CSE-ConnectionGUID: DQdFYcyxTRaRNDVRYe23RQ==
X-CSE-MsgGUID: AI3KoczaTwKUy8ChXXm01w==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79338468"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="79338468"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 10:36:59 -0700
X-CSE-ConnectionGUID: Nxa26c0zRl2Fr8kG6RS+cA==
X-CSE-MsgGUID: 15IbNe7bQCGpx4PhnqEPVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="155173189"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jul 2025 10:36:55 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXNrg-0002qV-36;
	Thu, 03 Jul 2025 17:36:52 +0000
Date: Fri, 4 Jul 2025 01:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	horms@kernel.org, andrew@lunn.ch, przemyslaw.kitszel@intel.com,
	anthony.l.nguyen@intel.com, sgoutham@marvell.com,
	gakula@marvell.com, sbhatta@marvell.com, bbhushan2@marvell.com,
	tariqt@nvidia.com, mbloch@nvidia.com, leon@kernel.org,
	gal@nvidia.com, ecree.xilinx@gmail.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next v2 3/5] eth: mlx5: migrate to the *_rxfh_context
 ops
Message-ID: <202507040129.gR5UyINU-lkp@intel.com>
References: <20250702030606.1776293-4-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702030606.1776293-4-kuba@kernel.org>

Hi Jakub,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/eth-otx2-migrate-to-the-_rxfh_context-ops/20250702-110737
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250702030606.1776293-4-kuba%40kernel.org
patch subject: [PATCH net-next v2 3/5] eth: mlx5: migrate to the *_rxfh_context ops
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250704/202507040129.gR5UyINU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040129.gR5UyINU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040129.gR5UyINU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/en/rss.c: In function 'mlx5e_rss_get_rxfh':
>> drivers/net/ethernet/mellanox/mlx5/core/en/rss.c:587:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
     587 |         return 0;
         |                ^
   drivers/net/ethernet/mellanox/mlx5/core/en/rss.c:570:6: note: declared here
     570 | void mlx5e_rss_get_rxfh(struct mlx5e_rss *rss, u32 *indir, u8 *key, u8 *hfunc,
         |      ^~~~~~~~~~~~~~~~~~


vim +/return +587 drivers/net/ethernet/mellanox/mlx5/core/en/rss.c

25307a91cb50a0 Tariq Toukan   2021-08-16  569  
540d484b812cad Jakub Kicinski 2025-07-01  570  void mlx5e_rss_get_rxfh(struct mlx5e_rss *rss, u32 *indir, u8 *key, u8 *hfunc,
540d484b812cad Jakub Kicinski 2025-07-01  571  			bool *symmetric)
25307a91cb50a0 Tariq Toukan   2021-08-16  572  {
25307a91cb50a0 Tariq Toukan   2021-08-16  573  	if (indir)
cae8e6dea27923 Adham Faris    2023-10-12  574  		memcpy(indir, rss->indir.table,
74a8dadac17e2b Adham Faris    2023-10-12  575  		       rss->indir.actual_table_size * sizeof(*rss->indir.table));
25307a91cb50a0 Tariq Toukan   2021-08-16  576  
25307a91cb50a0 Tariq Toukan   2021-08-16  577  	if (key)
25307a91cb50a0 Tariq Toukan   2021-08-16  578  		memcpy(key, rss->hash.toeplitz_hash_key,
25307a91cb50a0 Tariq Toukan   2021-08-16  579  		       sizeof(rss->hash.toeplitz_hash_key));
25307a91cb50a0 Tariq Toukan   2021-08-16  580  
25307a91cb50a0 Tariq Toukan   2021-08-16  581  	if (hfunc)
25307a91cb50a0 Tariq Toukan   2021-08-16  582  		*hfunc = rss->hash.hfunc;
25307a91cb50a0 Tariq Toukan   2021-08-16  583  
4d20c9f2db83a0 Gal Pressman   2025-02-24  584  	if (symmetric)
4d20c9f2db83a0 Gal Pressman   2025-02-24  585  		*symmetric = rss->hash.symmetric;
4d20c9f2db83a0 Gal Pressman   2025-02-24  586  
25307a91cb50a0 Tariq Toukan   2021-08-16 @587  	return 0;
25307a91cb50a0 Tariq Toukan   2021-08-16  588  }
25307a91cb50a0 Tariq Toukan   2021-08-16  589  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
