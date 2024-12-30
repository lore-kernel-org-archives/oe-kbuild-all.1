Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553C6198E91
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 13:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735565751; cv=none; b=DShIbynhXMmbgftfxQ0L+RCv+pnTwcsERl0025TcnbWbrVpsIFJd7W7K2ggU9+6avLvSbJ+HUfN808oYgM6hHyyS/hsmdNChIo4jRLZdbB1oZPIfTGmu4/Q2W2fcg1VrQmqqfDc6ush85JUUO6ffp9aNez13N2jHcy8TC+T6xSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735565751; c=relaxed/simple;
	bh=KQTsFNjfy+m7ag8f13carMGZ/IzIBNysy74WHF9c3Go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LDzjFUT+r9kb09GbSts+nf/XUNUGShon/bRE4KRsKSLsl9a08C97kqJ0zHhLCAbBiFmWjNDgkmI4obDCddSw75PZb60rL3Hbn26n25NPeylTZ6nc9oW/5bIJWv62GUaX4tfyGLPIkiu66qs+QLtzh4k2bMdJuIAZuLi03r/rygM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPU+MhNs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPU+MhNs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735565749; x=1767101749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KQTsFNjfy+m7ag8f13carMGZ/IzIBNysy74WHF9c3Go=;
  b=cPU+MhNsB9lfJar+x3tSu9u5PCiJI9ehXKHQA9IPqAQE4VfdUB0MJeJY
   GPkbrYdQpGEh3zudh2Wq97YwgoOQIJ/4nfrELUMuLRnIs5hiCatODZx52
   Ojl2BsSgV4t3C9cXJzC4/7cYEfV7ugEl7OoM5f+GIwrBJ+AaQ64F5B+Zf
   1cXXPI0BKk4JLuTKmKljeea0kNSUA5/j4Ga27Z1YI43IzYOgUG1XLULfV
   NwpYRx0ngjlNSVBt7bco2nY2KMBF6SLD/LweUDlAko6uyFNykNV1DKumL
   6HxO6C65IXt5cJ76gzAK9a1QEtY0DCEw2y779Pe7FwWyR1pRclMc5vwIX
   Q==;
X-CSE-ConnectionGUID: ZPTixwtZSUuoGNlQazx1SQ==
X-CSE-MsgGUID: N86k7XQ5SaKNW0Q8E82vOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="47272629"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="47272629"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 05:35:49 -0800
X-CSE-ConnectionGUID: mwKmRa7ZSWSyL7YJFRwxmw==
X-CSE-MsgGUID: ZvTU7pbWSiSp4SuR1J8CQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131745004"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Dec 2024 05:35:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSFvt-0005oa-1A;
	Mon, 30 Dec 2024 13:35:45 +0000
Date: Mon, 30 Dec 2024 21:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul Rameshbabu <rrameshbabu@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/lib/clock.c:397
 mlx5_ptp_freq_adj_real_time() warn: always true condition '(scaled_ppm <=
 (((~0) >> 1))) => (s32min-s32max <= s32max)'
Message-ID: <202412302112.rtTcbfVd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc033cf25e612e840e545f8d5ad2edd6ba613ed5
commit: 78c1b26754d9df062c3c8e08f5d6427967e3ba4b net/mlx5: Convert scaled ppm values outside the s32 range for PHC frequency adjustments
date:   1 year, 2 months ago
config: xtensa-randconfig-r073-20241229 (https://download.01.org/0day-ci/archive/20241230/202412302112.rtTcbfVd-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412302112.rtTcbfVd-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lib/clock.c:397 mlx5_ptp_freq_adj_real_time() warn: always true condition '(scaled_ppm <= (((~0) >> 1))) => (s32min-s32max <= s32max)'
drivers/net/ethernet/mellanox/mlx5/core/lib/clock.c:397 mlx5_ptp_freq_adj_real_time() warn: always true condition '(scaled_ppm >= ((-(((~0) >> 1)) - 1))) => (s32min-s32max >= s32min)'

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +397 drivers/net/ethernet/mellanox/mlx5/core/lib/clock.c

   389	
   390	static int mlx5_ptp_freq_adj_real_time(struct mlx5_core_dev *mdev, long scaled_ppm)
   391	{
   392		u32 in[MLX5_ST_SZ_DW(mtutc_reg)] = {};
   393	
   394		MLX5_SET(mtutc_reg, in, operation, MLX5_MTUTC_OPERATION_ADJUST_FREQ_UTC);
   395	
   396		if (MLX5_CAP_MCAM_FEATURE(mdev, mtutc_freq_adj_units) &&
 > 397		    scaled_ppm <= S32_MAX && scaled_ppm >= S32_MIN) {
   398			/* HW scaled_ppm support on mlx5 devices only supports a 32-bit value */
   399			MLX5_SET(mtutc_reg, in, freq_adj_units,
   400				 MLX5_MTUTC_FREQ_ADJ_UNITS_SCALED_PPM);
   401			MLX5_SET(mtutc_reg, in, freq_adjustment, (s32)scaled_ppm);
   402		} else {
   403			MLX5_SET(mtutc_reg, in, freq_adj_units, MLX5_MTUTC_FREQ_ADJ_UNITS_PPB);
   404			MLX5_SET(mtutc_reg, in, freq_adjustment, scaled_ppm_to_ppb(scaled_ppm));
   405		}
   406	
   407		return mlx5_set_mtutc(mdev, in, sizeof(in));
   408	}
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
