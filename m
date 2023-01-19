Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A97015A3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 02:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674095368; x=1705631368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=07qwpnTOn7HbUr+IqsmPC6bgh5Tfgy+souMwS1qJdG4=;
  b=dfusatD+VaJrSisdx+A5DDuJKKwoTrMg8Q0NKv1+7Y0v787Cwg9CRXJO
   2FRwJQCqX7oyj9WPETx99KmhAFdH7tpgwDqerMcShLOTDiBLo4arxyfNX
   gYXSY+1+gFjBvX2BjNy4+aQgjXlMqGA/DuKCUTNdLK1/yD9KmNn4KxmxW
   J7cW9q6/CwXhRaFSiBNAR5jsnvd5jkskgS/7pIkw8ZqBAQhfFP2TD2byj
   NGnAbrlPAwCSWW0yXU52hjIcqZ7+c4fPYX5JMSeRYN0Dr1e/1phYKoTWy
   uO33fx4yFOgSO8tc8DQxRF/vwlHo+EDFUkf0KITi07vqRAJJcumakLukZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308730519"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="308730519"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 18:29:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="783900487"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="783900487"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Jan 2023 18:29:26 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIKg9-0000yA-2p;
	Thu, 19 Jan 2023 02:29:25 +0000
Date: Thu, 19 Jan 2023 10:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [vkoul-dmaengine:next 21/21] ERROR: modpost:
 "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
Message-ID: <202301191059.L9hNlgUg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   4b23603a251d24022f2fa48ee67610eb245a4115
commit: 4b23603a251d24022f2fa48ee67610eb245a4115 [21/21] dmaengine: drivers: Use devm_platform_ioremap_resource()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230119/202301191059.L9hNlgUg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/commit/?id=4b23603a251d24022f2fa48ee67610eb245a4115
        git remote add vkoul-dmaengine https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git
        git fetch --no-tags vkoul-dmaengine next
        git checkout 4b23603a251d24022f2fa48ee67610eb245a4115
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
>> ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
>> ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "ioremap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
WARNING: modpost: suppressed 15 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
