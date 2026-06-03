Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB7A3E3161
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 16:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780505692; cv=none; b=kIUuIrR+isHtS8FJ9sa/g7xBjYBV52wYHQDf5/3G9BMAftSRbtvN/71it5smPx6UNT2ehWvC54SFK4Ru8dtrWixT2LkhSShF5SmIHLsTmZ4Oh39SLM/8ei2AZ/B+QV/K9ojA5DnAU1cFzPE6QfilSYUGh02rgP8aIHZqNch2tKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780505692; c=relaxed/simple;
	bh=lSkbLnxyan/V/NE45gsukrl43r3UBFclA6+i09ipQQE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VMuWN8cyV+deysZhBAJETCyepIrzjc7aaJXcgkz9XUFfcpZw4MQVmQnlhmSgmro78tg+MxtOnkLz9Hj/SbQ+Gb2/tFi1+pC//YlxYrr5SnAXgSwLIjiZRj+5x861Ax61uyzdmGGFi8ijpgH70P9aKnDgCzZtg4nvwZ/OQijRv4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgAkkEyS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgAkkEyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780505692; x=1812041692;
  h=date:from:to:cc:subject:message-id;
  bh=lSkbLnxyan/V/NE45gsukrl43r3UBFclA6+i09ipQQE=;
  b=MgAkkEySSuets8IzjkEZYO7JJlqu/c6tNvlz6Oa/FHW7nK4PadKaXW1y
   q6F/z5jTTYE7s7b3mQWMOr4WL2TWVGLeAYPi1SufmHztrLTtB34dRjpLB
   CUWcb0H9EpuV0TowejlPceEzKaiT78TnClOHnhvfwZ2twqWh2r5CA51ar
   GWlZnfTupiwXr1LXwgEnLIsTrKeoRcMI15BQwTXRs9X43U5D1jxHnLBxL
   ReAbppMv449VJdVgKv8NtZv9k5MotGJjMWmp/CGwlfHc0NRB8Go/HFUEs
   GBFr3oYQij9Q5L0hs7vralXCND+6bThdGHX5QeEJoGrLpx7mBgaU3itY7
   A==;
X-CSE-ConnectionGUID: STCmj+yETiuvqe4ZCjoNiA==
X-CSE-MsgGUID: oYKe0Zl7Tpi3jaJp3kY+Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81505620"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="81505620"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 09:54:49 -0700
X-CSE-ConnectionGUID: K37zSL2kQ5mFOXe5ERpwXg==
X-CSE-MsgGUID: c36BIHz0RJaZ6jgmH1LPOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="237954354"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2026 09:54:46 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUorc-0000000027N-1FgM;
	Wed, 03 Jun 2026 16:54:44 +0000
Date: Wed, 03 Jun 2026 18:53:53 +0200
From: kernel test robot <lkp@intel.com>
To: Nikolay Aleksandrov <nikolay@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 David Ahern <dsahern@kernel.org>, Tariq Toukan <tariqt@nvidia.com>
Subject: 
 drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.c:877:31: error:
 initialization of 'int (*)(struct devlink *, u32,  union devlink_param_value
 *, struct netlink_ext_ack *)' {aka 'int (*)(struct devlink *, unsigned int, 
 union devlink_param_value *, st...
Message-ID: <202606031801.2KXNQX9V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tariq-Toukan/devlink-add-generic-device-max_sfs-parameter/20260603-183351
head:   3f9c478ff2a7ceca60d14dab453bbd80ba5347fd
commit: 3f9c478ff2a7ceca60d14dab453bbd80ba5347fd net/mlx5: implement max_sfs parameter
date:   6 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260603/202606031801.2KXNQX9V-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031801.2KXNQX9V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031801.2KXNQX9V-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mlx5/driver.h:58,
                    from drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.h:7,
                    from drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.c:4:
>> drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.c:877:31: error: initialization of 'int (*)(struct devlink *, u32,  union devlink_param_value *, struct netlink_ext_ack *)' {aka 'int (*)(struct devlink *, unsigned int,  union devlink_param_value *, struct netlink_ext_ack *)'} from incompatible pointer type 'int (*)(struct devlink *, u32,  union devlink_param_value,  struct netlink_ext_ack *)' {aka 'int (*)(struct devlink *, unsigned int,  union devlink_param_value,  struct netlink_ext_ack *)'} [-Wincompatible-pointer-types]
     877 |                               mlx5_devlink_max_sfs_validate),
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:635:21: note: in definition of macro 'DEVLINK_PARAM_GENERIC'
     635 |         .validate = _validate,                                          \
         |                     ^~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.c:877:31: note: (near initialization for 'mlx5_nv_param_devlink_params[2].validate')
     877 |                               mlx5_devlink_max_sfs_validate),
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:635:21: note: in definition of macro 'DEVLINK_PARAM_GENERIC'
     635 |         .validate = _validate,                                          \
         |                     ^~~~~~~~~


vim +877 drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.c

   865	
   866	static const struct devlink_param mlx5_nv_param_devlink_params[] = {
   867		DEVLINK_PARAM_GENERIC(ENABLE_SRIOV, BIT(DEVLINK_PARAM_CMODE_PERMANENT),
   868				      mlx5_devlink_enable_sriov_get,
   869				      mlx5_devlink_enable_sriov_set, NULL),
   870		DEVLINK_PARAM_GENERIC(TOTAL_VFS, BIT(DEVLINK_PARAM_CMODE_PERMANENT),
   871				      mlx5_devlink_total_vfs_get,
   872				      mlx5_devlink_total_vfs_set,
   873				      mlx5_devlink_total_vfs_validate),
   874		DEVLINK_PARAM_GENERIC(MAX_SFS, BIT(DEVLINK_PARAM_CMODE_PERMANENT),
   875				      mlx5_devlink_max_sfs_get,
   876				      mlx5_devlink_max_sfs_set,
 > 877				      mlx5_devlink_max_sfs_validate),
   878		DEVLINK_PARAM_DRIVER(MLX5_DEVLINK_PARAM_ID_CQE_COMPRESSION_TYPE,
   879				     "cqe_compress_type", DEVLINK_PARAM_TYPE_STRING,
   880				     BIT(DEVLINK_PARAM_CMODE_PERMANENT),
   881				     mlx5_nv_param_devlink_cqe_compress_get,
   882				     mlx5_nv_param_devlink_cqe_compress_set,
   883				     mlx5_nv_param_devlink_cqe_compress_validate),
   884		DEVLINK_PARAM_DRIVER_WITH_DEFAULTS(MLX5_DEVLINK_PARAM_ID_SWP_L4_CSUM_MODE,
   885						   "swp_l4_csum_mode", DEVLINK_PARAM_TYPE_STRING,
   886						   BIT(DEVLINK_PARAM_CMODE_PERMANENT),
   887						   mlx5_devlink_swp_l4_csum_mode_get,
   888						   mlx5_devlink_swp_l4_csum_mode_set,
   889						   mlx5_devlink_swp_l4_csum_mode_validate,
   890						   mlx5_devlink_swp_l4_csum_mode_get_default,
   891						   mlx5_devlink_swp_l4_csum_mode_set_default),
   892	};
   893	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
