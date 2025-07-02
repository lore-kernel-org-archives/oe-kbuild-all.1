Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933F830114C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 17:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751478293; cv=none; b=GXmJ40Rt92sUYlzMi1dbfd2zkS5bXZbgEuYtcSP2WqCio1QJyqZsIEigivCFvBA9fnQPsGofjCf/KYbxIzK9LxQSC2cILzNJvFulA1JzjS/kT8n+8qNEm1tFPdw9If6m2CPYMIKO/2WWKIPvQMszqfXQDGRdRiHOfzKFuDQe9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751478293; c=relaxed/simple;
	bh=0ZhdgY78cRhQSvD43h5U4APFoaK51yJEP/LUbEsICsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iU56Iawx42dWTFaXwivlLpopDaRMJknUx9NnwYlznXOYIipCxMMgEuEbmYSsbIB8E/mZdsccAFNP0Tl8c+cyl6EoYRUGfksJCpkwHzEw8CMVyXtPMECFuBgp4+omzJ1H3L15Ove2Jqe+QiKaw/9hDuM5nzJ12diK6pKZX4pZ1Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=icLmJDP6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="icLmJDP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751478290; x=1783014290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ZhdgY78cRhQSvD43h5U4APFoaK51yJEP/LUbEsICsE=;
  b=icLmJDP6x9dEkrDRTQBHcfnkXfplVUcSYW/FuybHLdyzkGxC7ZAStJjR
   EsSHmqTmOOiOVUsUeoD9UJm22ba0w+Wm7F7YvPWRkkx/63tXSFlZrzvx5
   mJk9LhemGnJTqJ9qLwv7CtMg1lrxeHpAHekkbxSs58od/ODM9C1ow/BWk
   nLNNFaxzw4AkXEzLcbGgM3guTK5vTF4M4Kz3urDHPqfJf6zpa7TjN9eUI
   T6CnQ0grQHvu0Eo2VNHSlTyTPqDV+o8pixhISQv9hJuV0jdnC3lpz5fWz
   hAztjGcl/0npwNMz3Qr6WK1IIUdkt3zTI1uKGsmsKwVc4EfJwFLuQjbia
   Q==;
X-CSE-ConnectionGUID: XlmwSRWKT1Gbt43G2jYBmQ==
X-CSE-MsgGUID: Y0koGjPpRuOP0FmmXCwupA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57463593"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="57463593"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 10:44:49 -0700
X-CSE-ConnectionGUID: BrlVGAmuSmakHLNuIuPGig==
X-CSE-MsgGUID: HP2nbA8pRS6zMsUiJ0pb4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="158184192"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Jul 2025 10:44:48 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX1Vl-0000wt-29;
	Wed, 02 Jul 2025 17:44:45 +0000
Date: Thu, 3 Jul 2025 01:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: Or Har-Toov <ohartoov@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Michael Guralnik <michaelgur@nvidia.com>
Subject: [leon-rdma:rdma-next 63/79] drivers/infiniband/hw/mlx5/odp.c:229:49:
 warning: right shift count >= width of type
