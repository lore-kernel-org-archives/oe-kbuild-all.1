Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A78E277C9B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760773356; cv=none; b=Hym+3xRkMAm3vSz+fs8Ro99x+fCsQ+7WlXXG48QS0Eht5GO1Bj5CuPiy8c7PHMXtn/4Xwto1mhvEh6Q3mtHvSLpa3dkZ5VcDY0ZIbpNT5i5LpOMQU+Xv7AkSYmGnyHy5QSupTpw26ModufSVeJWsoAROfBF5h6LQMN3TSkCuUQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760773356; c=relaxed/simple;
	bh=xOpTd5jO+0NrF41257k6j4GF9gYFVtKH/e12dm4NH6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJu985brKXLln8eGKB2YyJrCMvCAFRDFNpSQBhO/0ITpc+0eY/AGbE6H0wCfcpXqX5+yqisfdF5sy5wstFI3cOB6RhnksXOI0APpJGF5/1OsqmdX8lq9p2uqyRQzA1Y8Jzc9ZUVJH4PJ61NoTZuR2nZ/Zu98o4sl+ZoPQph4jwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VO+qNQc9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VO+qNQc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760773354; x=1792309354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xOpTd5jO+0NrF41257k6j4GF9gYFVtKH/e12dm4NH6Y=;
  b=VO+qNQc9Ff9f5Xp97idHV3B9JvC6tC3kA+vD2eK8J5rg16irXzpSo5lz
   fPH9TgBQVwCGLmrPqerzDUFjbf2qKmJXDghKjd+5AGQgDd2Dt2EKkwu6S
   OQOX6ReIpqg7CYxGDHVn+aLttWVu3A+KCod0J7ugOF5XqEvHhzZO0kkSf
   gZxFFyjFtjkto5dijdcaucGsXM/S//uepPmOuXads7Mdsh8ESbOY4AgKV
   BP/hbBXFoCQWfMWgsoO9//NJpe8f2cZTwFNUaBrVmXSuqUfyAdLcm6uET
   vMlFpxfiY6Xa8RkS3QcBBeqWz/0uNi/+X+d7drGnnJUPKCEd0zXwpbooK
   w==;
X-CSE-ConnectionGUID: mpXp15dvQ8+KsOsUjGsOkg==
X-CSE-MsgGUID: 1FoHqTZKQY+FTYtE2S4IIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="66622719"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="66622719"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 00:42:34 -0700
X-CSE-ConnectionGUID: T+eAZmiBSBiHBRx2tLFw8g==
X-CSE-MsgGUID: kL5icr7USp+7ev58pbJpRA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Oct 2025 00:42:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA1Zw-000895-36;
	Sat, 18 Oct 2025 07:42:21 +0000
Date: Sat, 18 Oct 2025 15:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: Saeed Mahameed <saeed@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Gal Pressman <gal@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>, mbloch@nvidia.com,
	Adithya Jayachandran <ajayachandra@nvidia.com>
Subject: Re: [PATCH net-next 2/3] net/mlx5: MPFS, add support for dynamic
 enable/disable
Message-ID: <202510181424.S8zAzGjf-lkp@intel.com>
References: <20251016013618.2030940-3-saeed@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016013618.2030940-3-saeed@kernel.org>

