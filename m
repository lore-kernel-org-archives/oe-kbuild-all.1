Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC88F5A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725112032; cv=none; b=P3larMJQ/TXvSTsLMHbxgjA0lwcuMp/OajQeotw9IMJoy54nPKy+lkuBlwvtc6Gc2VNTovWsfYYFQoT+gEZJnGRBYETs7IJVhVdeLJ4ogGUTB9rTV8k8lYZr8BrqO1TjCEAvul3d+r8t8gWiqAkCiJs7GcoJOMo7THkStB4bLMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725112032; c=relaxed/simple;
	bh=d/w3YbuuMroVRqB43lHNbagkNTbmE+IJkZ4SAo7ZmnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qd3GglX4nf6dINmJ/SswGkhFfzMKrYiUjKN9S4pgpsobWvEan0WAS1qh21mJ3YAZ7tXymkyJ4dphqzx2u/kJeJrMic49YJnRkXAupViwdCcXuTlIb7Ny8zdx/HwZlZAsvm3xXrT0P1yTfrDMdcKvqiUoC1Jbqf8BCULCX6lSF0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVW4R1PV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVW4R1PV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725112030; x=1756648030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d/w3YbuuMroVRqB43lHNbagkNTbmE+IJkZ4SAo7ZmnI=;
  b=eVW4R1PV8xkjaDLCh0V6FFIQUFbaYgRcO0GqlGfQi2SyyTnR5Py8/HsR
   SCEEm3nbd5abbPZfTvU6UJOpHNESxuXE6wxjg7WGGfithYu0qxuJoebga
   EDHjLqrpW5zsMeinfwEK1SrqcM/SMePfIyDJq2UTXF7/4eHSp0H3992rd
   UM41MwWzwjzgds6XuIV3JUEx2gvhKkVqzJIeIbQYkfVgQpPbIThD8wMhy
   NJlHv3CZXQWiX15esqEu68O7rJcc8bjBSLsWkKt/oLIFDs6aqCyBiDqnn
   srk8y3LAlT4is+XnqcXi41VXKZiv5N27qkkBGf+CJbH4dlkdtCWzsnACC
   Q==;
X-CSE-ConnectionGUID: 6gXPqh5VT629nZEwajRTWw==
X-CSE-MsgGUID: Zc1DpO9WTgS7Rr3jldi+lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23880548"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23880548"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 06:47:09 -0700
X-CSE-ConnectionGUID: 9+og8I/7TSiP1EWGrkMRaA==
X-CSE-MsgGUID: VxfHUn98QSe6azkqxE2/Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="68997406"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Aug 2024 06:47:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skORV-0002nW-22;
	Sat, 31 Aug 2024 13:47:05 +0000
Date: Sat, 31 Aug 2024 21:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Guralnik <michaelgur@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 21/50] drivers/infiniband/hw/mlx5/odp.c:113:53:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202408312141.XB8gdSTr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   5cb0786f0ec8a80baf5aec93da6f0c6e8044f9e8
commit: 0684cc9ca5294ac5d587d8288d73928b7e2eca2f [21/50] RDMA/mlx5: Add implicit MR handling to ODP memory scheme
config: x86_64-randconfig-121-20240831 (https://download.01.org/0day-ci/archive/20240831/202408312141.XB8gdSTr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408312141.XB8gdSTr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408312141.XB8gdSTr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/hw/mlx5/odp.c:113:53: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] key @@     got restricted __be32 @@
   drivers/infiniband/hw/mlx5/odp.c:113:53: sparse:     expected unsigned int [usertype] key
   drivers/infiniband/hw/mlx5/odp.c:113:53: sparse:     got restricted __be32
>> drivers/infiniband/hw/mlx5/odp.c:122:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] key @@     got unsigned int [usertype] key @@
   drivers/infiniband/hw/mlx5/odp.c:122:35: sparse:     expected restricted __be32 [usertype] key
   drivers/infiniband/hw/mlx5/odp.c:122:35: sparse:     got unsigned int [usertype] key
   drivers/infiniband/hw/mlx5/odp.c:155:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] key @@     got unsigned int [usertype] key @@
   drivers/infiniband/hw/mlx5/odp.c:155:35: sparse:     expected restricted __be32 [usertype] key
   drivers/infiniband/hw/mlx5/odp.c:155:35: sparse:     got unsigned int [usertype] key

vim +113 drivers/infiniband/hw/mlx5/odp.c

   106	
   107	static void populate_klm(struct mlx5_klm *pklm, size_t idx, size_t nentries,
   108				struct mlx5_ib_mr *imr, int flags)
   109	{
   110		struct mlx5_core_dev *dev = mr_to_mdev(imr)->mdev;
   111		struct mlx5_klm *end = pklm + nentries;
   112		int step = MLX5_CAP_ODP(dev, mem_page_fault) ? MLX5_IMR_MTT_SIZE : 0;
 > 113		u32 key = MLX5_CAP_ODP(dev, mem_page_fault) ?
   114				  cpu_to_be32(imr->null_mmkey.key) :
   115				  mr_to_mdev(imr)->mkeys.null_mkey;
   116		u64 va =
   117			MLX5_CAP_ODP(dev, mem_page_fault) ? idx * MLX5_IMR_MTT_SIZE : 0;
   118	
   119		if (flags & MLX5_IB_UPD_XLT_ZAP) {
   120			for (; pklm != end; pklm++, idx++, va += step) {
   121				pklm->bcount = cpu_to_be32(MLX5_IMR_MTT_SIZE);
 > 122				pklm->key = key;
   123				pklm->va = cpu_to_be64(va);
   124			}
   125			return;
   126		}
   127	
   128		/*
   129		 * The locking here is pretty subtle. Ideally the implicit_children
   130		 * xarray would be protected by the umem_mutex, however that is not
   131		 * possible. Instead this uses a weaker update-then-lock pattern:
   132		 *
   133		 *    xa_store()
   134		 *    mutex_lock(umem_mutex)
   135		 *     mlx5r_umr_update_xlt()
   136		 *    mutex_unlock(umem_mutex)
   137		 *    destroy lkey
   138		 *
   139		 * ie any change the xarray must be followed by the locked update_xlt
   140		 * before destroying.
   141		 *
   142		 * The umem_mutex provides the acquire/release semantic needed to make
   143		 * the xa_store() visible to a racing thread.
   144		 */
   145		lockdep_assert_held(&to_ib_umem_odp(imr->umem)->umem_mutex);
   146	
   147		for (; pklm != end; pklm++, idx++, va += step) {
   148			struct mlx5_ib_mr *mtt = xa_load(&imr->implicit_children, idx);
   149	
   150			pklm->bcount = cpu_to_be32(MLX5_IMR_MTT_SIZE);
   151			if (mtt) {
   152				pklm->key = cpu_to_be32(mtt->ibmr.lkey);
   153				pklm->va = cpu_to_be64(idx * MLX5_IMR_MTT_SIZE);
   154			} else {
   155				pklm->key = key;
   156				pklm->va = cpu_to_be64(va);
   157			}
   158		}
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
