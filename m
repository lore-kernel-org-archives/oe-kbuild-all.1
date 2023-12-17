Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FAD1FA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 01:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XabrXJTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702775349; x=1734311349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s1/UZ/cA1Wfm7j9/EUoAUweZgM9WJTXaovk+ev1za2w=;
  b=XabrXJTDFoERxESOxuyUpvVKQl5sgNzpRgEnfTXda2dkPVIDf5pGMPqG
   iShsbaTWaadUT7pS0Jyz7cXTclbKfLJ7yUj2LupXbRtj3PTifil4SSmLZ
   HM2L0UDg6ZTbFuPxXjNaP/LBq5T2W1fsmXQUI31crxJ1TVHZUxbZ7gSGQ
   6x2V1FejyNaw2YFMbb+CfMdPPRytke6OB6+XyzCO4aLSGOetUQv96aX00
   TYbJKMcaTWeFjPU/B3whEmqhcY0Qv29Yvx+8AinB43HXT9s3kwGYaCKOy
   olNJF8sWJSJaMShmeMNvTuzHZYJ6HbSgqiKGCuxWndzrKrMzMczww5pKa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="380387993"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="380387993"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 17:09:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="724866216"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="724866216"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Dec 2023 17:09:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEfeT-0002Qk-1z;
	Sun, 17 Dec 2023 01:09:05 +0000
Date: Sun, 17 Dec 2023 09:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 127/16025]
 sound/soc/fsl/fsl_xcvr_sysfs.c:106:52: error: a function declaration without
 a prototype is deprecated in all versions of C
Message-ID: <202312170956.irSBQx2H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: d6bb8a57699c60069606540858677858f7df394d [127/16025] MLK-24965: ASoC: fsl_xcvr: bit and timestamp counters
config: i386-buildonly-randconfig-002-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170956.irSBQx2H-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170956.irSBQx2H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170956.irSBQx2H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/fsl_xcvr_sysfs.c:106:52: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   const struct attribute_group *fsl_xcvr_get_attr_grp()
                                                      ^
                                                       void
   1 error generated.


vim +106 sound/soc/fsl/fsl_xcvr_sysfs.c

   105	
 > 106	const struct attribute_group *fsl_xcvr_get_attr_grp()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
