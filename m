Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480EE10E0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 20:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757189666; cv=none; b=dOPx7GYQ8uru8UL//7iznhOajF/9h3xWa6+xd/IHkp6EqSFaJk0VV6fppLPQIEDNaJVpMbv1Ucmy+DQSZEB81bdGnkoDkoNnXgfEV3aUm2cpNRNujJsXUZJo9eZElnbMhnA4K5WPjEzxyIXHr677PR3BmkcAUuUqxN1BgbelStI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757189666; c=relaxed/simple;
	bh=cIv+3HkGYIV9YaupNssL3PF+4fW5lqd+43I39GxwzcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qwfpPIsgPsBIUdD2VJ6A6187l3/K3LGvbv701frkOEARWSHxCpkRM/qpveWfH9/h9mrYTGjY5V64anO0lNu+GsMmXjuWWP+3/5U4k1wnyfJiC5BNcy4pOOsavbeiSdVhYuVjyi9FPvPTPAqN5lRX2HNoLe3RM1JR5HYikZT1rzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4ZOAXGu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4ZOAXGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757189664; x=1788725664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cIv+3HkGYIV9YaupNssL3PF+4fW5lqd+43I39GxwzcU=;
  b=U4ZOAXGupZTDvYKZRN9wc9VLOiXaCS4i4dVLbFaLwGEKasGetCcnCxhX
   00eRhWLrO7JLgckWBszxUAsFSHKxTWT+SOFRYcDtqvjffqRm13Cfh8ENL
   0/eopXfwC4kBfQqoFcVJGpdh7dRyz+H47h9s1CXCV5rT0PKJrfsrpsO9F
   yPRkzYg6vK9jzRurGj5K/yFpWZrFGcQwEPEIFcu8jwa5wezcDh1Y/1k8M
   xaAcUkWFc5tHvU88ycRYTSZ0TUzYmaLNR6Kj0OOTWbTUHLfgOSpGCx2Ax
   GxjEbsQ3QERzqnCctKAoFKSONkcHS++dBdJjPwEMOTC21spZARbhiHFe0
   w==;
X-CSE-ConnectionGUID: SxVvPMgSS0eNKhohEubVtQ==
X-CSE-MsgGUID: qDAZV+fUT62jnX3aZE/gBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59570294"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59570294"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 13:14:24 -0700
X-CSE-ConnectionGUID: tRQvH+9MRpy5Z3gfTXdTOA==
X-CSE-MsgGUID: YxcWHwEiSw+9MfSaJcZZ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="177693757"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Sep 2025 13:14:22 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuzIi-0001mF-0y;
	Sat, 06 Sep 2025 20:14:20 +0000
Date: Sun, 7 Sep 2025 04:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] drivers/dma-buf/dma-buf.c:43:1:
 sparse: sparse: symbol 'dmabuf_accounting_key' was not declared. Should it
 be static?
Message-ID: <202509070429.F1aYGfNk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   4ef3d9b76a6cc5456e55e5dbb3492594d5f89e50
commit: d1918b99303a8948d23711bb445ece123bad795f [1/1] ANDROID: add command line parameter for dmabuf accounting
config: arm-randconfig-r122-20250906 (https://download.01.org/0day-ci/archive/20250907/202509070429.F1aYGfNk-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250907/202509070429.F1aYGfNk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070429.F1aYGfNk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/dma-buf.c:43:1: sparse: sparse: symbol 'dmabuf_accounting_key' was not declared. Should it be static?

vim +/dmabuf_accounting_key +43 drivers/dma-buf/dma-buf.c

    42	
  > 43	DEFINE_STATIC_KEY_TRUE(dmabuf_accounting_key);
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
