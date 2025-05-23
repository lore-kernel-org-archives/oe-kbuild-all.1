Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035EB1898E9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 05:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747979838; cv=none; b=jLxjqA/aQIorW9YDFOyQEMgtHpqqZdtHKg1979gp/yv2HfvewvdgQSF3kkaxaWQ5FSnNat+cgFFM4eHXwRKJBhPnoxoZAp2rvfJB6zYxjMOe27rvAEq0VELexzt4b05OlsGZ/y0XDL/83EEgsCUVSU+mGWj2qgVIi/YjJINU1Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747979838; c=relaxed/simple;
	bh=ESJrCbxd/qInCuGm4WLqEK2Zp0zlyPNnJVBmgJWxDgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mCXfroav6yPbbCcC5pdXuFKmYQbEds0CwqiIvzoAEtwqhJrt1DYLsNtyCg6wpVJU0HSao3A+LPjUOueOzIyNvNMSQMm1AuIA8A3Tjp+wK8jWW2MVNfUl9c3uAQ48DS82uTrtg48Pk4PIvha58sknXvhyyIi8Kc41NBM2W/Pzgu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hr1aammH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hr1aammH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747979837; x=1779515837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ESJrCbxd/qInCuGm4WLqEK2Zp0zlyPNnJVBmgJWxDgs=;
  b=Hr1aammHXneE64HqdDRiMl5o99Jbd8GGoYNHs8La7/2CvCoKDsPA5ZNn
   equp4nY/6mUrE8OkJKxTaJOwkRVY39yG7fHUzu5TPpGByDmV8rpy5zJ4p
   k4u+3DVivCLU34SewjmFY6t0FtjFiUY/ntFAhc/UxdzqAqoBQCS3pBWTl
   OwV3aJet93s73VjhMHP8iocBTabaZhOXr8W8YvrUyTLeeFuP3grsBRPZA
   fioubAo029CBj1jp1GecHbXVyV5jfs+YW43qwSsn6RmwQUe5p20Xrztxh
   GPUx1Ey+f9KwDfTFLJ3fCrPEt1xUijsrKpqdDi7MbofIwtiGRO4d1934T
   A==;
X-CSE-ConnectionGUID: WIjc5sUISJyMRlaN6yKR8Q==
X-CSE-MsgGUID: Thu1qW36TkuuBgdYcuD+7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61077121"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="61077121"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 22:57:16 -0700
X-CSE-ConnectionGUID: Z8p3wuRwQVOkMi3xU4ULIw==
X-CSE-MsgGUID: ImuLW6sMS1OdKDbc81iFeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="171959863"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 May 2025 22:57:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uILP7-000Q4K-1l;
	Fri, 23 May 2025 05:57:13 +0000
Date: Fri, 23 May 2025 13:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1/1]
 drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c:911:31: warning:
 'vf_type_ib' defined but not used
Message-ID: <202505231320.sjy69gfd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   a8755c6c8b3f958e95ab5212817b06a08801fb1d
commit: a8755c6c8b3f958e95ab5212817b06a08801fb1d [1/1] anolis: drivers: update Yunsilicon drivers to version 2412GA
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250523/202505231320.sjy69gfd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505231320.sjy69gfd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505231320.sjy69gfd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c:911:31: warning: 'vf_type_ib' defined but not used [-Wunused-const-variable=]
     911 | static const struct kobj_type vf_type_ib = {
         |                               ^~~~~~~~~~


vim +/vf_type_ib +911 drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c

64e8e83b98611a Liqiang 2025-01-21  910  
64e8e83b98611a Liqiang 2025-01-21 @911  static const struct kobj_type vf_type_ib = {
64e8e83b98611a Liqiang 2025-01-21  912  	.sysfs_ops     = &vf_sysfs_ops,
64e8e83b98611a Liqiang 2025-01-21  913  	.default_groups = vf_ib_groups,
64e8e83b98611a Liqiang 2025-01-21  914  };
64e8e83b98611a Liqiang 2025-01-21  915  

:::::: The code at line 911 was first introduced by commit
:::::: 64e8e83b98611ae1073a82656af3222b9037d4b2 anolis: drivers: support for xsc drivers from Yunsilicon Technology

:::::: TO: Liqiang <liq@yunsilicon.com>
:::::: CC: Qinyun Tan <qinyuntan@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