Message-ID: <202507030104.ED15QqJz-lkp@intel.com>
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
commit: 0d4abea40f6ae0caaf000f03cc6f8415d9e3253f [63/79] IB/mlx5: Reduce IMR KSM size when 5-level paging is enabled
config: powerpc-randconfig-002-20250702 (https://download.01.org/0day-ci/archive/20250703/202507030104.ED15QqJz-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030104.ED15QqJz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030104.ED15QqJz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:392,
                    from include/linux/scatterlist.h:5,
                    from include/rdma/ib_umem.h:11,
                    from include/rdma/ib_umem_odp.h:9,
                    from drivers/infiniband/hw/mlx5/odp.c:33:
   drivers/infiniband/hw/mlx5/odp.c: In function 'populate_klm':
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/vdso/bits.h:8:45: note: in definition of macro 'BIT_ULL'
       8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
         |                                             ^~
   drivers/infiniband/hw/mlx5/odp.c:101:35: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:115:56: note: in expansion of macro 'MLX5_IMR_MTT_SIZE'
     115 |         int step = MLX5_CAP_ODP(dev, mem_page_fault) ? MLX5_IMR_MTT_SIZE : 0;
         |                                                        ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/vdso/bits.h:8:45: note: in definition of macro 'BIT_ULL'
       8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
         |                                             ^~
   drivers/infiniband/hw/mlx5/odp.c:101:35: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:120:59: note: in expansion of macro 'MLX5_IMR_MTT_SIZE'
     120 |                 MLX5_CAP_ODP(dev, mem_page_fault) ? idx * MLX5_IMR_MTT_SIZE : 0;
         |                                                           ^~~~~~~~~~~~~~~~~
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/powerpc/include/uapi/asm/byteorder.h:14,
                    from include/linux/bitfield.h:12,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:392,
                    from include/linux/scatterlist.h:5,
                    from include/rdma/ib_umem.h:11,
                    from include/rdma/ib_umem_odp.h:9,
                    from drivers/infiniband/hw/mlx5/odp.c:33:
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of macro '__cpu_to_be32'
      40 | #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
         |                                                   ^
   drivers/infiniband/hw/mlx5/odp.c:101:27: note: in expansion of macro 'BIT_ULL'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                           ^~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:101:35: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:124:52: note: in expansion of macro 'MLX5_IMR_MTT_SIZE'
     124 |                         pklm->bcount = cpu_to_be32(MLX5_IMR_MTT_SIZE);
         |                                                    ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of macro '__cpu_to_be32'
      40 | #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
         |                                                   ^
   drivers/infiniband/hw/mlx5/odp.c:101:27: note: in expansion of macro 'BIT_ULL'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                           ^~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:101:35: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:153:44: note: in expansion of macro 'MLX5_IMR_MTT_SIZE'
     153 |                 pklm->bcount = cpu_to_be32(MLX5_IMR_MTT_SIZE);
         |                                            ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/uapi/linux/byteorder/big_endian.h:38:51: note: in definition of macro '__cpu_to_be64'
      38 | #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
         |                                                   ^
   drivers/infiniband/hw/mlx5/odp.c:101:27: note: in expansion of macro 'BIT_ULL'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                           ^~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:101:35: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:156:54: note: in expansion of macro 'MLX5_IMR_MTT_SIZE'
     156 |                         pklm->va = cpu_to_be64(idx * MLX5_IMR_MTT_SIZE);
         |                                                      ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c: In function 'free_implicit_child_mr_work':
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   drivers/infiniband/hw/mlx5/odp.c:229:52: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     229 |                              ib_umem_start(odp) >> MLX5_IMR_MTT_SHIFT, 1, 0,
         |                                                    ^~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/mlx5/odp.c:229:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     229 |                              ib_umem_start(odp) >> MLX5_IMR_MTT_SHIFT, 1, 0,
         |                                                 ^
   drivers/infiniband/hw/mlx5/odp.c: In function 'destroy_unused_implicit_child_mr':
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   drivers/infiniband/hw/mlx5/odp.c:240:51: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     240 |         unsigned long idx = ib_umem_start(odp) >> MLX5_IMR_MTT_SHIFT;
         |                                                   ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:240:48: warning: right shift count >= width of type [-Wshift-count-overflow]
     240 |         unsigned long idx = ib_umem_start(odp) >> MLX5_IMR_MTT_SHIFT;
         |                                                ^
   In file included from include/linux/bits.h:6,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:392,
                    from include/linux/scatterlist.h:5,
                    from include/rdma/ib_umem.h:11,
                    from include/rdma/ib_umem_odp.h:9,
                    from drivers/infiniband/hw/mlx5/odp.c:33:
   drivers/infiniband/hw/mlx5/odp.c: In function 'implicit_get_child_mr':
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/vdso/bits.h:8:45: note: in definition of macro 'BIT_ULL'
       8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
         |                                             ^~
   drivers/infiniband/hw/mlx5/odp.c:101:35: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:479:45: note: in expansion of macro 'MLX5_IMR_MTT_SIZE'
     479 |                                       idx * MLX5_IMR_MTT_SIZE,
         |                                             ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/vdso/bits.h:8:45: note: in definition of macro 'BIT_ULL'
       8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
         |                                             ^~
   drivers/infiniband/hw/mlx5/odp.c:101:35: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:480:39: note: in expansion of macro 'MLX5_IMR_MTT_SIZE'
     480 |                                       MLX5_IMR_MTT_SIZE, &mlx5_mn_ops);
         |                                       ^~~~~~~~~~~~~~~~~
