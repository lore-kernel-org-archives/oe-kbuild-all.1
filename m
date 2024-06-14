Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86964DF55
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 14:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718374627; cv=none; b=K+waIWoVqthqFtbOEyOARQmc8yUkgGX4h+YYakv2E/qiJRHO77YsqJE1hMbSi8/4TyZqENvaZmkkK4EMNcyvHzdfDAv+/wNftCP21JUGYbgJiuJEZv33q3Lo9Q4oJZdcVUw1UC2zHDGjNd2M+sP2Wownw4uVKLS3KM+R/Z24dEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718374627; c=relaxed/simple;
	bh=7C4p8FGLe3DMIEXVNmrtK7ANiGcgd7RESVzWlfRkqTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SIPTtXUjk5z101Doga0Ob0TetxiYp9LphuDV4zYLJfS/5sLV8JLa3HbvRwVL+h/MXPCqMZFCoe+ZLlVr0+p3NCKwr6HZX+UfaCUQYPBYogJHz54nao/A+DAt1l9haXNoz0+z9CdGRtdgihMkq7sgOztXos9S1wRdA3q/basZfOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqQyFbhM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqQyFbhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718374625; x=1749910625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7C4p8FGLe3DMIEXVNmrtK7ANiGcgd7RESVzWlfRkqTw=;
  b=aqQyFbhM+CybgQrHkC9YRQOU2KcUrWvhn60ngMC8dWHEUmvwAqShujYB
   uZkl9VQWGTG7TohPEr/LN3ZxcRQZ9CCoD/EGm29bU2CzIyVLw4ejl3ZV/
   gmfvq9p4lzoKNKelFVnZvgkwMFkXvbEFzBYM4TzAyOp3YUi1PlDjVGuEL
   ZSBmaUnavMn301EYOhiDo2kCc5RZn3JpgQ8Dof0RLAg/zu3hJBAqNGIla
   2hhaNVCdJCSdIKJd8fLEF2xSizU3rjgw3GjUXx2PWekLMExPv/t//H7z6
   ZIDs9VV0dhvr1ruNuPaonJaDYqepN4Ur6aZk+igFL7yoOGK/cxOWAGbCN
   Q==;
X-CSE-ConnectionGUID: IBa08gIwSxyHlmWzLa/5Ag==
X-CSE-MsgGUID: Ibnql/mjRLSP5pu9V4pM+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15042498"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15042498"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 07:17:04 -0700
X-CSE-ConnectionGUID: fUR8TCJcTTK/JF89Sub0MQ==
X-CSE-MsgGUID: uWXwjBnTTjiktHRssryCKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="45467940"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Jun 2024 07:17:04 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI7jh-0001Nj-1Z;
	Fri, 14 Jun 2024 14:17:01 +0000
Date: Fri, 14 Jun 2024 22:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip 20/31] ld.lld: error: undefined symbol:
 free_io_pgtable_ops
Message-ID: <202406142235.Dr18YGIQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   24b63cdc814fc36a04b7745265fdb4b3ca89c762
commit: 852f7b6a0848450c6f403a87f8d0e4cce158d307 [20/31] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
config: riscv-randconfig-002-20240614 (https://download.01.org/0day-ci/archive/20240614/202406142235.Dr18YGIQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406142235.Dr18YGIQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406142235.Dr18YGIQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: free_io_pgtable_ops
   >>> referenced by ipmmu-vmsa.c:1022 (drivers/iommu/ipmmu-vmsa.c:1022)
   >>>               drivers/iommu/ipmmu-vmsa.o:(ipmmu_domain_free) in archive vmlinux.a
   >>> referenced by io-pgtable-arm.c:1296 (drivers/iommu/io-pgtable-arm.c:1296)
   >>>               drivers/iommu/io-pgtable-arm.o:(arm_lpae_run_tests) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: alloc_io_pgtable_ops
   >>> referenced by ipmmu-vmsa.c:1037 (drivers/iommu/ipmmu-vmsa.c:1037)
   >>>               drivers/iommu/ipmmu-vmsa.o:(ipmmu_attach_device) in archive vmlinux.a
   >>> referenced by io-pgtable-arm.c:1283 (drivers/iommu/io-pgtable-arm.c:1283)
   >>>               drivers/iommu/io-pgtable-arm.o:(arm_lpae_run_tests) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
   Selected by [y]:
   - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
