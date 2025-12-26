Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFF9201278
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 11:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766746810; cv=none; b=Vu0eBtdYRKE3oUgq7xFBpkguACmUVeVSO9yPMCsCLi4CJ/1VFku7z0NMTYsbWt+odWUsYJMdCFJ2RelkibnK2mIh6XC28QtzdYXO08yq/idyCS6D0kUyGLqGyDbSK63pm1ZYYxg5b7uCkN+GiglKLuaHbw1yCueg7wMhzIvjRs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766746810; c=relaxed/simple;
	bh=+w0DPZc0QPJ16eTZM3DLXVyGuFRlHLVjedUWN+5764o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pwyH0g/37S/W3gvNE4ym8rzum7NM81HcNjwSCNlwZhkafbR0V/w/tpQvHE0wIJWz2FuloEyi5yTS5LrBbyMGThZMnqsod3TevUAm+m4yaslncYhJ1NifPF8WXPW08KB++uN5/dSUYZY6fbjJOx3HsU3JlRzQUQQ2RC+NOn92+g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGdrQeiX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGdrQeiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766746808; x=1798282808;
  h=date:from:to:cc:subject:message-id;
  bh=+w0DPZc0QPJ16eTZM3DLXVyGuFRlHLVjedUWN+5764o=;
  b=FGdrQeiX1dbimn7x7/NB/zaPBGUuQcLr5ZiUEMOJ5r9M0nX8Yz3uvsgI
   a2JOp8f16ZHuA6WvqiJqsRs1q33E2wwDQM01QuB1J0IXPv/po6S8XStqW
   eLGV7F6h4r1wZvsrPTuPA4g6KgilQdbOyJ876piBHKs93Abh3OHpUG5v3
   R8qXdjQpnptcDWTJWTcE29KdcwTU8QI68jftQDBCcilcB59Gz23lVfc9M
   v6PWMKDUSzTcRLQX6ohPTJElMM6OrDerUK23Fgp4XkGMqHdW6lsESZMhh
   RR0BwS1Vu81c0rk6lkEGueurI01RcuR1rdUOKyU1JK/te8M1FTh9wu+ok
   Q==;
X-CSE-ConnectionGUID: ru2RA+w0TJSwgD+DxAf/Ww==
X-CSE-MsgGUID: SXSA+pV9R+G8BMnHwCHrGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68542428"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="68542428"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 03:00:07 -0800
X-CSE-ConnectionGUID: PlZABb2TT6GzF5iy5WcZUg==
X-CSE-MsgGUID: ugZQWKAWSX6tdPIaIsO+Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="205288397"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Dec 2025 03:00:05 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ5Y5-000000004yf-2dho;
	Fri, 26 Dec 2025 10:59:58 +0000
Date: Fri, 26 Dec 2025 18:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jianbo Liu <jianbol@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Leon Romanovsky <leonro@nvidia.com>,
 Tariq Toukan <tariqt@nvidia.com>
Subject: ipsec.c:undefined reference to `ip6_dst_lookup'
Message-ID: <202512261850.P5Jp5BSz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
commit: e35d7da8dd9e55b37c3e8ab548f6793af0c2ab49 net/mlx5e: Use ip6_dst_lookup instead of ipv6_dst_lookup_flow for MAC init
date:   8 days ago
config: um-randconfig-r061-20251226 (https://download.01.org/0day-ci/archive/20251226/202512261850.P5Jp5BSz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261850.P5Jp5BSz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512261850.P5Jp5BSz-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.o: in function `mlx5e_ipsec_build_accel_xfrm_attrs':
>> ipsec.c:(.ltext+0x619): undefined reference to `ip6_dst_lookup'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
