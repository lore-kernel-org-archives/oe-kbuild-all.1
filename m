Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A40156FB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 22:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683240793; x=1714776793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=48aEXCjVdMmSa199Ys0aMYdGl7avBBAU18RJnyLQ21s=;
  b=bVzZcCvl6mBqSXBLl//zYIOg4Uv3rtyaOS1IoXzZrtBRVuJJ6oihBePb
   wrE4a2kKtA81nJCRsjqJBDt1jaCKm1ILwKuZEYID3XTQX+y/bQZFQPPTm
   C+Fzg6meTYWAtYHpLSwNN46P7RRLFWRTKn6hw2VdVjB9bwkr+85PAlRf5
   f6ghaj5lEGrjERvnps/y0kuqIYUmH0HyU1tzKzLLpRfFC3YTXTwxkiHFf
   a7QIMjg5+DScOEU20Q25devvBCb47eRwFeR7/RLGEqwmQDC2G+NBf5Hp2
   FRp71IqaXHEWw/RQMq4rYxkSx4Or1G8H01Nuo9wHM6NYGDr6VrDwPkR1/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="377150412"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="377150412"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 15:53:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="786781598"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="786781598"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 May 2023 15:52:54 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puhok-0000BU-0h;
	Thu, 04 May 2023 22:52:54 +0000
Date: Fri, 5 May 2023 06:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Aswath Govindraju <a-govindraju@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 1/2]
 scripts/dtc/include-prefixes/dt-bindings/pinctrl/k3.h:16:2: warning:
 #warning "These bindings are deprecated. Instead, use the header in the DTS
 source directory."
Message-ID: <202305050618.8gH97fQq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   6d13b41a203854e0340a1438c7ef0c3b2c15bb14
commit: 1e1b5c1557ab676a5768049471fd4b210b3f32fa [1/2] arm64: dts: ti: Add DT overlay for PCIe + USB3.0 SERDES personality card
config: arm64-randconfig-r004-20230501 (https://download.01.org/0day-ci/archive/20230505/202305050618.8gH97fQq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 1e1b5c1557ab676a5768049471fd4b210b3f32fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050618.8gH97fQq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/ti/k3-am654-pcie-usb3.dtso:13:
>> scripts/dtc/include-prefixes/dt-bindings/pinctrl/k3.h:16:2: warning: #warning "These bindings are deprecated. Instead, use the header in the DTS source directory." [-Wcpp]
      16 | #warning "These bindings are deprecated. Instead, use the header in the DTS source directory."
         |  ^~~~~~~


vim +16 scripts/dtc/include-prefixes/dt-bindings/pinctrl/k3.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
