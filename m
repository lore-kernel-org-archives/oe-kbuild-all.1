Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE74936C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 01:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675906221; x=1707442221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UdMF9WBd/aXtsf2pkQSNHWA5j0B/IJlp7dXu/SiaSu0=;
  b=nPssJHGhWlPhxaKfbXrj3c6W9DYvKib1SAWcnMWIrhX6DFUyLZ3jY9kR
   6y5FRkPNuk/1Ey0roQEuveQNDxpoKzzlY56bvzA0aFFe5w6PahimTl8Z9
   1WCdBJg+1FselBobuJQk4WuCWwenBQNb8z4AenKL97Sayo94BDuHNkfyK
   LrxNHRoXYFWJRzcy+RySR/xSv1VQargOYqauvj7Ozj+a9rZK3VepKA0PF
   rm9mKHgg9I0FEMbvTp8LpftueyRSIx9c3k8ZQbaTbj+B1yPgYG4Ho3yNX
   pgapPinv2KSAhQ1fb4r5Em/bYq1aUUO7uun/ZA78LG964vVcO0Hex/m9a
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="394573387"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="394573387"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 17:30:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="617417446"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="617417446"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Feb 2023 17:30:20 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPvlT-0004k9-23;
	Thu, 09 Feb 2023 01:30:19 +0000
Date: Thu, 9 Feb 2023 09:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ERROR: Input tree has errors, aborting (use -f to force output)
Message-ID: <202302090951.NNxX447H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Bhupesh-Sharma/arm64-dts-qcom-sm6115-Add-geni-debug-uart-node-for-qup0/20230208-203005
head:   d43f62de28e9acc5f2ff67120a3a2e3156503b6e
commit: 666151ffcde5f189ca3c80819090c99aece5e86e arm64: dts: qcom: sm6115: Add geni debug uart node for qup0
date:   13 hours ago
config: arm64-randconfig-r031-20230209 (https://download.01.org/0day-ci/archive/20230209/202302090951.NNxX447H-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/666151ffcde5f189ca3c80819090c99aece5e86e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bhupesh-Sharma/arm64-dts-qcom-sm6115-Add-geni-debug-uart-node-for-qup0/20230208-203005
        git checkout 666151ffcde5f189ca3c80819090c99aece5e86e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302090951.NNxX447H-lkp@intel.com

All errors (new ones prefixed by >>):

   arch/arm64/boot/dts/qcom/sm6115.dtsi:994.31-1012.5: ERROR (duplicate_node_names): /soc@0/geniqup@4ac0000: Duplicate node name
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
