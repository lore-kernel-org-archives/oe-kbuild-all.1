Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775316ADB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 22:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680907225; x=1712443225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14cBJo9UK+0qh1NvtGqbCTaR4qD2pZbzWVL8nzWFfhQ=;
  b=gEGGPoJmvUWn6E9883HQIeGMZknMSM4dneGoLbW523zN5q67+B5CJugL
   /cdwkOWDwPBQCDg7ZuibbgF00kIcgmeFxPbnlCoPwFsXW0WMlrRG28AWH
   PZxB5EKcvbVA3JJF/tazFEJRAZ0Tx3oQfSwuRfw6/r4e8W3XZZAE474Vo
   B4hVdrtZl2EeqVySD4w4JBdDFj0Kf4SiZ8VeP+j5tZSfg56z8FfMwwcqt
   GDQAeES0EViBSpMrysUCjlM4nUgzGLZXYnbNN7z9x45wdG5E8zPigAYZL
   A/daoEk71aLibPVx5/8kFP8wQRWHCZ1PQL50Z0IzMSRu6CDMhEGUwTkaL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="405903220"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="405903220"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 15:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="811534766"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="811534766"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Apr 2023 15:40:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkukb-000Swm-0i;
	Fri, 07 Apr 2023 22:40:09 +0000
Date: Sat, 8 Apr 2023 06:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: xtensa-linux-ld: section .Level2InterruptVector.text VMA
 [0000000000000180,0000000000000193] overlaps section .data VMA
 [0000000000000000,0000000000140ca7]
Message-ID: <202304080645.S7qi0nDB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Max,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2afccfefe7be1f7346564fe619277110d341f9b
commit: c20e1117d9aa22c558646a1060ddd1dd042fb107 xtensa: add kernel ABI selection to Kconfig
date:   1 year, 1 month ago
config: xtensa-randconfig-r032-20230407 (https://download.01.org/0day-ci/archive/20230408/202304080645.S7qi0nDB-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c20e1117d9aa22c558646a1060ddd1dd042fb107
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c20e1117d9aa22c558646a1060ddd1dd042fb107
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080645.S7qi0nDB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: section .Level2InterruptVector.text VMA [0000000000000180,0000000000000193] overlaps section .data VMA [0000000000000000,0000000000140ca7]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