Hi Saeed,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Saeed-Mahameed/devlink-Introduce-devlink-eswitch-state/20251016-094245
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251016013618.2030940-3-saeed%40kernel.org
patch subject: [PATCH net-next 2/3] net/mlx5: MPFS, add support for dynamic enable/disable
config: i386-buildonly-randconfig-001-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181424.S8zAzGjf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181424.S8zAzGjf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181424.S8zAzGjf-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/mellanox/mlx5/core/eq.o: in function `mlx5_mpfs_enable':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97: multiple definition of `mlx5_mpfs_enable'; drivers/net/ethernet/mellanox/mlx5/core/main.o:drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97: first defined here
   ld: drivers/net/ethernet/mellanox/mlx5/core/eq.o: in function `mlx5_mpfs_disable':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98: multiple definition of `mlx5_mpfs_disable'; drivers/net/ethernet/mellanox/mlx5/core/main.o:drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98: first defined here
   ld: drivers/net/ethernet/mellanox/mlx5/core/vport.o: in function `mlx5_mpfs_enable':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97: multiple definition of `mlx5_mpfs_enable'; drivers/net/ethernet/mellanox/mlx5/core/main.o:drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97: first defined here
   ld: drivers/net/ethernet/mellanox/mlx5/core/vport.o: in function `mlx5_mpfs_disable':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98: multiple definition of `mlx5_mpfs_disable'; drivers/net/ethernet/mellanox/mlx5/core/main.o:drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98: first defined here
   ld: drivers/net/ethernet/mellanox/mlx5/core/sriov.o: in function `mlx5_mpfs_enable':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97: multiple definition of `mlx5_mpfs_enable'; drivers/net/ethernet/mellanox/mlx5/core/main.o:drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97: first defined here
   ld: drivers/net/ethernet/mellanox/mlx5/core/sriov.o: in function `mlx5_mpfs_disable':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98: multiple definition of `mlx5_mpfs_disable'; drivers/net/ethernet/mellanox/mlx5/core/main.o:drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98: first defined here
   ld: drivers/net/ethernet/mellanox/mlx5/core/fs_cmd.o: in function `mlx5_mpfs_enable':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97: multiple definition of `mlx5_mpfs_enable'; drivers/net/ethernet/mellanox/mlx5/core/main.o:drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97: first defined here
   ld: drivers/net/ethernet/mellanox/mlx5/core/fs_cmd.o: in function `mlx5_mpfs_disable':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98: multiple definition of `mlx5_mpfs_disable'; drivers/net/ethernet/mellanox/mlx5/core/main.o:drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98: first defined here
   ld: drivers/net/ethernet/mellanox/mlx5/core/lag/lag.o: in function `mlx5_mpfs_enable':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97: multiple definition of `mlx5_mpfs_enable'; drivers/net/ethernet/mellanox/mlx5/core/main.o:drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97: first defined here
   ld: drivers/net/ethernet/mellanox/mlx5/core/lag/lag.o: in function `mlx5_mpfs_disable':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98: multiple definition of `mlx5_mpfs_disable'; drivers/net/ethernet/mellanox/mlx5/core/main.o:drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98: first defined here
   ld: drivers/net/ethernet/mellanox/mlx5/core/devlink.o: in function `mlx5_mpfs_enable':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97: multiple definition of `mlx5_mpfs_enable'; drivers/net/ethernet/mellanox/mlx5/core/main.o:drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97: first defined here
   ld: drivers/net/ethernet/mellanox/mlx5/core/devlink.o: in function `mlx5_mpfs_disable':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98: multiple definition of `mlx5_mpfs_disable'; drivers/net/ethernet/mellanox/mlx5/core/main.o:drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98: first defined here


vim +97 drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h

    87	
    88	#ifdef CONFIG_MLX5_MPFS
    89	struct mlx5_core_dev;
    90	int  mlx5_mpfs_init(struct mlx5_core_dev *dev);
    91	void mlx5_mpfs_cleanup(struct mlx5_core_dev *dev);
    92	int mlx5_mpfs_enable(struct mlx5_core_dev *dev);
    93	void mlx5_mpfs_disable(struct mlx5_core_dev *dev);
    94	#else /* #ifndef CONFIG_MLX5_MPFS */
    95	static inline int  mlx5_mpfs_init(struct mlx5_core_dev *dev) { return 0; }
    96	static inline void mlx5_mpfs_cleanup(struct mlx5_core_dev *dev) {}
  > 97	int mlx5_mpfs_enable(struct mlx5_core_dev *dev) { return 0; }
  > 98	void mlx5_mpfs_disable(struct mlx5_core_dev *dev) {}
    99	#endif
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
