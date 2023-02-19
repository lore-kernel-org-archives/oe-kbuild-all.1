Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D0C23A1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676818961; x=1708354961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RpFCyU8I+ZJSmBXeIJ4rdK7Jv/KX3c5a32KwmS0aakk=;
  b=Eo0nsK4UwNztnTnZOOHVWV++eUrreYDpl1Iea9YqLayfF+0Fr0u2pEYE
   /sORg5MPyvo3P+Si++O6YshmtR6Aek04bicSPbTi9C0g2U5tl64ttXaEr
   tDuwYfLLi9hsoK+l8tLMQI8tnsuYFK/+dek04Ha3JO4dnU6dTgzV41LjM
   J1U9bTztgyNczEqE5wNP+ensophtm10EeaaHwytxXTUnEDd+Lg8lPpCoJ
   cp4kmZ9pAGtdeOqpfGS8gkA+Yfhoy8TvquSI5zXQ46vUPR1HH+l+KKAFE
   +NoGI+c+zR7fsGgAzmKjJRBqNqeOBPt4UloWf/px1Bw0OuzbKlupu856V
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="418477788"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="418477788"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 07:02:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="648589798"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="648589798"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Feb 2023 07:02:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTlD4-000DLO-0Q;
	Sun, 19 Feb 2023 15:02:38 +0000
Date: Sun, 19 Feb 2023 23:02:03 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 4479/13499] fsl-edma.c:undefined reference to
 `devm_platform_ioremap_resource'
Message-ID: <202302192254.EGOAcwpm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c068f40300a0eaa34f7105d137a5560b86951aa9
commit: 4b23603a251d24022f2fa48ee67610eb245a4115 [4479/13499] dmaengine: drivers: Use devm_platform_ioremap_resource()
config: s390-randconfig-c034-20230219 (https://download.01.org/0day-ci/archive/20230219/202302192254.EGOAcwpm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4b23603a251d24022f2fa48ee67610eb245a4115
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4b23603a251d24022f2fa48ee67610eb245a4115
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302192254.EGOAcwpm-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/dma/fsl-edma.o: in function `fsl_edma_probe':
>> fsl-edma.c:(.text+0x1066): undefined reference to `devm_platform_ioremap_resource'
>> s390-linux-ld: fsl-edma.c:(.text+0x118c): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: drivers/dma/idma64.o: in function `idma64_platform_probe':
   idma64.c:(.text+0x1d1e): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: drivers/dma/qcom/hidma.o: in function `hidma_probe':
   hidma.c:(.text+0x530): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: hidma.c:(.text+0x59c): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/crypto/ccree/cc_driver.o: in function `init_cc_resources':
   cc_driver.c:(.text+0xd84): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/crypto/ccree/cc_debugfs.o: in function `cc_debugfs_init':
   cc_debugfs.c:(.text+0x116): undefined reference to `debugfs_create_regset32'
   s390-linux-ld: cc_debugfs.c:(.text+0x20c): undefined reference to `debugfs_create_regset32'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
