Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEB92E633
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Apr 2024 11:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713092910; cv=none; b=l4LtroG2CzbN/9oqWXxndYI4JkQWGDDfTfekj/ne7PVy9+hGV1n1h6FVMq11Fb8cqr8v6axSYRhlhQRUv5JVm0WQA28FnhOaClje1WJVK2asjUUBy+nYZZjUUW0FEoLf741UbiBDQH9d9198/rvxfi8LEIPr//91YP2ztPRDcTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713092910; c=relaxed/simple;
	bh=HI8b2+8kCaeZX+Vgyon2YDZVdJoDyhTzSaoQoal+cCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V2vd3ahq4YvCusDoW0eM4KDC6goJHyoCNDWmlZA1yXFmFmC2n35Aw4zGMmWs7DFSWxUdpHwgit6yXDddB9m0SRD4NR9O40DACbZse/GSLJU2Fq4dWxkIy93OrBRPn1gNKrop8rrEzlr1xM8Y3Fj1RbQFrVTc+J3wCgsPl7oDRCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALr+XrPA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALr+XrPA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713092909; x=1744628909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HI8b2+8kCaeZX+Vgyon2YDZVdJoDyhTzSaoQoal+cCQ=;
  b=ALr+XrPA12MeJB4jl10zhs2gGZUq2YU+XDeXGUyMyEQtWRz3QJKmzI49
   jfKCWYqVQheLZfqvUBQ5U+zFtbjnGWRw8tcdVDadpEfGdaKk9kKw5guHi
   rc4kRWJVfiB4AudVMpdWZ3Y9CSfWUfrz0bpuTVPR1OBPEBG9TrSacrBlM
   ir4bAZPDQAL8vT92e46gBpbbYphva0o22i28Q0ox2dZKKZQKa3Zsl0tF5
   eYwhfD+Kz0NmIoh9Duuy0p8JiKFYECDa7jqaps8dt6tZ2glIB3NTEngjq
   hivUBolBhROF+VQsr4LUhHV6eXeXgmQO+aCD9t3gLyG+3nare/3G31zCe
   A==;
X-CSE-ConnectionGUID: lNcwQ46JSraB2jDHAUPWhA==
X-CSE-MsgGUID: +hNLruV0QuKeRaimEi84Cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="8359214"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="8359214"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 04:08:28 -0700
X-CSE-ConnectionGUID: YtILkteLQ76fvdq9fxF2MA==
X-CSE-MsgGUID: ii8ixOgHSjy4SYe1lacPrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="26187535"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 14 Apr 2024 04:08:27 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvxii-0003aY-1T;
	Sun, 14 Apr 2024 11:08:24 +0000
Date: Sun, 14 Apr 2024 19:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/mmc-const-sdhci-ops 7/7]
 drivers/mmc/host/sdhci-s3c.c:426:31: warning: 'sdhci_s3c_ops_exynos4'
 defined but not used
Message-ID: <202404141914.CaGmgmeF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/mmc-const-sdhci-ops
head:   1d9addbf90a3a3f0cf5f9629597076d65ac06044
commit: 1d9addbf90a3a3f0cf5f9629597076d65ac06044 [7/7] mmc: sdhci-s3c: Choose sdhci_ops based on variant
config: i386-buildonly-randconfig-004-20240414 (https://download.01.org/0day-ci/archive/20240414/202404141914.CaGmgmeF-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404141914.CaGmgmeF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404141914.CaGmgmeF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-s3c.c:426:31: warning: 'sdhci_s3c_ops_exynos4' defined but not used [-Wunused-const-variable=]
     426 | static const struct sdhci_ops sdhci_s3c_ops_exynos4 = {
         |                               ^~~~~~~~~~~~~~~~~~~~~


vim +/sdhci_s3c_ops_exynos4 +426 drivers/mmc/host/sdhci-s3c.c

   425	
 > 426	static const struct sdhci_ops sdhci_s3c_ops_exynos4 = {
   427		.get_max_clock		= sdhci_cmu_get_max_clock,
   428		.set_clock		= sdhci_cmu_set_clock,
   429		.get_min_clock		= sdhci_cmu_get_min_clock,
   430		.set_bus_width		= sdhci_set_bus_width,
   431		.reset			= sdhci_reset,
   432		.set_uhs_signaling	= sdhci_set_uhs_signaling,
   433	};
   434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
