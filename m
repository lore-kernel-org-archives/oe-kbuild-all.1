Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636D0280A4B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755878229; cv=none; b=oCvHfa8LRFSaruEobI+7XUUN/VVfsIDRGPYXXO2f6+fhGGdrOnGH2y2G8tawmQO1qjiPRRmcFOPkq/46mWjfOUFvf4RXs12P+RurY9Snd/Om8RQpeOe1OPfUTFtr8dj5TMeHfUA3w0OS1hx3iHlL6QPYQ2pc/bxQPsZHXv4TzTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755878229; c=relaxed/simple;
	bh=ITJrutXX8Y7x1djdBT0t7Kl+E1ZLrLvpgVWNIaCvsY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XiEyegi0PXKPd/Hcz7yBAaNpSyTdbtUmyIbuOJVllZQ+9twcfJ0v9hrM9E7Y/G1E+QIOM6gC4Orqu7EFJQokV0cC5NVNYzPe+rQDEdqlPSWEXDFmOUEsLX4DwdXLW0XYcbxw0K+YeQo7qPcdh/H4OPeJ3+aj/vdj9uDrl9NB/oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSP36HCH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSP36HCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755878227; x=1787414227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ITJrutXX8Y7x1djdBT0t7Kl+E1ZLrLvpgVWNIaCvsY8=;
  b=cSP36HCHpG9CfK5aqM/8+RNPkdsmPmpmaKNgsyEjLpGj11y43dZXg2iG
   WbJmZVGhZoVuPe3ySPm7PX0CK4cxLH8oP3AYGNP13Nl631pa8W74hlXeN
   7LYzpoX+0RpavOdJi+SxXizT3lSjqqppp80ovwPZeFdA5e9MBu27QaYjU
   gwWmihUkFTPanxVj0Fla2qNhVHktWWjrMPVO+7eXcKXAcl/N8UWhkQGTm
   asvCJ+pW/V/1qGDr321mBtOMwlttdLQGFMg4H7VCPqDibA1qurzdvkVv4
   in12lz/aqq58KE/wDyvZJSySAwT4KKZ/be8AJVqIW/NK/mWHlMnm695gT
   g==;
X-CSE-ConnectionGUID: 4iTkn19yROyVAi2jx5uwUQ==
X-CSE-MsgGUID: nomZs+AxSnODCmOgNP2nZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="83601433"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="83601433"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 08:57:07 -0700
X-CSE-ConnectionGUID: Bo9+09B0T1Cb1OQsSn0N2Q==
X-CSE-MsgGUID: pmxfT7R/QQqm3n68zfa8pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168932596"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 22 Aug 2025 08:57:06 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upU8V-0001xL-0S;
	Fri, 22 Aug 2025 15:57:03 +0000
Date: Fri, 22 Aug 2025 17:56:10 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7/7]
 drivers/iommu/intel/dmar.c:923:6: error: use of undeclared identifier
 'enable_pkvm'
Message-ID: <202508221751.gYZthm5T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   3f8a5612f90e91c6acf0f22bb5fa67ad1ce1c1e4
commit: e1589c50414a0591b952c83d9ac4c07becafe0d3 [7/7] ANDROID: pkvm: x86: delay host iommu driver initialization after deprivilage
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250822/202508221751.gYZthm5T-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508221751.gYZthm5T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508221751.gYZthm5T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/intel/dmar.c:923:6: error: use of undeclared identifier 'enable_pkvm'
     923 |         if (enable_pkvm) {
         |             ^
>> drivers/iommu/intel/dmar.c:924:41: error: variable has incomplete type 'const struct pkvm_iommu_driver'
     924 |                 static const struct pkvm_iommu_driver kern_ops = {
         |                                                       ^
   drivers/iommu/intel/dmar.c:924:23: note: forward declaration of 'struct pkvm_iommu_driver'
     924 |                 static const struct pkvm_iommu_driver kern_ops = {
         |                                     ^
>> drivers/iommu/intel/dmar.c:928:3: error: call to undeclared function 'pkvm_iommu_register_driver'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     928 |                 pkvm_iommu_register_driver(&kern_ops);
         |                 ^
   drivers/iommu/intel/dmar.c:928:3: note: did you mean 'pci_unregister_driver'?
   include/linux/pci.h:1616:6: note: 'pci_unregister_driver' declared here
    1616 | void pci_unregister_driver(struct pci_driver *dev);
         |      ^
   3 errors generated.


vim +/enable_pkvm +923 drivers/iommu/intel/dmar.c

   920	
   921	static inline void __setup_iommu_init_hooks(void)
   922	{
 > 923		if (enable_pkvm) {
 > 924			static const struct pkvm_iommu_driver kern_ops = {
   925				.prepare_driver = dmar_table_init,
   926				.init_driver = intel_iommu_init,
   927			};
 > 928			pkvm_iommu_register_driver(&kern_ops);
   929	
   930			/*
   931			 * iommu_init happens during pkvm initialization and hence
   932			 * this should be a nop here.
   933			 */
   934			x86_init.iommu.iommu_init = intel_iommu_init_nop;
   935		} else {
   936			x86_init.iommu.iommu_init = intel_iommu_init;
   937		}
   938		/*
   939		 * Set iommu_shutdown hook regardless of pkvm.
   940		 * pkvm won't get a chance to shutdown iommu cleanly
   941		 * on reboot as we don't reprivilege at reboot. So,
   942		 * let the host do it in its normal shutdown flow.
   943		 */
   944		x86_platform.iommu_shutdown = intel_iommu_shutdown;
   945	}
   946	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
