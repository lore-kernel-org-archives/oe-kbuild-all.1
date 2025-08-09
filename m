Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E48118FC92
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Aug 2025 11:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754740454; cv=none; b=ae7n0XBnVoPvxNfDHZp1jj3YrTCAMDy9Pm+CSeuPp7R8D9RiUBEfJYrQKGqFfNyhwu5vPGVvjJvUplmN523jnNdBdqdKTGo0iI1sVWKltMmZrvGhKIWJIMWP58nn+G/85JITsQIqmjfEXxPY/AD+JvPc5bd7fxC3lNx7gxD+qi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754740454; c=relaxed/simple;
	bh=gWg2vhGsIAVr/SU9vPlVQF4K9yGvaM9WPJ2snXdFDvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pRFsA4fyh9hIKqoTqMQrtrDfMD+vzmM/kHoqYGtNReMwP8zSn1gQPLyAi3xmEnZZjQlvKMZMP1gxkyEUNfBP0IWFTtcdDhyMOcleOc+qvD/lZHZJoXbxGx1sJqoEBG27oE4mmnfk16DmpUoIKl3ok7/H8ZeHFLAJbdnG0gW5kX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uql32m07; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uql32m07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754740453; x=1786276453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gWg2vhGsIAVr/SU9vPlVQF4K9yGvaM9WPJ2snXdFDvI=;
  b=Uql32m07q7aNr079vPKTtZIYWIegff5AXRrvy88X9l2dUEON/fbAmFqu
   VAdLlEabzfARiGtdLg9p+/Xsy+pIXPMOWoEmr61kQRZe3L/ccU+4J6ZtW
   gcN4wiqLSFxAaashPUpM0tF8W57c4Xg1DduqXc5B3STATGa3+sfPQMhE4
   V1hJDODSJXhl+roEtnQr3Izmac4SaW4B+yCHiiXZZzZZAGMNBjRUBJT4T
   I7Fodyt7rOp200GLFhmKv2LzRPpvScyvlcoJBuZfNEokCEgC9FKdF8Acu
   nODsbi6ha9v+6/VLvx9F31nI2SSy7gb3CIO/QJ7AUU9dD+Tmz1Mp83jcn
   Q==;
X-CSE-ConnectionGUID: +f5MTGIIQguyaf9JXVG/5A==
X-CSE-MsgGUID: /c/LwlW9Sni1V9sQ7s7zsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="60914933"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="60914933"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 04:54:13 -0700
X-CSE-ConnectionGUID: /LayqXIpSACNVO5QDk1fqQ==
X-CSE-MsgGUID: du2bgJltTZefe8cCuH3+nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="164747366"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 09 Aug 2025 04:54:12 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uki9J-0002o7-1O;
	Sat, 09 Aug 2025 11:54:09 +0000
Date: Sat, 9 Aug 2025 13:53:53 +0200
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/large-buffers-v2-r2 13/25]
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:5630:25: error:
 incompatible function pointer types initializing 'int (*)(struct net_device
 *, struct netdev_queue_config *, void *, int)' with an expression of type
 'int (struct net_device *, void *, int)'
Message-ID: <202508091334.FnB9K5aH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/large-buffers-v2-r2
head:   a015bc25a6a3c423304e2185697474b68aa49f1c
commit: 06fe9ae7cc298f826f521435dadc083a708e05c9 [13/25] net: allocate per-queue config structs and pass them thru the queue API
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250809/202508091334.FnB9K5aH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091334.FnB9K5aH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508091334.FnB9K5aH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/en_main.c:5630:25: error: incompatible function pointer types initializing 'int (*)(struct net_device *, struct netdev_queue_config *, void *, int)' with an expression of type 'int (struct net_device *, void *, int)' [-Wincompatible-function-pointer-types]
    5630 |         .ndo_queue_mem_alloc    =       mlx5e_queue_mem_alloc,
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_main.c:5632:21: error: incompatible function pointer types initializing 'int (*)(struct net_device *, struct netdev_queue_config *, void *, int)' with an expression of type 'int (struct net_device *, void *, int)' [-Wincompatible-function-pointer-types]
    5632 |         .ndo_queue_start        =       mlx5e_queue_start,
         |                                         ^~~~~~~~~~~~~~~~~
   2 errors generated.


vim +5630 drivers/net/ethernet/mellanox/mlx5/core/en_main.c

b2588ea40ec947 Saeed Mahameed 2025-06-16  5627  
b2588ea40ec947 Saeed Mahameed 2025-06-16  5628  static const struct netdev_queue_mgmt_ops mlx5e_queue_mgmt_ops = {
b2588ea40ec947 Saeed Mahameed 2025-06-16  5629  	.ndo_queue_mem_size	=	sizeof(struct mlx5_qmgmt_data),
b2588ea40ec947 Saeed Mahameed 2025-06-16 @5630  	.ndo_queue_mem_alloc	=	mlx5e_queue_mem_alloc,
b2588ea40ec947 Saeed Mahameed 2025-06-16  5631  	.ndo_queue_mem_free	=	mlx5e_queue_mem_free,
b2588ea40ec947 Saeed Mahameed 2025-06-16  5632  	.ndo_queue_start	=	mlx5e_queue_start,
b2588ea40ec947 Saeed Mahameed 2025-06-16  5633  	.ndo_queue_stop		=	mlx5e_queue_stop,
b2588ea40ec947 Saeed Mahameed 2025-06-16  5634  };
b2588ea40ec947 Saeed Mahameed 2025-06-16  5635  

:::::: The code at line 5630 was first introduced by commit
:::::: b2588ea40ec9472688289c1a644627c0f4a1f33f net/mlx5e: Implement queue mgmt ops and single channel swap

:::::: TO: Saeed Mahameed <saeedm@nvidia.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
