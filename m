Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36381192B85
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 05:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730958419; cv=none; b=BmJNssLezOykNMTVfy+2dqASbLFC0gEHyIUIMgsXM6c7MuUHDxZnDI72clyyuhTPz5wdZvNAStkK0xMlzKOuYAXgn7EcLZry0wtSnPZgVWE/gSzH2cVIgfzp5fuWcpWcVGmEqMxBWqobQWScjvI0LYc5iopNDWCykv0bGv1Xlfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730958419; c=relaxed/simple;
	bh=JPxeCjdGq8a0zMzUJVf7kWzJDmpJp0Jzp57/Ycn+1Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GbJ6AtvKEUaFEGW9BBe/zUAg6c83bQ7y1K1TvSSUfL9Fv6VaS7qDxEAwm6PlZy4eI+/kK0wDviJxdlHFBsM0CmQPYmcnL213pdG6Hq4u9vQNzKgmHUdYOCflqoBMmEpeBST3sw076w2OBsHfOUF8VnQ+U68ASlyCB75tgF/0N5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUmGbwar; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUmGbwar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730958418; x=1762494418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JPxeCjdGq8a0zMzUJVf7kWzJDmpJp0Jzp57/Ycn+1Tk=;
  b=eUmGbwarMjkX/MQ433nM1qz8EnvXPOuOl/RGou/73AZ97SuJEMlWSW7v
   7HRYaR9/kC1diFL1VZn0axgXR3Womt9QHcuoRzadGTMtmjeZVEXneuSz0
   Umgdzqv0tL5gv+xMoTZ7JFkHRhHUxNQzhQuejluP1sYb0WZxdTEdmqVLl
   MnfZs8XWgUK05ZJEThCg+7uQE+rbdhPZHwEGfZJ1G5XXMCJL2ieVzRttV
   fmIvCwqD/PoTJt0/HxieI/v/56KdBguJvbIW6pyysQqUA3zvxvsUZw7vh
   tMefJ2AHCmCZYxYuYwKlqMysaeEPKQ4o7SBDTmDyHnfD25tYjdcqPMVcD
   Q==;
X-CSE-ConnectionGUID: jkEVKKYHTDOjUVY1ARs+oQ==
X-CSE-MsgGUID: O49ideLOQfOaLYv/kA3PIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30905433"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="30905433"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 21:46:58 -0800
X-CSE-ConnectionGUID: 5AbG2F7vRTuRMDRo0r1I4Q==
X-CSE-MsgGUID: TDwDifHmRU6KGHLE2pl7PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="88893668"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Nov 2024 21:46:56 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8vM6-000prY-2I;
	Thu, 07 Nov 2024 05:46:54 +0000
Date: Thu, 7 Nov 2024 13:45:59 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/device.h:381:23: sparse: sparse: incorrect type in
 return expression (different address spaces)
Message-ID: <202411071306.NRIW9j4f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ff7afaeca1a15fbeaa2c4795ee806c0667bd77b2
commit: f6bb3e9d98c2e8d70587d5ddaf9426ef30d7865c net: pcs: xpcs: Add Synopsys DW xPCS platform device driver
date:   4 months ago
config: s390-randconfig-r121-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071306.NRIW9j4f-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce: (https://download.01.org/0day-ci/archive/20241107/202411071306.NRIW9j4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411071306.NRIW9j4f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/pcs/pcs-xpcs-plat.c: note: in included file:
>> include/linux/device.h:381:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   include/linux/device.h:381:23: sparse:     expected void [noderef] __iomem *
   include/linux/device.h:381:23: sparse:     got void *

vim +381 include/linux/device.h

da7c07b1083809 Mark Brown 2023-07-18  376  
da7c07b1083809 Mark Brown 2023-07-18  377  static inline
da7c07b1083809 Mark Brown 2023-07-18  378  void __iomem *devm_ioremap_resource(struct device *dev,
da7c07b1083809 Mark Brown 2023-07-18  379  				    const struct resource *res)
da7c07b1083809 Mark Brown 2023-07-18  380  {
da7c07b1083809 Mark Brown 2023-07-18 @381  	return ERR_PTR(-EINVAL);
da7c07b1083809 Mark Brown 2023-07-18  382  }
da7c07b1083809 Mark Brown 2023-07-18  383  

:::::: The code at line 381 was first introduced by commit
:::::: da7c07b1083809888c82522e74370f962fb7685e driver core: Provide stubs for !IOMEM builds

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
