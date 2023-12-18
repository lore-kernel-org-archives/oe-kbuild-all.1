Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0F81840
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 00:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XO2zTz2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702857720; x=1734393720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PDNYLeFUJhlODDZeCwyvd/Fvsqp0Mn4fYPm0n2gUzSw=;
  b=XO2zTz2wSxbxgrkLELoX9C4n+bPBCRItZiWEgYHClv009vNFXbyhkmrL
   P4dyG8bVk59eILzwjA9dk3xyDfg+btPkrmwFXURvsLbxPxWjOHa6HS8ja
   xDpNp5SQLkm8A0vVI2Y+OGwoxNUKzG8SSmo463VQQaRc/1VozvHYPOd5L
   HzJlmYd1/tVfv2vUlbkBcvqmTOly8RQhQYTn69Xh9OPfQ0aQejzJVWEjL
   fVK2NHFRUwsCBUIgM8HgKrXRTut04sTfT9GgZvobDUW/4I66Ya/zI2OEt
   GH7WfxgCHsgP7vNnsmk+N/l54cYkGR/EZG5A4iO/Tqjde5uPh3prfCY8y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2262740"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="2262740"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 16:01:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="866028546"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="866028546"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2023 16:01:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF151-0003Xu-03;
	Mon, 18 Dec 2023 00:01:55 +0000
Date: Mon, 18 Dec 2023 08:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 1300/16025]
 usr/include/linux/videodev2.h:2437:20: error: field has incomplete type
 'struct timespec'
Message-ID: <202312180753.ge7NluEM-lkp@intel.com>
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
commit: d368bdd73e55410f089fc065109f13953f409d88 [1300/16025] video: fbdev: mxc: Forward IPUv3 framebuffer driver from imx_4.19.y kernel
config: i386-buildonly-randconfig-002-20231217 (https://download.01.org/0day-ci/archive/20231218/202312180753.ge7NluEM-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312180753.ge7NluEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312180753.ge7NluEM-lkp@intel.com/

Note: the freescale-fslc/6.1-2.1.x-imx HEAD 241e2f51bd87beb652196d1db92f0387c1209bfb builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/ipu.h:29:
>> usr/include/linux/videodev2.h:2437:20: error: field has incomplete type 'struct timespec'
           struct timespec                 timestamp;
                                           ^
   usr/include/linux/videodev2.h:2437:9: note: forward declaration of 'struct timespec'
           struct timespec                 timestamp;
                  ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
