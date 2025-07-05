Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D9A26F449
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 03:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751685918; cv=none; b=IUndgvfzLLLTj5LU+BTpbk88BEX96EbwyQRENPS69qmF2OWSs6hw8y7RbY33ihcBgIr6wWU/YtYZHm99eliYXYSXKtN42yQoj2wy0bhq9vE7xJBxYK3AGoZDImmmzcrKVVr7y6hYloZbATsGbtgpkXcfYCSYLa8mksM8QNf2Q30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751685918; c=relaxed/simple;
	bh=/XTL8dsaj/HAboMmNbxl/kqYz2wYXtuIkGO3JWQj7wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsGux5f92wY954GOtOIdgZQGy8pYHtlYxCfhOZ6/BKYTTJ2nx2NcwVH3ash3r+H1wGvo8apjTqTtazbyKnsdWdcdFRKnlG3sJiyRGYIOuJPctRGJ0j7vVbCXpcUIg75Tl8hlM9VV4+8q2d4E2AD0YKmOkLtJ4EbPo4CWG2H7GHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Arq08kRI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Arq08kRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751685917; x=1783221917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/XTL8dsaj/HAboMmNbxl/kqYz2wYXtuIkGO3JWQj7wo=;
  b=Arq08kRIV46U4/jBK7WSE24pOf+GB1f1+wgpRWmAtYMz4OQlXpvX2cuJ
   ocKcsWCtX0oJeLV3A+VBTbydg6wPihvtmpue0ymDqg081Jy5g62FudwOC
   y2pFu7edfQmf55PNxC82bOhLZcylywPlnGHK9RkgwCqZUTVSFefWwpFg0
   w+F/y05YY4dIPvu8WSg+KY6dEpSqyQqmF7WwdMYFeZxUHT1KG45MIpRRF
   casaIO5Zd1Te04QnTwIuMzERX+EP1Dp6/smFjUqjw4AiETEpp9myG9gJ0
   ov9ziu1Z6DZViX+J5vfAt9DHA2toEzCTlWjRGosQFvqg/8ZpGNkL9Bf4C
   g==;
X-CSE-ConnectionGUID: iypwb8fjTnOqFWH5l6qkCQ==
X-CSE-MsgGUID: qFtvTWraTFiLPddh+S/2/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64601692"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="64601692"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 20:25:16 -0700
X-CSE-ConnectionGUID: N6OH5bwoQNGjFiCKktdKUA==
X-CSE-MsgGUID: NBn3KLVgQ7SF8rygsStobg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="159306903"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2025 20:25:12 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXtWX-0004FT-2g;
	Sat, 05 Jul 2025 03:25:09 +0000
Date: Sat, 5 Jul 2025 11:24:12 +0800
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
Message-ID: <202507051125.6hx5EsC9-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/eth-otx2-migrate-to-the-_rxfh_context-ops/20250702-110737
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250702030606.1776293-4-kuba%40kernel.org
patch subject: [PATCH net-next v2 3/5] eth: mlx5: migrate to the *_rxfh_context ops
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20250705/202507051125.6hx5EsC9-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051125.6hx5EsC9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051125.6hx5EsC9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/en/rss.c: In function 'mlx5e_rss_get_rxfh':
>> drivers/net/ethernet/mellanox/mlx5/core/en/rss.c:587:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
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
