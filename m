Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F4733EA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 15:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683041743; x=1714577743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=azUmTho+0Odt1VrtyHmWZV6ZxspubeTjtHZMsRJSFAo=;
  b=R51LxnOE0OaXf59RYhx7RmcR94AXd0/a9dlCeTsrdgl2kcyNfzQxu/AE
   AO2ugPKDiwcBbTk/eLAdWmTXCs/e8siP4VJWPG5zmhhJ04hr0APOAXmyv
   HwBnoAl7DU4/RIeVvtvWBZL/gimqGLKY9i/W91k0uvBsvpGVcLC4W3MLb
   yYCfy8woT/Qa9LPwuq854xt5hIWmoLOATx2XDVvlLuiIBbQc1HEf0muPU
   3iO/1lZ09HvoYDzroeyqc9qza971+PtPmG5MHIbqNnok/AfZF+NcEN+Hy
   T7BaznLH2OlTcujN3Z606rkHE0xpd2kD414taElxrJQMUU0wUFlSYtlTW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="413888079"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="413888079"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 08:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026130876"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="1026130876"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 May 2023 08:34:29 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pts1M-00018C-1f;
	Tue, 02 May 2023 15:34:28 +0000
Date: Tue, 2 May 2023 23:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 287/382] ld.lld: error: undefined symbol:
 phy_mipi_dphy_get_default_config_for_hsclk
Message-ID: <202305022319.ATAY6Q5N-lkp@intel.com>
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
commit: f892c1ab1a9175a9d59ecd6e62654014937e72a5 [287/382] media: cadence: csi2rx: Add external DPHY support
config: i386-randconfig-a012-20230501 (https://download.01.org/0day-ci/archive/20230502/202305022319.ATAY6Q5N-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout f892c1ab1a9175a9d59ecd6e62654014937e72a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022319.ATAY6Q5N-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: phy_mipi_dphy_get_default_config_for_hsclk
   >>> referenced by cdns-csi2rx.c:161 (drivers/media/platform/cadence/cdns-csi2rx.c:161)
   >>>               drivers/media/platform/cadence/cdns-csi2rx.o:(csi2rx_configure_external_dphy) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
