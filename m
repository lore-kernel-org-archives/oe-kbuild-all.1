Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C6D40C03
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 02:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726196015; cv=none; b=Hbuz5DeZPoY7DV7ibQnQB2O/0GBCiGcpnhhfUSqjoFtxkOw8YCVyxup5iOScENX6PJ6+ljP/gASxY8B3btHY/1kvGTFP8kB+Q9CSVVrx4k796oH0W9EvY4IImcuJOv8W3WyT0hTMSRwh87VA7FuKGc7cYMBLOScjKeZ4+8G6dno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726196015; c=relaxed/simple;
	bh=W1p9h8bplarDu3lVaxin1ia7X7OgpDgdohSgDSIkkkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GLdwBOkEyljNcJ4aVZZk2c2MHUUXvsNbVn18i7SJgzJrSuuA8AO8hg9mTPk3+4pmAWS7ZM+S59inHc1hXfVxzanLLX3ahX/SayuUNDcVT1y52MkSrn38bLGmIXMZ/yjo3v8DNSiwFHHcVfGyelLTIeJXr9KZCGlLj3P90F0vMnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoAgQMdz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoAgQMdz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726196013; x=1757732013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W1p9h8bplarDu3lVaxin1ia7X7OgpDgdohSgDSIkkkw=;
  b=AoAgQMdzVX2A6K6vYMuFdKqShW7+lTaHtZy6JKD3omTqYVxhve1/ZS4H
   OJdtFxQqRriO6J63d6PVzR3pYBFXeY6z0WJjH+z5m6Kvhpm3sGxfODfem
   iF7vC67Ivxlrzzs7Cd1UuI5Rqcys6Aks+9U8ma8y98/X7y00qHAzjYuWS
   R4rJehqJdORENLrI1328woCbKAkkbdVb6u8c/Dm//OzKPoi7+ZQVUlbtO
   saaj2jXNrAmloCv0IaV26mU3WQwUryaiZMuJeHFz71zBujz3jm9s3ssbG
   bJXQnJDwb+gd9tSnQAqnp6MwBEUNH1HArA27f8tIab+j9qSonD/vxdlvS
   A==;
X-CSE-ConnectionGUID: ShnzkUkYSxGfZi7NUmPOSw==
X-CSE-MsgGUID: WjzKMeuoRCObBDknIEEs4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25182003"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="25182003"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 19:53:33 -0700
X-CSE-ConnectionGUID: AL7/rf/WT/mrXmC8qcYTIw==
X-CSE-MsgGUID: svdXIkyyS+moKjHdhnh3Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="68158780"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Sep 2024 19:53:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sowR7-0005wC-05;
	Fri, 13 Sep 2024 02:53:29 +0000
Date: Fri, 13 Sep 2024 10:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Guralnik <michaelgur@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 52/80]
 drivers/net/ethernet/mellanox/mlx5/core/main.c:482:2-3: Unneeded semicolon
Message-ID: <202409131019.IXh0jC0s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   f1e3ad547cf0c19a02c067031cd16c70943a1052
commit: 5416992c011080f20d2e849674bbbf5a5a9d1808 [52/80] net/mlx5: Handle memory scheme ODP capabilities
config: um-randconfig-r051-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131019.IXh0jC0s-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131019.IXh0jC0s-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mellanox/mlx5/core/main.c:482:2-3: Unneeded semicolon

vim +482 drivers/net/ethernet/mellanox/mlx5/core/main.c

   454	
   455	static int handle_hca_cap_odp(struct mlx5_core_dev *dev, void *set_ctx)
   456	{
   457		bool do_set = false, mem_page_fault = false;
   458		void *set_hca_cap;
   459		int err;
   460	
   461		if (!IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING) ||
   462		    !MLX5_CAP_GEN(dev, pg))
   463			return 0;
   464	
   465		err = mlx5_core_get_caps(dev, MLX5_CAP_ODP);
   466		if (err)
   467			return err;
   468	
   469		set_hca_cap = MLX5_ADDR_OF(set_hca_cap_in, set_ctx, capability);
   470		memcpy(set_hca_cap, dev->caps.hca[MLX5_CAP_ODP]->cur,
   471		       MLX5_ST_SZ_BYTES(odp_cap));
   472	
   473		/* For best performance, enable memory scheme ODP only when
   474		 * it has page prefetch enabled.
   475		 */
   476		if (MLX5_CAP_ODP_MAX(dev, mem_page_fault) &&
   477		    MLX5_CAP_ODP_MAX(dev, memory_page_fault_scheme_cap.page_prefetch)) {
   478			mem_page_fault = true;
   479			do_set = true;
   480			MLX5_SET(odp_cap, set_hca_cap, mem_page_fault, mem_page_fault);
   481			goto set;
 > 482		};
   483	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
