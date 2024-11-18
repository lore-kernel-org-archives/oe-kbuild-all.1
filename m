Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917391DFFB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731926481; cv=none; b=qqC9QfgG2mBBFhOD6+yFHzFhVjz7zEAWZW89EM1xg+jI5gmSsltC8GwVz/Liyy71H6Dk9l2ZdzBv43KlJjjoxFUyTRW/MMpNIqO1TabvjXE69Q2DZAUvkxpKVJ38UyjQRRndrLq+ZvCSFKkvCJ3+1qNI9K7qUSNTGM0NX6v3oVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731926481; c=relaxed/simple;
	bh=uXVWwlXBwSyCIQyl5Mpf6EjcAh8HEw1cMg57HBYh2mk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zjz2Y4cgKRCMkLBbq70EB1+YXjrWiNEyr5wyclQTiCHVmC0ERvU08MI2EpNgcS/cV5m7zfNO7j2Fz3KB2OViedTWTj+r2LEjpTkUCHmkvyEetJCW47Ne7nVXpHkJ+nW53Ibyf7hzlDDd6LQttsstZZGlhkjWJ6CkYl5EjIL/YRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFAVQ1dM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFAVQ1dM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731926480; x=1763462480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uXVWwlXBwSyCIQyl5Mpf6EjcAh8HEw1cMg57HBYh2mk=;
  b=CFAVQ1dMtYvPyxa1a5H0kwWYIWZezzIchbNJFWxhRcOJdsE3zyhNocEw
   A+5hIQ+a3whLDh4cG/u+5JPvZmrV6t3j8sBxI5N2xPoPru12RfpI0RkLv
   Gdb5SO0jxxeyaa5EitEso3E4sMaYvnCgqj2Fcemi0Sz3SiHaXf5S4Iya4
   0mrB99uA6sKEwhvPADlurLYSmEcV+gkWST3wuowTgLhA7IgOygEOEkmCn
   QzVNR5TLzbOZnfZKggQBr0thLVfkjdIMKmaQ5S/Mzl6hdUuT3dghNYvV/
   CZT1Rwwxg5bf5lPEoUIAQQtKcQY4dI3LCLO4FV3gtEmH+Dl/lXyNXIxrp
   A==;
X-CSE-ConnectionGUID: im2I/9k8RsCbk7Ud1Tf0Hw==
X-CSE-MsgGUID: w8oYWErCTAGyc5ylScwS0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="32028307"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="32028307"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 02:41:18 -0800
X-CSE-ConnectionGUID: xY83NsPYSky0KKyYQ4hBVg==
X-CSE-MsgGUID: 4C6TF2gJT7iSl+b/cfbo8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="88752875"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2024 02:41:17 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCzBy-0002O1-0r;
	Mon, 18 Nov 2024 10:41:14 +0000
Date: Mon, 18 Nov 2024 18:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rdma-next 80/81]
 drivers/infiniband/hw/mlx4/mlx4_ib.h:948:46: sparse: sparse: cast truncates
 bits from constant value (1fffff000 becomes fffff000)
Message-ID: <202411181852.09fun6Hi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   845d2ffec19e577cacf326ed496df4a7bb12642f
commit: 99af5949be7199ac79c2f922f02eb42c20080554 [80/81] RDMA/mlx4: Use ib_umem_find_best_pgsz() to calculate MTT size
config: arc-randconfig-r133-20241117 (https://download.01.org/0day-ci/archive/20241118/202411181852.09fun6Hi-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241118/202411181852.09fun6Hi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181852.09fun6Hi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/infiniband/hw/mlx4/cq.c: note: in included file:
>> drivers/infiniband/hw/mlx4/mlx4_ib.h:948:46: sparse: sparse: cast truncates bits from constant value (1fffff000 becomes fffff000)
   drivers/infiniband/hw/mlx4/cq.c: note: in included file (through arch/arc/include/asm/irqflags.h, include/linux/irqflags.h, include/linux/spinlock.h, ...):
   arch/arc/include/asm/irqflags-arcv2.h:80:31: sparse: sparse: undefined identifier '__builtin_arc_lr'
   arch/arc/include/asm/irqflags-arcv2.h:83:17: sparse: sparse: undefined identifier '__builtin_arc_sr'
--
   drivers/infiniband/hw/mlx4/mr.c: note: in included file:
>> drivers/infiniband/hw/mlx4/mlx4_ib.h:948:46: sparse: sparse: cast truncates bits from constant value (1fffff000 becomes fffff000)
--
   drivers/infiniband/hw/mlx4/qp.c: note: in included file:
>> drivers/infiniband/hw/mlx4/mlx4_ib.h:948:46: sparse: sparse: cast truncates bits from constant value (1fffff000 becomes fffff000)

vim +948 drivers/infiniband/hw/mlx4/mlx4_ib.h

   926	
   927	struct ib_wq *mlx4_ib_create_wq(struct ib_pd *pd,
   928					struct ib_wq_init_attr *init_attr,
   929					struct ib_udata *udata);
   930	int mlx4_ib_destroy_wq(struct ib_wq *wq, struct ib_udata *udata);
   931	int mlx4_ib_modify_wq(struct ib_wq *wq, struct ib_wq_attr *wq_attr,
   932			      u32 wq_attr_mask, struct ib_udata *udata);
   933	
   934	int mlx4_ib_create_rwq_ind_table(struct ib_rwq_ind_table *ib_rwq_ind_tbl,
   935					 struct ib_rwq_ind_table_init_attr *init_attr,
   936					 struct ib_udata *udata);
   937	static inline int
   938	mlx4_ib_destroy_rwq_ind_table(struct ib_rwq_ind_table *wq_ind_table)
   939	{
   940		return 0;
   941	}
   942	static inline int mlx4_ib_umem_calc_optimal_mtt_size(struct ib_umem *umem,
   943							     u64 start,
   944							     int *num_of_mtts)
   945	{
   946		unsigned long pg_sz;
   947	
 > 948		pg_sz = ib_umem_find_best_pgsz(umem, MLX4_PAGE_SIZE_SUPPORTED, start);
   949		if (!pg_sz)
   950			return -EOPNOTSUPP;
   951	
   952		*num_of_mtts = ib_umem_num_dma_blocks(umem, pg_sz);
   953		return order_base_2(pg_sz);
   954	}
   955	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