>> include/vdso/bits.h:8:41: warning: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '8589934592' to '0' [-Woverflow]
       8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
         |                                 ~~~~~~~~^~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:101:27: note: in expansion of macro 'BIT_ULL'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                           ^~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:480:39: note: in expansion of macro 'MLX5_IMR_MTT_SIZE'
     480 |                                       MLX5_IMR_MTT_SIZE, &mlx5_mn_ops);
         |                                       ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/vdso/bits.h:8:45: note: in definition of macro 'BIT_ULL'
       8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
         |                                             ^~
   drivers/infiniband/hw/mlx5/odp.c:102:28: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     102 | #define MLX5_IMR_MTT_BITS (MLX5_IMR_MTT_SHIFT - PAGE_SHIFT)
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:103:38: note: in expansion of macro 'MLX5_IMR_MTT_BITS'
     103 | #define MLX5_IMR_MTT_ENTRIES BIT_ULL(MLX5_IMR_MTT_BITS)
         |                                      ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:486:34: note: in expansion of macro 'MLX5_IMR_MTT_ENTRIES'
     486 |                                  MLX5_IMR_MTT_ENTRIES);
         |                                  ^~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/vdso/bits.h:8:45: note: in definition of macro 'BIT_ULL'
       8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
         |                                             ^~
   drivers/infiniband/hw/mlx5/odp.c:101:35: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:498:31: note: in expansion of macro 'MLX5_IMR_MTT_SIZE'
     498 |         mr->ibmr.iova = idx * MLX5_IMR_MTT_SIZE;
         |                               ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/vdso/bits.h:8:45: note: in definition of macro 'BIT_ULL'
       8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
         |                                             ^~
   drivers/infiniband/hw/mlx5/odp.c:102:28: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     102 | #define MLX5_IMR_MTT_BITS (MLX5_IMR_MTT_SHIFT - PAGE_SHIFT)
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:103:38: note: in expansion of macro 'MLX5_IMR_MTT_BITS'
     103 | #define MLX5_IMR_MTT_ENTRIES BIT_ULL(MLX5_IMR_MTT_BITS)
         |                                      ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:509:36: note: in expansion of macro 'MLX5_IMR_MTT_ENTRIES'
     509 |                                    MLX5_IMR_MTT_ENTRIES,
         |                                    ^~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c: In function 'mlx5_ib_alloc_implicit_mr':
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/vdso/bits.h:8:45: note: in definition of macro 'BIT_ULL'
       8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
         |                                             ^~
   drivers/infiniband/hw/mlx5/odp.c:102:28: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     102 | #define MLX5_IMR_MTT_BITS (MLX5_IMR_MTT_SHIFT - PAGE_SHIFT)
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:103:38: note: in expansion of macro 'MLX5_IMR_MTT_BITS'
     103 | #define MLX5_IMR_MTT_ENTRIES BIT_ULL(MLX5_IMR_MTT_BITS)
         |                                      ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:614:42: note: in expansion of macro 'MLX5_IMR_MTT_ENTRIES'
     614 |         if (!mlx5r_umr_can_load_pas(dev, MLX5_IMR_MTT_ENTRIES * PAGE_SIZE))
         |                                          ^~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/mlx5/odp.c:614:63: warning: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '8589934592' to '0' [-Woverflow]
     614 |         if (!mlx5r_umr_can_load_pas(dev, MLX5_IMR_MTT_ENTRIES * PAGE_SIZE))
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   drivers/infiniband/hw/mlx5/odp.c:106:29: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     106 | #define MLX5_KSM_PAGE_SHIFT MLX5_IMR_MTT_SHIFT
         |                             ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:650:36: note: in expansion of macro 'MLX5_KSM_PAGE_SHIFT'
     650 |                                    MLX5_KSM_PAGE_SHIFT,
         |                                    ^~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c: In function 'pagefault_implicit_mr':
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   drivers/infiniband/hw/mlx5/odp.c:753:57: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     753 |         unsigned long end_idx = (user_va + bcnt - 1) >> MLX5_IMR_MTT_SHIFT;
         |                                                         ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/rdma/ib_umem.h:10,
                    from include/rdma/ib_umem_odp.h:9,
                    from drivers/infiniband/hw/mlx5/odp.c:33:
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/infiniband/hw/mlx5/odp.c:101:27: note: in expansion of macro 'BIT_ULL'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                           ^~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:101:35: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:760:56: note: in expansion of macro 'MLX5_IMR_MTT_SIZE'
     760 |         if (unlikely(user_va >= mlx5_imr_ksm_entries * MLX5_IMR_MTT_SIZE ||
         |                                                        ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/infiniband/hw/mlx5/odp.c:101:27: note: in expansion of macro 'BIT_ULL'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                           ^~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:101:35: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     101 | #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:761:45: note: in expansion of macro 'MLX5_IMR_MTT_SIZE'
     761 |                      mlx5_imr_ksm_entries * MLX5_IMR_MTT_SIZE - user_va < bcnt))
         |                                             ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   drivers/infiniband/hw/mlx5/odp.c:766:48: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     766 |                 unsigned long idx = user_va >> MLX5_IMR_MTT_SHIFT;
         |                                                ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:6,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:392,
                    from include/linux/scatterlist.h:5,
                    from include/rdma/ib_umem.h:11,
                    from include/rdma/ib_umem_odp.h:9,
                    from drivers/infiniband/hw/mlx5/odp.c:33:
   drivers/infiniband/hw/mlx5/odp.c: In function 'mlx5_ib_odp_init':
   drivers/infiniband/hw/mlx5/odp.c:100:47: warning: left shift count >= width of type [-Wshift-count-overflow]
     100 | #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
         |                                               ^~
   include/vdso/bits.h:8:45: note: in definition of macro 'BIT_ULL'
       8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
         |                                             ^~
   drivers/infiniband/hw/mlx5/odp.c:102:28: note: in expansion of macro 'MLX5_IMR_MTT_SHIFT'
     102 | #define MLX5_IMR_MTT_BITS (MLX5_IMR_MTT_SHIFT - PAGE_SHIFT)
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:1911:40: note: in expansion of macro 'MLX5_IMR_MTT_BITS'
    1911 |                                        MLX5_IMR_MTT_BITS);
         |                                        ^~~~~~~~~~~~~~~~~


