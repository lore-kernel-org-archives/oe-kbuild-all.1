Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9904408
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680868794; x=1712404794;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zCLiotmWHIKkJTCcs/H9jAk/iuMcbogKyEmdKHTNN88=;
  b=JrI0Eqow2PfqrR4H/rVaY7sQDbZYfrpgiMQKm0LAgITMuW8WTeHfOFgs
   0lrl8mfl9spmuXIRtAa50NJqRepUB3UFl4XXia3DxkwzY/gm9EOcwMOwU
   yBL/cnB/iZgYUzcCNMYGeIF7GZflfOM6Jr33vk/BqAhQPIU4Zn2ntU3w+
   3hNQNIlBJ6hNvt7XZnKHjOlPG5lBE48WXQUyfsDhXopK1qDRRsdwDA7Wv
   WZqjneTUtXw5CXcUufCHGDRGZGo8cBcQkVM13Wyy0ZTF4WSJgffFU8CVx
   +MfPNNRwiIPs0UjKOemadNcFlQrmHu0a92yhcNPJCwfgD8NKnSIQ8A1Tx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="342983823"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="342983823"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 04:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="690035446"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="690035446"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2023 04:59:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkkkp-000STJ-2u;
	Fri, 07 Apr 2023 11:59:43 +0000
Date: Fri, 7 Apr 2023 19:59:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 69/213] ERROR: modpost:
 "of_msi_get_domain" [drivers/dma/ti/k3-udma.ko] undefined!
Message-ID: <202304071944.g72qltLX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kevin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   4921e3af7003ec7365b16a51252a8318739753e7
commit: 326d7693841abaeadccd348042e825f1587ec578 [69/213] dmaengine: ti: convert k3-udma to module
config: arm64-randconfig-r022-20230403 (https://download.01.org/0day-ci/archive/20230407/202304071944.g72qltLX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 326d7693841abaeadccd348042e825f1587ec578
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071944.g72qltLX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "of_msi_get_domain" [drivers/dma/ti/k3-udma.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
