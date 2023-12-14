Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15953E462
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTJdzWPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702562855; x=1734098855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DiY1H7twQ+sQ0zF3pHG9FMnM7H2P6I2qEPcDDTTEJZs=;
  b=RTJdzWPxpQ4g6ZxOfxsirjsAGLF0xmj1k8RG1WWnA0aO5AfOVMvhxgXG
   JpX6nFOrekAMXX08Fv71CJ4DSXUc5s6L0PTjpzDv/o8g+GsALb3BEns8Q
   F7ELnLdAi1DLTz2jQdqfDEh8eUF9hBkn+NoMswSR56iAY7ofzcYN0c2lf
   bJCJybe6aw38JOScQKSg9OTKlMwX0kOGxv+Fk+2sKTXhwF//eQGCNHE16
   5Mxj/m402AnEIYRht9ae7NfR3luCATTqbE2pzTYdULU9a7PYlt8Cm1Fps
   tB+lNjkhHsH5S4GrW3dzTOfca9LUJ7pduORXeVqV9Xn1NEJwjR28kmWIf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="380108037"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="380108037"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 06:07:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="947584016"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="947584016"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Dec 2023 06:07:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDmN8-000MA8-2k;
	Thu, 14 Dec 2023 14:07:30 +0000
Date: Thu, 14 Dec 2023 22:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [weiny2:cxl-cper-2023-12-13 8/9]
 drivers/firmware/efi/cper_cxl.c:192:1: sparse: sparse: symbol
 'cxl_cper_rw_sem' was not declared. Should it be static?
Message-ID: <202312142211.cbcsaH5v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git cxl-cper-2023-12-13
head:   effd1d38713375ee60e89f1bef31eea1ba668304
commit: 3394ce85e912b328886077c5a439c65284767bb8 [8/9] firmware/efi: Process CXL Component Events
config: x86_64-randconfig-121-20231214 (https://download.01.org/0day-ci/archive/20231214/202312142211.cbcsaH5v-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312142211.cbcsaH5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312142211.cbcsaH5v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/efi/cper_cxl.c:192:1: sparse: sparse: symbol 'cxl_cper_rw_sem' was not declared. Should it be static?
   drivers/firmware/efi/cper_cxl.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +/cxl_cper_rw_sem +192 drivers/firmware/efi/cper_cxl.c

   191	
 > 192	DECLARE_RWSEM(cxl_cper_rw_sem);
   193	static cxl_cper_notifier cper_notifier;
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
