Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D774D1DDF6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 21:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713993514; cv=none; b=ONu7yBCUkw1DXYrRhwVwTo3HDLt7O2+OYkLi5y256sh0X/4d5WiYHK1Es8vh4QRRqAo9tB+b8y0bIp/MPkzDSwO9LhGBkHIVDMQzDkgK8ulp47rofD1RbpEAC2rF48uABRP+XNavAGUSIS57xOwLsLRtbq4tIGoZ2hRJ2LLKL3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713993514; c=relaxed/simple;
	bh=l4JF2hbsdE3L9RIR8MJHprrBi12u+IQ7wjEKYTElP2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iymoxkzLFe9KDbBYZ1aPXhavu1jNJ+sW8oi+Us1XQJ6MBsLHb5bhTRRGw4KlTE+bDSFs7Qfo5mL2D6mnJkKQWC7k49/bSG1Faxk2wVCN3EjE+17+e6dB7FSQqwn77n6uTV/Lyar+lMOmQ8z2J/jRjsTCFGiuuRx8+7fQF3V4bEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzbKP32h; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzbKP32h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713993513; x=1745529513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l4JF2hbsdE3L9RIR8MJHprrBi12u+IQ7wjEKYTElP2s=;
  b=KzbKP32hvTaAs2QrgbPStr5d0Lh+j94C+zj+du8OI4/cs35tCd/GxCYV
   qd1yziDsGR3MYZjeCacExLqxojLUiPnTmghnzfi6roZx+qKFdg2w6vECb
   v0IZSgRnxyvJKdTrtBcAIbsG3zpe8q4XZbSxMTVj+u16ZdtKtE/RY5dHq
   x1RJv/QccaBiQXBDCber8074h/8It2n62f++DJ/WYj74/wPXttU5SWlFV
   pvI4g819NZn78kOX3Si2sE/QHzPs+66o30uYJ871KSABisUpxV4fA0wAL
   XqO6f6NkRo5jM9dMNXyOfpJogP+aJqXiLVFaaq0J861GKDedf6nQ0gsJA
   A==;
X-CSE-ConnectionGUID: CWvv2vE8SSGUUzPm2kYjEQ==
X-CSE-MsgGUID: 7E34d6xaTdSnaZZuy1jyzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13437513"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="13437513"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 14:18:32 -0700
X-CSE-ConnectionGUID: JBGvY6TkQQ6CdG6MN9e+TQ==
X-CSE-MsgGUID: 12nbHxnDQFmlqC0yRP1fnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="29484956"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2024 14:18:31 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzk0a-0001fd-1w;
	Wed, 24 Apr 2024 21:18:28 +0000
Date: Thu, 25 Apr 2024 05:17:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jianbo Liu <jianbol@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: [leon-rdma:rdma-next 9/14]
 drivers/net/ethernet/mellanox/mlx5/core/wc.c:409:36: error: 'struct
 mlx5_priv' has no member named 'parent_mdev'
Message-ID: <202404250542.eVL2AQq6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   b037a9b68f9d91e3dd0fc7dc7ad916ad5a6fa8b2
commit: 2aefb0d55636a2b5744a6588d9bebcf782d17b28 [9/14] net/mlx5: Reimplement write combining test
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240425/202404250542.eVL2AQq6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404250542.eVL2AQq6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404250542.eVL2AQq6-lkp@intel.com/

Note: the leon-rdma/rdma-next HEAD b037a9b68f9d91e3dd0fc7dc7ad916ad5a6fa8b2 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/wc.c: In function 'mlx5_wc_support_get':
>> drivers/net/ethernet/mellanox/mlx5/core/wc.c:409:36: error: 'struct mlx5_priv' has no member named 'parent_mdev'
     409 |                 parent = mdev->priv.parent_mdev;
         |                                    ^


vim +409 drivers/net/ethernet/mellanox/mlx5/core/wc.c

   382	
   383	bool mlx5_wc_support_get(struct mlx5_core_dev *mdev)
   384	{
   385		struct mlx5_core_dev *parent = NULL;
   386	
   387		if (!MLX5_CAP_GEN(mdev, bf)) {
   388			mlx5_core_dbg(mdev, "BlueFlame not supported\n");
   389			goto out;
   390		}
   391	
   392		if (!MLX5_CAP_GEN(mdev, log_max_sq)) {
   393			mlx5_core_dbg(mdev, "SQ not supported\n");
   394			goto out;
   395		}
   396	
   397		if (mdev->wc_state != MLX5_WC_STATE_UNINITIALIZED)
   398			/* No need to lock anything as we perform WC test only
   399			 * once for whole device and was already done.
   400			 */
   401			goto out;
   402	
   403		mutex_lock(&mdev->wc_state_lock);
   404	
   405		if (mdev->wc_state != MLX5_WC_STATE_UNINITIALIZED)
   406			goto unlock;
   407	
   408		if (mlx5_core_is_sf(mdev))
 > 409			parent = mdev->priv.parent_mdev;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
