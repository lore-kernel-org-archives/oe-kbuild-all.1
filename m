Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784AC13A271
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Sep 2024 20:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725222456; cv=none; b=KyKGo3+vhVEFoGIfUUJsUxYs85iisqiTQmkhbRzgABVCRbGAIiYf4s4xuU4ImHEQrxYpfZs5MgNicElkeBpnb4FzPrng5ljClVyOaNZ7ofvnSiAZ82I0ay422PQW0LR74/h3Opw/e+Gtbh0a1Qym9Mgyf/jaY8i14BAVn3gulBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725222456; c=relaxed/simple;
	bh=0ietRclwmKskv07HdjoPFOHygNxUPdulA22gKZi+cvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GlOkR7Py7NnH0sMqI+rtAOMmEpag3mj5FRQHTVX8w0Sq7HeBPNAi+8iEdTl7MxN45Uwem1fXC3YnucYnR1HvDwSXEXL2PjqGXGjeeA6zud4hWw2K2ydxAtZ71rhv/Osn1KjkymL2v/oP+dGWjm2asyvaFgax5q6dTIBWdaHgXnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5jA2dku; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5jA2dku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725222455; x=1756758455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ietRclwmKskv07HdjoPFOHygNxUPdulA22gKZi+cvo=;
  b=f5jA2dkuo37IN81OT5qBLbuGoF8bjS8sNokNdO+kFi7hToxwMW/T699H
   hW8r80yBUPuHXPYyIPN3Bx1EYNHx1WrmfCdNmYcr7qkW9I8knlAbDayy1
   xCjtJ/BGhiMaPCpvc5YCiD+7LeqJY3i8Vl7ESk4TlNHF5VkWqGzhAB+7P
   qohntBvRekH+0VWJL3axKIGGLu9tYE1dCY3tKi55HODuRmMmf7858kna7
   UgZChK6yDghpdWU4VL1XnMrMHsCwLbJ1qWON7VE+TWMDV+w3Bvokq3kvK
   +dcp4FWwPRgkW1KKMlKAhabYk1vG4WErnMrfqq/Vs1iZSfiPbd0VILm60
   g==;
X-CSE-ConnectionGUID: SjrxbDSqTlWfO5H0OvcD3w==
X-CSE-MsgGUID: akpMUn/ISDmpbIDNP6Akww==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="41280536"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="41280536"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 13:27:34 -0700
X-CSE-ConnectionGUID: wzdNoQ3xR1qK4Lt5W8rN7A==
X-CSE-MsgGUID: O+qMu3VPRGqt4cLgG+WHng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="69313107"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Sep 2024 13:27:34 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skrAZ-0004tC-0F;
	Sun, 01 Sep 2024 20:27:31 +0000
Date: Mon, 2 Sep 2024 04:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 45/47] WARNING: modpost: module iommufd uses
 symbol pt_iommu_amdv1_mock_init from namespace GENERIC_PT_IOMMU, but does
 not import it.
Message-ID: <202409020439.mgLMmbvd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   5a40c5df4fb5f5a12ee01c506d5f8585105d2aff
commit: 2a6bb518816bf74d80f8249e8c32b886f228df43 [45/47] iommufd: Change the selftest to use iommupt instead of xarray
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240902/202409020439.mgLMmbvd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409020439.mgLMmbvd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409020439.mgLMmbvd-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/mm/testmmiotrace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> WARNING: modpost: module iommufd uses symbol pt_iommu_amdv1_mock_init from namespace GENERIC_PT_IOMMU, but does not import it.
>> WARNING: modpost: module iommufd uses symbol pt_iommu_amdv1_init from namespace GENERIC_PT_IOMMU, but does not import it.
ERROR: modpost: "__umoddi3" [drivers/iommu/generic_pt/fmt/iommu_pt_kunit_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
