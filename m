Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53DF627
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 02:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675996217; x=1707532217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HeadTIURqG5D7AflBxcC4/YbDkRtTPPfRniUfy7ZDs4=;
  b=ZE9F0WcFyXMfFkq/XxJFONoEFoOqQQCR60pJO9Xp4eP4sn6osXKitEzX
   nb61g2YiIvmeDbfDqfNnNrAhDgp6apTSbCIpGdiISmU8Omh56mR2peC+6
   2D7Yk/anEsHJFbUqPN5K4agDtBiHzB8DoRfqjV13P9PQQwzspas1y7c1Y
   uvE/IDVsm8yBYfNBaqUODnr8bWeFH9/h9sLrdBO9sW8GkYk6rPlW4dDRD
   EHjnM60+bke+i6Hr5d6BkPcS9urgXGvNwY9P1gDh1zWN8NFxldqhav0xY
   w7LI0AhweZnbjkPfdWH15Gkr9K9qFgrTstudx6zbLXbzc0opHTYESGRw0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="357715626"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="357715626"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 18:30:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="661250523"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="661250523"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Feb 2023 18:30:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQJB0-0005Sk-2W;
	Fri, 10 Feb 2023 02:30:14 +0000
Date: Fri, 10 Feb 2023 10:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.10 2/4]
 arch/arm64/mm/dma-mapping-noalias.c:550:6: warning: no previous prototype
 for 'arm64_noalias_setup_dma_ops'
Message-ID: <202302101025.BQEneMEO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-5.10
head:   d40d310e5ea48fda20e144621a2abe0aa61cf39c
commit: 3c75a6fb7fd1cd149d7af1a2e200b064a2d12782 [2/4] ANDROID: arm64: Work around Cortex-A510 erratum 2454944
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230210/202302101025.BQEneMEO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/3c75a6fb7fd1cd149d7af1a2e200b064a2d12782
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-5.10
        git checkout 3c75a6fb7fd1cd149d7af1a2e200b064a2d12782
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101025.BQEneMEO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/dma-mapping-noalias.c:550:6: warning: no previous prototype for 'arm64_noalias_setup_dma_ops' [-Wmissing-prototypes]
     550 | void arm64_noalias_setup_dma_ops(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arm64_noalias_setup_dma_ops +550 arch/arm64/mm/dma-mapping-noalias.c

   549	
 > 550	void arm64_noalias_setup_dma_ops(struct device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
