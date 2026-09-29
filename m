Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28391515971
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 10:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678550; cv=none; b=p80kkSoYVM7iY30Xbv6U1/ppRbmGRRBlz6tQw1Q3qlwOb1tM3gopOvFDV2xPoxGYI5chB6RaHDjmgrRJ+zDWuRiZzgKT09nPojJPm+ea1cPYlbtZpyNZ0Q5KKf+ToAsHVhH07VT4YLE8m2PuWvZ/FVbdHt6OtbFyhIxLpDVqz7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678550; c=relaxed/simple;
	bh=L9xgEf9kpocAuJ1Xo7ed85oZ0sHTlcf+737bsUQQGRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EJl9WGOS/BguPbD7+lpWyq7mdN+HsYuFGh5ssKhSp5UBwHbra/NUwvLFswhtRkor2aeaK77vQc0aFUaOVrY7fK7hZxlPi6Ap3ustS2T7KispDXqjYZuATV+RJxIyDDyp8yVsj1EhtxKpJXtvsBjWxUO7iokduKeKq+LzF2vXJgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6+cwjRB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6+cwjRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790678544; x=1822214544;
  h=date:from:to:cc:subject:message-id;
  bh=L9xgEf9kpocAuJ1Xo7ed85oZ0sHTlcf+737bsUQQGRY=;
  b=Y6+cwjRBagz/uScuynuMwR4Hy7cgDdlmA7N1YleUcmaMd2rET+S3xxiY
   OZ+HeAQX+m3HCrkxYqm+aNVZJzAqt1KN+TgAf5W2NKhGXwCoX8OPUrBBh
   2PAPv0vA7Ts4vbNpb8aBHcqrxJLKYEgdTOj+anf2mJgc4B4/3xXFf2wQs
   BIXC0MuedGjizGayZ/nWGXp0zgFOSPyKhq1v/msttunKMrAMQK0xCge0B
   zYHediB698/y3IjoN+H5R5EF3GNt5pw5RgRQa9j+Kt16VGxwwkHkUNJaX
   fApAA1IbxFKjHIzJX1wYo6EI8qOswf2KALtJFfD1J6kPhRz3X9TJRAFA3
   g==;
X-CSE-ConnectionGUID: bfvHG1ldR6awjvXL28+FxQ==
X-CSE-MsgGUID: 8rgY/wBVTha5pvjbJqkAZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="116924640"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="116924640"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:42:19 -0700
X-CSE-ConnectionGUID: rg8wyUajQd6xAP/Hvu7OsA==
X-CSE-MsgGUID: ATXOES/0R/S8Gcf4ZOBz+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="283429168"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Sep 2026 03:42:17 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBVHr-00000000PDX-0hk6;
	Tue, 29 Sep 2026 10:42:15 +0000
Date: Tue, 29 Sep 2026 18:41:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] ld.lld: error: undefined
 symbol: iommu_free_pages
Message-ID: <202609291846.nrqU2oiB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   4f02a973d94c2e1b76391568aaf9d316067b9322
commit: 6ace5be5937cc205a98e4738d000581686a7c3d9 [1/1] ANDROID: KVM: arm64: iommu: Implement IOMMU subsystem accounting
config: arm64-randconfig-1003-20260929 (https://download.01.org/0day-ci/archive/20260929/202609291846.nrqU2oiB-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609291846.nrqU2oiB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609291846.nrqU2oiB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: iommu_free_pages
   >>> referenced by iommu.c
   >>>               arch/arm64/kvm/iommu.o:(__pkvm_free_iommu_hyp_memcache) in archive vmlinux.a
   >>> referenced by iommu.c
   >>>               arch/arm64/kvm/iommu.o:(__free_hyp_memcache) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: iommu_alloc_pages_node_sz
   >>> referenced by iommu.c
   >>>               arch/arm64/kvm/iommu.o:(__pkvm_topup_hyp_iommu) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
