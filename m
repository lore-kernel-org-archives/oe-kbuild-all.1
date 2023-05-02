Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A112F25
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 14:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683038550; x=1714574550;
  h=date:from:cc:subject:message-id:mime-version;
  bh=UOm+G9y3m1K5yPVDpg2aCobasoQisQbQqt/9Ew6RIMU=;
  b=BjeAzKwGGceeqnOJT2TmYG4/4clK6eXPL0jRPXHB7x2NXv97SD1KmgWE
   Go95FoqnjNH5ehoGh07YGQDZk1i7Ig00j9g6WIvTx8toYu1kF2xHN9+tB
   ZLJsl6UAQY4/i3fQMJMfbuunTr+JLGIDvDkA5F7EeFuEotfdGAPJOSqQD
   5g450Sb+Hkm/zgldNFBzS8kAqhl6CzoKJW7o2HcA7XKHXizToHNx5JDhC
   iY8uQoltNHDE7fEFZ7XcUvgfQ3bg/XnRw1kOWhNoRKPzhoCbZAyVWPdV5
   qgunwzhcaYFxvNhqaBl+pUN5bzVQQ2ggJ5H147VD7BHCLvkafL1awckjt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="434730443"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="434730443"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 07:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="690315823"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="690315823"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 May 2023 07:42:27 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptrD1-00016a-0G;
	Tue, 02 May 2023 14:42:27 +0000
Date: Tue, 2 May 2023 22:42:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 56/66]
 drivers/pinctrl/pinctrl-tps6594.c:undefined reference to
 `pinconf_generic_dt_node_to_map'
Message-ID: <202305022235.364mLd9i-lkp@intel.com>
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
commit: 7cda4826851d6659c41427fe84be1084c5aa15c1 [56/66] pinctrl: tps6594: add pinmux and gpio for TPS6594 PMIC
config: mips-buildonly-randconfig-r005-20230502 (https://download.01.org/0day-ci/archive/20230502/202305022235.364mLd9i-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 7cda4826851d6659c41427fe84be1084c5aa15c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022235.364mLd9i-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64el-linux-ld: mips64el-linux-ld: DWARF error: could not find abbrev number 114
   drivers/pinctrl/pinctrl-tps6594.o: in function `pinconf_generic_dt_node_to_map_group':
>> drivers/pinctrl/pinctrl-tps6594.c:(.text+0x3bc): undefined reference to `pinconf_generic_dt_node_to_map'
>> mips64el-linux-ld: drivers/pinctrl/pinctrl-tps6594.o:(.rodata+0x28): undefined reference to `pinconf_generic_dt_free_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
