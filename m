Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6ABFC18
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 18:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717005721; cv=none; b=oHfdNWVKHpo0o6eWg22lpdbvbGkKYdpSBYpkN5OLlG4vXZxBhxeIgHiBp4h4GQ/akXgB4IDAehTiEwdhvm8KHr3PhLXz+JomxjsJjpIYmaJ1ipE2lWx5PejGOrXpB6z62SwYFi8WTTkL6kjIFQGQmOv+HbrfxM4eFT7kWPeufGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717005721; c=relaxed/simple;
	bh=4LmQaOhnkam79ex9QLHh8QmhaLvzwmZREg16f9fJCkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dFP3WvgcN4M1dgybG1QH344MmsVrUwbTUTTKaD1EZp3hqPg4N+XIEtCB7tYxaQqs0YJDkZDoIJ6aKzkTfp/WAjj247wY4mHGIe0pLI/A9Rk2O3FVb0wW2HGjaxj4g+mj+9TkJ5rsRBPVGgWtLgwIiP86SXX7FlaNvlO0Dd7E9v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FG5xGz9I; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FG5xGz9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717005719; x=1748541719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4LmQaOhnkam79ex9QLHh8QmhaLvzwmZREg16f9fJCkk=;
  b=FG5xGz9IADEDGw5IxciIbFGq86lEUSyeFS/YpdEmQjKNddvL9X6jWOmz
   Q7osIccWatcyX1nAXaD/aj2pFk4JKgrwiPTf1/8hHr1EInvY8MUaIZDLh
   3ubNWycKHUjZKH3STtiCVN63ZSHkiQg65yOWkgEZdpcAS8gEkqg/6cCo9
   74eacScDFBD+vcE+Z7d8ZW2hczXA8+H9rciV4HOx3cH07lbIr6nSIhyJT
   urDwZMK05+bsB7gr5RpU3GNlyQ9O301pNdIp5XNPdokvcgbmjKIYQ/CW4
   uyDOYb5u4TaGJua0JQb+TJoKodWNUZNLnAvnb4orRx6x3YjjlUhiqP0Bn
   w==;
X-CSE-ConnectionGUID: /QAkbxm+QJSs9ouG9PoxeQ==
X-CSE-MsgGUID: VBO6pHYzQpabjJmtbL5Ryw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="16380568"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="16380568"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 11:01:59 -0700
X-CSE-ConnectionGUID: B+Ordm39RCOW2NNzrSI6iw==
X-CSE-MsgGUID: GpV6VQCIRUWOpG0W66umGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="66397283"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 May 2024 11:01:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCNcZ-000E2d-0n;
	Wed, 29 May 2024 18:01:55 +0000
Date: Thu, 30 May 2024 02:01:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jianbo Liu <jianbol@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: [leon-rdma:rdma-next 12/26]
 drivers/net/ethernet/mellanox/mlx5/core/wc.c:291 mlx5_wc_post_nop() warn:
 inconsistent indenting
Message-ID: <202405300117.cV41SFaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   8e0d724847bc01c35077eff9534ae7d5976e2547
commit: d25bf8f4935dbe8e15183d6359e2ded9077fd9a7 [12/26] net/mlx5: Reimplement write combining test
config: openrisc-randconfig-r081-20240529 (https://download.01.org/0day-ci/archive/20240530/202405300117.cV41SFaZ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300117.cV41SFaZ-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/wc.c:291 mlx5_wc_post_nop() warn: inconsistent indenting

vim +291 drivers/net/ethernet/mellanox/mlx5/core/wc.c

   257	
   258	static void mlx5_wc_post_nop(struct mlx5_wc_sq *sq, bool signaled)
   259	{
   260		int buf_size = (1 << MLX5_CAP_GEN(sq->cq.mdev, log_bf_reg_size)) / 2;
   261		struct mlx5_wqe_ctrl_seg *ctrl;
   262		__be32 mmio_wqe[16] = {};
   263		u16 pi;
   264	
   265		pi = mlx5_wq_cyc_ctr2ix(&sq->wq, sq->pc);
   266		ctrl = mlx5_wq_cyc_get_wqe(&sq->wq, pi);
   267		memset(ctrl, 0, sizeof(*ctrl));
   268		ctrl->opmod_idx_opcode =
   269			cpu_to_be32((sq->pc << MLX5_WQE_CTRL_WQE_INDEX_SHIFT) | MLX5_OPCODE_NOP);
   270		ctrl->qpn_ds =
   271			cpu_to_be32((sq->sqn << MLX5_WQE_CTRL_QPN_SHIFT) |
   272				    DIV_ROUND_UP(sizeof(struct mlx5_wqe_ctrl_seg), MLX5_SEND_WQE_DS));
   273		if (signaled)
   274			ctrl->fm_ce_se |= MLX5_WQE_CTRL_CQ_UPDATE;
   275	
   276		memcpy(mmio_wqe, ctrl, sizeof(*ctrl));
   277		((struct mlx5_wqe_ctrl_seg *)&mmio_wqe)->fm_ce_se |=
   278			MLX5_WQE_CTRL_CQ_UPDATE;
   279	
   280		/* ensure wqe is visible to device before updating doorbell record */
   281		dma_wmb();
   282	
   283		sq->pc++;
   284		sq->wq.db[MLX5_SND_DBR] = cpu_to_be32(sq->pc);
   285	
   286		/* ensure doorbell record is visible to device before ringing the
   287		 * doorbell
   288		 */
   289		wmb();
   290	
 > 291		 __iowrite64_copy(sq->bfreg.map + sq->bfreg.offset, mmio_wqe,
   292				  sizeof(mmio_wqe) / 8);
   293	
   294		sq->bfreg.offset ^= buf_size;
   295	}
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
