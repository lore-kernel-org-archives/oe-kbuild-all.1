Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48AD33DC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 14:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683037349; x=1714573349;
  h=date:from:cc:subject:message-id:mime-version;
  bh=QAiBS2Il/ZuHjUTYrhEd4NMOopZ7C2dWoM32FPbyRk8=;
  b=L+kuYTIIkFd60NV7j3u38rXLXhVB1ISHXBhA/BKTo6Now6QDd709zHZp
   9Iure9jcnw8+Cp1q39PJyjHChezqIYUWK8riOvhoqwIDRxAXZ7Be37TaA
   7VPwbhBMU3tuBgWHq6jrClfmqbUDUOyIxDNYZnqBnW8z1aHOsQ3J52HWd
   VrZSGtf+X9SXtHhOlhEIQ8VQex8eyIHUmbAXkXG8RtBo08WAs/ZjgOJDK
   F+wdHwKKpXcRgK4E8NOoGB1a7dWciTwrVS6z+HbUSIqlUsQ8QqYY9zhyc
   VOKpESXX819XaVMeEGm+gDI7f14VPF1wx5ZDnRPib131sBF7zJ1Ucmq94
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="348453618"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="348453618"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 07:22:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="726758660"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="726758660"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 May 2023 07:22:27 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptqte-000160-2D;
	Tue, 02 May 2023 14:22:26 +0000
Date: Tue, 2 May 2023 22:21:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 335/382] ERROR: modpost:
 "phy_mipi_dphy_get_default_config_for_hsclk"
 [drivers/media/platform/cadence/cdns-csi2rx.ko] undefined!
Message-ID: <202305022253.13O0PqP3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   bbd8927da68b353efb2d1fb94c3185c0ceabaf86
commit: abf5efa8c5ada91dc8d9c8adaa272e7792afaa17 [335/382] media: cadence: csi2rx: Support runtime PM
config: x86_64-randconfig-a016-20230501 (https://download.01.org/0day-ci/archive/20230502/202305022253.13O0PqP3-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout abf5efa8c5ada91dc8d9c8adaa272e7792afaa17
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022253.13O0PqP3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phy_mipi_dphy_get_default_config_for_hsclk" [drivers/media/platform/cadence/cdns-csi2rx.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
