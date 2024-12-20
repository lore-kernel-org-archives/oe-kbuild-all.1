Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A9C1A4E98
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 23:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734737672; cv=none; b=NxLqAPGFz30kGX/ZXXOq4tUcBhitXusRhlkOkv6vujViafxu+cjPIeh2l7BYP/UULGAPJWSMfA79OeMtKben580yx5rnpZpayfOHeCtCBmZhwTl0/gRdVCpklZGH3OjV89VMm34TRfC5wA7EBag7qrlGfXiHWC6H/shEDmmV9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734737672; c=relaxed/simple;
	bh=MUw9aMIwKnsNBfMjgPd5rkr1E1lO7tcd6RXavMjRHKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U0d+jLexU/kskyuphAqMmpRsuSEKL/xuD4rhz3pt8iblfPMDIuLtguJcDieK2Tsd1SBdXA3KZCd16bmHYSoKCnerYXjR11KVBkQU2APqtLozZ9r+uUd/wroUBMmnqwTKmQopmPaQJ7neldOwYxsqVmBKWHxpddps0CQjsqO2nBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d67PRMep; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d67PRMep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734737669; x=1766273669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MUw9aMIwKnsNBfMjgPd5rkr1E1lO7tcd6RXavMjRHKo=;
  b=d67PRMepfeORVUQP7hlJ/mRSYdT1ju+6w/iH0wx0aQk008BBA4yeaSwB
   vWyw5+q+AwE5H64eUEUanLNoCMxxfpn5KQRUkkoiNXwi5HhWjf/lm6pvD
   wgFpkK7Y55G1KpneIByD+4H3SngldL4WsfNLZK7fxUdw+YnqRZqaBGKrM
   lGQ4XzJDsQyxOq6CZQDc0RS55QtjkOGIOqkaXlQxhlomGCaD5R7POGpKO
   gK+1S23xyLxy0rtwP6jIf9OYmf7k7y67lgk6gpSXEK2fGVxWLft2K0WTt
   07QWLbJjiRcvTutJ8bRljta9vp2ynB0d8Cd5GO4EKI8U3Nx+9b5of1ToG
   A==;
X-CSE-ConnectionGUID: BUaqaL0ASOG4ur3N/lCAkQ==
X-CSE-MsgGUID: p14KfnqmS1mx+iYykku6tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35188146"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="35188146"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 15:34:29 -0800
X-CSE-ConnectionGUID: QsnyzG2GSSaC7eftSjUFwQ==
X-CSE-MsgGUID: gN8Uj3UBQHK3eY+yQex14g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="103615674"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Dec 2024 15:34:28 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOmVm-0001mb-0c;
	Fri, 20 Dec 2024 23:34:26 +0000
Date: Sat, 21 Dec 2024 07:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:ipsec-fixes 3/5]
 drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c:1159:28: sparse:
 sparse: restricted __be32 degrades to integer
Message-ID: <202412210712.AjjHsPqh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git ipsec-fixes
head:   2e0a097364fd4e347462026e7cb79f07fc3c77bc
commit: 995b3d5f04ba947ebb9fbab377f937ae9036efea [3/5] net/mlx5e: Properly match IPsec subnet addresses
config: x86_64-randconfig-r121-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210712.AjjHsPqh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210712.AjjHsPqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210712.AjjHsPqh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c:1159:28: sparse: sparse: restricted __be32 degrades to integer
>> drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c:1159:23: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c:1159:23: sparse:    left side has type restricted __be32
   drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c:1159:23: sparse:    right side has type int

vim +1159 drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c

  1152	
  1153	static void addr4_to_mask(__be32 *addr, __be32 *mask)
  1154	{
  1155		int i;
  1156	
  1157		*mask = 0;
  1158		for (i = 0; i < 4; i++)
> 1159			*mask |= ((*addr >> 8 * i) & 0xFF) ? (0xFF << 8 * i) : 0;
  1160	}
  1161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
