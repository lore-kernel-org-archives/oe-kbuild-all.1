Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF5A29AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681567364; x=1713103364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=68tM9Al5+6XXGx0BMOw9iVHN3hbd+4pmcUEGvXihP0s=;
  b=HovvbxfxB568o6BURTP8w7LU/kyBk5sOQpjrj++6+Ly8JI42NXb0jrgt
   Lalph1szf8jKYXqpUUeIZRd1eFo9V+xNoOmvJSR8oOly6chIKolU92ZsG
   cSIluQAOGSsHcp9Dx300xIe650Y9v7v1LA0CjPtzpwckGID+GARuwtxxN
   v7zSsYsarQMTT7WrOflA3DOlyzW96eGLnStnmskcok1ITg5sMuDaJI7jP
   jCDCWQ6Fd67tAVl8G1vqoOU0SLEdOJt1xcOss3CGxie96aDaDmp5PLdqN
   GtSsiRlOCHgOKiruiRAeFlzmOumyd3hoo5Nr2+bjNaSNLrrEG5RYh1yYp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="324273715"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="324273715"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 07:02:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="754799278"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="754799278"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Apr 2023 07:02:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pngUE-000b5f-0S;
	Sat, 15 Apr 2023 14:02:42 +0000
Date: Sat, 15 Apr 2023 22:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 1300/9838]
 usr/include/linux/videodev2.h:2437:41: error: field 'timestamp' has
 incomplete type
Message-ID: <202304152108.eRtZHZJk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: d368bdd73e55410f089fc065109f13953f409d88 [1300/9838] video: fbdev: mxc: Forward IPUv3 framebuffer driver from imx_4.19.y kernel
config: x86_64-randconfig-a014-20230410 (https://download.01.org/0day-ci/archive/20230415/202304152108.eRtZHZJk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/d368bdd73e55410f089fc065109f13953f409d88
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout d368bdd73e55410f089fc065109f13953f409d88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304152108.eRtZHZJk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/ipu.h:29,
                    from <command-line>:
>> usr/include/linux/videodev2.h:2437:41: error: field 'timestamp' has incomplete type
    2437 |         struct timespec                 timestamp;
         |                                         ^~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
