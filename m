Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4B61C6B4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 17:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476429; cv=none; b=FKLDIfcSonRIN/3GjKU8dP1Ay12l8+4qzgqxqDOsa/ZRR3WPVoqZVGuZG0oe0qWa79Fe0+hw0Oxh6Ri5ygkpo0bqpkW8q5FxmKVtB8BSzxlczUtkiHGKEcYiYIx1Jrlesiot0edUcdu7xtds1qtcIfqLiaXOFa7fAG3ZxwQPgrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476429; c=relaxed/simple;
	bh=7HWs8XHi/kGs2LpCRvceTCw9l6QALrai144dNl+rrzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ssPv/xWMbgxs2IB4ubW7BjCgVOB7zMOczs9IofOD20YM02czNeiobBEeSEktU037mgiz61SrwXNKlovlgCCC2aGCY2p/GbJg4VMSBMnS3LZ6VF8UE6QMIHn5BsaRTvw+hBVA3JCockXv0G/enSzOdNvRc9qScIJFeUuIyUXd6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3zHecJ7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3zHecJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751476428; x=1783012428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7HWs8XHi/kGs2LpCRvceTCw9l6QALrai144dNl+rrzE=;
  b=M3zHecJ7tM3OOB927Fo1kBoUJGutaJK3upPM6VZKapiHMPA6amNROH2V
   VY1hojPY5Dsx6ors0vLpNuIZwJPeb85D2NRBWLEiQS2ouc7N1XBr3IQW0
   +PWGGx6JHJkZGq0qJFu4hmTdiabjaWOkIR3JzD87lEuz6FdTpWLfXXlmx
   V2+qj0jH0eap5wMpgZPNh0cY+NHFKZRzOZlq1QUjBSbaUYarqSUVFWNip
   7WL37O4HUwfNG0lduPI1Y35Fa1wW3civxrbZ8oWHLS/8+CfHj39yJX+A0
   kKTquSUivdEAJgmTCATz2CoYfNwnDhyvSaf8goMkV41fmbwHVrxgji055
   w==;
X-CSE-ConnectionGUID: +m8rM6aAQXS2J7//pJJ5bw==
X-CSE-MsgGUID: UHUkJPhuTkGpvAqzfomcgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="52904701"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="52904701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 10:13:46 -0700
X-CSE-ConnectionGUID: WMkEnWD+Rr65PuBaXoXbOA==
X-CSE-MsgGUID: Y1+SG6BMRC6QnOb9YyhcQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="185161743"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jul 2025 10:13:44 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX11h-0000uq-2Y;
	Wed, 02 Jul 2025 17:13:41 +0000
Date: Thu, 3 Jul 2025 01:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yishai Hadas <yishaih@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Edward Srouji <edwards@nvidia.com>,
	Moshe Shemesh <moshe@nvidia.com>
Subject: [leon-rdma:rdma-next 33/79]
 drivers/net/ethernet/mellanox/mlx5/core/lib/st.c:35:33: error: 'struct
 mlx5_priv' has no member named 'parent_mdev'
Message-ID: <202507030151.5w1XHRpX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   839c76b16028184c778569358fdf2ca05a742087
commit: 89cb32e3172f83069192502e5bc8247522ac9d0d [33/79] net/mlx5: Add support for device steering tag
config: i386-buildonly-randconfig-005-20250702 (https://download.01.org/0day-ci/archive/20250703/202507030151.5w1XHRpX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030151.5w1XHRpX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030151.5w1XHRpX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/lib/st.c: In function 'mlx5_st_create':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/st.c:35:33: error: 'struct mlx5_priv' has no member named 'parent_mdev'
      35 |                 return dev->priv.parent_mdev->st;
         |                                 ^


vim +35 drivers/net/ethernet/mellanox/mlx5/core/lib/st.c

    23	
    24	struct mlx5_st *mlx5_st_create(struct mlx5_core_dev *dev)
    25	{
    26		struct pci_dev *pdev = dev->pdev;
    27		struct mlx5_st *st;
    28		u16 num_entries;
    29		int ret;
    30	
    31		if (!MLX5_CAP_GEN(dev, mkey_pcie_tph))
    32			return NULL;
    33	
    34		if (mlx5_core_is_sf(dev))
  > 35			return dev->priv.parent_mdev->st;
    36	
    37		/* Checking whether the device is capable */
    38		if (!pdev->tph_cap)
    39			return NULL;
    40	
    41		num_entries = pcie_tph_get_st_table_size(pdev);
    42		/* We need a reserved entry for non TPH cases */
    43		if (num_entries < 2)
    44			return NULL;
    45	
    46		/* The OS doesn't support ST */
    47		ret = pcie_enable_tph(pdev, PCI_TPH_ST_DS_MODE);
    48		if (ret)
    49			return NULL;
    50	
    51		st = kzalloc(sizeof(*st), GFP_KERNEL);
    52		if (!st)
    53			goto end;
    54	
    55		mutex_init(&st->lock);
    56		xa_init_flags(&st->idx_xa, XA_FLAGS_ALLOC);
    57		/* entry 0 is reserved for non TPH cases */
    58		st->index_limit.min = MLX5_MKC_PCIE_TPH_NO_STEERING_TAG_INDEX + 1;
    59		st->index_limit.max = num_entries - 1;
    60	
    61		return st;
    62	
    63	end:
    64		pcie_disable_tph(dev->pdev);
    65		return NULL;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