vim +229 drivers/infiniband/hw/mlx5/odp.c

b4cfe447d47b57 Haggai Eran      2014-12-11   99  
0d4abea40f6ae0 Or Har-Toov      2025-06-25 @100  #define MLX5_IMR_MTT_SHIFT ((TASK_SIZE > (1UL << 47)) ? 33 : 30)
81713d3788d2e6 Artemy Kovalyov  2017-01-18  101  #define MLX5_IMR_MTT_SIZE BIT_ULL(MLX5_IMR_MTT_SHIFT)
0d4abea40f6ae0 Or Har-Toov      2025-06-25 @102  #define MLX5_IMR_MTT_BITS (MLX5_IMR_MTT_SHIFT - PAGE_SHIFT)
0d4abea40f6ae0 Or Har-Toov      2025-06-25  103  #define MLX5_IMR_MTT_ENTRIES BIT_ULL(MLX5_IMR_MTT_BITS)
81713d3788d2e6 Artemy Kovalyov  2017-01-18  104  #define MLX5_IMR_MTT_MASK (~(MLX5_IMR_MTT_SIZE - 1))
81713d3788d2e6 Artemy Kovalyov  2017-01-18  105  
81713d3788d2e6 Artemy Kovalyov  2017-01-18  106  #define MLX5_KSM_PAGE_SHIFT MLX5_IMR_MTT_SHIFT
81713d3788d2e6 Artemy Kovalyov  2017-01-18  107  
81713d3788d2e6 Artemy Kovalyov  2017-01-18  108  static u64 mlx5_imr_ksm_entries;
81713d3788d2e6 Artemy Kovalyov  2017-01-18  109  
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  110  static void populate_klm(struct mlx5_klm *pklm, size_t idx, size_t nentries,
423f52d65005e8 Jason Gunthorpe  2019-10-09  111  			struct mlx5_ib_mr *imr, int flags)
81713d3788d2e6 Artemy Kovalyov  2017-01-18  112  {
6f2487bfafce5e Michael Guralnik 2024-09-09  113  	struct mlx5_core_dev *dev = mr_to_mdev(imr)->mdev;
423f52d65005e8 Jason Gunthorpe  2019-10-09  114  	struct mlx5_klm *end = pklm + nentries;
6f2487bfafce5e Michael Guralnik 2024-09-09  115  	int step = MLX5_CAP_ODP(dev, mem_page_fault) ? MLX5_IMR_MTT_SIZE : 0;
6f2487bfafce5e Michael Guralnik 2024-09-09  116  	__be32 key = MLX5_CAP_ODP(dev, mem_page_fault) ?
6f2487bfafce5e Michael Guralnik 2024-09-09  117  			     cpu_to_be32(imr->null_mmkey.key) :
6f2487bfafce5e Michael Guralnik 2024-09-09  118  			     mr_to_mdev(imr)->mkeys.null_mkey;
6f2487bfafce5e Michael Guralnik 2024-09-09  119  	u64 va =
6f2487bfafce5e Michael Guralnik 2024-09-09  120  		MLX5_CAP_ODP(dev, mem_page_fault) ? idx * MLX5_IMR_MTT_SIZE : 0;
81713d3788d2e6 Artemy Kovalyov  2017-01-18  121  
81713d3788d2e6 Artemy Kovalyov  2017-01-18  122  	if (flags & MLX5_IB_UPD_XLT_ZAP) {
6f2487bfafce5e Michael Guralnik 2024-09-09  123  		for (; pklm != end; pklm++, idx++, va += step) {
81713d3788d2e6 Artemy Kovalyov  2017-01-18  124  			pklm->bcount = cpu_to_be32(MLX5_IMR_MTT_SIZE);
6f2487bfafce5e Michael Guralnik 2024-09-09  125  			pklm->key = key;
6f2487bfafce5e Michael Guralnik 2024-09-09  126  			pklm->va = cpu_to_be64(va);
81713d3788d2e6 Artemy Kovalyov  2017-01-18  127  		}
81713d3788d2e6 Artemy Kovalyov  2017-01-18  128  		return;
81713d3788d2e6 Artemy Kovalyov  2017-01-18  129  	}
81713d3788d2e6 Artemy Kovalyov  2017-01-18  130  
f28b1932eaae18 Jason Gunthorpe  2019-10-01  131  	/*
423f52d65005e8 Jason Gunthorpe  2019-10-09  132  	 * The locking here is pretty subtle. Ideally the implicit_children
423f52d65005e8 Jason Gunthorpe  2019-10-09  133  	 * xarray would be protected by the umem_mutex, however that is not
f28b1932eaae18 Jason Gunthorpe  2019-10-01  134  	 * possible. Instead this uses a weaker update-then-lock pattern:
f28b1932eaae18 Jason Gunthorpe  2019-10-01  135  	 *
423f52d65005e8 Jason Gunthorpe  2019-10-09  136  	 *    xa_store()
f28b1932eaae18 Jason Gunthorpe  2019-10-01  137  	 *    mutex_lock(umem_mutex)
636bdbfc999656 Aharon Landau    2022-04-12  138  	 *     mlx5r_umr_update_xlt()
f28b1932eaae18 Jason Gunthorpe  2019-10-01  139  	 *    mutex_unlock(umem_mutex)
f28b1932eaae18 Jason Gunthorpe  2019-10-01  140  	 *    destroy lkey
f28b1932eaae18 Jason Gunthorpe  2019-10-01  141  	 *
423f52d65005e8 Jason Gunthorpe  2019-10-09  142  	 * ie any change the xarray must be followed by the locked update_xlt
423f52d65005e8 Jason Gunthorpe  2019-10-09  143  	 * before destroying.
f28b1932eaae18 Jason Gunthorpe  2019-10-01  144  	 *
f28b1932eaae18 Jason Gunthorpe  2019-10-01  145  	 * The umem_mutex provides the acquire/release semantic needed to make
db72438c9319cf Yishai Hadas     2021-02-02  146  	 * the xa_store() visible to a racing thread.
f28b1932eaae18 Jason Gunthorpe  2019-10-01  147  	 */
423f52d65005e8 Jason Gunthorpe  2019-10-09  148  	lockdep_assert_held(&to_ib_umem_odp(imr->umem)->umem_mutex);
f28b1932eaae18 Jason Gunthorpe  2019-10-01  149  
6f2487bfafce5e Michael Guralnik 2024-09-09  150  	for (; pklm != end; pklm++, idx++, va += step) {
423f52d65005e8 Jason Gunthorpe  2019-10-09  151  		struct mlx5_ib_mr *mtt = xa_load(&imr->implicit_children, idx);
81713d3788d2e6 Artemy Kovalyov  2017-01-18  152  
81713d3788d2e6 Artemy Kovalyov  2017-01-18  153  		pklm->bcount = cpu_to_be32(MLX5_IMR_MTT_SIZE);
423f52d65005e8 Jason Gunthorpe  2019-10-09  154  		if (mtt) {
81713d3788d2e6 Artemy Kovalyov  2017-01-18  155  			pklm->key = cpu_to_be32(mtt->ibmr.lkey);
423f52d65005e8 Jason Gunthorpe  2019-10-09  156  			pklm->va = cpu_to_be64(idx * MLX5_IMR_MTT_SIZE);
81713d3788d2e6 Artemy Kovalyov  2017-01-18  157  		} else {
6f2487bfafce5e Michael Guralnik 2024-09-09  158  			pklm->key = key;
6f2487bfafce5e Michael Guralnik 2024-09-09  159  			pklm->va = cpu_to_be64(va);
81713d3788d2e6 Artemy Kovalyov  2017-01-18  160  		}
81713d3788d2e6 Artemy Kovalyov  2017-01-18  161  	}
81713d3788d2e6 Artemy Kovalyov  2017-01-18  162  }
81713d3788d2e6 Artemy Kovalyov  2017-01-18  163  
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  164  static int populate_mtt(__be64 *pas, size_t start, size_t nentries,
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  165  			struct mlx5_ib_mr *mr, int flags)
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  166  {
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  167  	struct ib_umem_odp *odp = to_ib_umem_odp(mr->umem);
eedd5b1276e76d Leon Romanovsky  2025-04-28  168  	bool downgrade = flags & MLX5_IB_UPD_XLT_DOWNGRADE;
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  169  	struct pci_p2pdma_map_state p2pdma_state = {};
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  170  	struct ib_device *dev = odp->umem.ibdev;
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  171  	size_t i;
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  172  
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  173  	if (flags & MLX5_IB_UPD_XLT_ZAP)
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  174  		return 0;
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  175  
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  176  	for (i = 0; i < nentries; i++) {
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  177  		unsigned long pfn = odp->map.pfn_list[start + i];
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  178  		dma_addr_t dma_addr;
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  179  
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  180  		pfn = odp->map.pfn_list[start + i];
eedd5b1276e76d Leon Romanovsky  2025-04-28  181  		if (!(pfn & HMM_PFN_VALID))
eedd5b1276e76d Leon Romanovsky  2025-04-28  182  			/* ODP initialization */
eedd5b1276e76d Leon Romanovsky  2025-04-28  183  			continue;
eedd5b1276e76d Leon Romanovsky  2025-04-28  184  
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  185  		dma_addr = hmm_dma_map_pfn(dev->dma_device, &odp->map,
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  186  					   start + i, &p2pdma_state);
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  187  		if (ib_dma_mapping_error(dev, dma_addr))
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  188  			return -EFAULT;
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  189  
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  190  		dma_addr |= MLX5_IB_MTT_READ;
eedd5b1276e76d Leon Romanovsky  2025-04-28  191  		if ((pfn & HMM_PFN_WRITE) && !downgrade)
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  192  			dma_addr |= MLX5_IB_MTT_WRITE;
eedd5b1276e76d Leon Romanovsky  2025-04-28  193  
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  194  		pas[i] = cpu_to_be64(dma_addr);
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  195  		odp->npages++;
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  196  	}
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  197  	return 0;
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  198  }
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  199  
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  200  int mlx5_odp_populate_xlt(void *xlt, size_t idx, size_t nentries,
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  201  			  struct mlx5_ib_mr *mr, int flags)
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  202  {
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  203  	if (flags & MLX5_IB_UPD_XLT_INDIRECT) {
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  204  		populate_klm(xlt, idx, nentries, mr, flags);
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  205  		return 0;
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  206  	} else {
1efe8c0670d6a6 Leon Romanovsky  2025-04-28  207  		return populate_mtt(xlt, idx, nentries, mr, flags);
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  208  	}
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  209  }
cbe4b8f0a5766a Artemy Kovalyov  2019-12-22  210  
5256edcb98a14b Jason Gunthorpe  2019-10-09  211  /*
db72438c9319cf Yishai Hadas     2021-02-02  212   * This must be called after the mr has been removed from implicit_children.
db72438c9319cf Yishai Hadas     2021-02-02  213   * NOTE: The MR does not necessarily have to be
d561987f34f263 Jason Gunthorpe  2019-10-09  214   * empty here, parallel page faults could have raced with the free process and
d561987f34f263 Jason Gunthorpe  2019-10-09  215   * added pages to it.
5256edcb98a14b Jason Gunthorpe  2019-10-09  216   */
e6fb246ccafbdf Jason Gunthorpe  2021-03-04  217  static void free_implicit_child_mr_work(struct work_struct *work)
81713d3788d2e6 Artemy Kovalyov  2017-01-18  218  {
e6fb246ccafbdf Jason Gunthorpe  2021-03-04  219  	struct mlx5_ib_mr *mr =
e6fb246ccafbdf Jason Gunthorpe  2021-03-04  220  		container_of(work, struct mlx5_ib_mr, odp_destroy.work);
5256edcb98a14b Jason Gunthorpe  2019-10-09  221  	struct mlx5_ib_mr *imr = mr->parent;
f28b1932eaae18 Jason Gunthorpe  2019-10-01  222  	struct ib_umem_odp *odp_imr = to_ib_umem_odp(imr->umem);
5256edcb98a14b Jason Gunthorpe  2019-10-09  223  	struct ib_umem_odp *odp = to_ib_umem_odp(mr->umem);
81713d3788d2e6 Artemy Kovalyov  2017-01-18  224  
db72438c9319cf Yishai Hadas     2021-02-02  225  	mlx5r_deref_wait_odp_mkey(&mr->mmkey);
81713d3788d2e6 Artemy Kovalyov  2017-01-18  226  
f28b1932eaae18 Jason Gunthorpe  2019-10-01  227  	mutex_lock(&odp_imr->umem_mutex);
636bdbfc999656 Aharon Landau    2022-04-12  228  	mlx5r_umr_update_xlt(mr->parent,
636bdbfc999656 Aharon Landau    2022-04-12 @229  			     ib_umem_start(odp) >> MLX5_IMR_MTT_SHIFT, 1, 0,
e6fb246ccafbdf Jason Gunthorpe  2021-03-04  230  			     MLX5_IB_UPD_XLT_INDIRECT | MLX5_IB_UPD_XLT_ATOMIC);
f28b1932eaae18 Jason Gunthorpe  2019-10-01  231  	mutex_unlock(&odp_imr->umem_mutex);
e6fb246ccafbdf Jason Gunthorpe  2021-03-04  232  	mlx5_ib_dereg_mr(&mr->ibmr, NULL);
5256edcb98a14b Jason Gunthorpe  2019-10-09  233  
db72438c9319cf Yishai Hadas     2021-02-02  234  	mlx5r_deref_odp_mkey(&imr->mmkey);
5256edcb98a14b Jason Gunthorpe  2019-10-09  235  }
5256edcb98a14b Jason Gunthorpe  2019-10-09  236  

:::::: The code at line 229 was first introduced by commit
:::::: 636bdbfc9996567af1a3ed89ecf92ea5028a8a89 RDMA/mlx5: Use mlx5_umr_post_send_wait() to update xlt

:::::: TO: Aharon Landau <aharonl@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
