Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6AB1632DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 06:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737528407; cv=none; b=NJFKfdeNiaymLfisO/El/gzNIevqBGIqithGgNVelZgcjUAlT85GnA6qBhuvxn0sD4HeNEPqh5+x9StvycHLEc3GwR461tiC73EUxh/PZ+W7Nz55yjGnKFtD64SowOA+iRm1aLWa0Sm+gy/FGSFy5/PyRAquGF94OBxvFZOP0HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737528407; c=relaxed/simple;
	bh=73xkzjOqoRBgJT+02B+lkY5k7JZSDRd/zpwI4UzSL0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DhUyL8mjtgvVmil/rpjKn/p+e/bCNVCShVSyrneEmEbz4dLF9h9Wb7o4iU+HmB/Of/tczyozWIrzCwOIBnYceQDUHXQkiIiTcBL9JuRGoizfii8penDhI0RTFE6UTPavbwW/9/ctzu8QXmki7IQlvv6NpFsIgvg3ADMgYUrwjo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGVqqtC9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGVqqtC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737528406; x=1769064406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=73xkzjOqoRBgJT+02B+lkY5k7JZSDRd/zpwI4UzSL0M=;
  b=jGVqqtC9aoDvtq+Pp7WUQRzdBhZL9FoUPN1EJ1E7uzNcJ56E9eo5x1yd
   8UHG1zVItMz6xMnQdBTGsxllmH9q0x4nAS+QO0KxHtFH79dWFmdohwggD
   i1oEbpmbOgEiiRiRZG16EdskJC5FPWMpM4lQR4tRjyx9iH6ghwqQx6qLL
   uUhUUOZhMlNeTdH3u+CqlTa7i4JoA+9/lqvtwaygAchbf2pYqe6Ti0LUU
   MVWZJL+QYiYBdyx2uj3eYywmwqqxYOcvp8AU7xEbbuPEF/smoG1rByWLW
   991QMc/GhFZzeXhk0USh+PByDAYFM+hBHBxeSypY25/PjXOig3QkeMMT+
   w==;
X-CSE-ConnectionGUID: 6fhkNTC1T2+Mp/XSRVtB3Q==
X-CSE-MsgGUID: X6vnOFAjSsSfRXCwtBHUyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41731456"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="41731456"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 22:46:46 -0800
X-CSE-ConnectionGUID: PJA+n/cVRY2DMCoDGiEyQQ==
X-CSE-MsgGUID: QmV6WdIhS+eICsNUP99w5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="106831993"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jan 2025 22:46:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taUVd-000ZZn-2u;
	Wed, 22 Jan 2025 06:46:41 +0000
Date: Wed, 22 Jan 2025 14:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/device.h:381:23: sparse: sparse: incorrect type in
 return expression (different address spaces)
Message-ID: <202501221439.YoPUrrqD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0f93ac2c384c40202cf393fa7e8a2cac7004ba1
commit: f6bb3e9d98c2e8d70587d5ddaf9426ef30d7865c net: pcs: xpcs: Add Synopsys DW xPCS platform device driver
date:   7 months ago
config: um-randconfig-r121-20250122 (https://download.01.org/0day-ci/archive/20250122/202501221439.YoPUrrqD-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221439.YoPUrrqD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221439.YoPUrrqD-lkp@intel.com/

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
