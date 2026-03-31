Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3494936AB47
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 02:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774925278; cv=none; b=PKTb9o/eFH1m+hg1Nll6tDYKkgkAtLVBg5ZfB15zbv8/mSA1rjbPaMGgcGhED1Vh/J643P/QkZRk0o6YhkcegeeK8A1HY1TNYgTsbnIJTsgSutmp1uaP0KmsvccnwnC3h1mq/DClTnO37aDeCzU3UpgqcjCJ+VtRSKcdSrasoys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774925278; c=relaxed/simple;
	bh=TMKjg+OLQj0r8qrIwh1ZZ6glfh3Oivsb/ze0NURvkrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JvMJjqlPc3jJVVgRgOhEneKee2DhTHhWuxlh/ffpfSjuiaOUeoJiuLSGclqKajBikOSmROUGJRQ7SaU/iAn69jka7yo2yVRWVbhPuZ+03j/7SrCkIfvShnWw6VDFifOIcUkhFyHT2w/YH1GpAS3uxrwnYTXexZpOBKANeI0Ojco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKjuy8Dy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKjuy8Dy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774925277; x=1806461277;
  h=date:from:to:cc:subject:message-id;
  bh=TMKjg+OLQj0r8qrIwh1ZZ6glfh3Oivsb/ze0NURvkrc=;
  b=UKjuy8DyTQxXCTIrTdH5A9lBiX25g2O5cXXRbddmmRdtu2ZhQY6UF0aq
   X0jQk/m6hwCDfezx1XAaFpSxj5VHiyZ8Kc0sugwRL7N4suSfuYdTbdhyX
   cuzT/baqZMGIvXQEMjHayKQqNkhF8IDT7JBogZzihWV6sIGzFS5YR/vdl
   zmcPoeFxeVXx/lQoyF1kTdq+ltog1pyK2ZIJL5w4iHLSdf6qyYXdHZHm3
   0IsiWfKT77MjzcEXGfZahdZrnVh2UO5Wz5QbYZ/zZIKc6VYnPWsjmhHIz
   bggVmMf7FJCNGogbUdn7/lootj1W9dnzvFkzWe0fSAzeY0kAzkpg+LwqN
   A==;
X-CSE-ConnectionGUID: /k+ZJL3GSfeakbbR00lpkA==
X-CSE-MsgGUID: oDZIPIcbSY6TWiN3wUnvVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79828185"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="79828185"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 19:47:56 -0700
X-CSE-ConnectionGUID: Z1hJQT8wST2zKcjyryGjzA==
X-CSE-MsgGUID: 9/rviQTwTey0E9pa4GomjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="219579408"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Mar 2026 19:47:53 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7P8x-0000000023h-0yCy;
	Tue, 31 Mar 2026 02:47:51 +0000
Date: Tue, 31 Mar 2026 10:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.12 197/1171]
 drivers/gpu/drm/xlnx/xlnx_sdi.c:264:9: error: implicit declaration of
 function 'writel'
Message-ID: <202603311008.YURgSJkm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.12
head:   d25fdf9fee1c8707551f590540e46b3686b90099
commit: 11ac35b42adb09a45174a780c62277cc05d8ad63 [197/1171] drm: xlnx: sdi: Adding sdi-tx driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260331/202603311008.YURgSJkm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311008.YURgSJkm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311008.YURgSJkm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/xlnx_sdi.c: In function 'xlnx_sdi_writel':
>> drivers/gpu/drm/xlnx/xlnx_sdi.c:264:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
     264 |         writel(val, base + offset);
         |         ^~~~~~
   drivers/gpu/drm/xlnx/xlnx_sdi.c: In function 'xlnx_sdi_readl':
>> drivers/gpu/drm/xlnx/xlnx_sdi.c:269:16: error: implicit declaration of function 'readl' [-Wimplicit-function-declaration]
     269 |         return readl(base + offset);
         |                ^~~~~


vim +/writel +264 drivers/gpu/drm/xlnx/xlnx_sdi.c

   261	
   262	static inline void xlnx_sdi_writel(void __iomem *base, int offset, u32 val)
   263	{
 > 264		writel(val, base + offset);
   265	}
   266	
   267	static inline u32 xlnx_sdi_readl(void __iomem *base, int offset)
   268	{
 > 269		return readl(base + offset);
   270	}
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
