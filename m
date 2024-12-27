Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA2F154C07
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735286507; cv=none; b=O+ROYr8ugdaCW1v+Y42eKDWhhEc63ZV/T0FLVwKUHxNvcTu7qavREOazCzKFEGlZ0O1+ykhiBn4ZXU6EE8ZETCdPGCIAODPoOSnDJoK9lYNAOG0f5tsRTgisku8hai0Vx4OCq352RtTNrZrq8jF7kVHLdFq/BfNJ8ricKjEzduo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735286507; c=relaxed/simple;
	bh=IHW+BQCUtMGrWQLuOs+QpNF9TipQDX0JTNNeOZHLpIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HI6Q/5PqfVbEPGMkngaXFuZeu6Uk2DL1GHktFNneXucMhc/4xXPUuLcwqQmOBArI/yM/Wmtoh/4QcWV8065D47t+O2UUBdd7id78bgraeHusBcXnMuK6Aglp2yU6OfvT8UIg906OunIW2hVaMW0oax+kywJCAPjYRbeSpFX4+f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAIdBxDL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAIdBxDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735286506; x=1766822506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IHW+BQCUtMGrWQLuOs+QpNF9TipQDX0JTNNeOZHLpIk=;
  b=bAIdBxDL/Jvb1s/ScsU42m2W5RR0U8/RhfkT8TFvLC+m9NVFS6usnlQp
   Co/XEhct8AM4PLLofcnvCKowXemlmGMt8ESnKHO3nokNu75BcQrQSqq9V
   Lms+Pi1LkQgQJSM3yImN6Ti6cFd97aOsj62cMj0AZI0TkBIKfmx1f2rLs
   oVfGN3ywmIgQsy5kArpkw4wEatJo3P+Qpe1ij+x5pKd93c67wuQyriVm3
   NfDwHuOTRXBG2OxO4vxITOxo/f5JS4GJbbMlzvTOaMjOuDXlFJdZM8oaC
   HsoeLngIrEuE9ExwWiLSLpQ+GsKARuK3v6tOoBE8LQlIEeWDhs1Fq5XkR
   w==;
X-CSE-ConnectionGUID: LG/Wkr9fSrGzoXT7mF9qMQ==
X-CSE-MsgGUID: YREZ6RP1TQyiuVfZLLczhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35576817"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="35576817"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 00:01:46 -0800
X-CSE-ConnectionGUID: 8AeX3G5eTi21m9zTZmX0xQ==
X-CSE-MsgGUID: bjhI1JtMTqaAdtrhWRJHlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99955732"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Dec 2024 00:01:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR5Hy-00034c-1s;
	Fri, 27 Dec 2024 08:01:42 +0000
Date: Fri, 27 Dec 2024 16:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:acpi-eventlog 3/3]
 drivers/char/tpm/eventlog/acpi.c:66:13: warning: 'tpm_bios_log_free' defined
 but not used
Message-ID: <202412271554.uDlgJq1D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git acpi-eventlog
head:   741bf24096935bcc162d1944f05cdddbaa400948
commit: 741bf24096935bcc162d1944f05cdddbaa400948 [3/3] tpm: Map the ACPI provided event log
config: x86_64-buildonly-randconfig-001-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271554.uDlgJq1D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412271554.uDlgJq1D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412271554.uDlgJq1D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/eventlog/acpi.c:66:13: warning: 'tpm_bios_log_free' defined but not used [-Wunused-function]
      66 | static void tpm_bios_log_free(void *data)
         |             ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]


vim +/tpm_bios_log_free +66 drivers/char/tpm/eventlog/acpi.c

3dcd15665aca80 Stefan Berger   2021-03-10  65  
d3ffb09dc3de18 Jarkko Sakkinen 2024-12-25 @66  static void tpm_bios_log_free(void *data)
d3ffb09dc3de18 Jarkko Sakkinen 2024-12-25  67  {
d3ffb09dc3de18 Jarkko Sakkinen 2024-12-25  68  	kvfree(data);
d3ffb09dc3de18 Jarkko Sakkinen 2024-12-25  69  }
d3ffb09dc3de18 Jarkko Sakkinen 2024-12-25  70  

:::::: The code at line 66 was first introduced by commit
:::::: d3ffb09dc3de18123e4fa7f285b78087bb0044a1 tpm: Map the ACPI provided event log

:::::: TO: Jarkko Sakkinen <jarkko@kernel.org>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
