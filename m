Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A8036AF8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 23:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719013950; cv=none; b=QIMr7dwGR5qO36BhrclQM2VDrmUyvKdV2iYqCgpYy6pQ46FrbH7buRzHuC/QcRbzVJTlRAVHscD4QYtMF4ztt3OIMpXXq6iGXFlov26xac1YCqbQjIJ6qqbcaziXOJNcwKsGMY2lrXDx7AeByUn8X8YBjrjGnSQwQj2YuTYLkp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719013950; c=relaxed/simple;
	bh=J/MrGmo0IxWav8URR2JPdnNagcB0aruc+taluMp5OS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cumz4JzhMYbZZHzYuTx1CyPmSKOtQjKQ6DDPeKKqGCo6zcJa3umhp6PZ07H41J2rs50q2Uod1n8ZH8HmuWTcigNNkJtTPCwxQ1R+5ioDKUXtJCCG5xy/E3nt7E+xW+kSBmRRbRk9yAMGAVuafZtT3lCSIX8m94OV9PsaI17X0Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPPecDIw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPPecDIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719013948; x=1750549948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J/MrGmo0IxWav8URR2JPdnNagcB0aruc+taluMp5OS0=;
  b=aPPecDIwkeLniBFBcOvUtS3BnL6j3mBuppgVRSacC3UAJCJRaAhZ4Og6
   5wspQhScJ3GbQVX/mw4u5bWVUUjuHU9MlblcyLzyXC3vJOW9YzOFUnK1S
   TWE3LU0zLYVUif8Fyad4giKNXKgRvPBt6AGOVcRNf3PbJCitl9xVBtQ4b
   meQiKKqUoKei7qXZqHwJPygD2IwK9/HaOw4PWgnpyG5RJc0bwUU5XaF45
   mx03MxgfTy5lux6ZFoYJJJnCAZ8oHkFSXTmvHJ1nEeChOO1UyoU8mIs46
   NU3DT7EZK0L3rRVjXZCUCIR/XARpADb12wve+ZEUd8+twgoMaxLEg8SjB
   g==;
X-CSE-ConnectionGUID: E5zPnKVHRbqC3EnXbdWtRw==
X-CSE-MsgGUID: ts5sTdV0Q/q+FprR4FSQ7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="26695318"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="26695318"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 16:52:27 -0700
X-CSE-ConnectionGUID: yhz1hSNvRS2JJHlCf2GWhg==
X-CSE-MsgGUID: +3he/jSjSsmLg085IbGIQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="47677756"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jun 2024 16:52:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKo3M-00098Q-1K;
	Fri, 21 Jun 2024 23:52:24 +0000
Date: Sat, 22 Jun 2024 07:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:const_driver 3/10] drivers/bus/mips_cdmm.c:124:12:
 error: incompatible function pointer types initializing 'int (*)(struct
 device *, const struct device_driver *)' with an expression of type 'int
 (struct device *, struct device_driver *)'
Message-ID: <202406220726.iLKR3tvS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_driver
head:   f4b9252a85a6ce543ba43ddce935a318ed04a618
commit: 1c2cb4152270681e66c4db7415254ca450068b22 [3/10] driver core: have match() callback in struct bus_type take a const *
config: mips-randconfig-r123-20240622 (https://download.01.org/0day-ci/archive/20240622/202406220726.iLKR3tvS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
reproduce: (https://download.01.org/0day-ci/archive/20240622/202406220726.iLKR3tvS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220726.iLKR3tvS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bus/mips_cdmm.c:124:12: error: incompatible function pointer types initializing 'int (*)(struct device *, const struct device_driver *)' with an expression of type 'int (struct device *, struct device_driver *)' [-Wincompatible-function-pointer-types]
     124 |         .match          = mips_cdmm_match,
         |                           ^~~~~~~~~~~~~~~
   1 error generated.


vim +124 drivers/bus/mips_cdmm.c

8286ae03308c6f James Hogan         2015-03-25  120  
eac95d5ae4f872 Ricardo B. Marliere 2024-02-13  121  const struct bus_type mips_cdmm_bustype = {
8286ae03308c6f James Hogan         2015-03-25  122  	.name		= "cdmm",
8286ae03308c6f James Hogan         2015-03-25  123  	.dev_groups	= mips_cdmm_dev_groups,
8286ae03308c6f James Hogan         2015-03-25 @124  	.match		= mips_cdmm_match,
8286ae03308c6f James Hogan         2015-03-25  125  	.uevent		= mips_cdmm_uevent,
8286ae03308c6f James Hogan         2015-03-25  126  };
8286ae03308c6f James Hogan         2015-03-25  127  EXPORT_SYMBOL_GPL(mips_cdmm_bustype);
8286ae03308c6f James Hogan         2015-03-25  128  

:::::: The code at line 124 was first introduced by commit
:::::: 8286ae03308c6f97f346f9f8cb9174b04969add5 MIPS: Add CDMM bus support

:::::: TO: James Hogan <james.hogan@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
